// JavaScript Document

$(document).ready(function() {
	
	$("ul li ul").hide();
	
	$("ul li").click(function(e) {
		$("ul li ul:visible").slideToggle("slow");
		$(this).children().slideToggle("slow");
    });
});