package edu.fsu.cs.wheresat;

import android.content.Intent;
import android.os.Bundle;

// TODO Uncomment
// import com.google.android.gms.maps.GoogleMap;
// import com.google.android.gms.maps.OnMapReadyCallback;
// import com.google.android.gms.maps.SupportMapFragment;

import androidx.appcompat.app.AppCompatActivity;

import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class ProductPageActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.product_page);

        getSupportActionBar().setTitle("Toilet Paper");
        TextView title = findViewById(R.id.title);
        Button soldButton = findViewById(R.id.mark_as_sold);
        Button mapButton = findViewById(R.id.view_on_map);

        title.setText("Toliet Paper");

        mapButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
/*              TODO Uncomment
                Intent i = new Intent(getBaseContext(), MapsActivity.class);
                i.putExtra("product", "Toilet Paper");
                startActivity(i); */
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
