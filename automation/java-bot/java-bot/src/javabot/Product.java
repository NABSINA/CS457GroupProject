package javabot;

public class Product {

    public String sku;
    public String name;
    public String brand;
    public double price;
    public String imageURL;

    public Product(String sku, String name, String brand, double price, String imageURL) {
        this.sku = sku.replace("'", "");
        this.name = name.replace("'", "");
        this.brand = brand.replace("'", "");
        this.price = price;
        this.imageURL = imageURL;
    }

    @Override
    public String toString() {
        return String.format("{\"sku\": \"%s\", \"name\": \"%s\", \"brand\": \"%s\", \"price\": %s, \"imageURL\": \"%s\"}",
            this.sku, this.name, this.brand, this.price + "", this.imageURL);
    }
}
