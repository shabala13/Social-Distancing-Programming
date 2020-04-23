package edu.fsu.cs.wheresat;

import android.os.AsyncTask;
import android.view.View;
import android.widget.ProgressBar;

import java.util.concurrent.Callable;

public class AsyncTaskRunner extends AsyncTask<String, String, String> {
    private String resp;
    ProgressBar progressBar;
    private Callable<Void> function;

    public AsyncTaskRunner(ProgressBar progressBar, Callable<Void> function)
    {
        this.progressBar = progressBar;
        this.function = function;
    }

    @Override
    protected String doInBackground(String ... params) {
        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        try {
            function.call();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "String";
    }

    @Override
    protected void onPostExecute(String result) {
        progressBar.setVisibility(View.INVISIBLE);
    }

    @Override
    protected void onPreExecute() {
        progressBar.setVisibility(View.VISIBLE);
    }

    @Override
    protected void onProgressUpdate(String... text) {}
}
