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

//= require jquery
//= require jquery_ujs
//= require activestorage
//= require popper
//= require bootstrap-sprockets

//= require nested_form_fields
//= require cocoon
//= require_tree .

//画面を表示したときにreadyでjsを読み込ませる
$(document).ready(function(){
	$("tr[data-href]").click(function(){
		window.location = $(this).data("href");
	});

	//customer側編集画面のcocoon用js
	$(function() {
  	// limits the number of categories
	  $('#details').on('cocoon:after-insert', function() {
	  check_to_hide_or_show_add_link();
	  });

	  $('#details').on('cocoon:after-remove', function() {
	  check_to_hide_or_show_add_link();
	  });

	  check_to_hide_or_show_add_link();

	  function check_to_hide_or_show_add_link() {
	    if ($('#details .nested-fields').length == 3) {
	      $('#add-link').hide();
	    } else {
	      $('#add-link').show();
	    }
	  }
	})
});