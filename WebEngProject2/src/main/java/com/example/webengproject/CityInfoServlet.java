package com.example.webengproject;

import com.example.webengproject.models.City;
import com.example.webengproject.utils.PostgreSQLDataSource;
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

@WebServlet(urlPatterns = {"/city-info"})
public class CityInfoServlet extends HttpServlet {

    private static final String SELECT_CITY = "SELECT * FROM \"City\" WHERE \"CityId\" = ?";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cityIdParam = request.getParameter("cityId");

        if (cityIdParam != null && !cityIdParam.isEmpty()) {
            int cityId = Integer.parseInt(cityIdParam);
            City city = getCityById(cityId);

            request.setAttribute("city", city);
            request.getRequestDispatcher("cityInfo.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "City ID parameter is missing");
        }
    }

    private City getCityById(int cityId) {
        City city = null;

        try (Connection connection = PostgreSQLDataSource.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CITY)) {

            preparedStatement.setInt(1, cityId);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String cityName = resultSet.getString("CityName");
                    boolean isClean = resultSet.getBoolean("IsClean");
                    boolean isSafe = resultSet.getBoolean("IsSafe");
                    boolean isSane = resultSet.getBoolean("IsSane");
                    int countryId = resultSet.getInt("CountryId");

                    city = new City(cityId, cityName, countryId, isClean, isSafe, isSane);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Failed to retrieve city from the database.", e);
        }

        return city;
    }
}
