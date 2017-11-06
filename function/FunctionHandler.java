package function;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.commons.io.CopyUtils;

public class FunctionHandler {
    public void handle(InputStream in, OutputStream out) throws IOException {
        CopyUtils utils = new CopyUtils();
        utils.copy(in, out);
    }
}

