/* yandexMap */
var yandex_map;
function yandexMap(){ 	
	// yandex-map-contacts
	if ( $('#yandex-map-contacts').length ) {
		var obj = $('#yandex-map-contacts');
		var left = obj.data('left');
		var right = obj.data('right');
		var left_placemark = obj.data('placemark-left');
		var right_placemark = obj.data('placemark-right');
		var zoom = obj.data('zoom');
		ymaps.ready(function(){
			// Create map
			yandex_map = new ymaps.Map('yandex-map-contacts', {
				center: [left, right],
				zoom: zoom
			});
			myPlacemark = new ymaps.Placemark([left_placemark, right_placemark], {
				hintContent: '',
				help_hint: '',
				balloonContent: ''
			});
			// Add buttons and placemarks
			yandex_map.controls.add('zoomControl', {top: '10px', left:'10px', height: '50px'});
			yandex_map.geoObjects.add(myPlacemark);
		});
	}

	// yandex-map-delivery
	if ( $('#yandex-map-delivery').length ) {
		var obj2 = $('#yandex-map-delivery');
		var left2 = obj2.data('left');
		var right2 = obj2.data('right');
		var left_placemark2 = obj2.data('placemark-left');
		var right_placemark2 = obj2.data('placemark-right');
		var zoom2 = obj2.data('zoom');
		ymaps.ready(function(){
			// Create map
			yandex_map2 = new ymaps.Map('yandex-map-delivery', {
				center: [left2, right2],
				zoom: zoom2
			});
			myPlacemark2 = new ymaps.Placemark([left_placemark2, right_placemark2], {
				hintContent: '',
				help_hint: '',
				balloonContent: ''
			});
			// Add buttons and placemarks
			yandex_map2.controls.add('zoomControl', {top: '10px', left:'10px', height: '50px'});
			yandex_map2.geoObjects.add(myPlacemark2);
		});
	}
}
/* yandexMap end */

/* googleMap */
var google_map,google_map_center;
function googleMap(){ 
	if ($('#google-map-contacts').length) {
		// coordinates for placemark
		google_map_center = new google.maps.LatLng(55.837560776866766,37.44540149999996);
		function initialize() {
			// map option
			var mapOptions = {
				zoom: 16,
				center: google_map_center,
				mapTypeId: google.maps.MapTypeId.ROADMAP,
				scrollwheel: false
			};
			
			// define google map
			google_map = new google.maps.Map(document.getElementById('google-map-contacts'),
			mapOptions);
			
			// placemark option
			var marker = new google.maps.Marker({
				position: new google.maps.LatLng(55.837560776866766,37.44540149999996),
				map: google_map
			});
		}
		// init map
		google.maps.event.addDomListener(window, 'load', initialize);
	}
}
/* googleMap end */

