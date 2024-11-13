package com.example.btth.BTH6;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

import com.example.btth.R;

public class BT1 extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.bth6_bt1_activity_main);

        Button btn = findViewById(R.id.btn_open_other_activity);
        btn.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                Intent intent = new Intent(getApplicationContext(), BT1_OtherActivity.class);
                intent.putExtra("message","Xin chào từ ấy");
                startActivity(intent);
            }
        });
    }
}
