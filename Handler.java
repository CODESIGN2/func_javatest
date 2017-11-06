import function.FunctionHandler;
import java.io.IOException;

public class Handler {

    public static void main(String[] args) {
        try {
            FunctionHandler func = new FunctionHandler();
            func.handle(System.in, System.out);
        } catch(IOException e) {
            e.printStackTrace();
        }
    }
}
