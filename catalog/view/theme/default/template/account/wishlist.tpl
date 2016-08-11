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

				<div class="content-top__bottom">
				    <h1 class="left">Список желаний</h1>
					<div class="content-top__right-icon right"><i class="material-icons">compare_arrows</i></div>
				</div>
			</div>
			<!-- content-top end -->

				<!-- block-search -->
				<div class="section block-search">

					<!-- products -->
					<div class="products">
						<!-- products__sort -->
						<div class="products__sort">
							<div class="row">
								<div class="col s12 m3">
									<div class="items-view"> <span>Вид:</span>
										<ul class="items-view-list">
											<li class="active"><a href="#"><i class="material-icons">view_module</i></a></li>
											<li><a href="#" class="js-view-tile2"><span class="icon-tile-gray"></span></a></li>
											<li><a href="#" class="js-view-lines"><i class="material-icons">view_list</i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- products__sort end -->

						<!-- products-list -->
						<ul class="products-list js-products-viewed">
                            <?php foreach ($products as $product) { ?>
                                <?php require DIR_TEMPLATE . 'default/template/product/block_product_wishlist.tpl'; ?>
                            <?php } ?>
						</ul>
					    <!-- products-list end -->
					</div>
					<!-- products end -->

				</div>
				<!-- block-search end -->

		</div>
		<!-- container end -->
	</main>
	<!-- MAIN CONTENT [END] -->

<?php echo $footer; ?>
