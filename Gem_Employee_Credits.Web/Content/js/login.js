$(document).ready(function () {
    $('#loginFrm').on('submit', function (event) {
        event.preventDefault();
        $.ajax({
            url: '/App/LoginEmployee',
            type: 'POST',
            data: $(this).serialize(),
            success: function (obj) {
                var htmlString = "";
                if (obj.error) {
                    htmlString += "<div class = 'callout callout-danger'><center>"+obj.message+"</center></div>";
                } else {
                    htmlString += "<div class = 'callout callout-success'><center>" + obj.message + "</center></div>";
                    localStorage.setItem("employeeID", empId);
                }
                $('#message').html(htmlString);
                setTimeout(function () {
                    $('#message').html("");
                    window.location.href = "/App/Dashboard";
                }, 1000);
            },
            error: function (err) {
                console.log(err);
            }
        });
    });
});