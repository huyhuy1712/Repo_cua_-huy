package com.example.bt2.java;

import static com.example.bt2.ui.theme.XmlParser.exportCustomersToXML;
import static com.example.bt2.ui.theme.XmlParser.sendEmailWithXMLFile;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.util.Xml;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.example.bt2.R;
import com.example.bt2.model.Customer;
import com.example.bt2.provider.DatabaseManager;
import com.example.bt2.ui.theme.XmlParser;


import java.io.InputStream;
import java.util.List;

public class input_point_bt2 extends AppCompatActivity {

    private DatabaseManager dbManager;  // Quản lý cơ sở dữ liệu SQLite


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        dbManager = new DatabaseManager(this);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.input_point_bt2);

//        importCustomersToContentProvider();

        EditText phonenumber = findViewById(R.id.numberphope);
        TextView curr_point = findViewById(R.id.curr_point);
        EditText newPointEditText = findViewById(R.id.new_point);
        EditText noteEditText = findViewById(R.id.note);


        // Lắng nghe sự thay đổi trong EditText
        phonenumber.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int start, int count, int after) {
            }
            @Override
            public void afterTextChanged(Editable editable) {
            }
            @Override
            public void onTextChanged(CharSequence charSequence, int start, int before, int count) {
                String phoneNumber = charSequence.toString().trim();
                List<Customer> customers = dbManager.getAllCustomers();

                // Log the list of customers
                for (Customer customer : customers) {
                    Log.d("CustomerData", "Customer Phone: " + customer.getPhoneNumber() + " | Points: " + customer.getPoint());
                }
                boolean exist = false;

                // Duyệt qua từng khách hàng
                for (Customer customer : customers) {
                    if(phoneNumber.equals(customer.getPhoneNumber())){
                        exist = true;
                        curr_point.setText(String.valueOf(customer.getPoint())); //ghi điểm hiện tại
                        break;
                    }
                }
                if(!exist){
                    curr_point.setText("0"); //ghi điểm hiện tại
                }
            }
        });

        // Sự kiện cho nút import
        Button importBtn = findViewById(R.id.import_btn);
        importBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                importCustomersToContentProvider();
            }
        });

// Sự kiện cho nút save
        Button save_btn = findViewById(R.id.save_btn);
        save_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String new_note = noteEditText.getText().toString().trim();
                String newPointStr = newPointEditText.getText().toString().trim();
                String phone_text = phonenumber.getText().toString().trim();

                // Check if phone number exists in the database
                List<Customer> customers = dbManager.getAllCustomers();
                boolean phoneExists = false;
                for (Customer customer : customers) {
                    if (phone_text.equals(customer.getPhoneNumber())) {
                        phoneExists = true;
                        break;
                    }
                }

                // Check if phone number is entered
                if (phone_text.isEmpty() || !phoneExists) {
                    Toast.makeText(input_point_bt2.this, "Please enter a valid phone number", Toast.LENGTH_SHORT).show();
                    return;  // Stop if the phone number is empty
                }

                int newPoint = 0;

                // Parse newPoint if available
                if (!newPointStr.isEmpty()) {
                    try {
                        newPoint = Integer.parseInt(newPointStr);  // Convert to int
                    } catch (NumberFormatException e) {
                        Toast.makeText(input_point_bt2.this, "Invalid point value", Toast.LENGTH_SHORT).show();
                        return;  // Stop if the entered points are invalid
                    }
                }

                // Check if both note and points are empty
                if (new_note.isEmpty() && newPoint == 0) {
                    Toast.makeText(input_point_bt2.this, "New points and note are currently empty", Toast.LENGTH_SHORT).show();
                    return;  // Stop if no information to update
                }

                boolean isUpdated = false;  // Flag to check if anything was updated

                // Update points if available
                if (newPoint != 0) {
                    dbManager.plusPoint(phone_text, newPoint);  // Cập nhật điểm
                    isUpdated = true;  // Set flag to true if points are updated
                }

                // Update note if available
                if (!new_note.isEmpty()) {
                    dbManager.updateNote(phone_text, new_note);  // Cập nhật ghi chú
                    isUpdated = true;  // Set flag to true if note is updated
                }

                // Check if any update was performed
                if (isUpdated) {
                    Toast.makeText(input_point_bt2.this, "Successfully updated", Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(input_point_bt2.this, "No changes were made", Toast.LENGTH_SHORT).show();
                }
            }
        });




