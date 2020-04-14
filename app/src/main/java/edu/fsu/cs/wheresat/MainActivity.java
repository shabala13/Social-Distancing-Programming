package edu.fsu.cs.wheresat;

import android.app.AlertDialog;
import android.content.ContentResolver;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.MimeTypeMap;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.OnProgressListener;
import com.google.firebase.storage.StorageMetadata;
import com.google.firebase.storage.StorageReference;
import com.google.firebase.storage.StorageTask;
import com.google.firebase.storage.UploadTask;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/*
Test UI to demonstrate Firebase operations for login and account creation
 */

public class MainActivity extends AppCompatActivity {
    private static final int PICK_IMAGE_REQUEST = 1;
    private String TAG = "MainActivity";

    // Authentication for user accounts
    private FirebaseAuth firebaseAuth;

    // Contains user account information when login is successful
    private FirebaseUser firebaseUser;

    // UI elements
    private EditText pass, user;
    private ListView requestList;
    private ArrayAdapter<String> requestListAdapter;
    private Button post, itemL;

    DatabaseReference dataRef, itemref;
    private Uri uri;
    private StorageReference storageRef;
    private StorageTask uploadTask;
    private Item product;
    private ImageView imageView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        firebaseAuth = FirebaseAuth.getInstance();
        storageRef = FirebaseStorage.getInstance().getReference();
        dataRef = FirebaseDatabase.getInstance().getReference();
        itemref = FirebaseDatabase.getInstance().getReference();



        user = findViewById(R.id.username);
        pass = findViewById(R.id.password);
        requestList = findViewById(R.id.requestList);
        post = findViewById(R.id.Post);
        itemL = findViewById(R.id.ItemLink);


