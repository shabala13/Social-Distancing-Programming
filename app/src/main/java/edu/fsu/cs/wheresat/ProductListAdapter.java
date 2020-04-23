package edu.fsu.cs.wheresat;
import java.util.List;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

public class ProductListAdapter extends ArrayAdapter<ProductEntry> {
    private int resource;
    private LayoutInflater inflater;
    private Context context;

    public ProductListAdapter(Context ctx, int resourceId, List<ProductEntry> objects) {
        super(ctx, resourceId, objects);
        resource = resourceId;
        inflater = LayoutInflater.from(ctx);
        context = ctx;
    }

    @Override
    public View getView ( int position, View convertView, ViewGroup parent ) {

        // Connecting Views to Variables for editing
        convertView = (RelativeLayout) inflater.inflate(resource, null);
        ProductEntry product = getItem(position);
        TextView productStore = (TextView) convertView.findViewById(R.id.productName);
        ImageView productImage = (ImageView) convertView.findViewById(R.id.productImage);

        Picasso.get().load(product.image).rotate(90).into(productImage);

        // Setting product listing Name, Brand, and Image
        productStore.setText(product.store);

        return convertView;
    }
}