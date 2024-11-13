package com.example.btth.BTH3;

import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.example.btth.R;

public class BT2 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.bth3_bt2);

        final EditText editText = (EditText) findViewById(R.id.inputText);

        editText.setOnKeyListener(new View.OnKeyListener() {

            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (event.getAction() == KeyEvent.ACTION_DOWN && keyCode == KeyEvent.KEYCODE_ENTER) {
                    String message = editText.getText().toString();
                    Toast.makeText(BT2.this, message, Toast.LENGTH_SHORT).show();
                    return true;
                }
                return false;
            }
        });
    }
}
