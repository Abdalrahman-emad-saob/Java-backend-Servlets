package com.example.webengproject.models;

public class CityViolation {
    private Violation violation;
    private City city;

    public CityViolation(Violation violation, City city) {
        this.violation = violation;
        this.city = city;
    }

    public Violation getViolation() {
        return violation;
    }

    public void setViolation(Violation violation) {
        this.violation = violation;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }
}
