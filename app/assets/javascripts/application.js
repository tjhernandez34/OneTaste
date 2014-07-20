var currentImage = 1;

function showImage() {
    array_length = $('#images_length').val()
    // console.log("in loop")
    // console.log(array_length)

    last = "#restimage" + (currentImage - 1);
    string = "#restimage" + currentImage;
    // console.log(last)
    // console.log(string)
    // console.log(currentImage)
    $(last).removeClass('restaurant_image_visible');
    $(last).addClass('restaurant_image_hidden');
    $(string).removeClass('restaurant_image_hidden');
    $(string).addClass('restaurant_image_visible');

};


$(document).ready(function() {
    //---------------Modals JS------------
    $('.login').on('click', function(event) {
        event.preventDefault();
        $('.login-form').fadeToggle(400);
        return false;
    });


$("#box").val('');

})

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

    //---------------vote click--------------
    $(".vote").on('click', function(event) {
        event.preventDefault();
        that = $(this).parent();
        console.log($(this).data('url'));
        data = ($(this).data("type"));
        id = ($(this).data("id")).split(" ")[1]
        console.log(id)
        label = ($(this).data("id")).split(" ")[0]
        console.log(label)
        user_id = ($(this).data("user"))
        console.log(user_id)
        $.ajax({
            url: $(this).data('url'),
            type: "Post",
            data: {
                vote: {
                    voteable_type: data,
                    voteable_id: id,
                    voter_id: user_id
                }
            },
            dataType: "json",
            success: function(response) {
                $("#" + label + "_" + id).text(response);
                console.log("#" + label + "_" + id)
                console.log(response);
            }
        });
    })

    //------------------ homepage search---------------

    $(".pure-input-1-4").on('click', function() {
        $("#slogan").fadeTo("slow", 0.4);
        $('#search_tag').hide();
        $("#box").attr('class', 'pure-input-1-2');
        return false;

    });


    $("#slogan").on('click', function() {
        $("#slogan").fadeTo("slow", 1);
        $("#box").attr('class', 'pure-input-1-4');

    });

    $(document).scroll(function() {
        if ($(document).scrollTop() > 30) {
            $(".restaurants_splash").show();
            $("#users_splash").show();
            $("#slogan").css('height', '550px');
        }
        if ($(document).scrollTop() == 0) {
            $("#slogan").css('height', '900px');
            $(".restaurants_splash").hide();
            $("#users_splash").hide();
        };
    });

    $(".restaurants_splash").on('click', function() {
        $("#slogan").css('opacity', '1');
        $("#box").attr('class', 'pure-input-1-4');
    });

    $("#users_splash").on('click', function() {
        $("#slogan").css('opacity', '1');
        $("#box").attr('class', 'pure-input-1-4');
    });

    setInterval(function() {
        showImage()
        currentImage++;
        // console.log("just outside if");
        // console.log(currentImage);
        // console.log(array_length);
        // console.log(currentImage === array_length);
        if (currentImage > array_length) {
            // console.log("if statement");
            $(last).removeClass('restaurant_image_visible');
            $(last).addClass('restaurant_image_hidden');
            $('#restimage0').removeClass('restaurant_image_hidden');
            $('#restimage0').addClass('restaurant_image_visible');
            currentImage = 0;
        };
    }, 5000);

})



// });



// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
