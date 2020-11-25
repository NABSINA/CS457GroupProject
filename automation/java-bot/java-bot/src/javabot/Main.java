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

    private String getBtnClickJS(String selctor) {
        return "(() => {"
            + "\n\tconst btnUploadTagPicture = document.querySelector('[" + selctor + "]');"
            + "\n\t(btnUploadTagPicture ? btnUploadTagPicture.click() : undefined);"
            + "\n})();";
    }

    private void runJS(String jsCode) {
        act(pause, 2000L);
        System.out.println(jsCode);
        copy(jsCode);
        paste();
        act(typeKey, KeyEvent.VK_ENTER);
    }

    public Main() throws Exception {
        System.out.println("Starting!");
        act(pause, 5000L);
        String placeItemURL = "http://134.193.19.25/server/market/cgi-bin/b0choose.pl?country=usa&city=kc&shop=store15&classify=accessories&category=cables&cart=&language=english&user=staff&dllogin=store15&dlpasswordenc=!0+1+82312+49908+13121+7828+99017+53180+53638+40635+53153+11804+0+1+16628+43227+4246+64536+35965+70956+2266+30531+93441+78402+!&action=b0insert.pl";
        Map<String, ArrayList<Product>> productsMap = getProducts();
        System.out.println("----");
        act(typeKey, KeyEvent.VK_F12);
        int itemCount = 0;
        for (String key : productsMap.keySet()) {
            for (Product product : productsMap.get(key)) {
                String unformattedString = "window.automatedInsertItem('%s', '%s', '%s', '%s', %s);";
                String jsSelectCategoryAndFillForm = String.format(unformattedString,
                    String.format("%s/%s", getClassification(key), key), product.name, product.sku, product.brand, product.price + "");
                act(pause, 2000L);
                act(typeKey, KeyEvent.VK_F12);
                act(pause, 2000L);
                act(typeKey, KeyEvent.VK_F12);
                for (int i = 0; i < 2; i++) {
                    runJS(jsSelectCategoryAndFillForm);
                }
                for (String uploadBtnValue : new String[] {"Upload Tag Picture", "Upload Pictures"}) {
                    act(pause, 2000L);
                    runJS(getBtnClickJS("value=\"" + uploadBtnValue + "\""));
                    act(pause, 2000L);
                    act(typeKey, KeyEvent.VK_F12);
                    runJS(getBtnClickJS("name=\"upfile\""));
                    act(pause, 2500L);
                    copy(product.imageURL);
                    paste();
                    act(typeKey, KeyEvent.VK_ENTER);
                    act(pause, 7500L);
                    runJS(getBtnClickJS("value=\"Upload\""));
                    act(pause, 500L);
                    runJS(getBtnClickJS("value=\"OK\""));
                }
                for (int i = 0; i < 2; i++) {
                    act(pause, 500L);
                    act(typeKey, KeyEvent.VK_F6);
                }
                copy(placeItemURL);
                paste();
                act(typeKey, KeyEvent.VK_ENTER);
                if (++itemCount >= 2) {
                    break;
                }
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
