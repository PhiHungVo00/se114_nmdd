package com.example.myapplication.activities;

import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.myapplication.R;
import com.example.myapplication.adapters.FirmShowAdapter;
import com.example.myapplication.models.FirmShow;
import com.example.myapplication.network.ApiClient;
import com.example.myapplication.network.ApiFirmService;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class UserMainActivity extends AppCompatActivity {


    private RecyclerView FirmShowsRecyclerView;
    private List <FirmShow> mListFirmShows;
    private FirmShowAdapter firmShowAdapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.user_activity_main);

        FirmShowsRecyclerView = findViewById(R.id.firmShowsRecyclerView);
        FirmShowsRecyclerView.setLayoutManager(new LinearLayoutManager(this));

        mListFirmShows = new ArrayList<>();
        firmShowAdapter = new FirmShowAdapter(mListFirmShows);

        FirmShowsRecyclerView.setAdapter(firmShowAdapter);
        loadFirmsFromApi();
    }
    private void loadFirmsFromApi() {
        ApiFirmService apiFirmService = ApiClient.getRetrofit().create(ApiFirmService.class);
        Call<List<FirmShow>> call = apiFirmService.getAllFirms();

        call.enqueue(new Callback<List<FirmShow>>() {
            @Override
            public void onResponse(Call<List<FirmShow>> call, Response<List<FirmShow>> response) {
                try {
                    Log.e("API_RESPONSE", "Response code: " + response.message());
                    mListFirmShows.clear();
                    mListFirmShows.addAll(response.body());
                    firmShowAdapter.notifyDataSetChanged();

                } catch (NullPointerException e) {
                    Log.e("API_ERROR", "Response body is null: " + e.getMessage());
                    Toast.makeText(UserMainActivity.this, "Lỗi: Không có dữ liệu", Toast.LENGTH_SHORT).show();
                    return;
                }

            }

            @Override
            public void onFailure(Call<List<FirmShow>> call, Throwable t) {
                Toast.makeText(UserMainActivity.this, "Lỗi: " + t.getMessage(), Toast.LENGTH_SHORT).show();
                Log.e("API_ERROR", t.getMessage());
            }
        });
    }

}
