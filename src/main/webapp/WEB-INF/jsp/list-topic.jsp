<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Topic</title>
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

    <form style="display: inline" action="${pageContext.request.contextPath}/create-topic" method="get">
        <button>Gửi bài mới</button>
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
    const basePath = ${pageContext.request.contextPath}
    $(document).ready(function() {
        $.ajax({
            url: "/api/list-topic",
            type: "GET",
            dataType: "json",
            success: function(data) {
                var tableBody = "";
                for (var i = 0; i < data.length; i++) {
                    tableBody += "<tr>";
                    tableBody += "<td>";
                    tableBody += "<h4><a href='" + basePath + "/api/detail?id=" + data[i].id + "'>" + data[i].name + "</a></h4>";
                    tableBody += "<p>Created by: " + data[i].user + "</p>";
                    tableBody += "<p>Created on: " + data[i].date + "</p>";
                    tableBody += "</td>";
                    tableBody += "<td>";
                    tableBody += "<p>" + data[i].replies + " Replies</p>";
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
