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
<div class="noi-dung">
    <div class="form">
        <h2>Trang Đăng Nhập</h2>
        <form id="login-form" method="post" >
            <input class="form-group" type="text" name="username" placeholder="Username">
            <input class="form-group" type="password" name="password" placeholder="Password">
            <button class="btn btn-primary" type="submit">Login</button>
        </form>
        <p id="data-res" class="text-danger"></p>
    </div>
</div>
</body>
<script>
    $("#login-form").submit(function(event) {
        event.preventDefault();
        var formData = $(this).serialize();
        $.ajax({
            url: "/login",
            type: "POST",
            data: formData,
            success: function(response) {
                window.location.href = '/test'; // Redirect to home page
            },
            error: function(ajaxContext){
                var html = "<p>Invalid account</p>";
                $("#data-res").html(html);
            }

        });
    });
</script>
</html>
