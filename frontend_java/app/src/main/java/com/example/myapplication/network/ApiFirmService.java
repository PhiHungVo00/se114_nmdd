package com.example.myapplication.network;

import com.example.myapplication.models.DetailFirm;
import com.example.myapplication.models.FirmShow;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Path;

public interface ApiFirmService {

    @GET("firms/get_all")
    Call<List<FirmShow>> getAllFirms();

    @GET("firms/get/{id}")
    Call<DetailFirm> getFirmById(@Path("id") String id);



}
