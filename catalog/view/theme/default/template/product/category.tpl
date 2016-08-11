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
			</div>
			<!-- content-top end -->

				<!-- block-category -->
				<div class="section block-category">
					<!-- products__title -->
					<div class="products__title">
						<div class="row">
							<div class="col s12 m3">&nbsp;</div>
							<div class="col s12 m9"><h1><?php echo $seo_h1; ?></h1></div>
						</div>
						<div class="products__title-icon icon-products-gray"></div>
					</div>
					<!-- products__title end -->

					<!-- page-layout -->
					<div class="page-layout">
						<div class="row">
							<div class="col s12 m3 m24-3">
								<!-- sidebar -->
								<aside class="sidebar">
                                    <?php echo $column_left; ?>
								</aside>
								<!-- sidebar end -->
							</div>
							<div class="col s12 m9 m75-7">
								<!-- products -->
								<div class="products products--spec">

									<!-- products-list -->
									<ul class="products-list js-spec-products-slider" itemscope itemtype="http://schema.org/ItemList">
                                        <?php foreach ($products_hit as $product) { ?>
                                            <?php require DIR_TEMPLATE . 'default/template/product/block_product_hit.tpl'; ?>
                                        <?php } ?>
									</ul>
									<!-- products-list end -->
								</div>
								<!-- products end -->

								<!-- products -->
								<div class="products">
									<!-- products__title -->
									<div class="products__title">
										<h2><?php echo $seo_h2; ?></h2>
										<div class="products__title-icon icon-products-gray mobile-hidden"></div>
									</div>
									<!-- products__title end -->

									<!-- products__sort -->
                                    <?php require DIR_TEMPLATE . 'default/template/product/products_sort.tpl'; ?>
									<!-- products__sort end -->


									<!-- products-list -->
                                    <div id="res-products">
									<ul class="products-list js-products-viewed" itemscope itemtype="http://schema.org/ItemList">
                                        <?php foreach ($products as $product) { ?>
                                            <?php require DIR_TEMPLATE . 'default/template/product/block_product.tpl'; ?>
                                        <?php } ?>
									</ul>
									<!-- products-list end -->
                                    </div>
								</div>
								<!-- products end -->

                                <?php echo $pagination; ?>

                    			<div class="section block-news-single">
                    				<article class="news-single">
                                        <?php echo $description; ?>
                    				</article>
                    			</div>

							</div>
						</div>
					</div>
					<!-- page-layout -->
				</div>
				<!-- block-category end -->

		</div>
		<!-- container end -->
	</main>
	<!-- MAIN CONTENT [END] -->

<?php echo $footer; ?>


