<?php echo $header; ?>

	<!-- content -->
	<main>
		<!-- container -->
		<div class="container">
			<!-- content-top -->
			<div class="section content-top">
				<!-- breadcrumbs -->
                <?php require_once DIR_TEMPLATE . 'default/template/common/breadcrumbs.tpl'; ?>
				<!-- breadcrumbs end -->

				<div class="content-top__right-icon right">
					<i class="material-icons">chat</i>
				</div>
			</div>
			<!-- content-top end -->

			<!-- block-reviews -->
			<div class="section block-reviews">
				<div class="block-reviews-title">
					<h1 class="left">Отзывы покупателей</h1>
					<a href="#modal-testimonial" class="waves-effect waves-light btn-large btn-orange modal-trigger right">Оставить отзыв</a>
				</div>

	            <div id="testimonial"></div>


			</div>
			<!-- block-reviews end -->

		</div>
		<!-- container end -->
	</main>
	<!-- MAIN CONTENT [END] -->




<script type="text/javascript"><!--
$('#testimonial').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#testimonial').fadeOut('slow');

    $('#testimonial').load(this.href);

    $('#testimonial').fadeIn('slow');
});

$('#testimonial').load(location.protocol + "//" + location.host + '/index.php?route=product/testimonial/testimonial');

/*
$('#button-testimonial').on('click', function() {

    cosole.log($("#form-testimonial").serialize());

	$.ajax({
		url: 'index.php?route=product/testimonial/write',
		type: 'post',
		dataType: 'json',
		data: $("#form-testimonial").serialize(),
		beforeSend: function() {
			$('#button-testimonial').button('loading');
		},
		complete: function() {
			$('#button-testimonial').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#testimonial').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
			    $('#testimonial').fadeOut('slow');

				$('#testimonial').load(this.href);

				$('#testimonial').fadeIn('slow');

				$('#testimonial').load('index.php?route=product/testimonial/testimonial');

				$('#testimonial').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				<?php if ($title > 0) { ?>
				$('input[name=\'title\']').val('');
				<?php } ?>
				<?php if ($city > 0) { ?>
				$('input[name=\'city\']').val('');
				<?php } ?>
				<?php if ($name > 0) { ?>
				$('input[name=\'name\']').val('');
				<?php } ?>
				<?php if ($email > 0) { ?>
				$('input[name=\'email\']').val('');
				<?php } ?>
				<?php if ($text) { ?>
				$('textarea[name=\'text\']').val('');
				<?php } ?>
				<?php if ($good) { ?>
				$('textarea[name=\'good\']').val('');
				<?php } ?>
				<?php if ($bad) { ?>
				$('textarea[name=\'bad\']').val('');
				<?php } ?>
			}
		}
	});
});
*/
//--></script>

<?php echo $footer; ?>
