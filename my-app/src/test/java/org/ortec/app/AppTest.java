package org.ortec.app;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * Unit test for simple App.
 */
public class AppTest
        extends TestCase
{
    /**
     * Create the test case
     *
     * @param testName name of the test case
     */
    public AppTest( String testName )
    {
        super( testName );
    }

    /**
     * @return the suite of tests being tested
     */
    public static Test suite()
    {
        return new TestSuite( AppTest.class );
    }

    App app = new App();
    int value1;
    int value2;
    int sum;


    // assigning the values
    protected void setUp(){
        value1=(int)(Math.random() * 10);
        value2=(int)(Math.random() * 10);
    }

    /**
     * Rigourous Test :-)
     */
    public void testAppSuccess()
    {
        //assertTrue( true );
        sum = app.additionSuccess(value1, value2);
        System.out.println("testAppSuccess: " + value1 + "+" + value2 + "=" + sum);
        assertTrue(sum == (value1+value2));
    }


    public void testAppFailed() {
        sum = app.additionFailed(value1, value2);
        System.out.println("testAppFailed: " + value1 + "+" + value2 + "=" + sum);
        assertTrue(sum == (value1 + value2));
    }

    public void testAppDrei() {
    sum = app.additionFailed(value1, value2);
    System.out.println("testApp333: " + value1 + "+" + value2 + "=" + sum);
    assertTrue(sum == (value1+value2));
    assertTrue( false);
}
    public void testApppVier() {
        sum = app.additionFailed(value1, value2);
        System.out.println("testApp333: " + value1 + "+" + value2 + "=" + sum);
        assertTrue(sum == (value1+value2));
        assertTrue( false);
    }

    public void ttestApppDrei() {
        sum = app.additionFailed(value1, value2);
        System.out.println("testApp333: " + value1 + "+" + value2 + "=" + sum);
        assertTrue(sum == (value1+value2));
        assertTrue( false);
    }

}