/* validator */
function validator(){
	// contacts-leave-message form
	if ( $('.contacts-leave-message form').length ) {
		var form_item = $('.contacts-leave-message form');
		form_item.validate({
			rules: {
				contacts_leave_message_name: {
					required: true
				},
				contacts_leave_message_tel: {
					required: true
				},
				contacts_leave_message_email: {
					required: true,
					email: true
				},
				contacts_leave_message_text: {
					required: true,
				}
			},
			errorClass: 'error',
			validClass: 'valid',
			highlight: function(element, errorClass, validClass) { 
				$(element).parents('.input-field:eq(0)').removeClass(validClass).addClass(errorClass);
				$(element).removeClass(validClass).addClass(errorClass);
			},
			unhighlight: function(element, errorClass, validClass) {
				$(element).parents('.input-field:eq(0)').removeClass(errorClass).addClass(validClass);
				$(element).removeClass(errorClass).addClass(validClass);
			},
			invalidHandler: function(event, validator) {},
			errorPlacement: function(error, element) {}
		});
	}
	
	// account-auth form
	if ( $('.account-auth form').length ) {
		var form_item2 = $('.account-auth form');
		form_item2.validate({
			rules: {
				account_auth_name: {
					required: true
				},
				account_auth_password: {
					required: true
				}
			},
			errorClass: 'error',
			validClass: 'valid',
			highlight: function(element, errorClass, validClass) { 
				$(element).parents('.input-field:eq(0)').removeClass(validClass).addClass(errorClass);
				$(element).removeClass(validClass).addClass(errorClass);
			},
			unhighlight: function(element, errorClass, validClass) {
				$(element).parents('.input-field:eq(0)').removeClass(errorClass).addClass(validClass);
				$(element).removeClass(errorClass).addClass(validClass);
			},
			invalidHandler: function(event, validator) {},
			errorPlacement: function(error, element) {}
		});
	}
	
	// account-reg form
	if ( $('.account-reg form').length ) {
		var form_item3 = $('.account-reg form');
		form_item3.validate({
			rules: {
				account_reg_name: {
					required: true
				},
				account_reg_email: {
					required: true,
					email: true
				},
				account_reg_password: {
					required: true,
					equalTo: '[name="account_reg_repassword"]'
				},
				account_reg_repassword: {
					required: true,
					equalTo: '[name="account_reg_password"]'
				}
			},
			errorClass: 'error',
			validClass: 'valid',
			highlight: function(element, errorClass, validClass) { 
				$(element).parents('.input-field:eq(0)').removeClass(validClass).addClass(errorClass);
				$(element).removeClass(validClass).addClass(errorClass);
			},
			unhighlight: function(element, errorClass, validClass) {
				$(element).parents('.input-field:eq(0)').removeClass(errorClass).addClass(validClass);
				$(element).removeClass(errorClass).addClass(validClass);
			},
			invalidHandler: function(event, validator) {},
			errorPlacement: function(error, element) {}
		});
	}
	
	// leave-review-form
	if ( $('.leave-review-form').length ) {
		var form_item4 = $('.leave-review-form form');
		form_item4.validate({
			rules: {
				leave_review_name: {
					required: true
				},
				leave_review_email: {
					required: true,
					email: true
				},
				leave_review_text: {
					required: true
				}
			},
			errorClass: 'error',
			validClass: 'valid',
			highlight: function(element, errorClass, validClass) { 
				$(element).parents('.input-field:eq(0)').removeClass(validClass).addClass(errorClass);
				$(element).removeClass(validClass).addClass(errorClass);
			},
			unhighlight: function(element, errorClass, validClass) {
				$(element).parents('.input-field:eq(0)').removeClass(errorClass).addClass(validClass);
				$(element).removeClass(errorClass).addClass(validClass);
			},
			invalidHandler: function(event, validator) {},
			errorPlacement: function(error, element) {}
		});
	}
	
	// modal-quick-order-form
	if ( $('.modal-quick-order form').length ) {
		var form_item5 = $('.modal-quick-order form');
		form_item5.validate({
			rules: {
				modal_quick_order_name: {
					required: true
				},
				modal_quick_order_phone: {
					required: true
				},
				modal_quick_order_text: {
					required: true
				}
			},
			errorClass: 'error',
			validClass: 'valid',
			highlight: function(element, errorClass, validClass) { 
				$(element).parents('.input-field:eq(0)').removeClass(validClass).addClass(errorClass);
				$(element).removeClass(validClass).addClass(errorClass);
			},
			unhighlight: function(element, errorClass, validClass) {
				$(element).parents('.input-field:eq(0)').removeClass(errorClass).addClass(validClass);
				$(element).removeClass(errorClass).addClass(validClass);
			},
			invalidHandler: function(event, validator) {},
			errorPlacement: function(error, element) {}
		});
	}
	
	// modal-quick-order-form
	if ( $('.block-cart form').length ) {
		var form_item6 = $('.block-cart form');
		form_item6.validate({
			rules: {
				buyer_info_form_name: {
					required: true
				},
				buyer_info_form_phone: {
					required: true
				},
				buyer_info_form_email: {
					required: true
				},
				buyer_info_form_text: {
					required: true
				}
			},
			errorClass: 'error',
			validClass: 'valid',
			highlight: function(element, errorClass, validClass) { 
				$(element).parents('.input-field:eq(0)').removeClass(validClass).addClass(errorClass);
				$(element).removeClass(validClass).addClass(errorClass);
			},
			unhighlight: function(element, errorClass, validClass) {
				$(element).parents('.input-field:eq(0)').removeClass(errorClass).addClass(validClass);
				$(element).removeClass(errorClass).addClass(validClass);
			},
			invalidHandler: function(event, validator) {},
			errorPlacement: function(error, element) {}
		});
	}
	
	// modal-quick-order-form
	if ( $('.modal-callback-form form').length ) {
		var form_item7 = $('.modal-callback-form form');
		form_item7.validate({
			rules: {
				modal_callback_name: {
					required: true
				},
				modal_callback_phone: {
					required: true
				}
			},
			errorClass: 'error',
			validClass: 'valid',
			highlight: function(element, errorClass, validClass) { 
				$(element).parents('.input-field:eq(0)').removeClass(validClass).addClass(errorClass);
				$(element).removeClass(validClass).addClass(errorClass);
			},
			unhighlight: function(element, errorClass, validClass) {
				$(element).parents('.input-field:eq(0)').removeClass(errorClass).addClass(validClass);
				$(element).removeClass(errorClass).addClass(validClass);
			},
			invalidHandler: function(event, validator) {},
			errorPlacement: function(error, element) {}
		});
	}
}
/* validator end */

