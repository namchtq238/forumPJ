<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src=https://code.jquery.com/jquery-3.6.0.min.js></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
</head>
<body>
<div class="container">
    <c:set var="category" value="${category}" />

    <!-- Display the title of the topic using EL -->
    <h2>${category.title}</h2>
    <table >
        <thead>
        <tr>
            <td>Chủ đề</td>
            <td>Hồi âm</td>
            <td></td>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${buongList}">
            <tr>
                <td>${item.ten}</td>
                <td>${item.sucChua}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
</body>
<script>
    $(document).ready(function() {
        // AJAX call to retrieve data
        $.ajax({
            url: "/api/show-topic",
            type: "GET",
            success: function(data) {
                var tableBody = $("#my-table tbody");

                // Clear any existing rows from the table
                tableBody.empty();

                // Loop through the data and create a row for each item
                $.each(data, function(index, item) {
                    var row = $("<tr>");
                    row.append($("<td>").text(item.column1));
                    row.append($("<td>").text(item.column2));
                    tableBody.append(row);
                });            },
            error: function() {
                console.log("Error retrieving data");
            }
        });
    });
</script>
</html>
