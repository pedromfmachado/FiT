// JavaScript Document

$(document).ready(function() {
	
	$("ul ul").hide();
	
	$("ul div").hover(function(e) {
		if(!$(this).children("ul").is(":visible"))
			$(this).children("ul").slideDown("slow").show;
	}, function(e) {
		if($(this).children("ul").is(":visible"))
			$(this).children("ul").slideUp("slow");
	});
});