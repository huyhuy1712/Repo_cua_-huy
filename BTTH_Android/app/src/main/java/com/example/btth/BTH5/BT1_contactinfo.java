package com.example.btth.BTH5;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.example.btth.R;

public class BT1_contactinfo extends AppCompatActivity {

    private TextView nameText, emailText, projectText;
    private Button finishButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.bth5_bt1_contactinfo);

        nameText = findViewById(R.id.nameText);
        emailText = findViewById(R.id.emailText);
        projectText = findViewById(R.id.projectText);
        finishButton = findViewById(R.id.finishButton);

        // Nhận dữ liệu từ Intent
        Intent intent = getIntent();
        String name = intent.getStringExtra("name");
        String email = intent.getStringExtra("email");
        String project = intent.getStringExtra("project");

        // Hiển thị dữ liệu lên các TextView
        nameText.setText("Name: " + name);
        emailText.setText("Email: " + email);
        projectText.setText("Project: " + project);

        // Nút Finish để quay về màn hình chính hoặc đóng ứng dụng
        finishButton.setOnClickListener(v -> finish());
    }

}
