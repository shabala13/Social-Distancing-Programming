package edu.fsu.cs.wheresat;

import java.util.ArrayList;
import java.util.List;

import android.content.Intent;
import android.os.Bundle;
import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.Toast;

public class ResultPageActivity extends Activity {
    private ListView listViewProduct;
    private Context ctx;
    private ImageButton back_button;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result_page);
        ctx=this;

        // Setting up Back Button
        back_button = (ImageButton) findViewById(R.id.back_image_button);
        back_button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent return_home = new Intent(getApplicationContext(), HomePageActivity.class);
                startActivity(return_home);
            }
        });


        // Creating temp list
        List<Product> legendList= new ArrayList<Product>();
        legendList.add(new Product("Ultrasoft","Charmin","angelsoftdouble"));
        legendList.add(new Product("UltraStrong","Charmin","charminultrasoft"));
        legendList.add(new Product("Double Rolled","AngelSoft","charminultrastrong"));


        listViewProduct = (ListView) findViewById( R.id.FootballLegend_list);
        listViewProduct.setAdapter( new ProductListAdapter(ctx, R.layout.single_result, legendList ) );

        // Click event for single list row
        listViewProduct.setOnItemClickListener(new OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Product o = (Product) parent.getItemAtPosition(position);
                Toast.makeText(ResultPageActivity.this, o.getName().toString(), Toast.LENGTH_SHORT).show();
            }
        });
    }
}
