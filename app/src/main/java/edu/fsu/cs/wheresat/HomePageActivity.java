package edu.fsu.cs.wheresat;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.icu.text.Edits;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.ChildEventListener;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.GenericTypeIndicator;
import com.google.firebase.database.ValueEventListener;
import com.google.firebase.database.core.utilities.Tree;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.NavigableMap;
import java.util.TreeMap;

public class HomePageActivity extends AppCompatActivity {
    String[] temp_result_list = new String[10];

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

        // get DB references
        topItemsRef = database.getReference("TOP10");
        topRef = database.getReference();

        topItemsRef.addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
                GenericTypeIndicator<TreeMap<Long, String>> genericTypeIndicator = new GenericTypeIndicator<TreeMap<Long, String>>() {};
                TreeMap<Long, String> topTenItems = dataSnapshot.getValue(genericTypeIndicator);

                int i = 0;
                NavigableMap map = topTenItems.descendingMap();

                for(NavigableMap.Entry<Long, String> entry : topTenItems.entrySet()) {
                    temp_result_list[i++] = entry.getValue();
                }

                // Creates an adapter for the ListView and uses it to fill view with temp_result_list
                final ArrayAdapter<String> adapter = new ArrayAdapter<String>(getApplicationContext(), android.R.layout.simple_list_item_1, temp_result_list);
                top_search_view.setAdapter(adapter);

            }

            @Override
            public void onCancelled(@NonNull DatabaseError databaseError) {

            }
        });


        // TODO: Retrieve top result list and fill temp_result_list with it



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
        switch (item.getItemId()) {
            case R.id.product_page_selection:
                Intent product_page_intent = new Intent(this, ProductPageActivity.class);

                Bundle bundle = new Bundle();
                bundle.putParcelable("user", firebaseUser);
                product_page_intent.putExtras(bundle);

                startActivity(product_page_intent);
                break;

            case R.id.profile_page_selection:
                // TODO uncomment
//                Intent profile_page_selection = new Intent(this, ProfileActivity.class);
//                startActivity(profile_page_selection);
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
