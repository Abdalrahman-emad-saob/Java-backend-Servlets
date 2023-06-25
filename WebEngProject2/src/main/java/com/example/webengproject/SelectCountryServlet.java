package com.example.webengproject;

import com.example.webengproject.models.Country;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/select-country"})
public class SelectCountryServlet extends HttpServlet {

    private static final String SELECT_COUNTRIES = "SELECT * FROM public.\"Country\"";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Country> countries = getCountries();

        request.setAttribute("countries", countries);

        // Forward the request to selectCountry.jsp
        request.getRequestDispatcher("selectCountry.jsp").forward(request, response);
    }

    private List<Country> getCountries() {
        List<Country> countries = new ArrayList<>();

        try (Connection connection = PostgreSQLDataSource.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_COUNTRIES); ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                int countryId = resultSet.getInt("CountryId");
                String countryName = resultSet.getString("CountryName");

                Country country = new Country(countryId, countryName);
                countries.add(country);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Failed to retrieve countries from the database.", e);
        }

        return countries;
    }
}
