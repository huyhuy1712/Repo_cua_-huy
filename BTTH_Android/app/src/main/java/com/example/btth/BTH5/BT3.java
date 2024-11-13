package com.example.btth.BTH5;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

import com.example.btth.R;

public class BT3 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle saveInstanceState){
        super.onCreate(saveInstanceState);
        setContentView(R.layout.bth5_bt3);

        Button b1 = findViewById(R.id.button1);
        Button b2 = findViewById(R.id.button2);
        Button b3 = findViewById(R.id.button3);
        Button b4 = findViewById(R.id.button4);
        Button b5 = findViewById(R.id.button5);
        Button b6 = findViewById(R.id.button6);

        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i1 =new Intent(Intent.ACTION_DIAL, Uri.parse("tel:(+84)123456789"));
                startActivity(i1);
            }
        });
        b2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i2 =new Intent(Intent.ACTION_VIEW, Uri.parse("content://contacts/people/"));
                startActivity(i2);
            }
        });
        b3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i3 =new Intent(Intent.ACTION_SENDTO, Uri.parse("sms:5551234"));
                i3.putExtra("sms_body","gsgsdhdsdsh");
                startActivity(i3);
            }
        });
        b4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                    Intent i4 = new Intent();
                    i4.setType("image/pictures/*");
                    i4.setAction(Intent.ACTION_GET_CONTENT);
                startActivity(i4);
            }
        });
        b5.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i5 = new Intent("android.intent.action.MUSIC_PLAYER");
                startActivity(i5);
            }
        });
        b6.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String url = "http://maps.google.com/maps?"+
                        "saddr=9.938083,-84.054430&daddr=9.926392,-84.055964";
                Intent i5 = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
                startActivity(i5);
            }
        });
    }
}
