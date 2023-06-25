package com.example.webengproject;

import com.example.webengproject.utils.PostgreSQLDataSource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/media/*"})
public class MediaServlet extends HttpServlet {
    private static final String SELECT_MEDIA = """
            SELECT "MediaData", "MediaType"
            FROM "Media" LEFT JOIN "Violation"
            ON "Violation"."MediaId" = "Media"."MediaId"
            WHERE "ViolationId" = ?
            """;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mediaId = request.getPathInfo().substring(1);
        try (Connection connection = PostgreSQLDataSource.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MEDIA)) {

            int violationId = Integer.parseInt(mediaId);
            preparedStatement.setInt(1, violationId);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                byte[] mediaData = resultSet.getBytes("MediaData");
                String mediaType = resultSet.getString("MediaType");

                response.setContentType(mediaType);
                OutputStream outputStream = response.getOutputStream();
                outputStream.write(mediaData);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
