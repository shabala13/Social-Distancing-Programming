package edu.fsu.cs.wheresat;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.ProgressBar;

import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.GenericTypeIndicator;
import com.google.firebase.database.ValueEventListener;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.NavigableMap;
import java.util.TreeMap;
import java.util.concurrent.Callable;

public class HomePageActivity extends AppCompatActivity implements Callable<Void> {
    private List<String> top_result_list = new ArrayList<>();
    private ListView top_search_view;
    private final String TAG = "HomePageActivity.class";
    private FirebaseUser firebaseUser;
    private DatabaseReference topItemsRef, topRef;
    private ProgressBar progressBar;
    private EditText search_bar;
    View tempView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home_page);

        firebaseUser = getIntent().getExtras().getParcelable("user");
        top_search_view = (ListView) findViewById(R.id.top_searches);
        progressBar = (ProgressBar) findViewById(R.id.progressTopTen);
        search_bar = (EditText) findViewById(R.id.search_bar);

        // Set Enter Key Listener for Search Bar
        search_bar.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View view, int keyCode, KeyEvent event) {
                EditText s_bar = (EditText) findViewById(R.id.search_bar);

                if (keyCode == EditorInfo.IME_ACTION_SEARCH ||
                        keyCode == EditorInfo.IME_ACTION_DONE ||
                        event.getAction() == KeyEvent.ACTION_DOWN &&
                                event.getKeyCode() == KeyEvent.KEYCODE_ENTER) {

                    if (!event.isShiftPressed()) {
                        if (view.getId() == R.id.search_bar) {
                            String product_name = s_bar.getText().toString();
                            Intent intent = new Intent(getApplicationContext(), ResultPageActivity.class);
                            Bundle bundle = new Bundle();
                            bundle.putParcelable("user", (Parcelable) firebaseUser);
                            intent.putExtras(bundle);
                            intent.putExtra("product_name", product_name);
                            startActivity(intent);
                            return true;
                        }
                    }
                }
                Log.i("KEY", "Returning false.");
                return false; // pass on to other listeners.

            }
        });

        AsyncTaskRunner runner = new AsyncTaskRunner(progressBar, this);
        runner.execute("String");
    }


    // Creates the hamburger menu, uses the res/menu/menu.xml setup
    @Override
    public boolean onCreateOptionsMenu(Menu menu){
        getMenuInflater().inflate(R.menu.menu, menu);
        return true;
    }

    // Manages the selection of the menu items
    @Override
    public boolean onOptionsItemSelected(MenuItem item){
        Bundle bundle;

        // opens user profile page
        switch (item.getItemId()) {
            case R.id.profile_page_selection:
                Intent profile_page_selection = new Intent(this, ProfileActivity.class);
                bundle = new Bundle();
                bundle.putParcelable("user", (Parcelable) firebaseUser);
                profile_page_selection.putExtras(bundle);
                startActivity(profile_page_selection);
                break;

            case R.id.close_selection:
                finish();
                break;
        }
        return true;
    }

    @Override
    public Void call()
    {
        FirebaseDatabase database = FirebaseDatabase.getInstance();

        // get DB reference to top ten searches
        topItemsRef = database.getReference("TOP10");
        topItemsRef.addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
                progressBar.setVisibility(View.VISIBLE);
                progressBar.bringToFront();
                // Firebase only allows us to directly serialize to a HashMap of Strings, so need to construct
                // a new TreeMap with Integers after serialization

                // get HashMap from DB
                GenericTypeIndicator<HashMap<String, String>> genericTypeIndicator = new GenericTypeIndicator<HashMap<String, String>>() {};
                HashMap<String, String> topTenItemsString = dataSnapshot.getValue(genericTypeIndicator);

                // Build TreeMap in ascending order
                TreeMap<Integer, String> topTenItems = new TreeMap<>();

                for (HashMap.Entry entry : topTenItemsString.entrySet())
                    topTenItems.put(Integer.parseInt((String) entry.getKey()), (String) entry.getValue());

                // add items to List<String> temp_result_list in descending order
                for(NavigableMap.Entry<Integer, String> entry : topTenItems.descendingMap().entrySet()) {
                    top_result_list.add(Utilities.toLowerCase(entry.getValue()));
                }

                progressBar.setVisibility(View.INVISIBLE);
                // Creates an adapter for the ListView and uses it to fill view with temp_result_list
                final ArrayAdapter<String> adapter = new ArrayAdapter<String>(getApplicationContext(), android.R.layout.simple_list_item_1, top_result_list);
                top_search_view.setAdapter(adapter);

                top_search_view.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                    @Override
                    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                        top_search_view.setVisibility(View.INVISIBLE);

                        String product_name = adapter.getItem(position);
                        Intent intent = new Intent(getApplicationContext(), ResultPageActivity.class);
                        Bundle bundle = new Bundle();
                        bundle.putParcelable("user", (Parcelable) firebaseUser);
                        intent.putExtras(bundle);
                        intent.putExtra("product_name", product_name);
                        startActivity(intent);

                    }
                });

            }

            @Override
            public void onCancelled(@NonNull DatabaseError databaseError) {}
        });

        return null;
    }
}
