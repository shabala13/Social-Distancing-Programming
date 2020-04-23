package edu.fsu.cs.wheresat;

public class Utilities {
    public static String toLowerCase(String reference) {

        reference = reference.toLowerCase();

        reference = reference.replace('_', ' ');

        return reference;
    }

    public static String toUpperCase(String reference) {
        reference = reference.toUpperCase();

        reference = reference.replace(' ', '_');

        return reference;
    }

}
