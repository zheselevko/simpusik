/* modal-quick-order */
$('.button-modal-quick-order').on('click', function() {

    var product_id = $(this).attr('data-product');
    console.log(product_id);

    $.ajax({
        url: 'index.php?route=product/product/quick_order&product_id=' + product_id,
        dataType: 'html',
        success: function(html) {

            $('#modal-quick-order').replaceWith(html);

            $('.modal:visible').closeModal();
            $('body').showModal({'modal_id':'#modal-quick-order'});
	        spinnerFn();
            validator();

            /*
            if (json['error']) {
                $('#modal-message-text').html(json['error']);
                $('body').showModal({'modal_id':'#modal-message'});
            }

            if (json['success']) {
                $('.modal:visible').closeModal();

                $('#modal-message-text').html(json['success']);
                $('body').showModal({'modal_id':'#modal-message'});

                $('#modal-message').fadeIn();
            }
            */
        }
    });

    return false;


});
/* modal-quick-order */


/* send callback */
$('#button-callback__').on('click', function() {
	$.ajax({
		url: location.protocol + "//" + location.host + '/index.php?route=module/feedback/send',
		type: 'post',
		dataType: 'json',
		data: $("#form-callback").serialize(),
		beforeSend: function() {
		},
		complete: function() {
		},
		success: function(json) {
            console.log(json);

			if (json['error']) {
                //$('#modal-message').html(json['error']);
                //$('#modal-message').fadeIn();
			}

			if (json['success']) {
    		    $('.modal:visible').closeModal();

                $('#modal-message-text').html(json['success']);
                $('body').showModal({'modal_id':'#modal-message'});

                //$('#modal-message').fadeIn();
			}
		}
	});
});

function show_msg() {

}