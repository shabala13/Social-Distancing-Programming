package edu.fsu.cs.wheresat;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.content.ContentResolver;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.MimeTypeMap;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.OnProgressListener;
import com.google.firebase.storage.StorageReference;
import com.google.firebase.storage.StorageTask;
import com.google.firebase.storage.UploadTask;

import java.util.HashMap;

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
    private EditText pass, email;
    private ListView requestList;
    private ArrayAdapter<String> requestListAdapter;
    private Button login, createAcct;

    DatabaseReference dataRef, itemref;
    private Uri uri;
    private StorageReference storageRef;
    private StorageTask uploadTask;
    private Item product;

    boolean emailEmpty = true;
    boolean passwordEmpty = true;
    boolean confirmPassEmpty = true;

    AutoCompleteTextView dialogEmailEditText;
    AutoCompleteTextView dialogPassEditText;
    AutoCompleteTextView dialogConfirmPassEditText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        firebaseAuth = FirebaseAuth.getInstance();
        storageRef = FirebaseStorage.getInstance().getReference();
        dataRef = FirebaseDatabase.getInstance().getReference();
        itemref = FirebaseDatabase.getInstance().getReference();

        email = findViewById(R.id.username);
        pass = findViewById(R.id.password);
        //requestList = findViewById(R.id.requestList);
        login = findViewById(R.id.loginButton);
        createAcct = findViewById(R.id.create_acct);

        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                loginUser(view);
            }
        });

        createAcct.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                createUser(view);
            }
        });
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

        if(email.getText().toString().equals("") || pass.getText().toString().equals("")) {
            showToast("Please enter a valid username and password.");
        } else {
            // login is not synchronous (i.e. it does not happen instantly). if you need to access data
            // immediately after login, do that in the onComplete() function below and not elsewhere
            firebaseAuth.signInWithEmailAndPassword(email.getText().toString(), pass.getText().toString())
                    .addOnCompleteListener(MainActivity.this, new OnCompleteListener<AuthResult>() {
                        @Override
                        public void onComplete(@NonNull Task<AuthResult> task) {
                            if (task.isSuccessful()) {

                                Intent home_intent = new Intent(getBaseContext(), HomePageActivity.class);
                                Bundle bundle = new Bundle();

                                // firebaseUser gets the user's information (email, UID) from auth
                                firebaseUser = firebaseAuth.getCurrentUser();

                                // put this user in a bundle attached to the home page activity intent
                                bundle.putParcelable("user", firebaseUser);
                                home_intent.putExtras(bundle);

                                startActivity(home_intent);
                            } else {
                                // If sign in fails, display a message to the user
                                Toast.makeText(MainActivity.this, "Incorrect Email or Password.",
                                        Toast.LENGTH_SHORT).show();
                            }
                        }
                    });
        }
    }

    public void createUser(View view) {
        // create a Dialog for the user to enter an email and password
        // AlertDialog adapted from https://stackoverflow.com/questions/10903754/
        final AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);

        builder.setTitle("Create New User Account");

        // this dialog is using a custom layout I made in fragment_create_user.xml
        final View dialogView = LayoutInflater.from(this).inflate(R.layout.fragment_create_user,
                (ViewGroup) findViewById(android.R.id.content), false);

        // AutoCompleteTextView can be changed to EditText. I used this to try and make a good looking
        // UI, but it doesn't seem to have changed much. If we do decide to change it (and keep the
        // existing XML layout), remember to change the types in the XML from AutoCompleteTextView
        dialogEmailEditText = dialogView.findViewById(R.id.create_email);
        dialogPassEditText = dialogView.findViewById(R.id.create_pass);
        dialogConfirmPassEditText = dialogView.findViewById(R.id.confirm_pass);

        builder.setView(dialogView);

        // set up dialog buttons
        builder.setPositiveButton("Create account", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(final DialogInterface dialog, int which) {
                firebaseAuth.createUserWithEmailAndPassword(dialogEmailEditText.getText().toString(),
                        dialogConfirmPassEditText.getText().toString()).addOnCompleteListener(MainActivity.this, new OnCompleteListener<AuthResult>() {
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

        final AlertDialog createUserDialog = builder.create();
        createUserDialog.show();

        // disable the create account button immediately since the text fields are empty
        createUserDialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(false);

        // add the TextWatchers to make sure the text fields aren't empty and that password matches
        // confirm password

        dialogEmailEditText.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {}

            @Override
            public void afterTextChanged(Editable s) {
                emailEmpty = TextUtils.isEmpty(s);

                createUserDialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(verifyInput());
            }
        });

        dialogPassEditText.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {}

            @Override
            public void afterTextChanged(Editable s) {
                passwordEmpty = TextUtils.isEmpty(s);

                createUserDialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(verifyInput());
            }
        });

        dialogConfirmPassEditText.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {}

            @Override
            public void afterTextChanged(Editable s) {
                confirmPassEmpty = TextUtils.isEmpty(s);

                createUserDialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(verifyInput());
            }
        });
    }

    // Toast doesn't work inside the dialog for some reason, so just created a helper to call it
    // from inside the dialog
    public void showToast(String message)
    {
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show();
    }

    public boolean verifyInput()
    {
        if (emailEmpty || passwordEmpty || confirmPassEmpty)
            return false;

        return dialogConfirmPassEditText.getText().toString().equals(dialogPassEditText.getText().toString());
    }
}
