package ru.nbakaev.numbers;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.mutable.MutableInt;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Map;

/**
 * Created by Nikita Bakaev, ya@nbakaev.ru on 2/7/2016.
 * All Rights Reserved
 */
public class CountMain {

    public static void main(String[] args) throws FileNotFoundException {
        long startTime = System.currentTimeMillis();
        NumberProcessor numberProcessor = new NumberProcessor();
        long endTime = System.currentTimeMillis();
        int lettersSize = 0;

        // english characters
        String[] lowCase = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
        String[] upCase = Arrays.asList(lowCase).stream().map(String::toUpperCase).toArray(String[]::new);

        String[] allCharacters = (String[]) ArrayUtils.addAll(lowCase, upCase);

        System.out.println("All characters");
        for (Map.Entry<String, MutableInt> entry : numberProcessor.getLetters().entrySet()) {
            System.out.println("'" + entry.getKey() + "'" + ": " + entry.getValue());
            lettersSize= lettersSize + entry.getValue().intValue();
        }

        System.out.println("==========================================");
        System.out.println("English characters");

        PrintWriter out = new PrintWriter(numberProcessor.getInputFileName() + ".result");
        StringBuilder stringBuilder = new StringBuilder();

        numberProcessor.getLetters()
                .entrySet()
                .stream()
                .filter(entry -> Arrays.asList(allCharacters)
                .contains(entry.getKey()))
                .forEach(entry -> {
                    String s = "'" + entry.getKey() + "'" + ": " + entry.getValue() + "\r\n";
                    stringBuilder.append(s);
                    System.out.print(s);
                }  );

        out.println(stringBuilder);
        out.close();

        System.out.println("");
        System.out.println("All letters in file processed: " + lettersSize);
        System.out.println("Time: " + (endTime - startTime  ) / 1000  + " secs." );

    }

}
