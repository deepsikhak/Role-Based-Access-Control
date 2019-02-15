// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require best_in_place
//= require jquery.purr
//= require active_admin/base

$(document).ready(function() {
    $(".best_in_place").best_in_place()
    $('.best_in_place').bind("ajax:success", function () {$(this).closest('tr').effect('highlight'); });
  
    $(document).on('best_in_place:error', function(event, request, error) {
      // Display all error messages from server side validation
      response = $.parseJSON(request.responseText);
      $.each(response['errors'], function(index, value) {
        if(value.length > 0) {
          if( typeof(value) == "object") {value = index + " " + value.toString(); }
          var container = $("<span class='flash-error'></span>").html(value);
          container.purr();
        };
      });
    });
  });