/* phoneMask */
function phoneMask(){
	if ( $('.js-phone-mask').length )
		$('.js-phone-mask').mask('+7 (999) 999-99-99');
}
/* phoneMask end */

/* sliderRange */
function sliderRange(){
	if ( $('#range-slider').length ){
		// init slider
		var range_slider = document.getElementById('range-slider');
		noUiSlider.create(range_slider, {
			start: [2100, 13870],
			connect: true,
			step: 100,
			range: {
				'min': 2100,
				'max': 13870
			}
		});
		
		// update inputs/slider
		var valueInputFrom = document.getElementById('sidebar_price_from');
		var valueInputTo = document.getElementById('sidebar_price_to');
		//var valueSpanFrom = document.getElementById('range-slider-span-from');
		//var valueSpanTo = document.getElementById('range-slider-span-to');

		// When the slider value changes, update the input and span
		range_slider.noUiSlider.on('update', function( values, handle ) {
			if ( handle ) {
				valueInputTo.value = parseInt(values[handle]);
				//valueSpanTo.innerHTML = parseInt(values[handle]);
			} else {
				valueInputFrom.value = parseInt(values[handle]);
				//valueSpanFrom.innerHTML = parseInt(values[handle]);
			}
		});

		// When the input changes, set the slider value
		valueInputFrom.addEventListener('change', function(){
			range_slider.noUiSlider.set([this.value,null]);
			//valueSpanFrom.innerHTML = this.value;
		});
		valueInputTo.addEventListener('change', function(){
			range_slider.noUiSlider.set([null,this.value]);
			//valueSpanTo.innerHTML = this.value;
		});
	}
}
/* sliderRange end */

/* spinnerFn */
function spinnerFn(){
	var spin = $('.spinner');
	if (spin.length){
		spin.each( function() {
			var spinner = $(this);
		
			spinner.spinner({
				spin: function( event, ui ) {
					if ( ui.value > 99 ) {
					$( this ).spinner('value', 99 );
						return false;
					} else if ( ui.value < 1 ) {
						$( this ).spinner('value', 1 );
						return false;
					}
					var spin_val = $( this ).spinner('value');
				},
				create: function(ui, event){
					var widget = $( this ).spinner('widget');
					widget.find('.ui-icon-triangle-1-n').html('+');
					widget.find('.ui-icon-triangle-1-s').html('-');
				},
				stop: function(event, ui){				
					cartTotal(); //вызов функции пересчёта корзины
				}
			});
			
			// Функция реакции на событие event, проверяет введёный символ на "число это или нет", "дополнительные кнопки или нет" и "значение в интервале 1 - 9999 "
			function checkSpinInput(event) {
				// Если Ctrl+A, home, end, стрелки
				if ( event.keyCode == 46 || event.keyCode == 9 || event.keyCode == 27 ||
				(event.keyCode == 65 && event.ctrlKey === true) ||
				(event.keyCode >= 35 && event.keyCode <= 39)) {
				}
				else {
					// Если не число - отменить действие 
					if ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 )) {
						if ( event.keyCode != 8 )
							event.preventDefault();
					}
				}
			}
			
			spinner.keydown(function(event) {
				checkSpinInput(event);
			});
			spinner.keyup(function(event) {
				checkSpinInput(event);
			});
			spinner.focus(function(event) {
				spinner.val(parseInt(spinner.val()));
			});
			spinner.blur(function(event) {
				if ( !spinner.val() || spinner.val() == 0 )
					spinner.val(1);
				else
					spinner.val(spinner.val());
				cartTotal();
			});
		});
	}
}
/* spinnerFn End */

/* sideReset */
function sideReset(){
	if ( $('.js-side-reset').length ) {
		$('.js-side-reset').on('click',function(e){
			var cur = $(this);
			var cur_filter = cur.parents('.side-filter:eq(0)');
			cur_filter.unwrap();
			cur_filter.wrapInner('<form></form>');
			cur_filter.find('form').get(0).reset();
			cur_filter.find('form').children().unwrap();
			$('.side-filter,.side-filters__buttons').wrapAll('<form></form>');
			e.preventDefault();
		});
	}
}
/* sideReset end */

