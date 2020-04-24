package edu.fsu.cs.wheresat;

/*
User class used to load/store data into Firebase. Variables correspond to key/value pairs present
in the DB.

User needs to have a public default constructor to be serialized (loaded from DB or used to store
to DB). Also, all fields must be public or have getters and setters to be serialized.
 */

import com.google.firebase.database.Exclude;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.NavigableMap;

public class User {
    public User() {}

    public String level;
    public String points;
    public HashMap<String, HashMap<String, String>> requests;

    @Exclude
    public List<Request> getRequestList()
    {
        List<Request> list = new ArrayList<>();

        for (HashMap<String, String> map : requests.values())
            list.add(new Request(map.get("itemName"), map.get("date"), map.get("time")));

        return list;
    }
}
