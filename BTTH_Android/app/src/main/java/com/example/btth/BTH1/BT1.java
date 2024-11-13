package com.example.btth.BTH1;

import android.os.Bundle;
import android.widget.ImageView;

import androidx.appcompat.app.AppCompatActivity;

import com.example.btth.R;

public class BT1 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        ImageView myImg = new ImageView(this);
        myImg.setImageResource(R.drawable.uta);
    }
}
