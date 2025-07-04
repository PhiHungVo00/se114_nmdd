package com.example.myapplication.network;

import com.example.myapplication.models.PaymentRequest;
import com.example.myapplication.models.PaymentResponse;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.Header;
import retrofit2.http.POST;

public interface ApiPaymentService {
    @POST("payments/paypal")
    Call<PaymentResponse> payWithPaypal(@Header("Authorization") String token, @Body PaymentRequest request);

    @POST("payments/stripe")
    Call<PaymentResponse> payWithStripe(@Header("Authorization") String token, @Body PaymentRequest request);
}
