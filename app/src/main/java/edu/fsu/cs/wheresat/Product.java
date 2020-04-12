package edu.fsu.cs.wheresat;

public class Product {
    public Product(String name, String brand, String image) {
        super();
        this.name = name;
        this.brand = brand;
        this.image = image;
    }
    private String name;
    private String brand;
    private String image;

    public String getName() {
        return name;
    }
    public void setName(String nameText) {
        name = nameText;
    }

    public String getBrand() {
        return brand;
    }
    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }
}