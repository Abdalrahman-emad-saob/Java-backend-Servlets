package com.example.webengproject;

import com.example.webengproject.utils.PostgreSQLDataSource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/addCountry")
public class AddCountryServlet extends HttpServlet {

    private static final String INSERT_COUNTRY = """
            INSERT INTO public."Country" ("CountryName")
            VALUES (?)
            """;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("addCountry.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String countryName = request.getParameter("countryName");

        if (countryName != null && !countryName.isEmpty()) {
            addCountry(countryName);
        }

        response.sendRedirect(request.getContextPath() + "/addCountry");
    }

    private void addCountry(String countryName) {
        try (Connection connection = PostgreSQLDataSource.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_COUNTRY)) {
            preparedStatement.setString(1, countryName);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
