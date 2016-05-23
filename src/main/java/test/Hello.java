package test;

public class Hello {

    public static void main(String[] args) {
        say("test.Hello ");
        new Hello().concat("test.Hello ", "test.World");
    }

    @LogArgs
    public static void say(String string) {
        System.out.println(string);
    }

    @LogArgs
    @Timed
    public void concat(String one, String two) {
        System.out.println(one + two);
    }
}