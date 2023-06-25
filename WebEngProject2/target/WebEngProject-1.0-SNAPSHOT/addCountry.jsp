<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Country</title>

    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Add Country</h1>
    <form action="addCountry" method="POST">
        <div class="form-group">
            <label for="countryName">Country Name:</label>
            <input type="text" id="countryName" name="countryName" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Country</button>
    </form>
</div>

<!-- Include Bootstrap JavaScript (optional) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
