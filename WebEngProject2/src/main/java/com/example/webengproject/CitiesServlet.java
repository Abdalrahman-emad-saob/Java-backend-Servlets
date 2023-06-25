package com.example.webengproject;

import com.example.webengproject.models.City;
import com.example.webengproject.utils.PostgreSQLDataSource;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/cities/*")
public class CitiesServlet extends HttpServlet {

    private static final String SELECT_CITIES_BY_COUNTRY_ID = """
            SELECT "CityId", "CityName"
            FROM "City" LEFT JOIN "Country"
            ON "City"."CountryId" = "Country"."CountryId"
            WHERE "Country"."CountryId" = ?
            """;

    private ArrayList<City> getCitiesByCountryId(int countryId) throws SQLException {
        ArrayList<City> cities = new ArrayList<>();

        try (Connection connection = PostgreSQLDataSource.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CITIES_BY_COUNTRY_ID)) {
            preparedStatement.setInt(1, countryId);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    cities.add(new City(resultSet.getInt("CityId"), resultSet.getString("CityName")));
                }
            }
        }

        return cities;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo != null && pathInfo.length() > 1) {
            String pathParameter = pathInfo.substring(1);
            try {
                int countryId = Integer.parseInt(pathParameter);
                ArrayList<City> cities = getCitiesByCountryId(countryId);

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(new Gson().toJson(cities));

            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid country ID");
            } catch (SQLException e) {
                throw new RuntimeException("Failed to retrieve cities from the database.", e);
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Path parameter is missing");
        }
    }
}
