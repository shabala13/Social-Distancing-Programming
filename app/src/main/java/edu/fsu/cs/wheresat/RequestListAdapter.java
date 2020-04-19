package edu.fsu.cs.wheresat;

import java.util.List;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.constraintlayout.widget.ConstraintLayout;

import edu.fsu.cs.wheresat.R;
import edu.fsu.cs.wheresat.Request;

public class RequestListAdapter extends ArrayAdapter<Request> {
    private int layoutId;
    private Context context;

    public RequestListAdapter (Context context, int layoutId, List<Request> requests) {
        super(context, layoutId, requests);

        this.layoutId = layoutId;
        this.context = context;
    }

    @Override
    public View getView (int position, View view, ViewGroup parent) {

        // Connecting Views to Variables for editing
        view = (ConstraintLayout) LayoutInflater.from(context).inflate(layoutId, null );
        Request request = getItem(position);
        TextView itemName = (TextView) view.findViewById(R.id.name);
        TextView date = (TextView) view.findViewById(R.id.date);
        TextView time = (TextView) view.findViewById(R.id.time);

        itemName.setText(request.itemName);
        date.setText(request.date);
        time.setText(request.time);

        return view;
    }
}

