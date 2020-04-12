package edu.fsu.cs.wheresat;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;

public class ProfileActivity extends AppCompatActivity {
    TextView username, email, points;
    ImageButton back_button;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);

        //set up the text views so that they may be changed when viewing the users profile
        username = (TextView) findViewById(R.id.username);
        email = (TextView) findViewById(R.id.email);
        points = (TextView) findViewById(R.id.points);
        back_button = (ImageButton) findViewById(R.id.back_image_button);

        // Back button returns to home
        back_button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent return_home = new Intent(getApplicationContext(), HomePageActivity.class);
                startActivity(return_home);
            }
        });

    }

}
