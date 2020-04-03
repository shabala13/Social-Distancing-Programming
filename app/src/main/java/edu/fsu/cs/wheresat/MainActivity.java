package edu.fsu.cs.wheresat;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

public class MainActivity extends AppCompatActivity {

    private String TAG = "MainActivity";

    private FirebaseAuth firebaseAuth;
    private FirebaseUser firebaseUser;
    private EditText pass, user;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        firebaseAuth = FirebaseAuth.getInstance();

        Button login = findViewById(R.id.loginButton);

//        login.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                Intent i = new Intent(getBaseContext(), ProductPageActivity.class);
//                startActivity(i);
//            }
//        });

        user = findViewById(R.id.username);
        pass = findViewById(R.id.password);


    }

    @Override
    public void onStart()
    {
        super.onStart();

        // check if user is signed in already (TODO implement behavior if they are)
        FirebaseUser currentUser = firebaseAuth.getCurrentUser();

    }

    public void loginUser(View view) {
        Log.d(TAG, "entering login user func");

        firebaseAuth.signInWithEmailAndPassword(user.getText().toString(), pass.getText().toString())
                .addOnCompleteListener(  MainActivity.this, new OnCompleteListener<AuthResult>() {
                    @Override
                    public void onComplete(@NonNull Task<AuthResult> task) {

                        Log.d(TAG, "Testing");

                        if (task.isSuccessful()) {
                            // Sign in success, update UI with the signed-in user's information
                            Log.d(TAG, "signInWithEmail:success");
                            firebaseUser = firebaseAuth.getCurrentUser();

                            FirebaseDatabase database = FirebaseDatabase.getInstance();
                            DatabaseReference myRef = database.getReference();

                            Log.d(TAG, myRef.child(firebaseUser.getUid()).child("name").toString());
                            // updateUI(user);
                        } else {
                            // If sign in fails, display a message to the user.
                            Log.w(TAG, "signInWithEmail:failure", task.getException());
                            Toast.makeText(MainActivity.this, "Authentication failed.",
                                    Toast.LENGTH_SHORT).show();
                            //updateUI(null);
                        }

                        // ...
                    }
                });
    }

}
