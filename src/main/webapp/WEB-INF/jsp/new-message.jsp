<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
                            <label for="title">Name:</label>
                            <input type="text" class="form-control" id="title" name="title" required>
                        </div>
                        <div class="form-group">
                            <%--@declare id="contentmsg"--%><label for="contentmsg">Content:</label>
                            <textarea class="form-control" id="contentmsg" name="contentmsg" rows="3" required></textarea>
                        </div>
                        <button type="button" class="btn btn-primary" id="submit-btn">Submit</button>
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
                url: "/api/create-topic",
                type: "POST",
                data: {
                    title: $("#title").val(),
                    contentmsg: $("#contentmsg").val()
                },
                success: function(response) {
                    console.log(response)
                }
            });
        });
    });
</script>

</html>
