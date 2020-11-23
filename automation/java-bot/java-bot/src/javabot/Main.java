package javabot;

import java.awt.Robot;
import java.awt.event.KeyEvent;
import java.util.function.Consumer;

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

    public Main() throws Exception {
        System.out.println("Starting!");
        act(pause, 1000L);
        act(pressKey, KeyEvent.VK_ALT);
        act(typeKey, KeyEvent.VK_TAB);
        act(pause, 1000L);
        act(releaseKey, KeyEvent.VK_ALT);
        System.out.println("Finished!");
    }

    public static void main(String[] args) {
        try {
            new Main();
        } catch (Exception exception) {
            System.out.print(exception.getMessage());
        }
    }
}
