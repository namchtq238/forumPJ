<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Topic</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <script src=https://code.jquery.com/jquery-3.6.0.min.js></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
</head>
<body>
<div style="float: right">
    <form action="${pageContext.request.contextPath}/logout" method="post">
        <label for="logout">Xin chào ${user.username}</label>
        <button type="submit" class="btn btn-danger" id="logout">Logout</button>
    </form>
</div>

<div class="container">
    <c:set var="category" value="${category}" />

    <!-- Display the title of the topic using EL -->
    <h2>${category.title}</h2>

    <form style="display: inline" action="${pageContext.request.contextPath}/create-topic" method="get">
        <button style="font-family: 'Roboto Light'">Gửi bài mới</button>
    </form>

    <table class="table table-striped table-bordered" id="threadTable">
        <thead class="thead-dark">
        <tr>
            <td>Chủ đề</td>
            <td>Hồi âm</td>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>
</body>
<script>
    $(document).ready(function() {
        const basePath = ${pageContext.request.contextPath}
            $.ajax({
            url: "/api/list-topic",
            type: "GET",
            dataType: "json",
            success: function(data) {
                console.log(data)
                var tableBody = "";
                for (var i = 0; i < data.length; i++) {
                    tableBody += "<tr>";
                    tableBody += "<td>";
                    tableBody += "<h4><a href='/detail-topic?id=" + data[i].id + "'>" + data[i].title + "</a></h4>";
                    tableBody += "<p>Created by: " + data[i].creator.username + "</p>";
                    tableBody += "<p>Created on: " + data[i].createdTime + "</p>";
                    tableBody += "</td>";
                    tableBody += "<td>";
                    tableBody += "<p>" + data[i].messages.length + " Replies</p>";
                    tableBody += "</td>";
                    tableBody += "</tr>";
                }
                $("#threadTable tbody").html(tableBody);
            },
            fail: function(){
                alert("fail to load data")
            }
        });
    });
</script>

</html>
