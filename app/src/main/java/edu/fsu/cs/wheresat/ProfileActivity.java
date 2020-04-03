package edu.fsu.cs.wheresat;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class ProfileActivity extends AppCompatActivity {
    TextView username, email, points;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);

        //set up the text views so that they may be changed when viewing the users profile
        username = (TextView) findViewById(R.id.username);
        email = (TextView) findViewById(R.id.email);
        points = (TextView) findViewById(R.id.points);
    }

    public void backButtonClick(View v)
    {
        //on back button clicked start the home screen activity again
        //using the mainactivity as a placeholder until the home page is created
        Intent intent = new Intent(this, MainActivity.class);

    }
}
