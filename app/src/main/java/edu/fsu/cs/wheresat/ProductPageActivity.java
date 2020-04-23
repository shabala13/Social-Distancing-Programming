package edu.fsu.cs.wheresat;

import android.content.Intent;
import android.os.Bundle;

import androidx.appcompat.app.AppCompatActivity;

import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

public class ProductPageActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.product_page);

        String p_store = getIntent().getStringExtra("store");
        String image_url = getIntent().getStringExtra("image_url");
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
            }
        });
    }
}
