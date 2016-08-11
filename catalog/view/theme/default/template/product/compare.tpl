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
				    <h1 class="left">Сравнение товаров</h1>
					<div class="content-top__right-icon right"><i class="material-icons">compare_arrows</i></div>
				</div>
            </div>
			<!-- content-top end -->

				<!-- block-compare -->
				<div class="section block-compare">
					<!-- scrollpane-horizontal -->
					<div class="scrollpane-horizontal">
						<!-- block-compare__left -->
						<div class="block-compare__left">
							<!-- block-compare__left-top -->
							<div class="block-compare__left-top">
								<div class="switch"> <label>
							<input type="checkbox" class="js-compare-type">
							<span class="lever"></span>
							Показывать только отличия
							</label> </div>
							</div>
							<!-- block-compare__left-top end -->
							<!-- compare-rows -->
							<div class="compare-rows">
								<ul class="compare-rows-list">
                                    <?php foreach ($attributes as $attribute) { ?>
                                        <li class="<?php echo $attribute['different']; ?>"><?php echo $attribute['name']; ?></li>
                                    <?php } ?>
								</ul>
							</div>
							<!-- compare-rows end -->
						</div>
						<!-- block-compare__left end -->
						<!-- block-compare__right -->
						<div class="block-compare__right">
							<!-- scrollpane-horizontal -->
							<div class="scrollpane-horizontal">
								<!-- products-list -->
        						<ul class="products-list js-products-viewed">
                                    <?php foreach ($products as $product) { ?>
                                        <?php require DIR_TEMPLATE . 'default/template/product/block_product_compare.tpl'; ?>
                                    <?php } ?>
						        </ul>
								<!-- products-list end -->
							</div>
							<!-- scrollpane-horizontal -->
						</div>
						<!-- block-compare__right end -->
					</div>
					<!-- scrollpane-horizontal -->
				</div>
				<!-- block-compare end -->

		</div>
		<!-- container end -->
	</main>
	<!-- MAIN CONTENT [END] -->

<?php echo $footer; ?>
