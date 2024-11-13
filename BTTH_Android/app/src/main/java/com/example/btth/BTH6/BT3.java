package com.example.btth.BTH6;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

import com.example.btth.R;

public class BT3 extends AppCompatActivity implements View.OnClickListener {

    public static class Key {
        public static final String ACTION_PLUS_NUMBER = "com.example.action_and_number";
        public static final String NUMBER_A = "number a";
        public static final String NUMBER_B = "number b";
    }

    private EditText editA, editB;
    private Button btn;
    private BT3_CalculatorReceiver receiver;

    @RequiresApi(api = Build.VERSION_CODES.TIRAMISU)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.bth6_bt3_activity_main);
        editA = (EditText) findViewById(R.id.editText1);
        editB = (EditText) findViewById(R.id.editText2);
        btn = (Button) findViewById(R.id.btn);
        btn.setOnClickListener(this);

        receiver = new BT3_CalculatorReceiver();
        IntentFilter filter = new IntentFilter();
        filter.addAction(Key.ACTION_PLUS_NUMBER);
        registerReceiver(receiver, filter, Context.RECEIVER_NOT_EXPORTED);
    }

    @Override
    protected void onDestroy() {
        unregisterReceiver(receiver);
        super.onDestroy();
    }

    @SuppressLint("UnsafeImplicitIntentLaunch")
    @Override
    public void onClick(View v) {
        try {
            int a = Integer.parseInt(editA.getText().toString());
            int b = Integer.parseInt(editB.getText().toString());
            Intent intent = new Intent();
            intent.setAction(Key.ACTION_PLUS_NUMBER);
            intent.putExtra(Key.NUMBER_A, a);
            intent.putExtra(Key.NUMBER_B, b);
            sendBroadcast(intent);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }
}
