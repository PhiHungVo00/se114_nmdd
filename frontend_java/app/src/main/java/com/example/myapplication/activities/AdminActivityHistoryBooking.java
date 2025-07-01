// ==========================
//  AdminActivityHistoryBooking.java
//  Màn lịch sử đặt vé (Admin)
//  – Hiển thị danh sách vé đã đặt
//  – Cho phép xem chi tiết & xoá vé
// ==========================

package com.example.myapplication.activities;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.widget.ImageView;

import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.myapplication.R;
import com.example.myapplication.adapters.TicketAdapter;
import com.example.myapplication.models.BookingTicketResponse;
import com.example.myapplication.models.Ticket;
import com.example.myapplication.network.ApiClient;
import com.example.myapplication.network.ApiTicketService;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class AdminActivityHistoryBooking extends AppCompatActivity {

    /* ====== BIẾN TOÀN CỤC ====== */
    private static final int REQUEST_DELETE_TICKET = 4; // requestCode trả về khi xoá vé

    private String accessToken;          // JWT sau khi đăng nhập
    private int    userId;               // ID người dùng (admin)
    private ApiTicketService apiTicketService;

    /* ====== VIEW ====== */
    private RecyclerView recyclerViewTickets; // danh sách vé
    private ImageView    imageBack;           // nút quay lại

    /* ====== DỮ LIỆU – ADAPTER ====== */
    private final List<Ticket> ticketList = new ArrayList<>();
    private TicketAdapter      ticketAdapter;

    /* ====== LAUNCHER KẾT QUẢ CHI TIẾT VÉ ====== */
    private ActivityResultLauncher<Intent> launcherDetailTicket;

    /* ------------------------------------------------------------ */
    /* 1. onCreate – khởi tạo Activity                              */
    /* ------------------------------------------------------------ */
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.admin_activity_history_booked);

        // 1.1 Đọc token & userId đã lưu trong SharedPreferences
        SharedPreferences prefs = getSharedPreferences("MyAppPrefs", MODE_PRIVATE);
        accessToken =  prefs.getString("access_token", null);
        userId      = prefs.getInt("user_id", -1);
        Log.d("TOKEN",    "Token: "    + accessToken);
        Log.d("USER_ID",  "User ID: "  + userId);

        // 1.2 Ánh xạ view
        imageBack          = findViewById(R.id.imageBack);
        recyclerViewTickets = findViewById(R.id.historyTicketBookedRecyclerView);

        // 1.3 Cấu hình RecyclerView + Adapter
        recyclerViewTickets.setLayoutManager(new LinearLayoutManager(this));
        ticketAdapter = new TicketAdapter(ticketList, accessToken);
        recyclerViewTickets.setAdapter(ticketAdapter);

        // 1.4 Đăng ký launcher nhận kết quả từ màn chi tiết vé
        setLauncherDetailTicket();

        // 1.5 Tải danh sách lịch sử đặt vé
        loadHistoryBookingTicket();

        // 1.6 Bắt sự kiện click vào item → mở chi tiết vé
        ticketAdapter.setOnItemClickListener(
            ticket -> loadDetailTicketByApi(ticket.getId())
        );

        // 1.7 Bắt sự kiện nút quay lại
        setupBackButtonListener();
    }

    /* ------------------------------------------------------------ */
    /* 2. Gọi API lấy toàn bộ lịch sử đặt vé                       */
    /* ------------------------------------------------------------ */
    private void loadHistoryBookingTicket() {
        apiTicketService = ApiClient.getRetrofit().create(ApiTicketService.class);
        String bearer = "Bearer " + accessToken;

        Call<List<Ticket>> call = apiTicketService.getAllTickets(bearer);
        call.enqueue(new Callback<>() {
            @Override
            public void onResponse(Call<List<Ticket>> call, Response<List<Ticket>> response) {
                if (response.isSuccessful() && response.body() != null) {
                    Log.d("API_RESPONSE", "Tải lịch sử thành công – code: " + response.code());
                    ticketList.clear();
                    ticketList.addAll(response.body());
                    ticketAdapter.notifyDataSetChanged();
                } else {
                    Log.e("API_ERROR", "Tải lịch sử lỗi – code: " + response.code());
                }
            }

            @Override
            public void onFailure(Call<List<Ticket>> call, Throwable t) {
                Log.e("API_ERROR", "Tải lịch sử thất bại: " + t.getMessage());
            }
        });
    }

    /* ------------------------------------------------------------ */
    /* 3. Thiết lập listener cho nút back                          */
    /* ------------------------------------------------------------ */
    private void setupBackButtonListener() {
        imageBack.setOnClickListener(v -> finish());
    }

    /* ------------------------------------------------------------ */
    /* 4. Gọi API lấy chi tiết vé → mở màn hình chi tiết           */
    /* ------------------------------------------------------------ */
    private void loadDetailTicketByApi(int ticketId) {
        String bearer = "Bearer " + accessToken;
        ApiTicketService svc = ApiClient.getRetrofit().create(ApiTicketService.class);

        Call<BookingTicketResponse> call = svc.getTicketDetail(bearer, String.valueOf(ticketId));
        call.enqueue(new Callback<>() {
            @Override
            public void onResponse(Call<BookingTicketResponse> call, Response<BookingTicketResponse> rsp) {
                if (rsp.isSuccessful() && rsp.body() != null) {
                    Intent intent = new Intent(AdminActivityHistoryBooking.this,
                                                UserAdminShowDetailTicket.class);
                    intent.putExtra("bookingTicketResponse", rsp.body());
                    launcherDetailTicket.launch(intent);
                } else {
                    Log.e("API_ERROR", "Lỗi lấy chi tiết vé – code: " + rsp.code());
                }
            }

            @Override
            public void onFailure(Call<BookingTicketResponse> call, Throwable t) {
                Log.e("API_ERROR", "Lỗi lấy chi tiết vé: " + t.getMessage());
            }
        });
    }

    /* ------------------------------------------------------------ */
    /* 5. Đăng ký launcher nhận kết quả xoá vé từ màn chi tiết      */
    /* ------------------------------------------------------------ */
    private void setLauncherDetailTicket() {
        launcherDetailTicket = registerForActivityResult(
            new ActivityResultContracts.StartActivityForResult(),
            result -> {
                // Khi màn chi tiết trả về requestCode == REQUEST_DELETE_TICKET
                if (result.getResultCode() == REQUEST_DELETE_TICKET) {
                    Intent data = result.getData();
                    if (data != null) {
                        int ticketId = data.getIntExtra("ticketId", -1);
                        if (ticketId != -1) {
                            // Xoá vé khỏi danh sách hiện tại
                            for (int i = 0; i < ticketList.size(); i++) {
                                if (ticketList.get(i).getId() == ticketId) {
                                    ticketList.remove(i);
                                    ticketAdapter.notifyItemRemoved(i);
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        );
    }
}
