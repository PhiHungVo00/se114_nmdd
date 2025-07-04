package com.example.myapplication.models;

import com.google.gson.annotations.SerializedName;

public class PaymentRequest {
    @SerializedName("amount")
    private double amount;
    @SerializedName("currency")
    private String currency;

    public PaymentRequest(double amount, String currency) {
        this.amount = amount;
        this.currency = currency;
    }

    public double getAmount() {
        return amount;
    }

    public String getCurrency() {
        return currency;
    }
}
