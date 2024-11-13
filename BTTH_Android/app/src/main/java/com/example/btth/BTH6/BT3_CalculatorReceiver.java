package com.example.btth.BTH6;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.media.tv.BroadcastInfoRequest;
import android.os.Build;
import android.widget.Toast;

import androidx.annotation.RequiresApi;

@RequiresApi(api = Build.VERSION_CODES.TIRAMISU)
public class BT3_CalculatorReceiver extends BroadcastReceiver {


    public void onReceive(Context context, Intent intent){
        switch (intent.getAction()){
            case BT3.Key.ACTION_PLUS_NUMBER:
                int a = intent.getIntExtra(BT3.Key.NUMBER_A,0);
                int b = intent.getIntExtra(BT3.Key.NUMBER_B,0);
                Toast.makeText(context, "Resuilt= "+(a+b), Toast.LENGTH_SHORT).show();
                break;
            default:
                break;
        }
    }
}
