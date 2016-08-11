var application_context = '.quick-order-pro';
var product_context = '#product';

$(document).ready(function() {
	
	checkRequired();
	
	$("textarea, input, select", product_context).change(function(){
		
		var data = $(product_context + ' input[name][type=\'text\'], ' + product_context + ' input[name][type=\'hidden\'], ' + product_context + ' input[name][type=\'radio\']:checked, ' + product_context + ' input[name][type=\'checkbox\']:checked, ' + product_context + ' select, ' + product_context + ' textarea');
		
		data = jQuery.param(data);
		
		$(application_context).each(function(i, form){
			
			if ($('.total', form).length == 0) {
				return;
			}
			
			var form_data = data + '&' + jQuery.param($('.row.button input', form));
			
			ajax.send({
				data: form_data,
				a: 'p',
				success: function(json) {
					
					if (json['status'] == 'ok') {
						
						var show_option = $('.product-info-block .options', form).length;
						var show_total = $('.total', form).length;
				
						if (json.hasOwnProperty('total') && show_total) { // show total
							$('.total b', form).html(json['total']);
						}
						
						if ($(form).hasClass('sidebar')) {
							var quantity = json['quantity'];
						} else {
							var quantity = json['quantity'] + ' шт.';
						}
						
						$('.product-info-block .quantity', form).html(quantity);
						
						var html = '';
									
						if (json['options'] && show_option) {
							
							for (var option in json['options']) {
								html += '<li>- <small>' + json['options'][option]['name'] + ': ' + json['options'][option]['value'] + '</small></li>';
							}
							
						}
						
						$('.product-info-block .options', form).html(html);
					}
				}
			});
			
			
		});
		
	});
	
	useMask(application_context);
	
	$('.captcha-wrapper a.captcha', application_context).click(function(event){
		
		event.preventDefault();
		
		var self = this;
		var context = $(self).closest(application_context);
		var form_id = $('input:hidden[name=form_id]', context).val();
		
		if (form_id) {
			
			$.ajax({
				url: "index.php?route=module/quick_order_pro/captcha&a=reload&key=" + form_id,
				dataType: 'json',
				cache: false,
				success: function(data) {
					$(self).prev('img').attr('src', decodeURI(data['url']));
				}
				
			});
			
		} else {
			alert('Неизвестный идентификатор формы!');
		}
		
	});
	
	$('button.disabled', application_context).on('click', function(event) {
		
		var button = $(this).parent();
		var form = $(this).closest(application_context);
		
		var errors = getErrorElements(form);
		
		if (errors.length) {
			
			$(errors[0][0]).focus();
			
			$('.button .error', form).remove();
			$('.button', form).append('<span class="error">' + getErrorEmptyFieldsMessage(errors.length) + '</span>');
		}
		
	});
	
	$('body').on('click', application_context + ' a.js.req', function(event){
		
		var block = $(this).closest(application_context);
		var errors = getErrorElements(block);
		
		console.log(errors);
		
		if (errors.length) {
			$(errors[0][0]).focus();
		}
		
	});
	
	$('form', application_context).submit(function(event) {
		
		event.preventDefault();
		
		var context = $(this).closest(application_context);
		
		if ($(this).data('disabled') === true || $('.button button', context).hasClass('disabled')) return;
		
		var form_info = $('input[name][type=\'text\'], input[name][type=\'password\'], input[name][type=\'hidden\'], input[name][type=\'radio\']:checked, input[name][type=\'checkbox\']:checked, textarea, select', context);
		var product_info = $('input[name][type=\'text\'], input[name][type=\'hidden\'], input[name][type=\'radio\']:checked, input[name][type=\'checkbox\']:checked, select, textarea', product_context);
		
		var data = jQuery.param(form_info) + '&' + jQuery.param(product_info, true);
		
		var button = $('form', context).find('button:submit');
		
		ajax.send({
			data: data,
			a: 'o',
			beforeSend: function() {
				
				clearNotification()
				
				$('.error, .error-bubble, .text-danger', context).remove();
				$('.notification', context).empty();
				$('input, textarea', context).removeClass('error-item');
				$('.form-group', context).removeClass('has-error');
				
				if ($(button).data('origin') == undefined) {
					$(button).data('origin', $(button).text());
				}
				
				$('form', context).data('disabled', true);
				$(button).addClass('disabled').find('span').text($(button).data('process'));
			},
			complete: function() {
				$('form', context).data('disabled', false);
				$(button).removeClass('disabled').find('span').text($(button).data('origin'));
			},
			success: function(json) {

				if (json['status'] == 'ok') {
					
					if (json['redirect']) {
						location = json['redirect'];
					}
					
					if (json['success']) {
						clearForm($('form', context));
						showMessage('success', json['success'], context);
					}
					
				} else if (json['status'] == 'error') {


					
					if (json['error']['warning']) {
						showMessage('warning', json['error']['warning'], context);
					}
					
					if (json['error']['system']) {
						showMessage('warning', json['error']['system'], context);
					}
					
					if (json['error'].hasOwnProperty('fields')) {
					
						$('.error', context).remove();
					
						for (i in json['error']['fields']) {
							
							var field = $('*[id^=field-edit-' + i + ']', context);
							
							if ($(field).length) {
								$(field).after(json['error']['fields'][i]);
								$(field).closest('.form-group').addClass('has-error');
							}
						}
					}
				}
			}
		});
		
	});
	
	$(application_context + ' input, ' + application_context + ' select, ' + application_context + ' textarea').on('keyup blur change', function(event){
		
		event = event || window.event;
		
		var self = this;
		var context = $(self).closest(application_context);
		
		if (event.type == 'change' && $(self).attr('name').indexOf('field_country') != -1 && $('select[name*=zone]', context).length) {
			
			console.log(event);
			
			var country_id = $(self).val();
			
			var html = '<option value=""> --- Не выбрано --- </option>';
			
			if (country_id != '') {
				
				var button = $('form', context).find('button:submit');
			
				ajax.send({
					a: 'z',
					async: false,
					data: {
						'country_id': country_id
					},
					beforeSend: function() {
						
						if ($(button).data('origin') == undefined) {
							$(button).data('origin', $(button).text());
						}
						
						$('form', context).data('disabled', true);
						$(button).addClass('disabled').find('span').text($(button).data('process'));
						
					},
					complete: function() {
						$('form', context).data('disabled', false);
						$(button).removeClass('disabled').find('span').text($(button).data('origin'));
					},	
					success: function(json) {
						
						if (json['zone']) {
							
							for (var i = 0; i < json['zone'].length; i++) {
								html += '<option value="' + json['zone'][i]['zone_id'] + '">' + json['zone'][i]['name'] + '</option>';
							}
							
						}
						
						$('select[name*=zone]', context).html(html);
						
					}
				});
				
			} else {
				$('select[name*=zone]', context).html(html);
			}
		}
		
		checkRequired(context);
	});
	
});

