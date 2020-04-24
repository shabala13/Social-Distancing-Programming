package edu.fsu.cs.wheresat;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.NavigableMap;
import java.util.TreeMap;
import java.util.concurrent.Callable;

import android.content.Intent;
import android.os.Bundle;
import android.content.Context;
import android.os.Parcelable;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.GenericTypeIndicator;
import com.google.firebase.database.ValueEventListener;

public class ResultPageActivity extends AppCompatActivity implements Callable<Void> {
    ListView listViewProduct;
    ImageButton back_button;
    TextView product_name;
    FirebaseUser firebaseUser;
    FloatingActionButton addEntry;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        Log.i("NERD", "ENtered Result Page Activity");
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result_page);
        product_name = (TextView) findViewById(R.id.searched_product);
        firebaseUser = getIntent().getExtras().getParcelable("user");

        addEntry = (FloatingActionButton) findViewById(R.id.addEntryButton);
        addEntry.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent create_listing = new Intent(getApplicationContext(), CreateListing.class);
                Bundle bundle = new Bundle();
                bundle.putString("productName", product_name.getText().toString());
                bundle.putParcelable("user", (Parcelable) firebaseUser);
                create_listing.putExtras(bundle);
                startActivity(create_listing);
            }
        });

        final String product_name_str = getIntent().getStringExtra("product_name");


        product_name.setText(product_name_str);

        // Setting up Back Button
        back_button = (ImageButton) findViewById(R.id.back_image_button_1);
        back_button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(ResultPageActivity.this, HomePageActivity.class);
                Bundle bundle = new Bundle();
                bundle.putParcelable("user", firebaseUser);
                intent.putExtras(bundle);
                startActivity(intent);
                finish();
            }
        });

        FirebaseDatabase database = FirebaseDatabase.getInstance();

        // gets DB reference to Item
        final DatabaseReference itemReference = database.getReference("Item").child(Utilities.toUpperCase(product_name_str)).child("searchCount");
        itemReference.addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
                final int updatedSearchCount;

                if(dataSnapshot.getValue(Integer.class) == null)
                    updatedSearchCount = 1;
                else
                    updatedSearchCount = dataSnapshot.getValue(Integer.class) + 1;
                
                itemReference.setValue(updatedSearchCount);

                // get DB reference to top ten searches
                final DatabaseReference topItemsRef = FirebaseDatabase.getInstance().getReference("TOP10");

                topItemsRef.addListenerForSingleValueEvent(new ValueEventListener() {
                    @Override
                    public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
                        // Firebase only allows us to directly serialize to a HashMap of Strings, so need to construct
                        // a new TreeMap with Integers after serialization

                        // get HashMap from DB
                        GenericTypeIndicator<HashMap<String, String>> genericTypeIndicator = new GenericTypeIndicator<HashMap<String, String>>() {};
                        HashMap<String, String> topTenItemsString = dataSnapshot.getValue(genericTypeIndicator);

                        // Build TreeMap in ascending order
                        TreeMap<Integer, String> topTenItems = new TreeMap<>();

                        for (HashMap.Entry entry : topTenItemsString.entrySet())
                        {
                            String[] newKey = entry.getKey().toString().split("[_]");
                            topTenItems.put(Integer.parseInt(newKey[0]), (String) entry.getValue());
                        }

                        // if the searched entry is already in the top 10, see if it can be moved up or down
                        // if there is a tie, the element just searched will be bumped up

                        // used to signify whether the entry was found in the top 10 already
                        boolean updated = false;

                        NavigableMap<Integer, String> navigableMap = new TreeMap<>(topTenItems);

                        for (Map.Entry<Integer, String> entry : navigableMap.entrySet()) {
                            Map.Entry<Integer, String> next = navigableMap.higherEntry(entry.getKey());

                            // if the current entry is the entry just searched and it's updated count is bigger
                            // than or equal to the next entry, swap the two
                            if (entry.getValue().equals(Utilities.toUpperCase(product_name_str)) &&
                                next != null && updatedSearchCount >= next.getKey())
                            {
                                updated = true;
                                topItemsRef.child(next.getKey().toString() + "_k").setValue(Utilities.toUpperCase(product_name_str));
                                topItemsRef.child(entry.getKey().toString() + "_k").setValue(next.getValue());
                                break;
                            }

                            // if the current entry was just updated but does not need to move positions, update
                            // it's count
                            else if (entry.getValue().equals(Utilities.toUpperCase(product_name_str)))
                            {
                                updated = true;
                                topItemsRef.child(entry.getKey().toString() + "_k").removeValue();
                                topItemsRef.child(Integer.toString(updatedSearchCount) + "_k").setValue(entry.getValue());
                                break;
                            }
                        }

                        Integer firstKey = topTenItems.firstKey();

                        // if the entry was not previously in the top 10 but has now surpassed the bottom entry,
                        // replace the bottom entry
                        if (!updated && (firstKey < updatedSearchCount))
                        {
                            topItemsRef.child(firstKey.toString() + "_k").removeValue();
                            topItemsRef.child(firstKey.toString() + "_k").setValue(Utilities.toUpperCase(product_name_str));
                        }
                    }

                    @Override
                    public void onCancelled(@NonNull DatabaseError databaseError) {}
                });
            }

            @Override
            public void onCancelled(@NonNull DatabaseError databaseError) { }
        });

        // get DB reference to product entries
        DatabaseReference itemsRef = database.getReference("Item").child(Utilities.toUpperCase(product_name_str)).child("entries");

        itemsRef.addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
                // get HashMap from DB
                GenericTypeIndicator<HashMap<String, ProductEntry>> genericTypeIndicator = new GenericTypeIndicator<HashMap<String, ProductEntry>>() {};
                HashMap<String, ProductEntry> productEntryHashMap = dataSnapshot.getValue(genericTypeIndicator);
                final List<ProductEntry> productEntryList = new ArrayList<ProductEntry>();
                listViewProduct = (ListView) findViewById(R.id.product_entry_list);

                if(productEntryHashMap != null) {

                    for (ProductEntry productEntry : productEntryHashMap.values())
                        productEntryList.add(productEntry);


                    listViewProduct.setAdapter(new ProductListAdapter(getApplicationContext(), R.layout.single_result, productEntryList));

                    // Click event for single list row
                    listViewProduct.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                        @Override
                        public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                            ProductEntry o = (ProductEntry) parent.getItemAtPosition(position);
                            Intent send_to_product = new Intent(getApplicationContext(), ProductPageActivity.class);
                            Bundle bundle = new Bundle();
                            bundle.putParcelable("user", firebaseUser);
                            send_to_product.putExtra("store", o.store);
                            send_to_product.putExtra("image_url", o.image);
                            send_to_product.putExtra("lat", o.lat);
                            send_to_product.putExtra("lon", o.lon);
                            send_to_product.putExtra("title", product_name_str);
                            send_to_product.putExtras(bundle);
                            startActivity(send_to_product);
                        }
                    });

                } else {
                    // add user's request to their personal request list
                    DatabaseReference userRef = FirebaseDatabase.getInstance().getReference(firebaseUser.getUid());

                    // check to see if the user's request list is empty. if it is, overwrite the blank entry with the brand new entry
                    userRef.addListenerForSingleValueEvent(new ValueEventListener() {
                        @Override
                        public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
                            // serialize the result from userRef into a User object
                            User user = dataSnapshot.getValue(User.class);

                            String currentDate = new SimpleDateFormat("M/dd", Locale.getDefault()).format(new Date());
                            String currentTime = new SimpleDateFormat("h:mm a", Locale.getDefault()).format(new Date());
                            Request request = new Request(product_name_str, currentDate, currentTime);

                            DatabaseReference requestsRef = FirebaseDatabase.getInstance().getReference(firebaseUser.getUid()).child("requests");

                            for (Request entry : user.getRequestList())
                            {
                                if (entry.itemName.equals(" "))
                                {
                                    String newRequest = requestsRef.push().getKey();
                                    requestsRef.child(newRequest).setValue(request);
                                    requestsRef.child(" ").removeValue();
                                    break;
                                }

                                else
                                {
                                    String newRequest = requestsRef.push().getKey();
                                    requestsRef.child(newRequest).setValue(request);
                                    break;
                                }
                            }

                            ProductEntry empty = new ProductEntry();
                            empty.store = "No results found.";
                            empty.image = null;
                            empty.lat = null;
                            empty.lon = null;
                            productEntryList.add(empty);

                            listViewProduct.setAdapter(new ProductListAdapter(getApplicationContext(), R.layout.single_result, productEntryList));
                        }
                        @Override
                        public void onCancelled(@NonNull DatabaseError databaseError) {}
                    });
                }
            }

            @Override
            public void onCancelled(@NonNull DatabaseError databaseError) {

            }
        });
        }

    @Override
    public void onBackPressed() {
        Intent intent = new Intent(ResultPageActivity.this, HomePageActivity.class);
        Bundle bundle = new Bundle();
        bundle.putParcelable("user", firebaseUser);
        intent.putExtras(bundle);
        startActivity(intent);
        finish();
    }

    @Override
    public Void call()
    {

        return null;
    }
}