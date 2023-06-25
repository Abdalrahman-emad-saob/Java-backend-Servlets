<%@ page import="com.example.webengproject.models.Country" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add City</title>

    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Add City</h1>
    <form action="addCity" method="POST">
        <div class="form-group">
            <label for="cityName">City Name:</label>
            <input type="text" id="cityName" name="cityName" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="countryId">Country:</label>
            <select id="countryId" name="countryId" class="form-control" required>
                <%
                    List<Country> countries = (List<Country>) request.getAttribute("countries");
                    for (Country country : countries) {
                %>
                <option value="<%= country.getCountryId() %>"><%= country.getCountryName() %>
                </option>
                <%
                    }
                %>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Add City</button>
    </form>
</div>

<!-- Include Bootstrap JavaScript (optional) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
