package edu.fsu.cs.wheresat;

import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Parcelable;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.GenericTypeIndicator;
import com.google.firebase.database.ValueEventListener;
import com.google.firebase.database.core.utilities.Pair;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ProductPageActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.product_page);

        // Usable info from selected Result Page Product
        final FirebaseUser firebaseUser = getIntent().getExtras().getParcelable("user");
        final String p_store = getIntent().getStringExtra("store");
        final String image_url = getIntent().getStringExtra("image_url");
        final String lat = getIntent().getStringExtra("lat");
        final String lon = getIntent().getStringExtra("lon");
        final String p_title = getIntent().getStringExtra("title");


        // Setting Views
        getSupportActionBar().setTitle(p_title);
        TextView title = findViewById(R.id.title);
        Button soldButton = findViewById(R.id.mark_as_sold);
        Button mapButton = findViewById(R.id.view_on_map);
        ImageView image = findViewById(R.id.product_image);
        title.setText(p_title);
        Picasso.get().load(image_url).rotate(90).into(image);


        // Pulls up the Map feature with product coordinates
        mapButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i = new Intent(getBaseContext(), MapsActivity.class);
                i.putExtra("title", p_title);
                i.putExtra("lat", lat);
                i.putExtra("lon", lon);
                startActivity(i);
            }
        });


        // Mark As Sold button removes the listing from the Database and sends User back to Results
        soldButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                // Database references
                final FirebaseDatabase database = FirebaseDatabase.getInstance();
                final DatabaseReference itemsRef = database.getReference("Item").child(Utilities.toUpperCase(p_title)).child("entries");

                // Listener for database reference
                itemsRef.addListenerForSingleValueEvent(new ValueEventListener() {
                    @Override
                    public void onDataChange(@NonNull DataSnapshot dataSnapshot) {

                        // get HashMap from DB
                        GenericTypeIndicator<HashMap<String, ProductEntry>> genericTypeIndicator = new GenericTypeIndicator<HashMap<String, ProductEntry>>() {};
                        HashMap<String, ProductEntry> productEntryHashMap = dataSnapshot.getValue(genericTypeIndicator);

                        // Iterates through each Product Entry
                        for(HashMap.Entry<String, ProductEntry> entry : productEntryHashMap.entrySet()){
                            ProductEntry productEntry = entry.getValue();

                            // If ProductEntry is a direct match of Product being Marked...
                            if (image_url.equals(productEntry.image) && lat.equals(productEntry.lat) &&
                                        lon.equals(productEntry.lon) && p_store.equals(productEntry.store)){

                                // Get and remove ReferenceID depending on the unique Key Identifier
                                DatabaseReference sold_item = itemsRef.child(entry.getKey());
                                sold_item.removeValue();

                                // Return user to Results with an updated Results List
                                Intent return_to_results = new Intent(getApplicationContext(), ResultPageActivity.class);
                                Bundle bundle = new Bundle();
                                bundle.putParcelable("user", (Parcelable) firebaseUser);
                                return_to_results.putExtras(bundle);
                                return_to_results.putExtra("product_name", p_title);
                                startActivity(return_to_results);
                                finish();
                            }
                        }

                    }


                    @Override
                    public void onCancelled(@NonNull DatabaseError databaseError) {

                    }
                });

            }
        });
    }
}
