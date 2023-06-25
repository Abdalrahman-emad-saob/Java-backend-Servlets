<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>

    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<main class="container">
    <a class="btn btn-dark" href="${pageContext.request.contextPath}/report-form">Report</a>
    <a class="btn btn-dark" href="${pageContext.request.contextPath}/select-country">View City Info</a>
    <a class="btn btn-dark" href="${pageContext.request.contextPath}/adminHomePage.jsp">Admin</a>
</main>

<!-- Include Bootstrap JavaScript (optional) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
