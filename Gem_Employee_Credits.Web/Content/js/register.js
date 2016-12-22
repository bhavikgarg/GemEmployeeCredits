$(document).ready(function () {
    $('#registerFrm').on('submit', function (event) {
        event.preventDefault();
        $.ajax({
            url: '/App/RegisterEmployee',
            type: 'POST',
            data: $(this).serialize(),
            success: function (res) {
                console.log(res);
            },
            error: function (err) {
                console.log(err);
            }
        });
    });
});