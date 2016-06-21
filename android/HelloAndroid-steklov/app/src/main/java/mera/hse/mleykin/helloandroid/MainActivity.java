package mera.hse.mleykin.helloandroid;

import android.os.Bundle;
import android.os.CountDownTimer;
import android.support.v7.app.ActionBarActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;


public class MainActivity extends ActionBarActivity {

    private Long timeExe;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button bt = (Button) findViewById(R.id.button);

        bt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                EditText t = (EditText) findViewById(R.id.editText);

                final Long timeL = Long.parseLong(t.getText().toString());
                timeExe = timeL * 1000;
                MyTimer time = new MyTimer(timeExe, 1000);
                time.start();
            }
        });
    }

    public class MyTimer extends CountDownTimer {
        public MyTimer(long millisInFuture, long countDownInterval) {
            super(millisInFuture, countDownInterval);
        }

        @Override
        public void onFinish() {

            TextView t = (TextView) findViewById(R.id.textView);

            t.setText("Done");

        }

        public void onTick(long millisUntilFinished) {
            TextView t = (TextView) findViewById(R.id.textView);
            t.setText("seconds remaining: " + millisUntilFinished / 1000);
        }
    }
}
