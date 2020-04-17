package edu.fsu.cs.wheresat;

public class Utilities {
    public static String toLowerCase(String reference) {

        reference = reference.toLowerCase();

        reference.replace('_', ' ');

        return reference;
    }

    public static String toUpperCase(String reference) {
        reference = reference.toUpperCase();

        reference.replace(' ', '_');

        return reference;
    }

}
