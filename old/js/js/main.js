$(document).ready(function(){
	$('.bxslider').bxSlider({
		mode: 'fade',
		speed: 2000,
		auto: true,
		pause: 3000
	});
	$('.bxslider-pager').bxSlider({
		pagerCustom: '#bx-pager',
		auto: true,
		pause: 3000
	});
	
	$('#delivery-select, #pay-select').selectmenu();
	$('#spinner').spinner({
		min: 1
	});
	
	$('#filterPrice1').change(function() {
		var val = $(this).val();
		$('#slider').slider('values',0,val);
	});
	
	$('#filterPrice2').change(function() {
		var val = $(this).val();
		$('#slider').slider('values',1,val);
	});
	
	$("#slider").slider({
		values: [1800, 12500],
			min:200,
			max:32900,
			//step:100,
			range:true,
		slide: function( event, ui ) {
			$("#filterPrice1").val(ui.values[0]);
			$("#filterPrice2").val(ui.values[1]);
			}
	});
	$("#filterPrice1").val($('#slider').slider( "values",0 ));
	$("#filterPrice2").val($('#slider').slider( "values",1 ));
	
	//tabs
	$('#tabs-1').show();
		$('#items li').click(function(){
			if( $(this).attr('class') == 'active' ){
				return false;
			}
			var link = $(this).children().attr('href'); 
			var prevActive = $('li.active').children().attr('href'); 
			$('li.active').removeClass('active');
			$(this).addClass('active');
			
			$(prevActive).fadeOut(500, function(){
				$(link).fadeIn();
				$('#items li').css('background', '#f1f3f5');
				$('li.active').css('background', '#fff');
			});
			return false;
		});
	
	//menu
	var h = (($('.header-middle').height()) + ($('.header-bottom').height()));
	var menu = $('.header-bottom').offset();
  $(window).scroll(function(){
	if ($(this).scrollTop() >= menu.top) {
		$('.header-bottom').addClass('fixed');
		$('.header-middle').height(h);
	} else {
		$('.header-bottom').removeClass('fixed');
		$('.header-middle').css('height', '');
	}
  });
  
});