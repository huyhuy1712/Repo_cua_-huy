package com.example.btth.BTH3;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.example.btth.R;

public class BT1 extends AppCompatActivity implements View.OnClickListener {

    public void onClick(View v) {

// do something when the button is clicked

        Toast.makeText( BT1.this,  "Sự kiện click Button", Toast.LENGTH_SHORT).show();

    }

    @Override

    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);

        setContentView(R.layout.bth3_bt1);
        Button button = findViewById(R.id.btn);
     button.setOnClickListener(this);




    }

}
