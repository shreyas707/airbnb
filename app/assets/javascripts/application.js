// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function() {
  $('table').addClass('mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp');
  $('th').addClass('mdl-data-table__cell--non-numeric');
  $('td').addClass('mdl-data-table__cell--non-numeric');
  $('label').addClass('mdl-textfield__label');
  $('input[type=text]').addClass('mdl-textfield__input');
  $('input[type=email]').addClass('mdl-textfield__input');
  $('input[type=password]').addClass('mdl-textfield__input');
  $('textarea').addClass('mdl-textfield__input');
});