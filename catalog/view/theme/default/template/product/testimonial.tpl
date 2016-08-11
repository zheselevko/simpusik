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

$('#testimonial').load('/index.php?route=product/testimonial/testimonial');

//--></script>

<?php echo $footer; ?>
