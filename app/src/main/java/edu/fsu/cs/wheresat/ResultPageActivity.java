package edu.fsu.cs.wheresat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import android.content.Intent;
import android.os.Bundle;
import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.GenericTypeIndicator;
import com.google.firebase.database.ValueEventListener;

public class ResultPageActivity extends Activity {
    ListView listViewProduct;
    Context ctx;
    ImageButton back_button;
    TextView product_name;
    FirebaseUser firebaseUser;
    FloatingActionButton addEntry;

    @Override
    public void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result_page);
        product_name = (TextView) findViewById(R.id.searched_product);

        addEntry = (FloatingActionButton) findViewById(R.id.addEntryButton);
        addEntry.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent create_listing = new Intent(getApplicationContext(), CreateListing.class);
                Bundle bundle = new Bundle();
                bundle.putString("productName", product_name.getText().toString());
                create_listing.putExtras(bundle);
                startActivity(create_listing);
            }
        });

        final String product_name_str = getIntent().getStringExtra("product_name");
        firebaseUser = getIntent().getExtras().getParcelable("user");

        product_name.setText(product_name_str);

        // Setting up Back Button
        back_button = (ImageButton) findViewById(R.id.back_image_button);
        back_button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent return_home = new Intent(getApplicationContext(), HomePageActivity.class);
                startActivity(return_home);
            }
        });

        FirebaseDatabase database = FirebaseDatabase.getInstance();

        // get DB reference
        DatabaseReference itemsRef = database.getReference("Item").child(Utilities.toUpperCase(product_name_str)).child("entries");

        itemsRef.addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
                // get HashMap from DB
                GenericTypeIndicator<HashMap<String, ProductEntry>> genericTypeIndicator = new GenericTypeIndicator<HashMap<String, ProductEntry>>() {};
                HashMap<String, ProductEntry> productEntryHashMap = dataSnapshot.getValue(genericTypeIndicator);

                List<ProductEntry> productEntryList = new ArrayList<ProductEntry>();
                for (ProductEntry productEntry : productEntryHashMap.values())
                        productEntryList.add(productEntry);

                listViewProduct = (ListView) findViewById(R.id.product_entry_list);
                listViewProduct.setAdapter(new ProductListAdapter(getApplicationContext(), R.layout.single_result, productEntryList));

                // Click event for single list row
                listViewProduct.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                    @Override
                    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                        ProductEntry o = (ProductEntry) parent.getItemAtPosition(position);
                        Intent send_to_product = new Intent(getApplicationContext(), ProductPageActivity.class);
                        send_to_product.putExtra("store", o.store);
                        send_to_product.putExtra("image_url", o.image);
                        send_to_product.putExtra("lat", o.lat);
                        send_to_product.putExtra("lon", o.lon);
                        send_to_product.putExtra("title", product_name_str);
                        startActivity(send_to_product);
                    }
                });

            }


            @Override
            public void onCancelled(@NonNull DatabaseError databaseError) {

            }
        });
        }
}