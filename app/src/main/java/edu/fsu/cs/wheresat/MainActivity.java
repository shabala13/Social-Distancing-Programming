package edu.fsu.cs.wheresat;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.widget.EditText;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;

public class MainActivity extends AppCompatActivity {

    FirebaseAuth firebaseauth = FirebaseAuth.getInstance();
    FirebaseUser firebaseUser;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        EditText user = findViewById(R.id.username);
        EditText pass = findViewById(R.id.password);

        if (firebaseUser == null)
            firebaseauth.signInWithEmailAndPassword(user.getText().toString(), pass.getText().toString());

        Log.d("email", firebaseUser.getEmail());
    }

    @Override
    public void onStart()
    {
        super.onStart();
        firebaseUser = firebaseauth.getCurrentUser();
    }
}
