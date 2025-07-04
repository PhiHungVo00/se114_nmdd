package com.example.myapplication.activities;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.widget.Button;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.example.myapplication.R;
import com.example.myapplication.models.BookingTicketRequest;
import com.example.myapplication.models.BookingTicketResponse;
import com.example.myapplication.models.PaymentRequest;
import com.example.myapplication.models.PaymentResponse;
import com.example.myapplication.network.ApiClient;
import com.example.myapplication.network.ApiPaymentService;
import com.example.myapplication.network.ApiTicketService;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class PaymentActivity extends AppCompatActivity {
    private String accessToken;
    private int broadcastId;
    private int seatId;
    private double price;
    private Button btnPaypal;
    private Button btnStripe;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_payment);

        SharedPreferences prefs = getSharedPreferences("MyAppPrefs", MODE_PRIVATE);
        accessToken = prefs.getString("access_token", null);

        Intent intent = getIntent();
        broadcastId = intent.getIntExtra("broadcastId", -1);
        seatId = intent.getIntExtra("seatId", -1);
        price = intent.getDoubleExtra("price", 0);

        btnPaypal = findViewById(R.id.btnPaypal);
        btnStripe = findViewById(R.id.btnStripe);

        btnPaypal.setOnClickListener(v -> processPayment("paypal"));
        btnStripe.setOnClickListener(v -> processPayment("stripe"));
    }

    private void processPayment(String type) {
        ApiPaymentService apiPaymentService = ApiClient.getRetrofit().create(ApiPaymentService.class);
        PaymentRequest request = new PaymentRequest(price, "USD");
        Call<PaymentResponse> call;
        if (type.equals("paypal")) {
            call = apiPaymentService.payWithPaypal("Bearer " + accessToken, request);
        } else {
            call = apiPaymentService.payWithStripe("Bearer " + accessToken, request);
        }

        call.enqueue(new Callback<PaymentResponse>() {
            @Override
            public void onResponse(Call<PaymentResponse> call, Response<PaymentResponse> response) {
                if (response.isSuccessful()) {
                    bookTicket();
                } else {
                    Toast.makeText(PaymentActivity.this, "Payment failed", Toast.LENGTH_SHORT).show();
                }
            }

            @Override
            public void onFailure(Call<PaymentResponse> call, Throwable t) {
                Toast.makeText(PaymentActivity.this, "Payment error", Toast.LENGTH_SHORT).show();
                Log.e("Payment", "error", t);
            }
        });
    }

    private void bookTicket() {
        ApiTicketService apiTicketService = ApiClient.getRetrofit().create(ApiTicketService.class);
        BookingTicketRequest bookingTicketRequest = new BookingTicketRequest(broadcastId, seatId);
        Call<BookingTicketResponse> call = apiTicketService.createTicket("Bearer " + accessToken, bookingTicketRequest);
        call.enqueue(new Callback<BookingTicketResponse>() {
            @Override
            public void onResponse(Call<BookingTicketResponse> call, Response<BookingTicketResponse> response) {
                if (response.isSuccessful() && response.body() != null) {
                    Intent intent = new Intent(PaymentActivity.this, UserAdminShowDetailTicket.class);
                    intent.putExtra("bookingTicketResponse", response.body());
                    startActivity(intent);
                    finish();
                } else {
                    Toast.makeText(PaymentActivity.this, "Booking failed", Toast.LENGTH_SHORT).show();
                }
            }

            @Override
            public void onFailure(Call<BookingTicketResponse> call, Throwable t) {
                Toast.makeText(PaymentActivity.this, "Booking error", Toast.LENGTH_SHORT).show();
            }
        });
    }
}
