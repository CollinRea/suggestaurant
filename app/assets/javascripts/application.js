// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {

  $('#restaurant_table').on('click', '.add_rating', function (e) {
    e.preventDefault();
    $td = $(this).closest('td')
    url = $(this).attr('href')
    $.ajax({
      url: url,
      method: 'GET'
    }).done(function (response) {
      $td.html(response)
    });
  });

  $('#restaurant_table').on('submit', '.rating_form', function (e) {
    e.preventDefault();
    $form = $(this)
    $td = $(this).closest('td')
    url = this.action
    restaurant_name = $(this).closest('tr').find('td')[0].innerText
    $input = $('<input type ="text" name="restaurant_name"/>').val(restaurant_name)
    $form.append($input)
    data = $($form).serialize();

    $.ajax({
      url: url,
      method: 'POST',
      data: data
    });
    
  });

  $('#restaurant_table').on('click', '.edit_rating', function (e) {
    e.preventDefault();
  });

});

