package edu.fsu.cs.wheresat;

public class Request {
    public Request(String itemName, String date, String time){
        this.itemName = itemName;
        this.date = date;
        this.time = time;
    };

    String itemName;
    String date;
    String time;
}