function getErrorEmptyFieldsMessage(count) {
	return 'Осталось <a href="javascript:void(0);" class="js req">заполнить</a> <span class="count-errors">' + declination(count, ['поле', 'поля', 'полей']) + '</span>.';
}

function declination(number, titles) {  
	var cases = [2, 0, 1, 1, 1, 2];
	return number + " " + titles[(number%100 > 4 && number %100 < 20) ? 2 : cases[Math.min(number%10, 5)]];  
}

function checkRequired(context) {
	
	if (!context) {
		context = application_context;
	}
	
	var errors = getErrorElements(context);
	
	var error_message = $('div.button .error', context);
	
	if (errors.length) {
		
		$('.count-errors', error_message).html(declination(errors.length, ['поле', 'поля', 'полей']));
		
		$('button:submit[name=send]', context).addClass('disabled');
		
	} else {
		$(error_message).remove();
		$('button:submit[name=send]', context).removeClass('disabled');
	}
	
}

function getErrorElements(context) {
	
	var error = [];
	
	$('.rows .form-group', context).each(function(){
		
		if ($(this).hasClass('required')) {
			
			var list = ['input:text', 'textarea', 'input:password', 'select', 'input:radio', 'input:checkbox'];
				
			for (var i in list) {
				
				var type = list[i];
				
				if (!$(type, this).length) continue;
				
				var item = $(list[i], this);
				
				if (type == 'input:text') {
					
					if ($(item).val() != '') {
				
						if ($().mask && $(item).data('mask') != '') {
							
							if ($(item).data('buffer') == $(item).val()) {
								error.push(item);
							}
							
						}
						
					
					} else {
						error.push(item);
					}
					
				} else if ((type == 'input:radio' || type == 'input:checkbox') && !$(item).is(':checked')) {
					error.push(item);
				} else if ($(item).val() == '') {
					error.push(item);
				} else {
					$('.text-danger', this).remove();
				}
				
			}
			
		}
	});
	
	return error;
}

/**
 * clear form after submit
 */
function clearForm(context) {
	
	if ($(context).length) {
		
		$('input:text, textarea, select', context).each(function(){
			
			if ($(this).is('select')) {
				
				$('option:selected', this).each(function(){
					this.selected=false;
				})
				
			} else if ($(this).is('input:radio') || $(this).is('input:checkbox')) {
				$(this).attr('checked','').removeAttr('checked');
			} else {
				$(this).val('');
			}
			
		});
		
	}
	
}

/**
 * clear main message 
 */
function clearNotification() {
	$('.success, .warning, .attention, .information').remove();
}

function useMask(context) {

	if($().mask) {
		
		$('input[type="text"][data-mask]', context).each(function(){
			$(this).mask($(this).attr('data-mask'));
		})
			
	}
	
}

/**
 * show main message: success, notocation, warning...
 */
function showMessage(type, message, context) {
	
	if (!type) {
		type = 'success';
	}
	
	$('.alert').remove();
	
	if ($('.breadcrumb').length) {
		$('.breadcrumb').after('<div class="alert alert-' + type + '">' + message + '<button type="button" class="close" data-dismiss="alert">×</button></div>');
		$('html, body').animate({ scrollTop: 0 }, 'slow');
	} else if (context && $('.notification', context).length) {
		$('.notification', context).html('<div class="alert alert-' + type + '">' + message + '<button type="button" class="close" data-dismiss="alert">×</button></div>');
	} else {
		alert(message);
	}
	
}

var ajax = {
	disabled: null,
	clear: function() {
		this.disabled = null;
	},
	send: function (data) {
		
		var defaults = {
			url: 'index.php?route=module/quick_order_pro/ajax',
			type: 'POST',
			async: true,
			dataType: 'json',
			processData: true,
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				showMessage('warning', textStatus);
			}
		}
		
		var options = $.extend(defaults, data);
		
		if (!options.hasOwnProperty('a')) {
			return;
		}
		
		if (!options.hasOwnProperty('data')) {
			return;
		}
		
		// Convert data if not already a string 
		if (options.processData && typeof options.data !== "string") {

			if (typeof options.processData === "function") {
				options.data = options.processData(options.data);
			} else {
				options.data = jQuery.param(options.data);
			}

		}
		 
		options.data += '&a=' + options.a;
		
		options.success = function (response) {
			
			if (data.hasOwnProperty('success') && typeof data.success === 'function') {
				data.success(response);
			}
			
		}
		
		return $.ajax(options).responseText;
	}
}