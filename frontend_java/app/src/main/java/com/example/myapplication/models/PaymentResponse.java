package com.example.myapplication.models;

import com.google.gson.annotations.SerializedName;

public class PaymentResponse {
    @SerializedName("transaction_id")
    private String transactionId;
    @SerializedName("status")
    private String status;

    public String getTransactionId() {
        return transactionId;
    }

    public String getStatus() {
        return status;
    }
}
