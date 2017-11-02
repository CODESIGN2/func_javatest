package com.openfaas.cli;

import java.io.IOException;
import org.apache.commons.io.CopyUtils;

/**
 * Hello world!
 *
 */
public class App
{
    public static void main( String[] args ) throws IOException
    {
        try {
          CopyUtils utils = new CopyUtils();
          utils.copy(System.in, System.out);
        } catch(IOException e) {
            e.printStackTrace();
        }
    }
}
