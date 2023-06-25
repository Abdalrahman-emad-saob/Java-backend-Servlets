package com.example.webengproject.models;

import java.time.LocalDate;

public class Violation {
    private Integer violationId;
    private Integer violatedCityId;
    private String reporterNumber;
    private int mediaId;
    private LocalDate violationDate;
    private ViolationStatus violationStatus;
    private ViolationType violationType;


    public Violation(Integer violationId, Integer violatedCityId, String reporterNumber, Integer mediaId, LocalDate violationDate, ViolationStatus violationStatus, ViolationType violationType) {
        this.violationId = violationId;
        this.violatedCityId = violatedCityId;
        this.reporterNumber = reporterNumber;
        this.mediaId = mediaId;
        this.violationDate = violationDate;
        this.violationStatus = violationStatus;
        this.violationType = violationType;
    }

    public Violation() {
    }


    public Integer getViolationId() {
        return violationId;
    }

    public void setViolationId(Integer violationId) {
        this.violationId = violationId;
    }

    public Integer getViolatedCityId() {
        return violatedCityId;
    }

    public void setViolatedCityId(Integer violatedCityId) {
        this.violatedCityId = violatedCityId;
    }

    public String getReporterNumber() {
        return reporterNumber;
    }

    public void setReporterNumber(String reporterNumber) {
        this.reporterNumber = reporterNumber;
    }

    public Integer getmediaId() {
        return mediaId;
    }

    public void setMediaId(Integer violationProof) {
        this.mediaId = violationProof;
    }

    public LocalDate getViolationDate() {
        return violationDate;
    }

    public void setViolationDate(LocalDate violationDate) {
        this.violationDate = violationDate;
    }

    public ViolationStatus getViolationStatus() {
        return violationStatus;
    }

    public void setViolationStatus(ViolationStatus violationStatus) {
        this.violationStatus = violationStatus;
    }

    public ViolationType getViolationType() {
        return violationType;
    }

    public void setViolationType(ViolationType violationType) {
        this.violationType = violationType;
    }
}
