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

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlSerializer;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

public class XmlParser {

    private DatabaseManager dbManager;  // Quản lý cơ sở dữ liệu SQLite


    // Parse customers from XML resource
    public static List<Customer> parseCustomersFromXml(Context context, int resId) throws Exception {
        InputStream inputStream = context.getResources().openRawResource(resId);
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
        inputStream.close();
        return customers;
    }

    // Export customers to XML
    public static void exportCustomersToXML(Context context) {
        DatabaseManager dbManager = new DatabaseManager(context);
        List<Customer> customers = dbManager.getAllCustomers();

        // Create XML Serializer
        XmlSerializer xmlSerializer = Xml.newSerializer();
        StringWriter writer = new StringWriter();

        try {
            // Start XML document
            xmlSerializer.setOutput(writer);
            xmlSerializer.startDocument("UTF-8", true);

            // Root element
            xmlSerializer.startTag("", "customers");

            // Iterate over customers and add them to the XML document
            for (Customer customer : customers) {
                xmlSerializer.startTag("", "customer");

                xmlSerializer.startTag("", "phoneNumber");
                xmlSerializer.text(customer.getPhoneNumber());
                xmlSerializer.endTag("", "phoneNumber");

                xmlSerializer.startTag("", "createdDate");
                xmlSerializer.text(customer.getCreatedDate());
                xmlSerializer.endTag("", "createdDate");

                xmlSerializer.startTag("", "updatedDate");
                xmlSerializer.text(customer.getUpdatedDate());
                xmlSerializer.endTag("", "updatedDate");

                xmlSerializer.startTag("", "note");
                xmlSerializer.text(customer.getNote());
                xmlSerializer.endTag("", "note");

                xmlSerializer.startTag("", "point");
                xmlSerializer.text(String.valueOf(customer.getPoint()));
                xmlSerializer.endTag("", "point");

                xmlSerializer.endTag("", "customer");
            }

            // End the XML document
            xmlSerializer.endTag("", "customers");
            xmlSerializer.endDocument();

            // Save the XML file in internal storage
            FileOutputStream fos = context.openFileOutput("customers.xml", Context.MODE_PRIVATE);
            fos.write(writer.toString().getBytes());
            fos.close();

            Toast.makeText(context, "Customers exported to XML successfully", Toast.LENGTH_SHORT).show();

        } catch (Exception e) {
            e.printStackTrace();
            Toast.makeText(context, "Error exporting customers to XML", Toast.LENGTH_SHORT).show();
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
