import org.graalvm.polyglot.Context;

public class Test {

    public static void main(String[] args) {
        Context.create("js");
        System.out.println("done");
    }
}
