package com.example.myapplication.network;

import com.example.myapplication.models.UserInfo;
import com.example.myapplication.models.UserUpdateRequest;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.Header;
import retrofit2.http.PUT;
import retrofit2.http.Path;

public interface ApiUserService {
    @GET("users/get/{userId}")
    Call<UserInfo> getUserById(@Header("Authorization") String token, @Path("userId") String userId);

    @PUT("users/update/{userId}")
    Call<UserInfo> updateUser(@Header("Authorization") String token, @Path("userId") String userId, @Body UserUpdateRequest userUpdateRequest);
}
