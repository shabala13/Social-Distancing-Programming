package edu.fsu.cs.wheresat;

import android.os.Bundle;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.view.View;
import android.widget.TextView;

public class ProductPageActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.product_page);

        getSupportActionBar().setTitle("Toilet Paper");
        TextView title = findViewById(R.id.title);
        TextView price = findViewById(R.id.price);
        TextView description = findViewById(R.id.description);

        title.setText("Toliet Paper");
        price.setText("$100");
        description.setText("Found in Publix");

    }

}
