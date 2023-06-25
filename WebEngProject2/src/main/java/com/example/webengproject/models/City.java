package com.example.webengproject.models;

public class City {
    private Integer cityId;
    private String cityName;
    private Integer countryId;
    private Boolean isClean;
    private Boolean isSafe;
    private Boolean isSane;

    public City(Integer cityId, String cityName, Integer countryId, Boolean isClean, Boolean isSafe, Boolean isSane) {
        this.cityId = cityId;
        this.cityName = cityName;
        this.countryId = countryId;
        this.isClean = isClean;
        this.isSafe = isSafe;
        this.isSane = isSane;
    }

    public City(Integer cityId, String cityName) {
        this.cityId = cityId;
        this.cityName = cityName;
    }

    public City() {
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public Integer getCountryId() {
        return countryId;
    }

    public void setCountryId(Integer countryId) {
        this.countryId = countryId;
    }

    public Boolean getClean() {
        return isClean;
    }

    public void setClean(Boolean clean) {
        isClean = clean;
    }

    public Boolean getSafe() {
        return isSafe;
    }

    public void setSafe(Boolean safe) {
        isSafe = safe;
    }

    public Boolean getSane() {
        return isSane;
    }

    public void setSane(Boolean sane) {
        isSane = sane;
    }
}
