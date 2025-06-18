package com.example.myapplication.activities;

import static retrofit2.Response.error;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.util.Log;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.bumptech.glide.Glide;
import com.example.myapplication.R;
import com.example.myapplication.models.BookingTicketResponse;
import com.example.myapplication.models.Broadcast;


public class UserAdminShowDetailTicket extends AppCompatActivity {

    private ImageView imageThumbnail;
    private TextView tvTicketID;
    private TextView tvFirmName;
    private TextView tvDate;
    private TextView tvTime;
    private TextView tvRuntime;
    private TextView tvSeatName;
    private TextView tvRoomID;
    private TextView tvDateOrder;
    private TextView tvTimeOrder;
    private TextView tvPrice;
    private Button btnBack;



    @SuppressLint({"MissingInflatedId", "SetTextI18n"})
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail_ticket);
        imageThumbnail = findViewById(R.id.imgThumbnail);
        tvFirmName = findViewById(R.id.tvFirmName);
        tvDate = findViewById(R.id.tvDate);
        tvTime = findViewById(R.id.tvTime);
        tvRuntime = findViewById(R.id.tvRuntime);
        tvSeatName = findViewById(R.id.tvSeatName);
        tvRoomID = findViewById(R.id.tvRoomID);
        tvDateOrder = findViewById(R.id.tvDateOrder);
        tvTimeOrder = findViewById(R.id.tvTimeOrder);
        tvTicketID = findViewById(R.id.tvTicketID);
        tvPrice = findViewById(R.id.tvPrice);
        btnBack = findViewById(R.id.btnBack);

        // Retrieve the BookingTicketResponse object from the intent
        try {
            BookingTicketResponse bookingTicketResponse = getIntent().getParcelableExtra("bookingTicketResponse");
            if (bookingTicketResponse == null) {
                throw new NullPointerException("BookingTicketResponse is null");
            }
        } catch (NullPointerException e) {
            Log.e("UserAdminShowDetailTicket", "Error retrieving BookingTicketResponse: " + e.getMessage());
            // Handle the error, e.g., show a message to the user
        }
        BookingTicketResponse bookingTicketResponse = getIntent().getParcelableExtra("bookingTicketResponse");
        Broadcast broadcast = bookingTicketResponse.getBroadcast();
        Log.d("thumbnail", "Thumbnail URL: " + broadcast.getThumbnail());
        if (bookingTicketResponse != null && broadcast != null) {
            if(broadcast.getThumbnail() == null || broadcast.getThumbnail().isEmpty()) {
                // Set a default image if the thumbnail is null or empty
                Glide.with(this)
                        .load(R.drawable.default_img) // Replace with your default image resource
                        .into(imageThumbnail);
            } else {
                // Load the thumbnail from the URL
                Glide.with(this)
                        .load(broadcast.getThumbnail())
                        .error(R.drawable.default_img) // Fallback image in case of error
                        .into(imageThumbnail);
            }

            tvFirmName.setText(broadcast.getFirmName());
            tvDate.setText("Date: "+ broadcast.getDateBroadcast());
            tvTime.setText("Time: " + broadcast.getTimeBroadcast());
            tvRuntime.setText("Runtime: " + broadcast.getRuntime() + " minutes");
            tvRoomID.setText(String.valueOf(bookingTicketResponse.getRoomID()));
            tvSeatName.setText(String.valueOf(bookingTicketResponse.getSeatID()));
            tvDateOrder.setText(bookingTicketResponse.getDateOrder());
            tvPrice.setText(String.valueOf(bookingTicketResponse.getPrice() )+ " VND");
            tvTimeOrder.setText(bookingTicketResponse.getTimeOrder());
            tvTicketID.setText(String.valueOf(bookingTicketResponse.getID()));
        } else {
            // Handle the case where bookingTicketResponse is null

            tvFirmName.setText("No booking details available");
        }


        btnBack.setOnClickListener(v -> {
            finish(); // Close the activity and return to the previous one
        });
    }



}
