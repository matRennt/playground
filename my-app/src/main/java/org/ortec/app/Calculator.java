package org.ortec.app;

/**
 * Created by ortecadmin on 01.08.2016.
 */
public class Calculator {
    public int evaluate(String expression) {
        int sum = 0;
        for (String summand: expression.split("\\+"))
            sum += Integer.valueOf(summand);
        return sum;
    }
}