/* itemsViews */
function itemsViews(){
	if ( $('.items-view-list').length ) {
		$('.items-view-list a').on('click',function(e){
			var cur = $(this);
			var cur_li = cur.parents('li:eq(0)');
			cur_li.addClass('active').siblings('.active').removeClass('active');
			if ( !cur.hasClass('js-view-tile2') && !cur.hasClass('js-view-lines') ){
				$('.js-products-viewed').removeClass('products-list--tile2 products-list--lines');
				return false;
			}
			if ( cur.hasClass('js-view-tile2') ){
				$('.js-products-viewed').removeClass('products-list--lines').addClass('products-list--tile2');
				return false;
			}
			if ( cur.hasClass('js-view-lines') ){
				$('.js-products-viewed').removeClass('products-list--tile2').addClass('products-list--lines');
				return false;
			}
			e.preventDefault();
		});
	}
}
/* itemsViews end */

/* Cart Total */
function cartTotal(){
	var cart = $('.cart-table tbody'); // tbody нашей таблицы корзина
	var total = $('.js-cart-total'); // итоговое значение
	var total_value = 0;
	cart.find('tr').each(function(){
		var cur = $(this);
		var price = parseInt(cur.attr('data-price')); // цена
		var count = cur.find('.spinner').val(); // количество
		var sum = cur.find('.js-product-cost'); // стоимость
		var sum_value = price*count; 
		sum.text(val_space(sum_value));
		total_value+=sum_value; // итоговое значение
	});
	total.html(val_space(total_value));  // вывод итогового значения
}
/* Cart Total End */

// delete space in numbers
function num_length_val(num_val){
	var str = ''
	num_val = num_val + ' ';
	str = num_val.replace(',','');
	return str;
}
// add space in numbers
function val_space(n) {
	n += "";
	return n.replace(/(\d{1,3}(?=(\d{3})+(?:\.\d|\b)))/g, "$1,").replace(/U/g, "");
}

/* removeTableRow */
function removeTableRow() {
	if ( $('.js-remove-row').length ) {
		$('.js-remove-row').on('click', function(e) {
			$(this).parents('tr').fadeOut(function(){
				$(this).remove();
				cartTotal();
			});
			e.preventDefault();
		});			
	}
}
/* removeTableRow End */

/* countdownTimer */
function countdownTimer(){
	if ( $('.js-clock').length ) {
		var clock_block = $('.js-clock');
		var clock = clock_block.FlipClock(3600 * 24 * 3, {
			clockFace: 'DailyCounter',
			countdown: true,
			showSeconds: false
		});
		var clock_time = clock_block.attr('data-time');
		clock.setTime(clock_time); // seconds
	}
}
/* countdownTimer end */

/* sliders */
function sliders(){
	// js-promo-slider
	if ( $('.js-promo-slider').length ) {
		$('.js-promo-slider').bxSlider({
			pager: false
		});
	}
	
	// js-product-full-images-left-slider
	if ( $('.js-product-full-images-left-slider').length ) {
		$('.js-product-full-images-left-slider').bxSlider({
			infiniteLoop:false,
			hideControlOnEnd:true,
			mode: 'vertical',
			slideMargin: 8,
			pager: false,
			minSlides: 4,
			maxSlides: 4
		});
	}
	
	// js-product-full-images-right-slider
	if ( $('.js-product-full-images-right-slider').length ) {
		if ( !$('.mobile-res').is(':visible') ){
			$('.js-product-full-images-right-slider').bxSlider({
				pagerCustom: '.js-product-full-images-left-slider',
				controls:false
			});
		} else {
			$('.js-product-full-images-right-slider').bxSlider({
				controls:false
			});
		}
	}
	
	// js-related-news-slider
	if ( $('.js-related-news-slider').length && $('.mobile-res').is(':visible') ){
		$('.js-related-news-slider').bxSlider({
			controls:false,
			adaptiveHeight:true,
			slideMargin: 20
		});
	}
	
	// js-delivery-slider
	if ( $('.js-delivery-slider').length && $('.mobile-res').is(':visible') ){
		$('.js-delivery-slider').bxSlider({
			controls:false,
			adaptiveHeight:true,
			slideMargin: 20
		});
	}
	
	// js-related-products-slider
	if ( $('.js-related-products-slider').length && $('.mobile-res').is(':visible') ){
		$('.js-related-products-slider').bxSlider({
			controls:false,
			adaptiveHeight:true,
			slideMargin: 20
		});
	}
	
	// js-spec-products-slider
	if ( $('.js-spec-products-slider').length && $('.mobile-res').is(':visible') ){
		$('.js-spec-products-slider').bxSlider({
			controls:false,
			adaptiveHeight:true,
			slideMargin: 20
		});
	}
	
	// js-main-reviews-slider
	if ( $('.js-main-reviews-slider').length && $('.mobile-res').is(':visible') ){
		$('.js-main-reviews-slider').bxSlider({
			controls:false,
			adaptiveHeight:true,
			slideMargin: 20
		});
	}
	
	// js-main-similar-products-slider
	if ( $('.js-main-similar-products-slider').length && $('.mobile-res').is(':visible') ){
		$('.js-main-similar-products-slider').bxSlider({
			controls:false,
			adaptiveHeight:true,
			slideMargin: 20
		});
	}
}
/* sliders end */

