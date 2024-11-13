package com.example.btth.BTH6;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.example.btth.R;

public class BT1_OtherActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.bth6_bt1_activity_other);
        String message =getIntent().getStringExtra("message");
        TextView textView = findViewById(R.id.text_view);
        textView.setText(message);

        Button btnBackToMain = findViewById(R.id.btn_back_to_main);
        btnBackToMain.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                finish();
            }
        });
    }
}
