package com.example.webengproject.utils;

import java.sql.*;

public class ViolationChecker {
  private static final String updateExpiredViolations = """
            UPDATE "Violation"
            SET "ViolationStatus" = 'EXPIRED'
            WHERE "ViolationId" IN (
                  SELECT "ViolationId"
                  FROM "Violation" LEFT
                  JOIN "City"
                  ON "City"."CityId" = "Violation"."ViolatedCityId"
                  WHERE "Violation"."ViolationStatus" = 'APPROVED' AND DATE_PART('day', now() - "Violation"."ViolationDate") >= 30
            )
            """;
  public static void main(String[] args) {
    try (Connection connection = PostgreSQLDataSource.getConnection();
         Statement statement = connection.createStatement()) {
      statement.executeUpdate(updateExpiredViolations);
      }
     catch (SQLException e) {
      e.printStackTrace();
    }
  }
}
