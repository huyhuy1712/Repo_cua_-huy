package com.example.btth.BTH6;

import android.app.IntentService;
import android.content.Intent;
import android.util.Log;

import androidx.annotation.Nullable;

public class BT2_ExampleIntentService extends IntentService {

    @Override
    protected void onHandleIntent(@Nullable Intent intent) {
        Log.d("ExampleIntentService", "Task in Progress");

        try{
            Thread.sleep(5000);

        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        Log.d("ExampleIntentService", "Task completed");
    }


    public BT2_ExampleIntentService(){
        super("ExampleIntentService");
    }
}
