package com.example.myapplication.network;

import com.example.myapplication.models.DetailFirm;
import com.example.myapplication.models.FirmRequest;
import com.example.myapplication.models.FirmShow;
import com.example.myapplication.models.StatusMessage;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.DELETE;
import retrofit2.http.GET;
import retrofit2.http.Header;
import retrofit2.http.POST;
import retrofit2.http.Path;

public interface ApiFirmService {

    @GET("firms/get_all")
    Call<List<FirmShow>> getAllFirms();

    @GET("firms/get/{id}")
    Call<DetailFirm> getFirmById(@Header("Authorization") String token, @Path("id") String id);


    @POST("firms/create")
    Call<FirmShow> createFirm(@Header("Authorization") String token, @Body FirmRequest firmRequest);


    @DELETE("firms/delete/{id}")
    Call<StatusMessage> deleteFirm(@Header("Authorization") String token, @Path("id") int id);



}
