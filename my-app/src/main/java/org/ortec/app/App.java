package org.ortec.app;

import java.util.Random;

/**
 * Hello world!
 *
 */
public class App
{
    public App( ) {}

    //public int getRandomNumber() {
        return (int)(Math.random() * 10);
    }

    public int additionSuccess(int value1, int value2) {

        return value1+value2;
    }

    public int additionFailed(int value1, int value2) {

        return value1+value2+1;
    }

    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );
    }
}
