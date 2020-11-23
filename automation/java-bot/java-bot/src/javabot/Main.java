package javabot;

import java.awt.datatransfer.StringSelection;
import java.awt.datatransfer.Clipboard;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import java.util.function.Function;
import java.awt.event.KeyEvent;
import java.awt.Toolkit;
import java.awt.Robot;

class Main {

    private Robot robot = new Robot();

    Consumer<Long> pause = (Long millis) -> { try { Thread.sleep(millis); } catch (Exception exception) {}};
    Consumer<Integer> pressKey = (Integer keyCode) -> robot.keyPress(keyCode);
    Consumer<Integer> releaseKey = (Integer keyCode) -> robot.keyRelease(keyCode);
    Consumer<Integer> typeKey = (Integer keyCode) -> {
        pressKey.accept(keyCode);
        releaseKey.accept(keyCode);
    };

    private <T> void act(Consumer<T> consumer, T argument) {
        consumer.accept(argument);
    }

    private Map<String, ArrayList<Product>> getProducts() throws Exception {
        String[] lines = FileIO.readFileLines("../../data/products.json");
        Map<String, ArrayList<Product>> productsMap = new HashMap<String, ArrayList<Product>>();
        String searchTerm = "";
        for (String line : lines) {
            // System.out.println(line);
            ArrayList<Product> products = new ArrayList<Product>();
            if (line.contains("searchTerm")) {
                searchTerm = line.split("searchTerm")[1].split("\"")[2];
            }
            if (line.contains("items")) {
                BiFunction<String, Boolean, ArrayList<String>> getKeyValue = (String key, Boolean isDouble) -> {
                    int i = 0;
                    ArrayList<String> values = new ArrayList<String>();
                    for (String img : line.split(key)) {
                        if (i++ != 0) {
                            if (isDouble) {
                                values.add(img.split("\"")[1].split(":")[1].split(",")[0]);
                            } else {
                                values.add(img.split("\"")[2]);
                            }
                        }
                    }
                    return values;
                };
                ArrayList<String> skus = getKeyValue.apply("sku", false);
                ArrayList<String> names = getKeyValue.apply("name", false);
                ArrayList<String> brands = getKeyValue.apply("brand", false);
                ArrayList<String> prices = getKeyValue.apply("price", true);
                ArrayList<String> imageURLs = getKeyValue.apply("imageURL", false);
                for (int i = 0; i < 24; i++) {
                    products.add(new Product(
                        skus.get(i),
                        names.get(i),
                        brands.get(i),
                        Double.parseDouble(prices.get(i)),
                        imageURLs.get(i)
                    ));
                }
            }
            if (searchTerm != "" && products.size() != 0) {
                productsMap.put(searchTerm, products);
                searchTerm = "";
            }
        }
        return productsMap;
    }

    private String getClassification(String category) throws Exception {
        Map<String, String[]> classifications = new HashMap<String, String[]>();
        classifications.put("peripherals", new String[] {
            "mice",
            "keyboards",
            "speakers",
            "headphones"
        });
        classifications.put("accessories", new String[] {
            "adapters",
            "chargers",
            "cables",
            "mousepads",
            "power strips"
        });
        classifications.put("hardware", new String[] {
            "graphics cards",
            "power supplies",
            "memory",
            "CPUs",
            "mother boards"
        });
        classifications.put("devices", new String[] {
            "laptops",
            "phones",
            "monitors",
            "routers"
        });
        for (String classification : classifications.keySet()) {
            for (String cat : classifications.get(classification)) {
                if (cat.equals(category)) {
                    return classification;
                }
            }
        }
        throw new Exception("classification not found for " + category);
    }

    private void copy(String text) {
        Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
        clipboard.setContents(new StringSelection(text), null);
    }

    private void paste() {
        act(pressKey, KeyEvent.VK_CONTROL);
        act(typeKey, KeyEvent.VK_V);
        act(releaseKey, KeyEvent.VK_CONTROL);
    }

    public Main() throws Exception {
        System.out.println("Starting!");
        act(pause, 5000L);

        Map<String, ArrayList<Product>> productsMap = getProducts();
        System.out.println("----");
        act(typeKey, KeyEvent.VK_F12);
        for (String key : productsMap.keySet()) {
            // System.out.println(key);
            // System.out.println(productsMap.get(key).toString());
            for (Product product : productsMap.get(key)) {
                String unformattedString = "window.automatedInsertItem('%s', '%s', '%s', '%s', %s);";
                String jsFunctionCallString = String.format(unformattedString,
                    String.format("%s/%s", getClassification(key), key), product.name, product.sku, product.brand, product.price + "");
                // System.out.println(jsFunctionCallString);
                act(pause, 1000L);
                act(typeKey, KeyEvent.VK_F12);
                act(pause, 1000L);
                act(typeKey, KeyEvent.VK_F12);
                act(pause, 1000L);
                copy(jsFunctionCallString);
                paste();
                act(typeKey, KeyEvent.VK_ENTER);
                break;
            }
            break;
        }
        System.out.println("Finished!");
    }

    public static void main(String[] args) {
        try {
            new Main();
        } catch (Exception exception) {
            System.out.println("---- Exception! ----");
            System.out.print(exception.getMessage());
            System.out.println("---- Exception! ----");
            exception.printStackTrace();
        }
    }
}
