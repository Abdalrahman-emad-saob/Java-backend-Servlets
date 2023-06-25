package com.example.webengproject.models;

public class Country {
    private Integer countryId;
    private String countryName;

    public Country() {
    }

    public Country(Integer id, String name) {
        this.countryId = id;
        this.countryName = name;
    }

    public Integer getCountryId() {
        return countryId;
    }

    public void setCountryId(Integer countryId) {
        this.countryId = countryId;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }
}
