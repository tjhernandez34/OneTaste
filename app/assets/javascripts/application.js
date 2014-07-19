$(document).ready(function(){
  $(".vote").on('click', function(event){
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
      url:$(this).data('url'),
      type: "Post",
      data: {vote: {voteable_type: data, voteable_id: id, voter_id: user_id}},
      dataType: "json",
      success: function(response){
        $("#" + label + "_" + id).text(response);
        console.log("#" + label + "_" + id)
        console.log(response);
      }
 });
})
})




//   });



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
