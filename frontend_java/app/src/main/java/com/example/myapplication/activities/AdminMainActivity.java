package com.example.myapplication.activities;

import static android.graphics.Color.*;

import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.Spinner;

import androidx.appcompat.app.AppCompatActivity;

import com.example.myapplication.R;
import com.github.mikephil.charting.charts.BarChart;
import com.github.mikephil.charting.charts.PieChart;
import com.github.mikephil.charting.components.Legend;
import com.github.mikephil.charting.components.XAxis;
import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.data.BarDataSet;
import com.github.mikephil.charting.data.BarEntry;
import com.github.mikephil.charting.data.PieData;
import com.github.mikephil.charting.data.PieDataSet;
import com.github.mikephil.charting.data.PieEntry;
import com.github.mikephil.charting.formatter.IndexAxisValueFormatter;
import com.github.mikephil.charting.utils.ColorTemplate;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AdminMainActivity extends AppCompatActivity {
    private Map<String, List<Float>> weeklyRevenue = new HashMap<>();
    BarChart barChart;
    Spinner spinnerWeek;
    ImageView imageHistory, imageHome, imageManageUser, imageManageFirm, imageProfile;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.admin_activity_main);
//        findViewById
        setFindIdElement();


//        set up and show graph

        setupSampleData();

        ArrayAdapter<String> adapter = new ArrayAdapter<>(this, R.layout.item_spinner,
                new ArrayList<>(weeklyRevenue.keySet()));
        adapter.setDropDownViewResource(R.layout.item_spinner);
        spinnerWeek.setAdapter(adapter);
        spinnerWeek.setBackgroundColor(Color.parseColor("#081000"));


        spinnerWeek.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String selectedWeek = parent.getItemAtPosition(position).toString();
                showBarChart(weeklyRevenue.get(selectedWeek));
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) { }
        });

        // Hiển thị tuần đầu tiên mặc định
        spinnerWeek.setSelection(0);



        // listen menu button
        listenerSetupMenuButton();

    }

    void listenerSetupMenuButton() {
        imageProfile.setOnClickListener(
                v -> {
                    startActivity(new android.content.Intent(AdminMainActivity.this, AdminActivityProfile.class));
                }
        );

        imageHistory.setOnClickListener(
                v -> {
                    startActivity(new android.content.Intent(AdminMainActivity.this, AdminActivityHistoryBooking.class));
                }
        );

    }

    void setFindIdElement() {
        imageHistory = findViewById(R.id.imageHistory);
        imageHome = findViewById(R.id.imageHome);
        imageManageFirm = findViewById(R.id.imageManageFirm);
        imageManageUser = findViewById(R.id.imageManageUser);
        imageProfile = findViewById(R.id.imageProfile);
        spinnerWeek = findViewById(R.id.spinnerWeek);
        barChart = findViewById(R.id.barChart);
    }




    private void setupSampleData() {
        // Giả lập dữ liệu cho 4 tuần
        weeklyRevenue.put("Tuần 1", Arrays.asList(10f, 15f, 12f, 20f, 25f, 18f, 16f));
        weeklyRevenue.put("Tuần 2", Arrays.asList(14f, 11f, 13f, 22f, 26f, 19f, 17f));
        weeklyRevenue.put("Tuần 3", Arrays.asList(8f, 10f, 9f, 15f, 20f, 16f, 14f));
        weeklyRevenue.put("Tuần 4", Arrays.asList(12f, 18f, 14f, 19f, 21f, 22f, 23f));
    }


    private void showBarChart(List<Float> revenueList) {
        List<BarEntry> entries = new ArrayList<>();

        for (int i = 0; i < revenueList.size(); i++) {
            entries.add(new BarEntry(i, revenueList.get(i)));
        }

        BarDataSet dataSet = new BarDataSet(entries, "Doanh thu theo ngày");
        dataSet.setColors(ColorTemplate.MATERIAL_COLORS); // Hoặc dùng setColor(Color.GREEN), vv
        dataSet.setValueTextColor(Color.WHITE);
        dataSet.setValueTextSize(14f); // 👈 tăng size chữ giá trị trên cột

        BarData barData = new BarData(dataSet);
        barData.setBarWidth(0.6f); // 👈 chỉnh độ rộng cột
        barChart.setData(barData);

        String[] days = {"T2", "T3", "T4", "T5", "T6", "T7", "CN"};

        // Trục X
        XAxis xAxis = barChart.getXAxis();
        xAxis.setValueFormatter(new IndexAxisValueFormatter(days));
        xAxis.setTextColor(Color.WHITE);
        xAxis.setTextSize(16f); // 👈 tăng size
        xAxis.setPosition(XAxis.XAxisPosition.BOTTOM);
        xAxis.setDrawGridLines(false);
        xAxis.setGranularity(1f);
        xAxis.setLabelCount(days.length);
        xAxis.setYOffset(10f); // 👈 tăng khoảng cách text và trục

        // Trục Y trái
        YAxis leftAxis = barChart.getAxisLeft();
        leftAxis.setTextColor(Color.WHITE);
        leftAxis.setTextSize(16f); // 👈 tăng size
        leftAxis.setAxisMinimum(0f); // 👈 đảm bảo trục bắt đầu từ 0
        leftAxis.setGranularity(3f); // 👈 chia lưới đẹp hơn
        leftAxis.setGridColor(Color.DKGRAY); // 👈 màu lưới

        // Trục Y phải
        YAxis rightAxis = barChart.getAxisRight();
        rightAxis.setEnabled(false); // 👈 tắt nếu không cần thiết

            // Legend
            Legend legend = barChart.getLegend();
            legend.setTextColor(Color.WHITE);
            legend.setTextSize(20f); // 👈 tăng size
            legend.setDrawInside(false);
            legend.setVerticalAlignment(Legend.LegendVerticalAlignment.BOTTOM);
    //        legend.setHorizontalAlignment(Legend.LegendHorizontalAlignment.CENTER);
            legend.setOrientation(Legend.LegendOrientation.HORIZONTAL);

            // General settings
            barChart.setBackgroundColor(Color.parseColor("#081029"));
            barChart.getDescription().setEnabled(false);
            barChart.setExtraOffsets(10f, 10f, 10f, 60f);
            barChart.setExtraBottomOffset(40f);
            barChart.animateY(1000);
            barChart.invalidate();
    }



}
