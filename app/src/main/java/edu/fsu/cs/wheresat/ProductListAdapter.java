package edu.fsu.cs.wheresat;
import java.util.List;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

public class ProductListAdapter extends ArrayAdapter<Product> {
    private int resource;
    private LayoutInflater inflater;
    private Context context;

    public ProductListAdapter(Context ctx, int resourceId, List<Product> objects) {
        super(ctx, resourceId, objects);
        resource = resourceId;
        inflater = LayoutInflater.from(ctx);
        context = ctx;
    }

    @Override
    public View getView ( int position, View convertView, ViewGroup parent ) {

        // Connecting Views to Variables for editing
        convertView = (RelativeLayout) inflater.inflate(resource, null);
        Product product = getItem(position);
        TextView productName = (TextView) convertView.findViewById(R.id.productName);
        TextView productBrand = (TextView) convertView.findViewById(R.id.productBrand);
        ImageView productImage = (ImageView) convertView.findViewById(R.id.productImage);


        // Getting reference image from Drawable section
        // TODO: Figure out how to grab image from DB and set it to product image (Drawable?)
        String image_name = product.getImage();
        int imageResource = getContext().getResources().getIdentifier(image_name, "drawable", context.getPackageName());
        Drawable image = getContext().getResources().getDrawable(imageResource);

        // Setting product listing Name, Brand, and Image
        productName.setText(product.getName());
        productBrand.setText(product.getBrand());
        productImage.setImageDrawable(image);

        return convertView;
    }
}