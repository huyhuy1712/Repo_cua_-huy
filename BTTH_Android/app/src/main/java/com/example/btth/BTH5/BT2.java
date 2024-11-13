package com.example.btth.BTH5;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

import com.example.btth.R;

public class BT2 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.bth5_bt2);

        // Tìm Button trong layout
        Button button = findViewById(R.id.button2);

        // Thiết lập sự kiện click cho Button
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www/google.com.vn"));
                startActivity(intent);
            }
        });
    }
}
