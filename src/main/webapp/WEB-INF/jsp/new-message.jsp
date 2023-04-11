<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>New Topic</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src=https://code.jquery.com/jquery-3.6.0.min.js></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>

<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-header">
                    Trả lời:
                </div>
                <div class="card-body">
                    <form>
                        <div class="form-group">
                            <label for="title">Tiêu đề:</label>
                            <input type="text" class="form-control" id="title" name="title" required value="${title}">
                            <input type="hidden"  id="id" name="id" required value="${id}">
                        </div>
                        <div class="form-group">
                            <%--@declare id="contentmsg"--%><label for="contentmsg">Nội <dung></dung>:</label>
                            <textarea class="form-control" id="contentmsg" name="contentmsg" rows="3" required></textarea>
                        </div>
                        <button type="button" class="btn btn-primary" id="submit-btn">Gửi</button>
                        <button type="button" class="btn btn-primary" onclick="history.back()">Trở về</button>
                    </form>
                    <div id="result"></div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(document).ready(function() {
        $("#submit-btn").click(function() {
            $.ajax({
                url: "/api/reply-topic",
                type: "POST",
                data: {
                    title: $("#title").val(),
                    contentmsg: $("#contentmsg").val(),
                    idTopic: $("#id").val()
                },
                success: function(response) {
                    window.location.href = `/detail-topic?id=` + response.topic.id; // Redirect to home page
                }
            });
        });
    });
</script>

</html>
