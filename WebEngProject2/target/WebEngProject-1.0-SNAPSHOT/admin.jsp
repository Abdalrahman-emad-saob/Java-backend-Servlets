<%@ page import="com.example.webengproject.models.CityViolation" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Page</title>

    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Pending Violations</h1>
    <%
        List<CityViolation> cityViolations = (List<CityViolation>) request.getAttribute("cityViolations");
        if (cityViolations == null || cityViolations.isEmpty()) {
    %>
    <h2>There are no pending violations 😊</h2>
    <%
    } else {
    %>
    <form action="${pageContext.request.contextPath}/admin" method="post">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Select</th>
                <th>Violation ID</th>
                <th>Violation Date</th>
                <th>Violation Type</th>
                <th>Reporter Number</th>
                <th>City Name</th>
                <th>Media</th>
            </tr>
            </thead>
            <tbody>
            <% for (CityViolation cityViolation : cityViolations) { %>
            <tr>
                <td>
                    <input type="checkbox" name="selectedViolation"
                           value="<%= cityViolation.getViolation().getViolationId() %>">
                </td>
                <td><%= cityViolation.getViolation().getViolationId() %>
                </td>
                <td><%= cityViolation.getViolation().getViolationDate() %>
                </td>
                <td><%= cityViolation.getViolation().getViolationType() %>
                </td>
                <td><%= cityViolation.getViolation().getReporterNumber() %>
                </td>
                <td><%= cityViolation.getCity().getCityName() %>
                </td>
                <td>
                    <a target="_blank"
                       href="${pageContext.request.contextPath}/media/<%=cityViolation.getViolation().getmediaId()%>">
                        View Media
                    </a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
        <br>
        <input type="submit" name="action" value="APPROVED" class="btn btn-success">
        <input type="submit" name="action" value="REJECTED" class="btn btn-danger">
    </form>
    <%
        }
    %>
</div>

<!-- Include Bootstrap JavaScript (optional) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
