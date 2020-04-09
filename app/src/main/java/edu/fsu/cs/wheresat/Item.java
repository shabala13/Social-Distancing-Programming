package edu.fsu.cs.wheresat;

/*
Item class used to load/store data into Firebase. Variables correspond to key/value pairs present
in the DB.

Item needs to have a public default constructor to be serialized (loaded from DB or used to store
to DB). Also, all fields must be public or have getters and setters to be serialized.
 */

import java.util.HashMap;

public class Item {
    public Item(){};

    // add location, notes, picture, price, and timestamp fields when needed to this HashMap
    public HashMap<String, String> entry;
    public int searchCount;
}
