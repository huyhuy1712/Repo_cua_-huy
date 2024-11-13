package com.example.btth.BTH1;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.example.btth.R;

public class BT2 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.bth1_bt2);

        // Khởi tạo các view từ layout
        ImageView imageView = findViewById(R.id.imageView);
        TextView imageName = findViewById(R.id.imageName);
        EditText commentEditText = findViewById(R.id.commentEditText);
        Button showCommentButton = findViewById(R.id.showCommentButton);

        // Đặt tên hình ảnh (hoặc bạn có thể thiết lập động từ mã nguồn)
        imageName.setText("Hình ảnh uta");

        // Xử lý sự kiện khi nhấn nút "Hiển thị bình luận"
        showCommentButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String comment = commentEditText.getText().toString().trim();

                if (!comment.isEmpty()) {
                    // Hiển thị bình luận dưới dạng Toast
                    Toast.makeText(BT2.this, "Bình luận: " + comment, Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(BT2.this, "Vui lòng nhập bình luận", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }
}
