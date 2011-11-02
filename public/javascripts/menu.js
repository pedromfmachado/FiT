// JavaScript Document

$(document).ready(function() {
	
	$("ul ul").hide();
	
	$("ul a").click(function(e) {		
		
		if(!$(this).next().is('ul:visible'))
			$("ul ul:visible").slideToggle("slow");
		
		$('ul a li.current').removeClass().addClass("parent");
		$(this).children().removeClass().addClass("current");
		
		if($(this).next().is('ul'))
		{
			$(this).next().slideToggle("slow");
			return false;
		}
    });
	
});