// Sự kiện cho nút saveAnext
        Button saveAnext = findViewById(R.id.saveAnext);
        saveAnext.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String new_note = noteEditText.getText().toString().trim();
                String newPointStr = newPointEditText.getText().toString().trim();
                String phone_text = phonenumber.getText().toString().trim();

                // Check if phone number exists in the database
                List<Customer> customers = dbManager.getAllCustomers();
                boolean phoneExists = false;
                for (Customer customer : customers) {
                    if (phone_text.equals(customer.getPhoneNumber())) {
                        phoneExists = true;
                        break;
                    }
                }

                // Kiểm tra nếu số điện thoại không được nhập
                if (phone_text.isEmpty() || !phoneExists) {
                    Toast.makeText(input_point_bt2.this, "Please enter a valid phone number", Toast.LENGTH_SHORT).show();
                    return;  // Dừng lại nếu số điện thoại rỗng
                }

                int newPoint = 0;

                // Chuyển đổi giá trị newPoint nếu có
                if (!newPointStr.isEmpty()) {
                    try {
                        newPoint = Integer.parseInt(newPointStr);  // Chuyển thành số nguyên
                    } catch (NumberFormatException e) {
                        Toast.makeText(input_point_bt2.this, "Invalid point value", Toast.LENGTH_SHORT).show();
                        return;  // Dừng lại nếu giá trị điểm không hợp lệ
                    }
                }

                // Kiểm tra nếu cả ghi chú và điểm đều trống
                if (new_note.isEmpty() && newPoint == 0) {
                    Toast.makeText(input_point_bt2.this, "New points and note are currently empty", Toast.LENGTH_SHORT).show();
                    return;  // Dừng lại nếu không có thông tin để cập nhật
                }

                boolean isUpdated = false;  // Biến để kiểm tra nếu có cập nhật nào

                // Cập nhật điểm nếu có
                if (newPoint != 0) {
                    dbManager.plusPoint(phone_text, newPoint);  // Cập nhật điểm
                    isUpdated = true;  // Đánh dấu là đã cập nhật
                }

                // Cập nhật ghi chú nếu có
                if (!new_note.isEmpty()) {
                    dbManager.updateNote(phone_text, new_note);  // Cập nhật ghi chú
                    isUpdated = true;  // Đánh dấu là đã cập nhật
                }

                // Kiểm tra nếu có thay đổi nào được thực hiện
                if (isUpdated) {
                    Toast.makeText(input_point_bt2.this, "Successfully updated", Toast.LENGTH_SHORT).show();

                    // Chuyển đến màn hình tiếp theo
                    Intent use_point = new Intent(input_point_bt2.this, use_point_bt2.class);
                    startActivity(use_point);
                } else {
                    Toast.makeText(input_point_bt2.this, "No changes were made", Toast.LENGTH_SHORT).show();
                }
            }
        });




        //hàm exports danh sách
        Button exportButton = findViewById(R.id.export_btn);
        exportButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                exportCustomersToXML(v.getContext()); // Xuất danh sách ra XML
                sendEmailWithXMLFile(v.getContext()); // Gửi email với file XML đính kèm
            }
        });

        // Sự kiện cho các nút chuyển trang
        Button input_btn = findViewById(R.id.input_btn);
        input_btn.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view) {
                recreate();
            }
        });

        Button use_btn = findViewById(R.id.use_btn);
        use_btn.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view) {
                Intent use_point = new Intent(input_point_bt2.this, use_point_bt2.class);
                startActivity(use_point);  // Thêm startActivity để chuyển trang
            }
        });

        Button list_btn = findViewById(R.id.list_btn);
        list_btn.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view) {
                Intent use_point = new Intent(input_point_bt2.this, danh_sach_kh_bt2.class);
                startActivity(use_point);  // Thêm startActivity để chuyển trang
            }
        });

        //tạo sự kiện nút logout
        Button logout_btn = findViewById(R.id.logout_btn);
        logout_btn.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view) {
                Intent use_point = new Intent(input_point_bt2.this, login_bt2.class);
                startActivity(use_point);  // Thêm startActivity để chuyển trang
            }
        });

    }

    // Hàm nhập danh sách khách hàng từ file XML và lưu vào cơ sở dữ liệu
    private static final int PICK_XML_FILE_REQUEST_CODE = 100;

    private void importCustomersToContentProvider() {
        Intent intent = new Intent(Intent.ACTION_GET_CONTENT);
        intent.setType("text/xml"); // Chỉ chọn file XML
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        try {
            startActivityForResult(Intent.createChooser(intent, "Select XML File"), PICK_XML_FILE_REQUEST_CODE);
        } catch (Exception e) {
            e.printStackTrace();
            Toast.makeText(this, "No file manager found or unable to open file picker.", Toast.LENGTH_SHORT).show();
        }
    }


    // Xử lý kết quả sau khi người dùng chọn file
    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == PICK_XML_FILE_REQUEST_CODE && resultCode == RESULT_OK && data != null) {
            Uri fileUri = data.getData(); // Lấy URI của file được chọn
            if (fileUri != null) {
                try {
                    // Mở InputStream từ URI
                    InputStream inputStream = getContentResolver().openInputStream(fileUri);

                    // Parse dữ liệu XML thành danh sách khách hàng
                    List<Customer> newCustomers = XmlParser.parseCustomersFromXml(inputStream);

                    // Lấy danh sách số điện thoại hiện tại từ cơ sở dữ liệu
                    List<String> existingPhoneNumbers = dbManager.getAllCustomerPhoneNumbers();

                    // Thêm khách hàng mới vào cơ sở dữ liệu nếu không tồn tại
                    for (Customer newCustomer : newCustomers) {
                        if (!existingPhoneNumbers.contains(newCustomer.getPhoneNumber())) {
                            long result = dbManager.insertCustomer(newCustomer);

                            // Kiểm tra kết quả chèn
                            if (result == -1) {
                                Log.e("InsertError", "Failed to insert customer: " + newCustomer.getPhoneNumber());
                            }
                        }
                    }

                    // Thông báo thành công
                    Toast.makeText(this, "Customers imported successfully.", Toast.LENGTH_SHORT).show();

                } catch (Exception e) {
                    e.printStackTrace();
                    Toast.makeText(this, "Failed to import customers: " + e.getMessage(), Toast.LENGTH_SHORT).show();
                }
            } else {
                Toast.makeText(this, "No file selected.", Toast.LENGTH_SHORT).show();
            }
        }
    }




}
