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
				    <i class="material-icons">new_releases</i>
                </div>
			</div>
			<!-- content-top end -->

				<!-- block-sale-full -->
				<div class="section block-sale-full">
					<article>
						<h1><?php echo $heading_title; ?></h1>
						<?php echo $description; ?>
					</article>
				</div>
				<!-- block-sale-full end -->

				<!-- block-timer -->
				<div class="section block-timer">
					<div class="block-timer__title">Спешите, времени осталось совсем немного:</div>
					<div class="js-clock" data-time="220880"></div>
				</div>
				<!-- block-timer end -->

				<!-- related-products -->
				<div class="section related-products">
					<div class="block-title">
						<h2 class="left">Товары, участвующие в акции</h2>
						<div class="block-title__right right"> <a><i class="material-icons">hotel</i></a> </div>
					</div>
					<!-- products-list -->
					<ul class="products-list js-related-products-slider">
                        <?php foreach ($products as $product) { ?>
                            <?php require DIR_TEMPLATE . 'default/template/product/block_product.tpl'; ?>
                        <?php } ?>
					</ul>
					<!-- products-list end -->
				</div>
				<!-- related-products end -->


		</div>
		<!-- container end -->
	</main>
	<!-- MAIN CONTENT [END] -->

<?php echo $footer; ?>
