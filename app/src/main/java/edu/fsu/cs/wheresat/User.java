package edu.fsu.cs.wheresat;

/*
User class used to load/store data into Firebase. Variables correspond to key/value pairs present
in the DB.

User needs to have a public default constructor to be serialized (loaded from DB or used to store
to DB). Also, all fields must be public or have getters and setters to be serialized.
 */

import java.util.HashMap;

public class User {
    public User() {}

    public String level;
    public long points;
    public HashMap<String, String> requestHistory;
}
