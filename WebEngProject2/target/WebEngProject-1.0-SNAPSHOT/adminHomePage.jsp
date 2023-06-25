<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Home Page</title>

    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <a class="btn btn-dark" href="${pageContext.request.contextPath}/addCity">Add City</a>
    <a class="btn btn-dark" href="${pageContext.request.contextPath}/addCountry">Add Country</a>
    <a class="btn btn-dark" href="${pageContext.request.contextPath}/admin">Admin</a>
</div>

<!-- Include Bootstrap JavaScript (optional) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
