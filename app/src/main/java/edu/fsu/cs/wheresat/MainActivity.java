package edu.fsu.cs.wheresat;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button login = findViewById(R.id.loginButton);

        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent home_intent = new Intent(getBaseContext(), HomePageActivity.class);
                startActivity(home_intent);
            }
        });

        EditText user = findViewById(R.id.username);
        EditText pass = findViewById(R.id.password);

    }

    @Override
    public void onStart()
    {
        super.onStart();
    }
}
