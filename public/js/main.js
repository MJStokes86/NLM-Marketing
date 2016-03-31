$(document).ready(function(){
	console.log('ready');


$(window).scroll( function(){
	$('.hideme').each(function(i){

		var bottom_of_object = $(this).offset().top + $(this).outerHeight();
		var bottom_of_window = $(window).scrollTop() + $(window).height();

		if(
			bottom_of_window > bottom_of_object) {

			$(this).animate({'opacity': '1'}, 500);
		}
	});
});

});


