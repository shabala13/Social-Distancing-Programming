package edu.fsu.cs.wheresat;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.TextView;

import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.util.List;

public class ProfileActivity extends AppCompatActivity {
    TextView username, email, points, level;
    final String TAG = "ProfileActivity";
    ListView requestList;
    ImageButton back_button;
    FirebaseUser firebaseUser;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);

        firebaseUser = getIntent().getExtras().getParcelable("user");

        //set up the text views so that they may be changed when viewing the users profile
        username = (TextView) findViewById(R.id.username);

        email = (TextView) findViewById(R.id.email);
        email.setText(firebaseUser.getEmail());

        points = (TextView) findViewById(R.id.points);
        level = (TextView) findViewById(R.id.level);
        back_button = (ImageButton) findViewById(R.id.back_image_button);
        requestList = (ListView) findViewById(R.id.requestList);

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

                points.setText(Long.toString(user.points));
                level.setText(user.level);

                // change level's text color to reflect user's level
                if (user.level.equals("Gold"))
                    level.setTextColor(Color.parseColor("#FFD700"));
                else if (user.level.equals("Silver"))
                    level.setTextColor(Color.parseColor("#C0C0C0"));
                else
                    level.setTextColor(Color.parseColor("#A46628"));

                List<Request> request_list = user.getRequestList();
                requestList.setAdapter(new RequestListAdapter(getApplicationContext(), R.layout.listview_request_item, request_list));
            }
                @Override
                public void onCancelled(@NonNull DatabaseError databaseError) {
                    Log.d(TAG, "Did not find any entry for this user");
                }
        });

        // Back button returns to home
        back_button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });

    }

}
