package com.example.webengproject;

import com.example.webengproject.models.City;
import com.example.webengproject.models.CityViolation;
import com.example.webengproject.models.Violation;
import com.example.webengproject.models.ViolationType;
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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    private static final String SELECT_VIOLATIONS = """
            SELECT *
            FROM "Violation" left join "City"
            ON "City"."CityId" = "Violation"."ViolatedCityId"
            WHERE "Violation"."ViolationStatus" = cast('PENDING' as "ViolationStatus")
            """;

    private static final String UPDATE_VIOLATION = """
            UPDATE public."Violation"
            SET "ViolationStatus" = cast(? as "ViolationStatus")
            WHERE "ViolationId" = ?
            """;

    private static final String SELECT_CITY_BY_ID = """
            SELECT "CityName", "CityId"
            FROM public."City"
            WHERE "CityId" = ?
            """;
    private static final String SELECT_REPORTER_NUMBER_BY_VIOLATION_ID = """
            SELECT "ReporterNumber"
            FROM public."Violation"
            WHERE "ViolationId" = ?
            """;
    private static final String UPDATE_REPORTER_FALSE_REPORTS = """
            UPDATE public."Reporter"
            SET "FalseReports" = "FalseReports" + 1
            WHERE "phoneNumber" = ?
            """;

    private static void updateFalseReports(String isApproved, Integer violationId) {
        try (Connection conn = PostgreSQLDataSource.getConnection()) {
            if (isApproved.equals("REJECTED")) {
                PreparedStatement statement1 = conn.prepareStatement(SELECT_REPORTER_NUMBER_BY_VIOLATION_ID);
                statement1.setInt(1, violationId);
                statement1.execute();
                ResultSet rs = statement1.getResultSet();
                String pn = "";
                if (rs.next()) {
                    pn = rs.getString("reporterNumber");
                }

                PreparedStatement statement2 = conn.prepareStatement(UPDATE_REPORTER_FALSE_REPORTS);
                statement2.setString(1, pn);
                statement2.executeUpdate();


                String getFalseReports = """
                        SELECT "FalseReports"
                        FROM "Reporter"
                        WHERE "phoneNumber" = ?
                        """;
                PreparedStatement statement3 = conn.prepareStatement(getFalseReports);
                statement3.setString(1, pn);
                statement3.execute();
                ResultSet sr = statement3.getResultSet();
                Integer falseRep = 0;
                if (sr.next()) {
                    falseRep = sr.getInt("FalseReports");
                }
                if (falseRep > 3) {
                    String updateReporterStatus = """
                            UPDATE "Reporter"
                            SET "blocked" = true
                            WHERE "phoneNumber" = ?
                            """;


                    PreparedStatement statement4 = conn.prepareStatement(updateReporterStatus);
                    statement4.setString(1, pn);
                    statement4.executeUpdate();
                }
            } else if (isApproved.equals("APPROVED")) {
                String countViolations = """
                        SELECT "City"."CityId" as cityid, Count("ViolationType") as cvt
                        FROM "Violation" left join "City"
                        ON "City"."CityId" = "Violation"."ViolatedCityId"
                        WHERE "Violation"."ViolationStatus" = 'APPROVED' AND "Violation"."ViolationType" = cast(? as "ViolationType")
                        GROUP BY "City"."CityId"
                        """;
                PreparedStatement statement5 = conn.prepareStatement(countViolations);
                statement5.setString(1, "TRAFFIC_LIGHT");
                statement5.execute();
                ResultSet rs1 = statement5.getResultSet();
                Map<Integer, Integer> map1 = new HashMap<>();
                Map<Integer, Integer> map2 = new HashMap<>();
                Map<Integer, Integer> map3 = new HashMap<>();
                Map<Integer, Integer> map4 = new HashMap<>();
                while (rs1.next()) {
                    map1.put(rs1.getInt("cityid"), rs1.getInt("cvt"));
                }
                statement5.clearParameters();
                statement5.setString(1, "STOP_SIGN");
                statement5.execute();
                rs1 = statement5.getResultSet();
                while (rs1.next()) {
                    map2.put(rs1.getInt("cityid"), rs1.getInt("cvt"));
                }
                statement5.clearParameters();
                statement5.setString(1, "JAYWALKING");
                statement5.execute();
                rs1 = statement5.getResultSet();
                while (rs1.next()) {
                    map3.put(rs1.getInt("cityid"), rs1.getInt("cvt"));
                }
                statement5.clearParameters();
                statement5.setString(1, "LITTERING");
                statement5.execute();
                rs1 = statement5.getResultSet();
                while (rs1.next()) {
                    map4.put(rs1.getInt("cityid"), rs1.getInt("cvt"));
                }
                for (Map.Entry<Integer, Integer> entry : map2.entrySet()) {
                    int key = entry.getKey();
                    int value = entry.getValue();

                    if (map1.containsKey(key)) {
                        int sum = map1.get(key) + value;
                        map1.put(key, sum);
                    } else {
                        map1.put(key, value);
                    }
                }
                for (Map.Entry<Integer, Integer> entry : map1.entrySet()) {
                    if (entry.getValue() >= 10) {
                        String updateSafety = """
                                UPDATE "City"
                                SET "IsSafe" = false
                                WHERE "City"."CityId" = ?
                                """;
                        PreparedStatement statement6 = conn.prepareStatement(updateSafety);
                        statement6.setInt(1, entry.getKey());
                        statement6.execute();
                    }
                }
                for (Map.Entry<Integer, Integer> entry : map3.entrySet()) {
                    if (entry.getValue() >= 10) {
                        String updateSanity = """
                                UPDATE "City"
                                SET "IsSane" = false
                                WHERE "City"."CityId" = ?
                                """;
                        PreparedStatement statement6 = conn.prepareStatement(updateSanity);
                        statement6.setInt(1, entry.getKey());
                        statement6.execute();
                    }
                }
                for (Map.Entry<Integer, Integer> entry : map4.entrySet()) {
                    if (entry.getValue() >= 10) {
                        String updateCleanliness = """
                                UPDATE "City"
                                SET "IsClean" = false
                                WHERE "City"."CityId" = ?
                                """;
                        PreparedStatement statement6 = conn.prepareStatement(updateCleanliness);
                        statement6.setInt(1, entry.getKey());
                        statement6.execute();
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CityViolation> cityViolations = getPendingViolations();
        request.setAttribute("cityViolations", cityViolations);

        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] selectedViolationIds = request.getParameterValues("selectedViolation");
        String action = request.getParameter("action");

        if (selectedViolationIds != null && action != null) {
            for (String violationId : selectedViolationIds) {
                updateFalseReports(action, Integer.parseInt(violationId));
                updateViolationStatus(Integer.parseInt(violationId), action);
            }
        }

        response.sendRedirect(request.getContextPath() + "/admin");
    }

    private List<CityViolation> getPendingViolations() {
        List<CityViolation> cityViolations = new ArrayList<>();

        try (Connection connection = PostgreSQLDataSource.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_VIOLATIONS); ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Violation violation = new Violation();
                violation.setViolationId(resultSet.getInt("ViolationId"));
                violation.setViolationDate(LocalDate.parse(resultSet.getString("ViolationDate")));
                violation.setViolationType(ViolationType.valueOf(resultSet.getString("ViolationType")));
                violation.setReporterNumber(resultSet.getString("ReporterNumber"));
                int cityId = resultSet.getInt("ViolatedCityId");
                violation.setMediaId(resultSet.getInt("MediaId"));
                City city = getCityById(cityId);
                CityViolation cityViolation = new CityViolation(violation, city);
                cityViolations.add(cityViolation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cityViolations;
    }

    private City getCityById(int cityId) {
        try (Connection connection = PostgreSQLDataSource.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CITY_BY_ID)) {
            preparedStatement.setInt(1, cityId);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int id = resultSet.getInt("CityId");
                    String cityName = resultSet.getString("CityName");
                    return new City(id, cityName);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    private void updateViolationStatus(int violationId, String status) {
        try (Connection connection = PostgreSQLDataSource.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_VIOLATION)) {
            preparedStatement.setString(1, status);
            preparedStatement.setInt(2, violationId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
