package com.example.myapplication.activities;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.example.myapplication.R;
import com.example.myapplication.models.RoomRequest;
import com.example.myapplication.models.RoomResponse;
import com.example.myapplication.network.ApiClient;
import com.example.myapplication.network.ApiRoomService;

public class AdminActivityEditRoom extends AppCompatActivity {
    String accessToken;
    private EditText editRoomName;
    private EditText editSeats;
    TextView textRoomID;
    private  Button buttonCancel;
    private Button buttonSave;
    @SuppressLint("SetTextI18n")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.admin_activity_edit_room);
        // Get the access token from SharedPreferences
        accessToken = getSharedPreferences("MyAppPrefs", MODE_PRIVATE).getString("access_token", null);
        if (accessToken == null) {
            finish();
            return;
        }
        // Initialize UI elements
        setElementsByID();

        Intent intent = getIntent();
        RoomResponse roomResponse = (RoomResponse) intent.getParcelableExtra("room");
        if (roomResponse != null) {
            editRoomName.setText(roomResponse.getName());
            editSeats.setText(String.valueOf(roomResponse.getSeats()));
            textRoomID.setText("Mã phòng: " + roomResponse.getId());
        }


        setListeners(roomResponse.getId());


    }

    private void setElementsByID() {
        editRoomName = findViewById(R.id.editRoomName);
        editSeats = findViewById(R.id.editSeats);
        buttonCancel = findViewById(R.id.buttonCancel);
        buttonSave = findViewById(R.id.buttonSave);
        textRoomID = findViewById(R.id.textRoomId);
    }


    void setListeners(int roomId) {
        buttonCancel.setOnClickListener(v -> {
            setResult(RESULT_CANCELED);
            finish();
        });

        buttonSave.setOnClickListener(v -> {
            String roomName = editRoomName.getText().toString().trim();
            String seatsStr = editSeats.getText().toString().trim();

            if (roomName.isEmpty() || seatsStr.isEmpty()) {
                editRoomName.setError("Room name is required");
                editSeats.setError("Seats are required");
                return;
            }
            int seats = Integer.parseInt(seatsStr);
            // Create RoomRequest object
            RoomRequest roomRequest = new RoomRequest(roomName, seats);
            updateRoomApi(roomRequest, roomId);
        });
        
    }

    void updateRoomApi(RoomRequest roomRequest, int roomId){
        ApiRoomService apiRoomService = ApiClient.getRetrofit().create(ApiRoomService.class);
        apiRoomService.updateRoom("Bearer " + accessToken, roomRequest, roomId)
            .enqueue(new retrofit2.Callback<RoomResponse>() {
                @Override
                public void onResponse(retrofit2.Call<RoomResponse> call, retrofit2.Response<RoomResponse> response) {
                    if (response.isSuccessful()) {
                        RoomResponse updatedRoom = response.body();
                        Intent resultIntent = new Intent();
                        resultIntent.putExtra("updatedRoom", updatedRoom);
                        setResult(3, resultIntent);
                        finish();
                    } else {
                        // Handle error
                    }
                }

                @Override
                public void onFailure(retrofit2.Call<RoomResponse> call, Throwable t) {
                    // Handle failure
                }
            });
    }


}
