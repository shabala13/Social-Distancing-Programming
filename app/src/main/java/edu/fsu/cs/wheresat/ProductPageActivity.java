package edu.fsu.cs.wheresat;

import android.content.Intent;
import android.os.Bundle;

import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;

import androidx.appcompat.app.AppCompatActivity;

import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class ProductPageActivity extends AppCompatActivity {

    // Product display
    private String p_name;
    private String p_brand;
    private String p_image;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.product_page);

        // Basic view setup
        getSupportActionBar().setTitle("Toilet Paper");
        TextView title = findViewById(R.id.title);
        TextView brand = findViewById(R.id.price);
        TextView description = findViewById(R.id.description);
        Button soldButton = findViewById(R.id.mark_as_sold);
        Button mapButton = findViewById(R.id.view_on_map);


        // ToDO: Replace with Request.java class
        // Retrieving extras
        p_name = getIntent().getStringExtra("chosen_product_name");
        p_brand = getIntent().getStringExtra("chosen_product_brand");
        p_brand = getIntent().getStringExtra("chosen_product_image");

        //
        title.setText("REMOVE ME");
        brand.setText("REMOVE ME");
        description.setText("REMOVE ME");

        mapButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i = new Intent(getBaseContext(), MapsActivity.class);
                i.putExtra("product", "Toilet Paper");
                startActivity(i);
            }
        });

        soldButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i = new Intent(getBaseContext(), MapsActivity.class);
                i.putExtra("product", "Toilet Paper");
                startActivity(i);
            }
        });
    }
}
