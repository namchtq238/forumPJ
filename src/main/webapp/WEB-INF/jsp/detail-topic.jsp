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
    <div class="card">
        <div class="card-header">
            <strong>Created on: Date</strong>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-4">
                    <p><strong>User: Nam</strong> ></p>
                    <p><strong>Joined on: Date</strong> </p>
                </div>
                <div class="col-md-8">
                    <h5>Title  <a href="#" class="btn btn-primary">Reply</a></h5>
                    <hr>
                    <p>Content</p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    const basePath = ${pageContext.request.contextPath}
    $(document).ready(function() {
        $.ajax({
            url: "/api/detail-topic",
            type: "GET",
            dataType: "json",
            success: function(data) {
                // var tableBody = "";
                // for (var i = 0; i < data.length; i++) {
                //     tableBody += "<tr>";
                //     tableBody += "<td>";
                //     tableBody += "<h4><a href='" + basePath + "/api/detail?id=" + data[i].id + "'>" + data[i].name + "</a></h4>";
                //     tableBody += "<p>Created by: " + data[i].user + "</p>";
                //     tableBody += "<p>Created on: " + data[i].date + "</p>";
                //     tableBody += "</td>";
                //     tableBody += "<td>";
                //     tableBody += "<p>" + data[i].replies + " Replies</p>";
                //     tableBody += "</td>";
                //     tableBody += "</tr>";
                // }
                // $("#threadTable tbody").html(tableBody);
            }
        });
    });
</script>

</html>
