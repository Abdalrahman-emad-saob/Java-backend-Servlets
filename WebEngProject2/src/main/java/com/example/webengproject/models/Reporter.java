package com.example.webengproject.models;

public class Reporter {

    private boolean blocked;
    private String phoneNumber;
    private Integer falseReports;

    public Reporter(String phoneNumber, int falseReports) {
        this.phoneNumber = phoneNumber;
        this.falseReports = falseReports;
    }

    public Reporter() {
    }

    public boolean isBlocked() {
        return blocked;
    }

    public void setBlocked(boolean blocked) {
        this.blocked = blocked;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getFalseReports() {
        return falseReports;
    }

    public void setFalseReports(int falseReports) {
        this.falseReports = falseReports;
    }
}
