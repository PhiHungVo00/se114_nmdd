package com.example.myapplication.activities;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.myapplication.R;
import com.example.myapplication.adapters.RoomAdapter;
import com.example.myapplication.models.RoomResponse;
import com.example.myapplication.models.StatusMessage;
import com.example.myapplication.network.ApiClient;
import com.example.myapplication.network.ApiRoomService;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Retrofit;

public class AdminActivityManageRoom extends AppCompatActivity {
    private static final int REQUEST_CODE_EDIT_ROOM = 1;
    private static final int REQUEST_CODE_CANCEL = 2;
    String accessToken;

    List<RoomResponse> roomList;
    RoomAdapter roomAdapter;
    RecyclerView recyclerViewRooms;
    ActivityResultLauncher<Intent> launcherEditRoom;

    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.admin_activity_manage_room);
        // get accesstoken
        accessToken = getSharedPreferences("MyAppPrefs", MODE_PRIVATE).getString("access_token", null);

        // Initialize RecyclerView
        recyclerViewRooms = findViewById(R.id.roomShowsRecyclerView);
        // Assuming roomList is already populated with RoomResponse objects
        roomList = new ArrayList<>();
        recyclerViewRooms.setLayoutManager(new LinearLayoutManager(this));
        roomAdapter = new RoomAdapter(roomList);
        recyclerViewRooms.setAdapter(roomAdapter);
        LoadRooms();

        setOnclickRoomAdapter();


    }



    void LoadRooms() {
        // This method should be implemented to load rooms from the server or database
        // For now, we will just simulate loading rooms with dummy data
        String token = "Bearer " + accessToken;

        ApiRoomService apiRoomService = ApiClient.getRetrofit().create(ApiRoomService.class);
        Call<List<RoomResponse>> call = apiRoomService.getAllRooms(token);
        call.enqueue(new retrofit2.Callback<List<RoomResponse>>() {
            @Override
            public void onResponse(Call<List<RoomResponse>> call, retrofit2.Response<List<RoomResponse>> response) {
                if (response.isSuccessful() && response.body() != null) {
                    roomList.clear();
                    roomList.addAll(response.body());
                    roomAdapter.notifyDataSetChanged();
                } else {
                    Toast.makeText(AdminActivityManageRoom.this, "Failed to load rooms", Toast.LENGTH_SHORT).show();
                    Log.e("AdminActivityManageRoom", "Error loading rooms: " + response.message());
                }
            }

            @Override
            public void onFailure(Call<List<RoomResponse>> call, Throwable t) {
                Toast.makeText(AdminActivityManageRoom.this, "Failed to load rooms", Toast.LENGTH_SHORT).show();
                Log.e("AdminActivityManageRoom", "Error loading rooms: " + t.getMessage());
            }
        });
    }



    void setOnclickRoomAdapter(){
        roomAdapter.setOnRoomClickListener(
            new RoomAdapter.OnRoomClickListener() {

                @Override
                public void onEditClick(RoomResponse room) {
                    Intent intent = new Intent(AdminActivityManageRoom.this, AdminActivityEditRoom.class);
                    intent.putExtra("room", room);
                    startActivity(intent);
                }

                @Override
                public void onDeleteClick(RoomResponse room) {
                    alertDialogDeleteRoom(room);
                }
            }
        );
    }
    void alertDialogDeleteRoom(RoomResponse room) {
        new AlertDialog.Builder(AdminActivityManageRoom.this)
            .setTitle("Xác nhận Xóa Phòng")
            .setMessage("Bạn có chắc chắn muốn xóa không?")
            .setPositiveButton("Chắc chắn", (dialog, which) -> {
                // Xử lý xóa phòng
                DeleteRoom(room);
            })
            .setNegativeButton("Hủy", (dialog, which) -> {
                dialog.dismiss(); // Đóng dialog nếu chọn Cancel
            })
            .show();
    }


    void DeleteRoom(RoomResponse room) {
        // Implement the logic to delete a room
        String token = "Bearer " + accessToken;
        ApiRoomService apiRoomService = ApiClient.getRetrofit().create(ApiRoomService.class);
        Call<StatusMessage> call = apiRoomService.deleteRoom(token, room.getId());
        call.enqueue(new retrofit2.Callback<StatusMessage>() {
            @Override
            public void onResponse(Call<StatusMessage> call, retrofit2.Response<StatusMessage> response) {
                if (response.isSuccessful() && response.body() != null) {
                    StatusMessage statusMessage = response.body();
                    Toast.makeText(AdminActivityManageRoom.this, statusMessage.getMessage(), Toast.LENGTH_SHORT).show();
                    LoadRooms(); // Reload the room list after deletion
                } else {
                    Toast.makeText(AdminActivityManageRoom.this, "Failed to delete room", Toast.LENGTH_SHORT).show();
                    Log.e("AdminActivityManageRoom", "Error deleting room: " + response.message());
                }
            }

            @Override
            public void onFailure(Call<StatusMessage> call, Throwable t) {
                Toast.makeText(AdminActivityManageRoom.this, "Failed to delete room", Toast.LENGTH_SHORT).show();
                Log.e("AdminActivityManageRoom", "Error deleting room: " + t.getMessage());
            }
        });

    }


    void setOnclickEditRoom(RoomResponse room){
        setLauncherEditRoom();
        Intent intent = new Intent(AdminActivityManageRoom.this, AdminActivityEditRoom.class);
        intent.putExtra("room", room);
        launcherEditRoom.launch(intent);
    }

    void setLauncherEditRoom(){
        launcherEditRoom = registerForActivityResult(
            new ActivityResultContracts.StartActivityForResult(),
            result -> {
                if (result.getResultCode() ==  REQUEST_CODE_EDIT_ROOM) {
                    Intent data = result.getData();
                    if (data != null) {
                        RoomResponse updatedRoom = data.getParcelableExtra("updatedRoom");
                        if (updatedRoom != null) {
                            // Update the room list with the updated room
                            for (int i = 0; i < roomList.size(); i++) {
                                if (roomList.get(i).getId() == updatedRoom.getId()) {
                                    roomList.set(i, updatedRoom);
                                    break;
                                }
                            }
                            roomAdapter.notifyDataSetChanged();
                        }
                    }
                }
            }
        );
    }
}
