$(function(){
	$('[data-toggle="collapse"]').click(function() {
		$('.collapse.in').collapse('hide')
	});
	var amit = $('.menu-list > ul > li')
	amit.on('click', 'a', function(event) {
		$('.menu-list > ul > li a').removeClass('active')
		$(this).addClass('active')
	});
});

$(function(){
	$('.topmenu .admin').hover(
		function() {
			$(this).find('ul').show();
		}, function() {
			$(this).find('ul').hide();
		}
		);
});

/*Height **/	
$(window).on("load resize", function(){
	var maxHeight = 0;
	$('.bHeight').each(function() {
		maxHeight = Math.max(maxHeight, $(this).height());
	});
	$('#navbar__left.bHeight, #body__wrapper.bHeight').css({height:maxHeight + 'px'});
});
/* Height**/