/* tooltips */
function tooltips(){
	if ( $('.tooltip').length ){
		var tooltip_interval;
		$('.tooltip').hover(
		function(){
			var cur = $(this);
			tooltip_interval = setTimeout(function(){
				var cur_left = cur.offset().left;
				var cur_top = cur.offset().top;
				var cur_id = cur.attr('data-tooltip');
				var cur_width = cur.width();
				$('.tooltip-fixed[id="'+cur_id+'"]').fadeIn().css({'left':cur_left+cur_width+20,'top':cur_top-80});
			},100);
		},
		function(){
			clearInterval(tooltip_interval);
			var cur = $(this);
			$('.tooltip-fixed').fadeOut(function(){
				$(this).removeAttr('style');
			});
		});
	}
}
/* tooltips end */

/* starRating */
function starRating() {
	if ( $('.rating-stars').length ) {
		// hover
		$('.rating-stars.active .stars-list > li').hover(
		function(){
			var cur = $(this);
			var parent = cur.parents('.rating-stars');
			if (!parent.hasClass('blocked')) {
				cur.addClass('active').prevAll().addClass('active');
				cur.nextAll().removeClass('active');
			}
		},
		function(){
			var cur = $(this);
			var parent = cur.parents('.rating-stars');
			if (!parent.hasClass('blocked')) {
				parent.find('.stars-list > li').removeClass('active');
			}
		});
		
		// click
		$('.rating-stars.active .stars-list > li').on('click',function(){
			var cur = $(this);
			var cur_index = cur.index();
			var parent = cur.parents('.rating-stars');
			parent.addClass('blocked');
			cur.addClass('active').prevAll().addClass('active');
			cur.nextAll().removeClass('active');
			parent.find('input[type="hidden"]').val(cur_index+1);
			
		});
	}
}
/* starRating end */

/* voteUseful */
function voteUseful(){
	if ( $('.vote-useful').length ){
		// yes
		$('.vote-useful .js-vote-btn-yes').on('click',function(e){
			var cur = $(this);
			var parent = cur.parents('.vote-useful');
			if ( !parent.hasClass('blocked') ){
				parent.addClass('blocked');
				var cur_value_block = parent.find('.js-vote-count-yes');
				var cur_value = parseInt(cur_value_block.text())+1;
				cur_value_block.html(cur_value);
			}
			e.preventDefault();
		});
		
		// no
		$('.vote-useful .js-vote-btn-no').on('click',function(e){
			var cur = $(this);
			var parent = cur.parents('.vote-useful');
			if ( !parent.hasClass('blocked') ){
				parent.addClass('blocked');
				var cur_value_block = parent.find('.js-vote-count-no');
				var cur_value = parseInt(cur_value_block.text())+1;
				cur_value_block.html(cur_value);
			}
			e.preventDefault();
		});
	}
}
/* voteUseful end */

