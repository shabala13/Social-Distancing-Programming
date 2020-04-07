package edu.fsu.cs.wheresat;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MenuInflater;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class home_page extends AppCompatActivity {
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

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home_page);

        top_search_view = (ListView) findViewById(R.id.top_searches);

        // TODO: Retrieve top result list and fill temp_result_list with it

        // Creates an adapter for the ListView and uses it to fill view with temp_result_list
        final ArrayAdapter<String> adapter = new ArrayAdapter<String>(getApplicationContext(), android.R.layout.simple_list_item_1, temp_result_list);
        top_search_view.setAdapter(adapter);


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
                Intent product_page_intent = new Intent(getBaseContext(), ProductPageActivity.class);
                startActivity(product_page_intent);
            case R.id.profile_page_selection:
                Intent profile_page_selection = new Intent(getBaseContext(), ProfileActivity.class);
                startActivity(profile_page_selection);
            case R.id.close_selection:
                finish();
                break;
        }
        return true;
    }
}
