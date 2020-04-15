package edu.fsu.cs.wheresat;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class CreateListing extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_create_listing);

        Button login = findViewById(R.id.submitButton);

        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast toast = Toast.makeText(getBaseContext(), "Successful Submission", Toast.LENGTH_LONG);
                toast.show();
                Intent home_intent = new Intent(CreateListing.this, HomePageActivity.class);
                startActivity(home_intent);
            }
        });

    }
}
