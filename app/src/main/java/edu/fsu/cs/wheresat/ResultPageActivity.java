package edu.fsu.cs.wheresat;

import java.util.ArrayList;
import java.util.List;

import android.content.Intent;
import android.os.Bundle;
import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.TextView;
import android.widget.Toast;

public class ResultPageActivity extends Activity {
    ListView listViewProduct;
    Context ctx;
    ImageButton back_button;
    TextView product_name;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        Log.i("KEY", "Entered ResultPageActivity");
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result_page);
        product_name = (TextView) findViewById(R.id.searched_product);
        Log.i("KEY", "View created.");
        String search_name = getIntent().getStringExtra("search_name");
        Log.i("KEY", "Printing search:");
        Log.i("KEY", search_name);
        product_name.setText(search_name);
        Log.i("KEY", "setText done.");

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


        listViewProduct = (ListView) findViewById(R.id.FootballLegend_list);
        listViewProduct.setAdapter( new ProductListAdapter(ctx, R.layout.single_result, legendList));

        // Click event for single list row
        listViewProduct.setOnItemClickListener(new OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Product o = (Product) parent.getItemAtPosition(position);
                Toast.makeText(ResultPageActivity.this, o.getName().toString(), Toast.LENGTH_SHORT).show();
                Intent send_to_product = new Intent(getApplicationContext(), ProductPageActivity.class);
                send_to_product.putExtra("chosen_product_name", o.getName());
                send_to_product.putExtra("chosen_product_brand", o.getBrand());
                send_to_product.putExtra("chosen_product_image", o.getImage());
                startActivity(send_to_product);

            }
        });
    }
}