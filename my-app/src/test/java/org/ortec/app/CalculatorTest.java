package org.ortec.app;

import static org.junit.Assert.assertEquals;
import org.junit.Test;

/**
 * Created by ortecadmin on 01.08.2016.
 */
public class CalculatorTest {

    @Test
    public void evaluatesExpression() {
        Calculator calculator = new Calculator();
        int sum = calculator.evaluate("1+2+3");
        assertEquals(6, sum);
    }

    @Test
    public void evaluatesExpression2() {
        Calculator calculator = new Calculator();
        int sum = calculator.evaluate("1+2+4");
        assertEquals(7, sum);
    }
}
