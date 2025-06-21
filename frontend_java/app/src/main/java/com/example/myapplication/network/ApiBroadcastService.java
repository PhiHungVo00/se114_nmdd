package com.example.myapplication.network;

import com.example.myapplication.models.BroadcastFirm;
import com.example.myapplication.models.Seat;
import com.example.myapplication.models.StatusMessage;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.DELETE;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Path;

public interface ApiBroadcastService {

    @GET("broadcasts/firm/{id}")
    Call<List<BroadcastFirm>> getBroadcastsByFirmId(@Path("id") int firmId);

    @GET("broadcasts/seats/{id}")
    Call<List<Seat>> getSeatsByBroadcastId(@Path("id") int broadcastId);

    @DELETE("broadcasts/delete/{id}")
    Call<StatusMessage> deleteBroadcast(@Path("id") int broadcastId);
}