/* compareProducts */
function compareProducts(){
	if ( $('.block-compare').length ) {
		// js-compare-type
		$('.js-compare-type').on('click',function(){
			var cur = $(this);
			if ( cur.is(':checked') ){
				$('.compare-rows-list > li:not(.different)').hide();
			} else {
				$('.compare-rows-list > li:not(.different)').show();
			}
			compareEven();
			if ( !$('.mobile-res').is(':visible') ) {
				block_compare_right_scrollbar_jsp.destroy();
				$('.block-compare__right .scrollpane-horizontal')
				.jScrollPane({
					verticalDragMaxHeight:0,
					verticalDragMinHeight:0,
					horizontalDragMinWidth: 120,
					horizontalDragMaxWidth: 120,
					animateScroll:true,
					autoReinitialise: true
				});
				block_compare_right_scrollbar_jsp = $('.block-compare__right .scrollpane-horizontal').data('jsp');
			} else {
				block_compare_scrollbar_jsp.destroy();
				$('.block-compare > .scrollpane-horizontal')
				.jScrollPane({
					verticalDragMaxHeight:0,
					verticalDragMinHeight:0,
					horizontalDragMinWidth: 120,
					horizontalDragMaxWidth: 120,
					animateScroll:true,
					autoReinitialise: true
				});
				block_compare_scrollbar_jsp = $('.block-compare > .scrollpane-horizontal').data('jsp');
			}
		});
		
		// autoHeight
		var compares_length = $('.block-compare__left .compare-rows-list > li').length;
		for(var i=0;i<compares_length;i++){
			var max_li = 0;
			$('.compare-rows-list').each(function(){
				var cur_li = $(this).find('li:eq('+i+')');
				var cur_li_height = cur_li.innerHeight();
				if ( cur_li_height > max_li )
					max_li = cur_li_height;
			});
			$('.compare-rows-list').each(function(){
				$(this).find('li:eq('+i+')').css('height',max_li);;
			});
		};
		
		// even
		function compareEven(){
			$('.compare-rows-list').each(function(){
				$(this).find('li').removeClass('even');
				$(this).find('li:visible:odd').addClass('even');
			});
		}
		compareEven();
		
		// hover
		$('.compare-rows-list li').hover(
		function(){
			var cur = $(this);
			var cur_index = cur.index();
			$('.compare-rows-list').each(function(){
				$(this).find('li:eq('+cur_index+')').addClass('hovered');
			});
		},
		function(){
			$('.compare-rows-list li').removeClass('hovered');
		});
	}
}
/* compareProducts end */

/* scrollpanes */
var block_compare_right_scrollbar_jsp,block_compare_scrollbar_jsp;
function scrollpanes(){
	if ( !$('.mobile-res').is(':visible') ) {
		// INDEX
		// products-scrollbar
		if ( $('.products-scrollbar').length ) {
			$('.products-scrollbar .scrollpane-horizontal')
			.jScrollPane({
				verticalDragMaxHeight:0,
				verticalDragMinHeight:0,
				horizontalDragMinWidth: 120,
				horizontalDragMaxWidth: 120,
				animateScroll:true,
				autoReinitialise: true
			});
			var product_scrollbar_jsp = $('.products-scrollbar .scrollpane-horizontal').data('jsp');
			
			// left
			$('.products-scrollbar__controls-left').on('click',function(e){
				var cur_product = $('.products-scrollbar .product.current');
				if ( cur_product.prev().length ){
					var cur_product_prev = cur_product.prev();
					cur_product_prev.addClass('current').siblings('.current').removeClass('current');
					var cur_product_prev_left = cur_product_prev.position().left;
					product_scrollbar_jsp.scrollToX(cur_product_prev_left);
				}
				e.preventDefault();
			});
			
			// right
			$('.products-scrollbar__controls-right').on('click',function(e){
				var cur_product = $('.products-scrollbar .product.current');
				if ( cur_product.nextAll().length > 3 ){
					var cur_product_next = cur_product.next();
					cur_product_next.addClass('current').siblings('.current').removeClass('current');
					var cur_product_next_left = cur_product_next.position().left;
					product_scrollbar_jsp.scrollToX(cur_product_next_left);
				}
				e.preventDefault();
			});
		}
		
		// COMPARE
		// inner
		if ( $('.block-compare__right .scrollpane-horizontal').length ) {
			$('.block-compare__right .scrollpane-horizontal')
			.jScrollPane({
				verticalDragMaxHeight:0,
				verticalDragMinHeight:0,
				horizontalDragMinWidth: 120,
				horizontalDragMaxWidth: 120,
				animateScroll:true,
				autoReinitialise: true
			});
			block_compare_right_scrollbar_jsp = $('.block-compare__right .scrollpane-horizontal').data('jsp');
		}
	} else {
		// COMPARE
		// outer
		if ( $('.block-compare > .scrollpane-horizontal').length ){
			$('.block-compare > .scrollpane-horizontal')
			.jScrollPane({
				verticalDragMaxHeight:0,
				verticalDragMinHeight:0,
				horizontalDragMinWidth: 120,
				horizontalDragMaxWidth: 120,
				animateScroll:true,
				autoReinitialise: true
			});
			block_compare_scrollbar_jsp = $('.block-compare > .scrollpane-horizontal').data('jsp');
		}
	}
}
/* scrollpanes end */

