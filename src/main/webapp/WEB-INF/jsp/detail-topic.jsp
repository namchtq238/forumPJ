<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Topic</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <div>
        <h3>Chủ đề: ${topic.title}</h3>
        ${topMessage != null ? '<p>Bài mới nhất do \'' + topMessage.creator.username + '\' gửi lúc ' + topMessage.createdTime + '. ' + repCount + ' hồi âm</p>' : '<p></p>'}
        <a href="/home">Danh sách chủ đề</a>
    </div>
    <div id="main-title">
        <div class="card">
            <div class="card-header">
                <strong>Tạo lúc: ${topic.createdTime}</strong>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <input type="hidden" id="id" name="id" required value="${topic.id}">
                        <p><strong>Người dùng: ${topic.creator.username}</strong></p>
                        <p><strong>Ngày tham gia: ${topic.creator.joinDate}</strong></p>
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-sm-6">
                                <h5 style="float: left">Tiêu đề: ${topic.title}</h5>
                            </div>
                            <div class="col-sm-6">
                                <a href="${pageContext.request.contextPath}/reply-topic?id=${topic.id}"
                                   class="btn btn-primary" style="float: right">Reply</a>
                            </div>
                        </div>
                        <hr>
                        <p>${topic.content}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="main-body"></div>
</div>
</body>
<script>
    $(document).ready(function () {
        $.ajax({
            url: "/api/detail-topic",
            type: "GET",
            data: {
                id: $("#id").val()
            },
            success: function (data) {
                var cardBody = "";
                for (var i = 0; i < data.length; i++) {
                    cardBody += "<div class='card'>";
                    cardBody += "<div class='card-header'>";
                    cardBody += "<strong>Tạo lúc: " + data[i].createdTime + "</strong>";
                    cardBody += "</div>";
                    cardBody += "<div class='card-body'>";
                    cardBody += "<div class='row'>";
                    cardBody += "<div class='col-md-4'>";
                    cardBody += "<input type='hidden' id='id' name='id' required value=" + ${topic.id} +">";
                    cardBody += "<p><strong>Người dùng: "+ data[i].creator.username + "</strong></p>";
                    cardBody += " <p><strong>Ngày tham gia: " + data[i].creator.joinDate +"</strong></p>";
                    cardBody += "</div>";
                    cardBody += "<div class='col-md-8'>"
                    cardBody += "<div class='row'>"
                    cardBody += "<div class='col-sm-6'>"
                    cardBody += "<p style='float: left'>" + data[i].title + "</p>";
                    cardBody += "</div>";
                    cardBody += "<div class='col-sm-6'>"
                    cardBody += "<a href='/reply-topic?id=" + ${topic.id} + "' ";
                    cardBody += "class='btn btn-primary' style='float: right'>";
                    cardBody += "Trả lời</a>";
                    cardBody += "</div>";
                    cardBody += "<hr>";
                    cardBody += "<p>" + data[i].content +"</p>";
                    cardBody += "</div>";
                    cardBody += "</div>";
                    cardBody += "</div>";
                    cardBody += "</div>";
                    cardBody += "</div>";
                }
                $("#main-body").html(cardBody);
            }
        });
    });
</script>

</html>