        post.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                openFileChooser();


            }
        });


        itemL.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(MainActivity.this, "Not Done yet", Toast.LENGTH_LONG).show();
            }
        });




    }
    private void openFileChooser() {
        Intent intent = new Intent();
        intent.setType("image/*");
        intent.setAction(Intent.ACTION_GET_CONTENT);
        startActivityForResult(intent, PICK_IMAGE_REQUEST);
    }@Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == PICK_IMAGE_REQUEST && resultCode == RESULT_OK
                && data != null && data.getData() != null) {
            uri = data.getData();
            Log.d("IMAGE_PICKED",uri.toString());
           // Picasso.with(this).load(mImageUri).into(mImageView);
            upload();
        }
        else
            Log.d("IMAGE_NOT_PICKED","somthing is wrong.");
    }
    private String getFileExtension(Uri turi) {
        ContentResolver cR = getContentResolver();
        MimeTypeMap mime = MimeTypeMap.getSingleton();
        return mime.getExtensionFromMimeType(cR.getType(turi));
    }
    private void upload(){

        if(uri != null) {
            Log.d("URI_SUCCESS", "URI loaded successfully");
            // StorageReference fileRef= storageRef.child("Toilet_Paper.jpg");
            product = new Item();
            product.entry = new HashMap<>();
            //product.name = "Toliet Paper";D:\mtric\Documents\GitHub\Social-Distancing-Programming\app\src\main\res\layout\activity_main.xml
            //uri = Uri.fromFile(new File(getApplicationContext().getResources().getP(R.drawable.testimage));
            StorageReference fileReference = storageRef.child(System.currentTimeMillis()
                    + "." + getFileExtension(uri));
            uploadTask = fileReference.putFile(uri)
                    //uploadTask = storageRef.putBytes(data)
                    .addOnSuccessListener(new OnSuccessListener<UploadTask.TaskSnapshot>() {
                        @Override
                        public void onSuccess(UploadTask.TaskSnapshot taskSnapshot) {
                            Toast.makeText(MainActivity.this, "Upload successful", Toast.LENGTH_LONG).show();

                            taskSnapshot.getMetadata().getReference().getDownloadUrl().addOnSuccessListener(new OnSuccessListener<Uri>() {
                                @Override
                                public void onSuccess(Uri url) {
                                    String imageURL = url.toString();
                                    product.entry.put("Publix", imageURL);
                                    // uploadId = dataRef.push().getKey();
                                    //dataRef.child(uploadId).setValue(product);
                                    String uploadId = itemref.push().getKey();
                                    itemref.child("Toilet_Paper").setValue(product);
                                }
                            });
                            //Toast.makeText(MainActivity.this, taskSnapshot.getMetadata().getReference().getPath().toString() , Toast.LENGTH_SHORT).show();

                        }
                    }).addOnFailureListener(new OnFailureListener() {
                        @Override
                        public void onFailure(@NonNull Exception e) {
                            Toast.makeText(MainActivity.this, e.getMessage(), Toast.LENGTH_SHORT).show();
                        }
                    }).addOnProgressListener(new OnProgressListener<UploadTask.TaskSnapshot>() {
                        @Override
                        public void onProgress(UploadTask.TaskSnapshot taskSnapshot) {
                               /* double progress = (100.0 * taskSnapshot.getBytesTransferred() / taskSnapshot.getTotalByteCount());
                                mProgressBar.setProgress((int) progress);*/
                        }
                    });
        }
        else
            Log.d("URI_FAIL", "URI has failed to load");

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

                                    // iterate over the requests in the HashMap (if the account has
                                    // requests)
                                    if (user.requestHistory != null)
                                    {
                                        for (HashMap.Entry<String, String> entry : user.requestHistory.entrySet())
                                            requests.add(entry.getKey() + " " + entry.getValue());

                                        requestListAdapter = new ArrayAdapter<>(getApplicationContext(), android.R.layout.simple_list_item_1, requests);
                                        requestList.setAdapter(requestListAdapter);
                                    }
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




    /*  NOTE: THIS METHOD DOES NOT DO ERROR CHECKING SUCH AS CONFIRMING IF THE AUTOCOMPLETETEXTVIEWS
        ARE EMPTY OR NOT OR IF THE PASSWORD MATCHES THE CONFIRMPASSWORD.

        It does, however, have Firebase's built in error checking, such as if the password is not
        long enough, or if the user exists already.
    */
    public void createUser(View view) {
        // create a Dialog for the user to enter an email and password
        // AlertDialog adapted from https://stackoverflow.com/questions/10903754/
        final AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);

        builder.setTitle("Create new user account");

        // this dialog is using a custom layout I made in fragment_create_user.xml
        final View dialogView = LayoutInflater.from(this).inflate(R.layout.fragment_create_user,
                (ViewGroup) findViewById(android.R.id.content), false);

        // AutoCompleteTextView can be changed to EditText. I used this to try and make a good looking
        // UI, but it doesn't seem to have changed much. If we do decide to change it (and keep the
        // existing XML layout), remember to change the types in the XML from AutoCompleteTextView
        final AutoCompleteTextView email = dialogView.findViewById(R.id.create_email);
        final AutoCompleteTextView password = dialogView.findViewById(R.id.create_pass);
        final AutoCompleteTextView confirmPass = dialogView.findViewById(R.id.confirm_pass);

        builder.setView(dialogView);

        // set up dialog buttons
        builder.setPositiveButton("Create account", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(final DialogInterface dialog, int which) {
                firebaseAuth.createUserWithEmailAndPassword(email.getText().toString(),
                        password.getText().toString()).addOnCompleteListener(MainActivity.this, new OnCompleteListener<AuthResult>() {
                        @Override
                        public void onComplete(@NonNull Task<AuthResult> task) {
                            if (task.isSuccessful()) {
                                // get the new user (once the account is created, it is automatically
                                // signed in and given to firebaseAuth
                                firebaseUser = firebaseAuth.getCurrentUser();

                                FirebaseDatabase database = FirebaseDatabase.getInstance();

                                // get a top level reference in the DB
                                DatabaseReference topRef = database.getReference();

                                // create a new User object to serialize
                                User user = new User();
                                user.level = "bronze";
                                user.points = 0;
                                user.requestHistory = null;

                                // this call adds the UID and the User POJO into the DB. by using
                                // child().setValue(), it will create the child entry (the UID) if
                                // it doesn't exist.
                                topRef.child(firebaseUser.getUid()).setValue(user);

                                dialog.dismiss();

                            } else {
                                // print a Toast with the reason the sign in didn't work (this will check
                                // if the account already exists)
                                showToast(task.getException().getMessage());
                            }
                        }
                    });
                }
        });

        builder.setNegativeButton(android.R.string.cancel, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.cancel();
            }
        });

        AlertDialog createUserDialog = builder.create();
        createUserDialog.show();
    }

    // Toast doesn't work inside the dialog for some reason, so just created a helper to call it
    // from inside the dialog
    public void showToast(String message)
    {
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show();
    }
}
