// JavaScript Document

$(document).ready(function() {

	$("#login-panel").hide();
	
	$("#login_txt").hover(function() {
		$("#login-panel").slideDown('slow').show();
    }, function() {});
	
});
