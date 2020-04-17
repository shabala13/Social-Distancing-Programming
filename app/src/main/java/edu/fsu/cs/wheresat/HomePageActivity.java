package edu.fsu.cs.wheresat;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.inputmethod.EditorInfo;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ListView;
import android.view.View;
import android.view.View.OnKeyListener;
import android.widget.Toast;

public class HomePageActivity extends AppCompatActivity implements OnKeyListener {
    String[] temp_result_list = {
            "Toilet Paper",
            "Gummy Worms",
            "Coffee",
            "Nintendo Switch",
            "Motivation",
            "Mike_n_Ikes",
            "RTX 2080",
            "White Claws",
            "Flashlight",
            "wheres@"
    };

    ListView top_search_view;
    EditText search_bar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home_page);

        top_search_view = (ListView) findViewById(R.id.top_searches);
        search_bar = (EditText) findViewById(R.id.search_bar);
        search_bar.setOnKeyListener(this);

        // TODO: Retrieve top result list and fill temp_result_list with it

        // Creates an adapter for the ListView and uses it to fill view with temp_result_list
        final ArrayAdapter<String> adapter = new ArrayAdapter<String>(getApplicationContext(), android.R.layout.simple_list_item_1, temp_result_list);
        top_search_view.setAdapter(adapter);

        // Clicking on Top results sends to Search Page with Product
        top_search_view.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                String product_name = adapter.getItem(position);
                Intent search_product = new Intent(getApplicationContext(), ResultPageActivity.class);
                search_product.putExtra("search_name", product_name);
                startActivity(search_product);
            }
        });


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
        switch (item.getItemId()) {
            case R.id.product_page_selection:
                Intent product_page_intent = new Intent(this, ProductPageActivity.class);
                startActivity(product_page_intent);
                break;

            case R.id.profile_page_selection:
                Intent profile_page_selection = new Intent(this, ProfileActivity.class);
                startActivity(profile_page_selection);
                break;

            case R.id.search_result_list:
                Intent new_search = new Intent(this, ResultPageActivity.class);
                startActivity(new_search);
                break;

            case R.id.close_selection:
                finish();
                break;
        }
        return true;
    }


    @Override
    public boolean onKey(View view, int keyCode, KeyEvent event) {
        Log.i("KEY", "Entered onKey function.");
        EditText s_bar = (EditText) findViewById(R.id.search_bar);

        if (keyCode == EditorInfo.IME_ACTION_SEARCH ||
                keyCode == EditorInfo.IME_ACTION_DONE ||
                event.getAction() == KeyEvent.ACTION_DOWN &&
                        event.getKeyCode() == KeyEvent.KEYCODE_ENTER) {

            if (!event.isShiftPressed()) {
                if (view.getId() == R.id.search_bar) {
                    Log.i("KEY", "Returning true.");
                    String product_name = s_bar.getText().toString();
                    Log.i("KEY", product_name);
                    Intent initiate_search = new Intent(getApplicationContext(), ResultPageActivity.class);
                    initiate_search.putExtra("search_name", product_name);
                    startActivity(initiate_search);
                    return true;
                }
            }

        }
        Log.i("KEY", "Returning false.");
        return false; // pass on to other listeners.

    }
}
