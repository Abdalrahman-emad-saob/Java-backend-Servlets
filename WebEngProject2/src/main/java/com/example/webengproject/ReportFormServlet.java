package com.example.webengproject;

import com.example.webengproject.models.Country;
import com.example.webengproject.utils.PostgreSQLDataSource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/report-form"})
@MultipartConfig(maxFileSize = 1024 * 1024 * 20)
public class ReportFormServlet extends HttpServlet {

    private static final String SELECT_REPORTER = """
            SELECT * FROM public."Reporter" WHERE "phoneNumber" = ?
            """;
    private static final String INSERT_REPORTER = """
            INSERT INTO public."Reporter" ("phoneNumber", "FalseReports", "blocked") VALUES (?, 0, false)
            """;

    private static final String INSERT_VIOLATION = """
            INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber", "ViolatedCityId", "MediaId")
            VALUES (current_date,cast(? as "ViolationType"), cast('PENDING' AS "ViolationStatus"), ?, ?, ?)
            """;

    private static final String INSERT_MEDIA = """
            INSERT INTO public."Media" ("MediaData", "MediaType") VALUES (?, ?) RETURNING "MediaId"
            """;

    private static final String SELECT_COUNTRIES = "SELECT * FROM public.\"Country\"";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Country> countries = getAllCountries();
        request.setAttribute("countries", countries);

        request.getRequestDispatcher("reportForm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phoneNumber = request.getParameter("phoneNumber");
        String country = request.getParameter("country");
        String city = request.getParameter("city");
        Part mediaPart = request.getPart("file");
        String violationType = request.getParameter("violationType");
        try (Connection connection = PostgreSQLDataSource.getConnection()) {
            int mediaId = saveMedia(connection, mediaPart);
            saveViolation(connection, violationType, phoneNumber, city, mediaId);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request.");
            return;
        }

        response.sendRedirect(request.getContextPath() + "/chadGPT/submitReport.jsp");
    }


    private List<Country> getAllCountries() {
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

    private void saveViolation(Connection connection, String violationType, String phoneNumber, String city, int mediaId) throws SQLException {
        if (phoneNumber == null || phoneNumber.isEmpty()) {
            throw new IllegalArgumentException("Phone number is required.");
        }

        try (PreparedStatement selectReporterStatement = connection.prepareStatement(SELECT_REPORTER)) {

            selectReporterStatement.setString(1, phoneNumber);
            ResultSet reporterResult = selectReporterStatement.executeQuery();

            if (!reporterResult.next()) {
                try (PreparedStatement insertReporterStatement = connection.prepareStatement(INSERT_REPORTER)) {
                    insertReporterStatement.setString(1, phoneNumber);
                    insertReporterStatement.executeUpdate();
                }
            } else {
                if (reporterResult.getBoolean("blocked")) {
                    throw new SQLException("Number is blocked");
                }
            }
        }


        try (PreparedStatement violationStatement = connection.prepareStatement(INSERT_VIOLATION)) {
            violationStatement.setString(1, violationType);
            violationStatement.setString(2, phoneNumber);
            violationStatement.setInt(3, Integer.parseInt(city));
            violationStatement.setInt(4, mediaId);
            violationStatement.executeUpdate();
        }
    }

    private int saveMedia(Connection connection, Part mediaPart) throws SQLException, IOException {
        if (mediaPart != null && mediaPart.getSize() > 0) {
            try (PreparedStatement mediaStatement = connection.prepareStatement(INSERT_MEDIA)) {
                mediaStatement.setBinaryStream(1, mediaPart.getInputStream(), (int) mediaPart.getSize());
                mediaStatement.setString(2, mediaPart.getContentType());

                boolean executed = mediaStatement.execute(); // Use execute() instead of executeUpdate()

                if (executed) {
                    ResultSet generatedKeys = mediaStatement.getResultSet();

                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    } else {
                        // Failed to get the generated media ID
                        throw new SQLException("Failed to retrieve the generated media ID.");
                    }
                } else {
                    // No result returned, handle accordingly
                    throw new SQLException("No result returned after saving media.");
                }
            }
        } else {
            // No media data provided
            return -1; // Set a default or null media ID value
        }
    }

}
