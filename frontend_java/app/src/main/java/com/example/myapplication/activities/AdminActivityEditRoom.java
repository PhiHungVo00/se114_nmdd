package com.example.myapplication.activities;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.example.myapplication.R;
import com.example.myapplication.models.RoomResponse;

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







    }

    private void setElementsByID() {
        editRoomName = findViewById(R.id.editRoomName);
        editSeats = findViewById(R.id.editSeats);
        buttonCancel = findViewById(R.id.buttonCancel);
        buttonSave = findViewById(R.id.buttonSave);
        textRoomID = findViewById(R.id.textRoomId);
    }


    void setEvent(){
        
    }


}