/* headerFixed */
function headerFixed(){
	if ( $('.header-fixed').length ) {
		var topbar_h = $('.top-bar').innerHeight();
		var header_h = $('.header').innerHeight();
		if ( $(window).scrollTop() > (topbar_h+header_h) )
			$('.header-fixed').addClass('active');
		else
			$('.header-fixed').removeClass('active');
		
		// scroll
		$(window).scroll(function(){
			if ( $(window).scrollTop() > (topbar_h+header_h) )
				$('.header-fixed').addClass('active');
			else
				$('.header-fixed').removeClass('active');
		});
		
		// header-menu-link
		if ( $('.header-menu-link').length ) {
			$('.header-menu-link').on('click',function(e){
				var cur = $(this);
				if ( cur.hasClass('active') )
					cur.html('menu');
				else
					cur.html('close');
				cur.toggleClass('active');
				$('.header-fixed .nav').toggleClass('active');
				e.preventDefault();
			});
		}
	}
}
/* headerFixed end */

/* deviceFn */
function deviceFn(){
	if ( device.tablet() )
		$('meta[name="viewport"]').attr('content','width=1200');
}
/* deviceFn end */

/* mobileFn */
function mobileFn(){
	// HEADER
	// header-mobile-menu-link
	if ( $('.header-mobile-menu-link').length ) {
		$('.header-mobile-menu-link').on('click',function(e){
			var cur = $(this);
			var parent = cur.parents('.header-mobile');
			$('.header-mobile-menu:visible,.header-mobile-search:visible,.modal-callback:visible').fadeOut();
			if ( cur.hasClass('active') ){
				cur.removeClass('active');
				parent.find('.header-mobile-menu').fadeOut();
				cur.html('menu');
			} else {
				$('.header-mobile-menu-link,.header-mobile-search-link,.header-mobile-phone-link').removeClass('active');
				cur.addClass('active');
				parent.find('.header-mobile-menu').fadeIn();
				cur.html('close');
			}
			e.preventDefault();
		});
	}
	
	// header-mobile-search-link
	if ( $('.header-mobile-search-link').length ) {
		$('.header-mobile-search-link').on('click',function(e){
			var cur = $(this);
			var parent = cur.parents('.header-mobile');
			$('.header-mobile-menu:visible,.header-mobile-search:visible,.modal-callback:visible').fadeOut();
			if ( cur.hasClass('active') ){
				cur.removeClass('active');
				parent.find('.header-mobile-search').fadeOut();
			} else {
				$('.header-mobile-menu-link').html('menu');
				$('.header-mobile-menu-link,.header-mobile-search-link,.header-mobile-phone-link').removeClass('active');
				cur.addClass('active');
				parent.find('.header-mobile-search').fadeIn();
			}
			e.preventDefault();
		});
	}
	
	// header-mobile-phone-link
	if ( $('.header-mobile-phone-link').length ) {
		$('.header-mobile-phone-link').on('click',function(e){
			var cur = $(this);
			var parent = cur.parents('.header-mobile');
			$('.header-mobile-menu:visible,.header-mobile-search:visible,.modal-callback:visible').hide();
			$('.modal-callback').removeClass('modal-callback--bottom');
			if ( cur.hasClass('active') ){
				cur.removeClass('active');
				$('.modal-callback').fadeOut();
			} else {
				$('.header-mobile-menu-link,.header-mobile-search-link,.header-mobile-phone-link').removeClass('active');
				cur.addClass('active');
				if ( parent.hasClass('header-mobile--footer') )
					$('.modal-callback').addClass('modal-callback--bottom');
				$('.modal-callback').fadeIn();
			}
			
			e.preventDefault();
		});
	}
	
	// CATEGORY
	// sidebar
	if ( $('.sidebar').length && $('.mobile-res').is(':visible') ) {
		$('.sidebar').insertAfter($('.products__sort'));
		
		// toggle
		$('.side-filters__title').on('click',function(){
			var cur = $(this);
			var parent = cur.parents('.side-filters');
			if ( parent.hasClass('active') ){
				$('.side-filters__title i').html('filter_list');
			} else {
				$('.side-filters__title i').html('close');
			}
			$('.side-filters__content').fadeToggle();
			parent.toggleClass('active');
		});
	}
	
	// PRODUCT
	// product-full-actions
	if ( $('.product-full-actions').length && $('.mobile-res').is(':visible') ) {
		$('.product-full-actions').insertAfter($('.product-full-images'));
		$('.share-list').insertAfter($('.product-full-actions'));
	}
	
	// COMPARE
	if ( $('.block-compare__left-top .switch').length && $('.mobile-res').is(':visible') ) {
		$('.block-compare__left-top .switch').appendTo($('.block-compare'));
	}
}
/* mobileFn end */

