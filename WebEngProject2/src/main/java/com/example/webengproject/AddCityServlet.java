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

@WebServlet("/addCity")
public class AddCityServlet extends HttpServlet {

    private static final String SELECT_COUNTRIES = """
            SELECT "CountryId", "CountryName"
            FROM public."Country"
            """;

    private static final String INSERT_CITY = """
            INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
            VALUES (?, true, true, true, ?)
            """;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Country> countries = getCountries();
        request.setAttribute("countries", countries);
        request.getRequestDispatcher("addCity.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cityName = request.getParameter("cityName");
        int countryId = Integer.parseInt(request.getParameter("countryId"));

        addCity(cityName, countryId);

        response.sendRedirect(request.getContextPath() + "/addCity");
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
            e.printStackTrace();
        }

        return countries;
    }

    private void addCity(String cityName, int countryId) {
        try (Connection connection = PostgreSQLDataSource.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CITY)) {
            preparedStatement.setString(1, cityName);
            preparedStatement.setInt(2, countryId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
