package com.example.btth.BTH4;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import com.example.btth.R;

import java.util.Date;

public class BT2 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.bth4_bt2_activity_main);

        // Tìm Button sau khi layout đã được thiết lập
        final Button btn = (Button) findViewById(R.id.button);

        // Tạo AlertDialog
        final AlertDialog ad = new AlertDialog.Builder(this).create();

        // Đặt sự kiện OnClick cho button
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
              Date t = new Date();
              String message = "Thời gian hiện hành" + t.toString();
              ad.setMessage(message);
              ad.show();
            }
        });
    }
}