/* printFn */
function printFn(){
	if ( $('.js-print-link').length ) {
		$('.js-print-link').on('click',function(e){
			var disp_setting="toolbar=yes,location=no,directories=yes,menubar=yes,";
			disp_setting+="scrollbars=yes,width=650, height=600, left=100, top=25";
			var docprint=window.open("","",disp_setting);
			var product_title = $('.product-full-top h1').html();
			var product_image = $('.product-full-images__right li:first-child img').attr('src');
			var product_price = $('.product__price.product__price--large').html();
			var product_characteristics = $('.product-full__characteristics').html();
			var product_availability = $('.product-availability').html();
			var product_index = $('.product-full-index span').html();
			var product_phones = $('.product-full-actions__phones').html();
			
			docprint.document.open();
			docprint.document.write('<html><head><title>'+document.title+'</title>');
			// head
			docprint.document.write('<meta charset="utf-8">\
				<meta name="keywords" content="">\
				<meta name="description" content="">\
				<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">\
				<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="all"/>\
				<link type="text/css" rel="stylesheet" href="css/main.css"  media="all"/>\
				<link type="text/css" rel="stylesheet" href="css/print.css"  media="all"/></head><body>');
				
			// body
			docprint.document.write('<div class="product-print">\
				<div class="product-print__title">\
					<h1>'+product_title+'</h1>\
				</div>\
				<div class="product-print__meta">\
					<div class="product-print__meta-left">\
						<div class="product-full-actions__prices-title">Цена:</div>\
						<div class="product__price product__price--large">'+product_price+'</div>\
					</div>\
					<div class="product-print__meta-right">\
						<div class="product-availability">'+product_availability+'</div>\
						<div class="product-full-index"><span>'+product_index+'</span></div>\
					</div>\
				</div>\
				<div class="product-print__image">\
					<img src="'+product_image+'" alt="" />\
				</div>\
				<div class="product-print__content">\
					<div class="product-full-main">\
						<div class="product-full-main__top">\
							<ul class="tabs">\
								<li class="tab"><a class="active" href="#product-full-tab1">Характеристики</a></li>\
							</ul>\
						</div>\
						<div class="product-full-main__content">\
							<div class="product-full__characteristics" id="product-full-tab1">'+product_characteristics+'</div>\
						</div>\
					</div>\
				</div>\
				<div class="product-full-actions__phones">'+product_phones+'</div>\
			</div>');
			
			// end
			docprint.document.write('</body></html>');
			docprint.document.close();
			docprint.focus();
			e.preventDefault();
		});
	}
}
/* printFn end */

// ready
$(document).ready(function(){
	deviceFn();
	validator();
	phoneMask();
	yandexMap();
	googleMap();
	sliderRange();
	spinnerFn();
	cartTotal();
	removeTableRow();
	sideReset();
	itemsViews();
	countdownTimer();
	sliders();
	starRating();
	voteUseful();
	tooltips();
	compareProducts();
	headerFixed();
	mobileFn();
	
	// print
	printFn();
	
	// MATERIALIZE PLUGINS
	// Select
	$('select').material_select();
	
	// modal
	$('.modal-trigger').leanModal();
	$('.js-modal-close').on('click',function(e){
		$('.modal:visible').closeModal();
		e.preventDefault();
	});
	
	// js-textarea-autoresize
	$('.js-textarea-autoresize').trigger('autoresize');
	
	// remove active prefix
	setTimeout(function(){
		$('input[placeholder]').prev('.prefix').removeClass('active');
	},0);
	
	// dropdown
	$('.dropdown-button').dropdown({
		constrain_width: false,
		gutter: 0,
		belowOrigin: true
	});

	// Material Fancy
	//$('.materialboxed').materialbox();
});
$(window).load(function(){
	scrollpanes();
});

