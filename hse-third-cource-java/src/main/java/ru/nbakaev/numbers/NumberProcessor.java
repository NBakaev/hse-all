package ru.nbakaev.numbers;

import org.apache.commons.lang.mutable.MutableInt;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/**
 * Created by Nikita Bakaev, ya@nbakaev.ru on 2/7/2016.
 * All Rights Reserved
 */
public class NumberProcessor {

    private Map<String, MutableInt> letters = new HashMap<>();
    private String inputFileName ;

    private void processString(String str) {
        if (str == null || str.length() == 0) return;

        for (char c : str.toCharArray()) {
            processLetter(c);
        }
    }

    private void processLetter(char aByte) {
        String s = String.valueOf(aByte);
        if (letters.containsKey(s)) {
            letters.get(s).increment();
        } else {
            letters.put(s, new MutableInt(1));
        }
    }

    public NumberProcessor() throws FileNotFoundException {

        Scanner console = new Scanner(System.in);

        System.out.println("File to be read: for example 'D:\\\\test\\\\code.txt' ");
        inputFileName = console.next();

        File file = new File(inputFileName);
        Scanner in = new Scanner(file);

        while (in.hasNextLine()) {
            processString(in.nextLine());
        }

    }

    public Map<String, MutableInt> getLetters() {
        return letters;
    }

    public String getInputFileName() {
        return inputFileName;
    }
}
