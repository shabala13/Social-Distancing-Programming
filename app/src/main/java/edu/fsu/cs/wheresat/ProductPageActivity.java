package edu.fsu.cs.wheresat;

import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

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

        final String p_store = getIntent().getStringExtra("store");
        final String image_url = getIntent().getStringExtra("image_url");
        final String lat = getIntent().getStringExtra("lat");
        final String lon = getIntent().getStringExtra("lon");
        final String p_title = getIntent().getStringExtra("title");

        getSupportActionBar().setTitle(p_title);
        TextView title = findViewById(R.id.title);
        Button soldButton = findViewById(R.id.mark_as_sold);
        Button mapButton = findViewById(R.id.view_on_map);
        ImageView image = findViewById(R.id.product_image);

        title.setText(p_title);
        Picasso.get().load(image_url).rotate(90).into(image);

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

        soldButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
/*              TODO Uncomment
                Intent i = new Intent(getBaseContext(), MapsActivity.class);
                i.putExtra("product", "Toilet Paper");
                startActivity(i); */

                final FirebaseDatabase database = FirebaseDatabase.getInstance();
                final DatabaseReference itemsRef = database.getReference("Item").child(Utilities.toUpperCase(p_title)).child("entries");

                itemsRef.addListenerForSingleValueEvent(new ValueEventListener() {
                    @Override
                    public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
                        // get HashMap from DB
                        GenericTypeIndicator<HashMap<String, ProductEntry>> genericTypeIndicator = new GenericTypeIndicator<HashMap<String, ProductEntry>>() {};
                        HashMap<String, ProductEntry> productEntryHashMap = dataSnapshot.getValue(genericTypeIndicator);

                        for(HashMap.Entry<String, ProductEntry> entry : productEntryHashMap.entrySet()){
                            ProductEntry productEntry = entry.getValue();
                            if (image_url.equals(productEntry.image) &&
                                lat.equals(productEntry.lat) &&
                                lon.equals(productEntry.lon) &&
                                p_store.equals(productEntry.store)){
                                Log.i("NERD", entry.getKey());
                                DatabaseReference sold_item = itemsRef.child(entry.getKey());
                                sold_item.removeValue();


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
