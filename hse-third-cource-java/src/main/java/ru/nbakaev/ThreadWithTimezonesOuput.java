package ru.nbakaev;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

/**
 * Created by Nikita Bakaev, ya@nbakaev.ru on 3/28/2016.
 * All Rights Reserved
 */
public class ThreadWithTimezonesOuput {
    public static void main(String[] args) {

        ExecutorService es = Executors.newCachedThreadPool();

        es.submit((Runnable) () -> {
            while (true){
                DateFormat formatter = new SimpleDateFormat
                        ("EEE MMM dd HH:mm:ss zzz yyyy");
                TimeZone central = TimeZone.getTimeZone("America/Chicago");
                formatter.setTimeZone(central);
                System.out.println(formatter.format(new Date()));
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        });

        es.submit((Runnable) () -> {
            while (true) {
                DateFormat formatter = new SimpleDateFormat
                        ("EEE MMM dd HH:mm:ss zzz yyyy");
                TimeZone central = TimeZone.getTimeZone("Europe/Russia");
                formatter.setTimeZone(central);
                System.out.println(formatter.format(new Date()));
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        });




        es.shutdown();
        try {
            es.awaitTermination(1, TimeUnit.MINUTES);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }
}
