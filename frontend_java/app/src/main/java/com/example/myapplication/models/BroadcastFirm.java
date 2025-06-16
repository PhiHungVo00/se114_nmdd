package com.example.myapplication.models;

import com.google.gson.annotations.SerializedName;

public class BroadcastFirm {

    @SerializedName("FirmID")
    private int FirmID;

    @SerializedName("ID")
    private int ID;

    @SerializedName("DateBroadcast")
    private String DateBroadcast;

    @SerializedName("TimeBroadcast")
    private String TimeBroadcast;

    @SerializedName("RoomID")
    private int RoomID;

    @SerializedName("Seats")
    private int Seats;

    @SerializedName("Price")
    private double Price;


//    getters
    public int getFirmID() {
        return FirmID;
    }

    public int getID() {
        return ID;
    }

    public String getDateBroadcast() {
        return DateBroadcast;
    }

    public String getTimeBroadcast() {
        return TimeBroadcast;
    }

    public int getRoomID() {
        return RoomID;
    }

    public int getSeats() {
        return Seats;
    }

    public double getPrice() {
        return Price;
    }


}
