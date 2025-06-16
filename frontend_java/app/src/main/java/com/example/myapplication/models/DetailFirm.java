package com.example.myapplication.models;

import com.google.gson.annotations.SerializedName;

import java.util.List;

public class DetailFirm {

    @SerializedName("ID")
    private int id;

    @SerializedName("Name")
    private String name;

    @SerializedName("StartDate")
    private String startDate;

    @SerializedName("EndDate")
    private String endDate;

    @SerializedName("Description")
    private String description;

    @SerializedName("Rating")
    private Double rating;

    @SerializedName("RatingCount")
    private Integer ratingCount;

    @SerializedName("ThumbnailPath")
    private String thumbnailPath;

    @SerializedName("Images")
    private List<ImageFirm> images;


    @SerializedName("Runtime")
    private Integer runtime;
// Getters

    public int getId() {
        return id;
    }


    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }


    public String getStartDate() {
        return startDate;
    }


    public String getEndDate() {
        return endDate;
    }


    public Double getRating() {
        return rating;
    }


    public Integer getRatingCount() {
        return ratingCount;
    }

    public String getThumbnailPath() {
        return thumbnailPath;
    }

    public List<ImageFirm> getImages() {
        return images;
    }

    public Integer getRuntime() {
        return runtime;
    }

//    Setters

    public void setId(int id) {
        this.id = id;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }
    public void setRatingCount(Integer ratingCount) {
        this.ratingCount = ratingCount;
    }
    public void setThumbnailPath(String thumbnailPath) {
        this.thumbnailPath = thumbnailPath;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public void setImages(List<ImageFirm> images) {
        this.images = images;
    }
}
