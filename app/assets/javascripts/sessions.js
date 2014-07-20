$(document).ready(function() {
    //---------------Modals JS------------
    $('.login').on('click', function(event) {
        event.preventDefault();
        $('.login-form').fadeToggle(400);
        return false;
    });


    $(document).on('click', function(event) {
        if (!$(event.target).closest('.modal > form').length) {
            if ($('.login-form').is(":visible")) {
                $('.login-form').fadeToggle(400);
            };
        };
    });



    $('.signup').on('click', function(event) {
        event.preventDefault();
        $('.signup-form').fadeToggle(400);
        return false;
    });

    $(document).on('click', function(event) {
        if (!$(event.target).closest('.modal > form').length) {
            if ($('.signup-form').is(":visible")) {
                $('.signup-form').fadeToggle(400);
            };
        };
    });

    //-------------login/sugnup submit------------

    var loginForm =

    $('.login-form > .submit').submit(function() {
        $.ajax({
            type: "POST",
            url: '/login',
            data: loginForm,
            success: signupSuccess,
            dataType: JSON
        });
    });

    $('.signup-form > .submit').submit(function() {
        $.ajax({
            type: "POST",
            url: '/signup',
            data: signupForm,
            success: signupSuccess,
            dataType: JSON
        });
    });
})
