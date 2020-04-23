package edu.fsu.cs.wheresat;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.location.Location;
import android.location.LocationManager;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.OnProgressListener;
import com.google.firebase.storage.StorageReference;
import com.google.firebase.storage.StorageTask;
import com.google.firebase.storage.UploadTask;

import java.io.ByteArrayOutputStream;
import java.util.HashMap;

public class CreateListing extends Activity {
    private ImageView imageView;
    private String productName;
    private Button getCurrentLoc, submit, takePicture;
    private Location location;
    private EditText store;
    private TextView latitudeTextView, longitudeTextView;
    private byte[] byteArray;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_create_listing);

        Intent intent = getIntent();
        Bundle bundle = intent.getExtras();
        productName = bundle.getString("productName");
        getCurrentLoc = (Button) findViewById(R.id.getLocationButton);
        submit = (Button) findViewById(R.id.submitButton);
        store = (EditText) findViewById(R.id.store);
        imageView = (ImageView) findViewById(R.id.picture);
        takePicture = (Button) findViewById(R.id.openCamera);
        latitudeTextView = (TextView) findViewById(R.id.latitude);
        longitudeTextView = (TextView) findViewById(R.id.longitude);

        // requests camera permissions if they are not already given
        if(ContextCompat.checkSelfPermission(CreateListing.this, Manifest.permission.CAMERA) != PackageManager.PERMISSION_GRANTED)
        {
            ActivityCompat.requestPermissions(CreateListing.this, new String[]
                    {Manifest.permission.CAMERA},100);
        }

        // checks if location permissions given, if not, asks for them again; then gets current location
        getCurrentLoc.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(ContextCompat.checkSelfPermission(CreateListing.this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED) {

                    ActivityCompat.requestPermissions(CreateListing.this, new String[] {Manifest.permission.ACCESS_FINE_LOCATION}, 200);

                } else if(ContextCompat.checkSelfPermission(CreateListing.this, Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED) {

                    LocationManager locationManager = (LocationManager) getSystemService(Context.LOCATION_SERVICE);
                    location = locationManager.getLastKnownLocation(LocationManager.GPS_PROVIDER);

                    String latitude = "Latitude: " + Double.toString(location.getLatitude());
                    String longitude = "Longitude: " + Double.toString(location.getLongitude());


                    latitudeTextView.setText(latitude);
                    longitudeTextView.setText(longitude);
                }
            }
        });

        // uploads new listing to DB and returns user to home activity
        submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(location == null) {
                    Toast.makeText(getApplicationContext(), "Please add your current location to proceed.", Toast.LENGTH_SHORT).show();
                } else if (store.getText().toString().equals("")) {
                    Toast.makeText(getApplicationContext(), "Please enter a store name to proceed.", Toast.LENGTH_SHORT).show();
                }
                else
                {
                    upload(byteArray);
                    finish();
                }
            }
        });


        takePicture.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent takePictureIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
                startActivityForResult(takePictureIntent, 100);
            }
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        // compresses picture taken by user
        if (requestCode == 100 && resultCode == Activity.RESULT_OK) {
            Bitmap photo = (Bitmap) data.getExtras().get("data");
            imageView.setImageBitmap(photo);

            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            photo.compress(Bitmap.CompressFormat.JPEG, 100, baos);
            byteArray = baos.toByteArray();

        }
    }

    // uploads new listing to database
    private void upload(byte[] byteArray) {

        FirebaseDatabase database = FirebaseDatabase.getInstance();

        // gets a reference to the entries of a specific product in DB
        final DatabaseReference entryRef = database.getReference().child("Item").child(Utilities.toUpperCase(productName)).child("entries");

        ProductEntry product = new ProductEntry();
        product.store = store.getText().toString();
        product.lat = Double.toString(location.getLatitude());
        product.lon = Double.toString(location.getLongitude());

        StorageReference storageRef = FirebaseStorage.getInstance().getReference();
        final String key = entryRef.push().getKey();

        // updates the DB if user doesn't upload picture
        if(byteArray == null) {
            product.image = "https://firebasestorage.googleapis.com/v0/b/where-sat.appspot.com/o/default_image.jpg?alt=media&token=d03a93f3-7694-4cca-b7e1-b6167e410eb7";
            entryRef.child(key).setValue(product);
        } else {
            UploadTask uploadTask = (UploadTask) storageRef.child(key).putBytes(byteArray)
                    .addOnSuccessListener(new OnSuccessListener<UploadTask.TaskSnapshot>() {
                        @Override
                        public void onSuccess(UploadTask.TaskSnapshot taskSnapshot) {
                            Toast.makeText(CreateListing.this, "Upload successful", Toast.LENGTH_LONG).show();

                            taskSnapshot.getMetadata().getReference().getDownloadUrl().addOnSuccessListener(new OnSuccessListener<Uri>() {
                                    @Override
                                    public void onSuccess(Uri url) {
                                        ProductEntry product = new ProductEntry();
                                        product.store = store.getText().toString();
                                        product.lat = Double.toString(location.getLatitude());
                                        product.lon = Double.toString(location.getLongitude());
                                        product.image = url.toString();
                                        entryRef.child(key).setValue(product);
                                    }
                                });

                                Log.d("CreateListing.class", "Upload successful.");

                            }
                        }).addOnFailureListener(new OnFailureListener() {
                            @Override
                            public void onFailure(@NonNull Exception e) {
                                Log.d("CreateListing.class", e.getMessage());
                            }
                        });
            }
        }
}