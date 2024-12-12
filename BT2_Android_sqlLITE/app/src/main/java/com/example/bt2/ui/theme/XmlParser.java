package com.example.bt2.ui.theme;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.Xml;
import android.view.View;
import android.widget.Toast;

import androidx.core.content.FileProvider;

import com.example.bt2.model.Customer;
import com.example.bt2.provider.DatabaseManager;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlSerializer;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

public class XmlParser {

    private DatabaseManager dbManager;  // Quản lý cơ sở dữ liệu SQLite


    // Parse customers from XML file
    public static List<Customer> parseCustomersFromXml(InputStream inputStream) throws Exception {
        XmlPullParser parser = Xml.newPullParser();
        parser.setInput(inputStream, null);

        List<Customer> customers = new ArrayList<>();
        int eventType = parser.getEventType();
        Customer currentCustomer = null;

        while (eventType != XmlPullParser.END_DOCUMENT) {
            String tagName = parser.getName();

            switch (eventType) {
                case XmlPullParser.START_TAG:
                    if ("customer".equals(tagName)) {
                        currentCustomer = new Customer("", "", "", 0, "");
                    } else if ("phoneNumber".equals(tagName) && currentCustomer != null) {
                        currentCustomer.setPhoneNumber(parser.nextText());
                    } else if ("createdDate".equals(tagName) && currentCustomer != null) {
                        currentCustomer.setCreatedDate(parser.nextText());
                    } else if ("updatedPointsDate".equals(tagName) && currentCustomer != null) {
                        currentCustomer.setUpdatedDate(parser.nextText());
                    } else if ("points".equals(tagName) && currentCustomer != null) {
                        currentCustomer.setPoint(Integer.parseInt(parser.nextText()));
                    } else if ("note".equals(tagName) && currentCustomer != null) {
                        currentCustomer.setNote(parser.nextText());
                    }
                    break;

                case XmlPullParser.END_TAG:
                    if ("customer".equals(tagName) && currentCustomer != null) {
                        customers.add(currentCustomer);
                    }
                    break;
            }
            eventType = parser.next();
        }
        inputStream.close(); // Đóng stream sau khi sử dụng
        return customers;
    }


    // Export customers to XML
    public static void exportCustomersToXML(Context context) {
        DatabaseManager dbManager = new DatabaseManager(context);
        List<Customer> customers = dbManager.getAllCustomers();

        try {
            // Tạo tài liệu XML
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
            Document doc = docBuilder.newDocument();

            // Thẻ gốc (Root)
            Element rootElement = doc.createElement("customers");
            doc.appendChild(rootElement);

            // Thêm từng khách hàng
            for (Customer customer : customers) {
                Element customerElement = doc.createElement("customer");

                // Thẻ phoneNumber
                Element phoneNumber = doc.createElement("phoneNumber");
                phoneNumber.appendChild(doc.createTextNode(customer.getPhoneNumber()));
                customerElement.appendChild(phoneNumber);

                // Thẻ createdDate
                Element createdDate = doc.createElement("createdDate");
                createdDate.appendChild(doc.createTextNode(customer.getCreatedDate()));
                customerElement.appendChild(createdDate);

                // Thẻ updatedPointsDate
                Element updatedPointsDate = doc.createElement("updatedPointsDate");
                updatedPointsDate.appendChild(doc.createTextNode(customer.getUpdatedDate()));
                customerElement.appendChild(updatedPointsDate);

                // Thẻ points
                Element points = doc.createElement("points");
                points.appendChild(doc.createTextNode(String.valueOf(customer.getPoint())));
                customerElement.appendChild(points);

                // Thẻ note
                Element note = doc.createElement("note");
                note.appendChild(doc.createTextNode(customer.getNote()));
                customerElement.appendChild(note);

                // Thêm customer vào root
                rootElement.appendChild(customerElement);
            }

            // Chuyển XML sang định dạng đẹp
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");
            DOMSource source = new DOMSource(doc);

            // Lưu vào file
            FileOutputStream fos = context.openFileOutput("customers.xml", Context.MODE_PRIVATE);
            StreamResult result = new StreamResult(fos);
            transformer.transform(source, result);

            fos.close();
            Toast.makeText(context, "Xuất file XML thành công!", Toast.LENGTH_SHORT).show();

        } catch (Exception e) {
            e.printStackTrace();
            Toast.makeText(context, "Lỗi khi xuất file XML!", Toast.LENGTH_SHORT).show();
        }
    }


    // Send the XML file via email
    public static void sendEmailWithXMLFile(Context context) {
        // Path to the saved XML file
        File fileLocation = new File(context.getFilesDir(), "customers.xml");
        Uri path = FileProvider.getUriForFile(context, "com.example.bt2.fileprovider", fileLocation);

        // Create an intent to send email
        Intent emailIntent = new Intent(Intent.ACTION_SEND);
        emailIntent.setType("text/xml");
        emailIntent.putExtra(Intent.EXTRA_SUBJECT, "Customer List XML");
        emailIntent.putExtra(Intent.EXTRA_TEXT, "Here is the customer list in XML format.");
        emailIntent.putExtra(Intent.EXTRA_STREAM, path);

        // Grant read permission to other apps via FileProvider
        emailIntent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);

        // Open email client chooser
        try {
            context.startActivity(Intent.createChooser(emailIntent, "Send email..."));
        } catch (ActivityNotFoundException e) {
            Toast.makeText(context, "No email client found.", Toast.LENGTH_SHORT).show();
        }
    }
}
