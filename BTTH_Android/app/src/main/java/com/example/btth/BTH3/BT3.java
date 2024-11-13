package com.example.btth.BTH3;

import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.example.btth.R;

public class BT3 extends AppCompatActivity {

    @Override

    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);

        setContentView(R.layout.bth3_bt3);

        View v1 =findViewById(R.id.view1);

        v1.setOnTouchListener(new View.OnTouchListener() {

            @Override

            public boolean onTouch (View v, MotionEvent event) {

                if (event.getAction()==MotionEvent.ACTION_DOWN)

                    Toast.makeText(BT3.this,"Bạn vừa chạm màn hình", Toast.LENGTH_SHORT).show();

                return false;

            }

        });

        } }