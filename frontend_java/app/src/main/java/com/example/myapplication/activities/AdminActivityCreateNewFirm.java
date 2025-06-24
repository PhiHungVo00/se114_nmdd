package com.example.myapplication.activities;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.widget.ImageView;

import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.app.AppCompatActivity;

import com.bumptech.glide.Glide;
import com.example.myapplication.R;
import com.example.myapplication.models.ImageFirm;

public class AdminActivityCreateNewFirm extends AppCompatActivity {
    private ActivityResultLauncher<Intent> pickImageLauncher;
    private Uri selectedImageUri;
    ImageView imageThumbnail;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.admin_activity_create_firm);

        // Initialize UI components and set up listeners here
        // For example, you might want to set up a button to create a new firm
        pickImageLauncher = registerForActivityResult(
                new ActivityResultContracts.StartActivityForResult(),
                result -> {
                    if (result.getResultCode() == Activity.RESULT_OK && result.getData() != null) {
                        Uri imageUri = result.getData().getData();
                        selectedImageUri = imageUri;
                        // Hiển thị ảnh vừa chọn lên ImageView thumbnail
                        Glide.with(this)
                                .load(imageUri)
                                .into(imageThumbnail);
                    }
                }
        );
    }
}
