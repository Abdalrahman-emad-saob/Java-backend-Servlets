<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Violation</title>

    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <script>
        function getCitiesByCountry() {
            var countrySelect = document.getElementById("country");
            var countryId = countrySelect.value;
            var citySelect = document.getElementById("city");

            // Clear the current city options
            citySelect.innerHTML = "";

            if (countryId !== "") {
                fetch("${pageContext.request.contextPath}/cities/" + countryId)
                    .then(response => response.json())
                    .then(cities => {
                        // Populate the city select options
                        cities.forEach(city => {
                            var option = document.createElement("option");
                            option.value = city.cityId;
                            option.text = city.cityName;
                            citySelect.appendChild(option);
                        });
                    })
                    .catch(error => console.log(error));
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h2>Report Violation</h2>
    <form action="${pageContext.request.contextPath}/report-form" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="date">Date:</label>
            <input type="text" id="date" name="date" value="<%= new java.util.Date() %>" readonly class="form-control">
        </div>
        <div class="form-group">
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" required class="form-control">
        </div>
        <div class="form-group">
            <label for="country">Country:</label>
            <select id="country" name="country" required onchange="getCitiesByCountry()" class="form-control">
                <option>---Country---</option>
                <%@ page import="com.example.webengproject.models.Country" %>
                <%@ page import="java.util.List" %>
                <% List<Country> countries = (List<Country>) request.getAttribute("countries"); %>
                <% for (Country country : countries) { %>
                <option value="<%= country.getCountryId() %>"><%= country.getCountryName() %>
                </option>
                <% } %>
            </select>
        </div>
        <div class="form-group">
            <label for="city">City:</label>
            <select id="city" name="city" required class="form-control">
                <option>---City---</option>
            </select>
        </div>
        <div class="form-group">
            <label for="file">Upload Picture/Video (Max 20MB):</label>
            <input type="file" id="file" name="file" accept="image/*, video/*" required class="form-control-file">
        </div>
        <div class="form-group">
            <label for="violationType">Type of Violation:</label>
            <select id="violationType" name="violationType" required class="form-control">
                <option value="TRAFFIC_LIGHT">Red light crossing</option>
                <option value="STOP_SIGN">Running a stop sign</option>
                <option value="JAYWALKING">Jaywalking</option>
                <option value="LITTERING">Littering</option>
            </select>
        </div>
        <input type="submit" value="Submit Report" class="btn btn-primary">
    </form>
</div>

<!-- Include Bootstrap JavaScript (optional) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
