<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>City Information</title>

    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2>City Information</h2>
    <%-- Access the request attribute to display city information --%>
    <%@ page import="com.example.webengproject.models.City" %>
    <% City city = (City) request.getAttribute("city"); %>
    <% if (city != null) { %>
    <p>City Name: <%= city.getCityName() %>
    </p>
    <p>Is Clean: <%= city.getClean() %>
    </p>
    <p>Is Safe: <%= city.getSafe() %>
    </p>
    <p>Is Sane: <%= city.getSane() %>
    </p>
    <% } else { %>
    <p>No city information available.</p>
    <% } %>
</div>

<!-- Include Bootstrap JavaScript (optional) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
