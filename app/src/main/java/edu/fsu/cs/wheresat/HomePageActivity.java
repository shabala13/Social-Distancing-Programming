package edu.fsu.cs.wheresat;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Parcelable;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.GenericTypeIndicator;
import com.google.firebase.database.ValueEventListener;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.NavigableMap;
import java.util.TreeMap;

public class HomePageActivity extends AppCompatActivity {
    List<String> top_result_list = new ArrayList<>();

    ListView top_search_view;
    final String TAG = "HomePageActivity";
    FirebaseUser firebaseUser;
    DatabaseReference topItemsRef, topRef;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home_page);

        firebaseUser = getIntent().getExtras().getParcelable("user");

        top_search_view = (ListView) findViewById(R.id.top_searches);

        FirebaseDatabase database = FirebaseDatabase.getInstance();

        // get DB reference
        topItemsRef = database.getReference("TOP10");

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
                    topTenItems.put(Integer.parseInt((String) entry.getKey()), (String) entry.getValue());

                // add items to List<String> temp_result_list in descending order
                for(NavigableMap.Entry<Integer, String> entry : topTenItems.descendingMap().entrySet()) {
                    top_result_list.add(Utilities.toLowerCase(entry.getValue()));
                }

                // Creates an adapter for the ListView and uses it to fill view with temp_result_list
                final ArrayAdapter<String> adapter = new ArrayAdapter<String>(getApplicationContext(), android.R.layout.simple_list_item_1, top_result_list);
                top_search_view.setAdapter(adapter);

                top_search_view.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                    @Override
                    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                        String product_name = adapter.getItem(position);
                        Intent intent = new Intent(getApplicationContext(), ResultPageActivity.class);
                        Bundle bundle = new Bundle();
                        bundle.putParcelable("user", (Parcelable) firebaseUser);
                        intent.putExtras(bundle);
                        intent.putExtra("product_name", product_name);
                        startActivity(intent);
                    }
                });

            }

            @Override
            public void onCancelled(@NonNull DatabaseError databaseError) {

            }
        });
    }


    // Creates the hamburger menu, uses the res/menu/menu.xml setup
    @Override
    public boolean onCreateOptionsMenu(Menu menu){
        getMenuInflater().inflate(R.menu.menu, menu);
        return true;
    }

    // Manages the selection of the menu items
    @Override
    public boolean onOptionsItemSelected(MenuItem item){
        Bundle bundle;

        switch (item.getItemId()) {
            case R.id.product_page_selection:
                Intent product_page_intent = new Intent(this, ProductPageActivity.class);

                bundle = new Bundle();
                bundle.putParcelable("user", (Parcelable) firebaseUser);
                product_page_intent.putExtras(bundle);

                startActivity(product_page_intent);
                break;

            case R.id.profile_page_selection:
                Intent profile_page_selection = new Intent(this, ProfileActivity.class);
                bundle = new Bundle();
                bundle.putParcelable("user", (Parcelable) firebaseUser);
                profile_page_selection.putExtras(bundle);
                startActivity(profile_page_selection);
                break;

            case R.id.search_result_list:
                // TODO: Bundle search into transfer to new search result

                // TODO uncomment
//                Intent new_search = new Intent(this, ResultPageActivity.class);
//                startActivity(new_search);
                break;

            case R.id.close_selection:
                finish();
                break;
        }
        return true;
    }
}
