package com.example.myapplication.activities;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.widget.ImageView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.myapplication.R;
import com.example.myapplication.adapters.TicketAdapter;
import com.example.myapplication.models.Ticket;
import com.example.myapplication.network.ApiClient;
import com.example.myapplication.network.ApiTicketService;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;

public class AdminActivityHistoryBooking extends AppCompatActivity {

    String accessToken;
    int userId;
    ApiTicketService apiTicketService;
    List<Ticket> ticketList;
    RecyclerView recyclerViewTickets;
    TicketAdapter ticketAdapter;
    ImageView imageBack;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.admin_activity_history_booked);
        SharedPreferences prefs = getSharedPreferences("MyAppPrefs", MODE_PRIVATE);
        accessToken =  prefs.getString("access_token", null);
        Log.d("TOKEN", "Token: " + accessToken);
        userId = prefs.getInt("user_id", -1);
        Log.d("USER_ID", "User ID: " + userId);
        imageBack = findViewById(R.id.imageBack);




        recyclerViewTickets = findViewById(R.id.historyTicketBookedRecyclerView);
        recyclerViewTickets.setLayoutManager(new LinearLayoutManager(this));
        ticketList = new ArrayList<>();
        ticketAdapter = new TicketAdapter(ticketList, accessToken);
        recyclerViewTickets.setAdapter(ticketAdapter);
        // Load the booking history
        loadHistoryBookingTicket();


        // Listen back button  click
        ListenerSetupBackButton();

    }


    private  void  loadHistoryBookingTicket() {
        apiTicketService = ApiClient.getRetrofit().create(ApiTicketService.class);
        // Call the API to get the booking history
        accessToken = "Bearer " + accessToken; // Ensure the token is prefixed with "Bearer "
        String id = String.valueOf(userId);
        Call<List<Ticket>> call = apiTicketService.getAllTickets(accessToken);

        call.enqueue(new retrofit2.Callback<List<Ticket>>() {
            @Override
            public void onResponse(Call<List<Ticket>> call, retrofit2.Response<List<Ticket>> response) {
                if (response.isSuccessful() && response.body() != null) {
                    Log.d("API_RESPONSE", "Booking history loaded successfully: "+ response.code());
                    ticketList.clear();
                    ticketList.addAll(response.body());
                    ticketAdapter.notifyDataSetChanged();
                } else {
                    Log.e("API_ERROR", "Response error: " + response.code());
                    // Handle the case where the response is not successful
                    Log.e("API_ERROR", "Failed to load booking history: " + response.message());
                }
            }

            @Override
            public void onFailure(Call<List<Ticket>> call, Throwable t) {
                // Handle the failure case
                Log.e("API_ERROR", "Failed to load booking history: " + t.getMessage());
            }
        });
    }

    private void ListenerSetupBackButton() {
        imageBack.setOnClickListener(v -> {
            finish(); // Close the current activity
        });
    }


//    không tối ưu
    @Override
    protected void onResume() {
        super.onResume();
        loadHistoryBookingTicket(); // luôn cập nhật danh sách vé khi quay lại
    }

}
