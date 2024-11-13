package com.example.btth.BTH4;

import android.os.Bundle;
import android.util.Log;
import android.view.ContextMenu;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.PopupMenu;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.example.btth.R;

public class BT1 extends AppCompatActivity {

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        Log.d("Menu", "onCreateOptionsMenu called");
        getMenuInflater().inflate(R.menu.bth4_bt1_option_menu, menu);
        return true;
    }


    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item){
        Toast.makeText(this, item.getTitle(), Toast.LENGTH_SHORT).show();
        return true;
    }
    @Override
    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo){
        super.onCreateContextMenu(menu, v, menuInfo);
        getMenuInflater().inflate(R.menu.bth4_bt1_context_menu, menu);
    }

    // Phải gọi registerForContextMenu(view) trong onCreate hoặc khi khởi tạo View
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.bth4_bt1_activity_main);

        View view = findViewById(R.id.image);
        registerForContextMenu(view);

        View btnPopupMenu = (Button) findViewById(R.id.btn);
//bắt đầu sự kiện cho button
        btnPopupMenu.setOnClickListener(new OnClickListener(){
            @Override
            public void onClick(View view){
                PopupMenu popupMenu;
                popupMenu = new PopupMenu(getApplicationContext(),btnPopupMenu);
                //đẩy layout tạo trang thành ứng dụng
                popupMenu.getMenuInflater().inflate(R.menu.bth4_bt1_popupmenu, popupMenu.getMenu());
                //sự kiện click vào item của menu
                popupMenu.setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener(){
                    @Override
                    public  boolean onMenuItemClick(MenuItem item){
                        Toast.makeText(BT1.this,"Bạn vừa chọn popup menu", Toast.LENGTH_SHORT).show();
                            return false;
                    }
                });
                popupMenu.show();
            }
        });
    }
}
