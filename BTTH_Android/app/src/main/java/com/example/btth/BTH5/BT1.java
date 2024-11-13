package com.example.btth.BTH5;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;

import com.example.btth.R;

public class BT1 extends AppCompatActivity {

    private EditText nameInput, emailInput, projectInput;
    private Button viewInfoButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.bth5_bt1_activity_main);

        nameInput = findViewById(R.id.nameInput);
        emailInput = findViewById(R.id.emailInput);
        projectInput = findViewById(R.id.projectInput);
        viewInfoButton = findViewById(R.id.viewInfoButton);

        viewInfoButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Lấy thông tin từ các EditText
                String name = nameInput.getText().toString();
                String email = emailInput.getText().toString();
                String project = projectInput.getText().toString();

                // Tạo Intent để chuyển sang màn hình mới
                Intent intent = new Intent(BT1.this, BT1_contactinfo.class);
                intent.putExtra("name", name);
                intent.putExtra("email", email);
                intent.putExtra("project", project);
                startActivity(intent);
            }
        });
    }
}
