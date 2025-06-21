package com.example.myapplication.models;


import com.google.gson.annotations.SerializedName;

/*
     {
        "Date": 14,
        "ID": 2,
        "Month": 6,
        "TotalMoney": 500000.0,
        "Year": 2025
    }
 */
public class
RevenueDay {


    @SerializedName("Date")
    int date;
    @SerializedName("Month")
    int month;
    @SerializedName("Year")
    int year;

    @SerializedName("ID")
    int ID;

    @SerializedName("TotalMoney")
    float TotalMoney;

    public RevenueDay(int date, int month, int year, int ID, float totalMoney) {
        this.date = date;
        this.month = month;
        this.year = year;
        this.ID = ID;
        TotalMoney = totalMoney;
    }

//    getter
    public int getDate() {
        return date;
    }
    public int getMonth() {
        return month;
    }
    public int getYear() {
        return year;
    }
    public int getID() {
        return ID;
    }
    public float getTotalMoney() {
        return TotalMoney;
    }



}
