<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select Country</title>

    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div class="container">
    <h2>Select Country and City</h2>
    <form action="${pageContext.request.contextPath}/city-info" method="get">
        <div class="form-group">
            <label for="countrySelect">Country:</label>
            <select id="countrySelect" name="countryId" class="form-control">
                <option value="">-- Select Country --</option>
                <%-- Access the request attribute and populate options dynamically --%>
                <%@ page import="java.util.List" %>
                <%@ page import="com.example.webengproject.models.Country" %>
                <% List<Country> countries = (List<Country>) request.getAttribute("countries"); %>
                <% if (countries != null) {
                    for (Country country : countries) { %>
                <option value="<%= country.getCountryId() %>"><%= country.getCountryName() %>
                </option>
                <% }
                } %>
            </select>
        </div>
        <div class="form-group">
            <label for="citySelect">City:</label>
            <select id="citySelect" name="cityId" class="form-control">
                <option value="">-- Select City --</option>
            </select>
        </div>
        <input type="submit" value="Submit" class="btn btn-primary">
    </form>
</div>

<!-- Include Bootstrap JavaScript (optional) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    document.getElementById("countrySelect").addEventListener("change", function () {
        var countryId = this.value;
        getCities(countryId);
    });

    function getCities(countryId) {
        fetch("${pageContext.request.contextPath}/cities/" + countryId)
            .then(response => response.json())
            .then(data => {
                var citySelect = document.getElementById("citySelect");
                citySelect.innerHTML = "<option value=''>-- Select City --</option>";
                data.forEach(function (city) {
                    var option = document.createElement("option");
                    option.value = city.cityId;
                    option.textContent = city.cityName;
                    citySelect.appendChild(option);
                });
            })
            .catch(error => console.error("Error:", error));
    }
</script>
</body>
</html>
