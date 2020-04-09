package edu.fsu.cs.wheresat;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Dialog;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.ChildEventListener;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/*
Test UI to demonstrate Firebase operations for login and account creation
 */

public class MainActivity extends AppCompatActivity {
    private String TAG = "MainActivity";

    // Authentication for user accounts
    private FirebaseAuth firebaseAuth;

    // Contains user account information when login is successful
    private FirebaseUser firebaseUser;

    private EditText pass, user;

    private ListView requestList;
    private ArrayAdapter<String> adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        firebaseAuth = FirebaseAuth.getInstance();

        Button login = findViewById(R.id.loginButton);

        user = findViewById(R.id.username);
        pass = findViewById(R.id.password);

        requestList = findViewById(R.id.requestList);
    }

    @Override
    public void onStart()
    {
        super.onStart();

        // check if user is signed in already (TODO implement behavior if they are)
        firebaseUser = firebaseAuth.getCurrentUser();
    }

    public void loginUser(View view) {
        // login is not synchronous (i.e. it does not happen instantly). if you need to access data
        // immediately after login, do that in the onComplete() function below and not elsewhere
        firebaseAuth.signInWithEmailAndPassword(user.getText().toString(), pass.getText().toString())
                .addOnCompleteListener(  MainActivity.this, new OnCompleteListener<AuthResult>() {
                    @Override
                    public void onComplete(@NonNull Task<AuthResult> task) {
                        if (task.isSuccessful()) {
                            // Sign in success. update TextViews in Activity
                            TextView uid = findViewById(R.id.uid);
                            TextView email = findViewById(R.id.email);

                            // firebaseUser gets the user's information (email, UID) from auth
                            firebaseUser = firebaseAuth.getCurrentUser();

                            // UID is the key for an account stored in the DB
                            uid.setText(firebaseUser.getUid());
                            email.setText(firebaseUser.getEmail());

                            FirebaseDatabase database = FirebaseDatabase.getInstance();

                            // navigate to UID's entry in the database
                            DatabaseReference userRef = database.getReference(firebaseUser.getUid());

                            // this event listener (addListenerForSingleValueEvent) reads values from the
                            // DB immediately. there are other callbacks to read values later if desired
                            userRef.addListenerForSingleValueEvent(new ValueEventListener() {
                                @Override
                                public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
                                    // serialize the result from userRef into a User object
                                    User user = dataSnapshot.getValue(User.class);

                                    // update the rest of the TextViews
                                    TextView level = findViewById(R.id.level);
                                    TextView points = findViewById(R.id.points);

                                    level.setText(user.level);
                                    points.setText(Long.toString(user.points));

                                    // populate the request history ListView
                                    List<String> requests = new ArrayList<>();

                                    // iterate over the requests in the HashMap
                                    for (HashMap.Entry<String, String> entry : user.requestHistory.entrySet())
                                        requests.add(entry.getKey() + " " + entry.getValue());

                                    adapter = new ArrayAdapter<>(getApplicationContext(), android.R.layout.simple_list_item_1, requests);
                                    requestList.setAdapter(adapter);
                                }

                                @Override
                                public void onCancelled(@NonNull DatabaseError databaseError) {
                                    Log.d(TAG, "Did not find any entry for this user");
                                }
                            });
                        }

                        else {
                            // If sign in fails, display a message to the user
                            Toast.makeText(MainActivity.this, "Incorrect Email or Password.",
                                    Toast.LENGTH_SHORT).show();
                        }
                    }
                });
    }

}
