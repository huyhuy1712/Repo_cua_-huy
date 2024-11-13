package com.example.btth.BTH6;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

import com.example.btth.R;

public class BT2 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.bth6_bt2_acvtivity_main);

        Button startServiceButton =findViewById(R.id.start_service_btn);

        startServiceButton.setOnClickListener(v -> {
            Intent intent = new Intent(BT2.this, BT2_ExampleIntentService.class);
            startService(intent);
        });
    }
}
