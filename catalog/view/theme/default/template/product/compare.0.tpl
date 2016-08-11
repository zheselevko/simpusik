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

  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>

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
									<li>Коллекция</li>
									<li class="different">Материал</li>
									<li>Пододеяльник</li>
									<li class="different">Простыня</li>
									<li>Наволочка</li>
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



									<li>
										<div class="card product">
											<div class="compare-product">
												<div class="product__top">
													<a href="#" class="card-image product__image"> <img class="responsive-img" src="pic/products/product-01.jpg" alt="" /> </a>
												</div>
												<div class="card-content product__content">
													<h2 class="product__title truncate"><a href="#">Постельное белье cs557-3</a></h2>
													<div class="product__content-top">
														<ul class="stars-list">
															<li class="active"><i class="material-icons">star_rate</i></li>
															<li class="active"><i class="material-icons">star_rate</i></li>
															<li class="active"><i class="material-icons">star_rate</i></li>
															<li class="active"><i class="material-icons">star_rate</i></li>
															<li><i class="material-icons">star_rate</i></li>
														</ul> <a href="#" class="reviews-link">Отзывов 5</a> </div>
													<div class="product__content-bottom">
														<div class="input-field"> <input class="spinner" name="product_count1" value="1" /> </div>
														<div class="product__prices">
															<div class="product__prices-inner">
																<div class="product__price product__price--new">5,999 <span class="ruble">o</span></div>
																<div class="product__price product__price--old">6,200 <span class="ruble">o</span></div>
															</div>
														</div>
													</div>
												</div>
												<div class="card-action product__buttons">
													<div class="product__buttons-left"> <a href="#modal-added-tocart" class="btn-floating waves-effect waves-light btn-large btn-orange modal-trigger"><i class="material-icons">add_shopping_cart</i></a> </div>
													<div class="product__buttons-right"> <a href="#modal-quick-order" class="waves-effect waves-light btn-large bold btn-blue modal-trigger">Быстрый заказ</a> </div>
												</div>
											</div>
											<div class="compare-rows">
												<ul class="compare-rows-list">
													<li>
														<div class="inner">“Paradise”</div>
													</li>
													<li class="different">
														<div class="inner">Сатин</div>
													</li>
													<li>
														<div class="inner">175 х 215</div>
													</li>
													<li class="different">
														<div class="inner">220 х 240</div>
													</li>
													<li>
														<div class="inner">
															<div>70 х 70 (2 шт.)</div>
															<div>50 х 70 (2 шт.)</div>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</li>
									<li>
										<div class="card product">
											<div class="compare-product">
												<div class="product__top">
													<a href="#" class="card-image product__image"> <img class="responsive-img" src="pic/products/product-02.jpg" alt="" /> </a>
												</div>
												<div class="card-content product__content">
													<h2 class="product__title truncate"><a href="#">Постельное белье cs662-1-70</a></h2>
													<div class="product__content-top">
														<ul class="stars-list">
															<li class="active"><i class="material-icons">star_rate</i></li>
															<li class="active"><i class="material-icons">star_rate</i></li>
															<li class="active"><i class="material-icons">star_rate</i></li>
															<li class="active"><i class="material-icons">star_rate</i></li>
															<li><i class="material-icons">star_rate</i></li>
														</ul> <a href="#" class="reviews-link">Отзывов 10</a> </div>
													<div class="product__content-bottom">
														<div class="input-field"> <input class="spinner" name="product_count1" value="1" /> </div>
														<div class="product__prices">
															<div class="product__prices-inner">
																<div class="product__price product__price--new">5,999 <span class="ruble">o</span></div>
																<div class="product__price product__price--old">6,200 <span class="ruble">o</span></div>
															</div>
														</div>
													</div>
												</div>
												<div class="card-action product__buttons">
													<div class="product__buttons-left"> <a href="#modal-added-tocart" class="btn-floating waves-effect waves-light btn-large btn-orange modal-trigger"><i class="material-icons">add_shopping_cart</i></a> </div>
													<div class="product__buttons-right"> <a href="#modal-quick-order" class="waves-effect waves-light btn-large bold btn-blue modal-trigger">Быстрый заказ</a> </div>
												</div>
											</div>
											<div class="compare-rows">
												<ul class="compare-rows-list">
													<li>
														<div class="inner">“Paradise”</div>
													</li>
													<li class="different">
														<div class="inner">Сатин</div>
													</li>
													<li>
														<div class="inner">175 х 215</div>
													</li>
													<li class="different">
														<div class="inner">220 х 240
															<div>220 х 240</div>
														</div>
													</li>
													<li>
														<div class="inner">
															<div>70 х 70 (2 шт.)</div>
															<div>50 х 70 (2 шт.)</div>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</li>
									<li>
										<div class="card product">
											<div class="compare-product">
												<div class="product__top">
													<a href="#" class="card-image product__image"> <img class="responsive-img" src="pic/products/product-03.jpg" alt="" /> </a>
												</div>
												<div class="card-content product__content">
													<h2 class="product__title truncate"><a href="#">Постельное белье cs648-34</a></h2>
													<div class="product__content-top">
														<ul class="stars-list">
															<li class="active"><i class="material-icons">star_rate</i></li>
															<li class="active"><i class="material-icons">star_rate</i></li>
															<li class="active"><i class="material-icons">star_rate</i></li>
															<li class="active"><i class="material-icons">star_rate</i></li>
															<li><i class="material-icons">star_rate</i></li>
														</ul> <a href="#" class="reviews-link">Отзывов 7</a> </div>
													<div class="product__content-bottom">
														<div class="input-field"> <input class="spinner" name="product_count1" value="1" /> </div>
														<div class="product__prices">
															<div class="product__prices-inner">
																<div class="product__price product__price--new">5,999 <span class="ruble">o</span></div>
																<div class="product__price product__price--old">6,200 <span class="ruble">o</span></div>
															</div>
														</div>
													</div>
												</div>
												<div class="card-action product__buttons">
													<div class="product__buttons-left"> <a href="#modal-added-tocart" class="btn-floating waves-effect waves-light btn-large btn-orange modal-trigger"><i class="material-icons">add_shopping_cart</i></a> </div>
													<div class="product__buttons-right"> <a href="#modal-quick-order" class="waves-effect waves-light btn-large bold btn-blue modal-trigger">Быстрый заказ</a> </div>
												</div>
											</div>
											<div class="compare-rows">
												<ul class="compare-rows-list">
													<li>
														<div class="inner">“Paradise”</div>
													</li>
													<li class="different">
														<div class="inner">Сатин</div>
													</li>
													<li>
														<div class="inner">175 х 215</div>
													</li>
													<li class="different">
														<div class="inner">220 х 240</div>
													</li>
													<li>
														<div class="inner">
															<div>70 х 70 (2 шт.)</div>
															<div>50 х 70 (2 шт.)</div>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</li>
									<li>
										<div class="card product">
											<div class="compare-product">
												<div class="product__top">
													<a href="#" class="card-image product__image"> <img class="responsive-img" src="pic/products/product-01.jpg" alt="" /> </a>
												</div>
												<div class="card-content product__content">
													<h2 class="product__title truncate"><a href="#">Постельное белье cs557-3</a></h2>
													<div class="product__content-top">
														<ul class="stars-list">
															<li class="active"><i class="material-icons">star_rate</i></li>
															<li class="active"><i class="material-icons">star_rate</i></li>
															<li class="active"><i class="material-icons">star_rate</i></li>
															<li class="active"><i class="material-icons">star_rate</i></li>
															<li><i class="material-icons">star_rate</i></li>
														</ul> <a href="#" class="reviews-link">Отзывов 5</a> </div>
													<div class="product__content-bottom">
														<div class="input-field"> <input class="spinner" name="product_count1" value="1" /> </div>
														<div class="product__prices">
															<div class="product__prices-inner">
																<div class="product__price product__price--new">5,999 <span class="ruble">o</span></div>
																<div class="product__price product__price--old">6,200 <span class="ruble">o</span></div>
															</div>
														</div>
													</div>
												</div>
												<div class="card-action product__buttons">
													<div class="product__buttons-left"> <a href="#modal-added-tocart" class="btn-floating waves-effect waves-light btn-large btn-orange modal-trigger"><i class="material-icons">add_shopping_cart</i></a> </div>
													<div class="product__buttons-right"> <a href="#modal-quick-order" class="waves-effect waves-light btn-large bold btn-blue modal-trigger">Быстрый заказ</a> </div>
												</div>
											</div>
											<div class="compare-rows">
												<ul class="compare-rows-list">
													<li>
														<div class="inner">“Paradise”</div>
													</li>
													<li class="different">
														<div class="inner">Сатин</div>
													</li>
													<li>
														<div class="inner">175 х 215</div>
													</li>
													<li class="different">
														<div class="inner">220 х 240</div>
													</li>
													<li>
														<div class="inner">
															<div>70 х 70 (2 шт.)</div>
															<div>50 х 70 (2 шт.)</div>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</li>
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

<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php if ($products) { ?>
      <table class="table table-bordered">
        <thead>
          <tr>
            <td colspan="<?php echo count($products) + 1; ?>"><strong><?php echo $text_product; ?></strong></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><?php echo $text_name; ?></td>
            <?php foreach ($products as $product) { ?>
            <td><a href="<?php echo $products[$product['product_id']]['href']; ?>"><strong><?php echo $products[$product['product_id']]['name']; ?></strong></a></td>
            <?php } ?>
          </tr>
          <tr>
            <td><?php echo $text_image; ?></td>
            <?php foreach ($products as $product) { ?>
            <td class="text-center"><?php if ($products[$product['product_id']]['thumb']) { ?>
              <img src="<?php echo $products[$product['product_id']]['thumb']; ?>" alt="<?php echo $products[$product['product_id']]['name']; ?>" title="<?php echo $products[$product['product_id']]['name']; ?>" class="img-thumbnail" />
              <?php } ?></td>
            <?php } ?>
          </tr>
          <tr>
            <td><?php echo $text_price; ?></td>
            <?php foreach ($products as $product) { ?>
            <td><?php if ($products[$product['product_id']]['price']) { ?>
              <?php if (!$products[$product['product_id']]['special']) { ?>
              <?php echo $products[$product['product_id']]['price']; ?>
              <?php } else { ?>
              <strike><?php echo $products[$product['product_id']]['price']; ?></strike> <?php echo $products[$product['product_id']]['special']; ?>
              <?php } ?>
              <?php } ?></td>
            <?php } ?>
          </tr>
          <tr>
            <td><?php echo $text_model; ?></td>
            <?php foreach ($products as $product) { ?>
            <td><?php echo $products[$product['product_id']]['model']; ?></td>
            <?php } ?>
          </tr>
          <tr>
            <td><?php echo $text_manufacturer; ?></td>
            <?php foreach ($products as $product) { ?>
            <td><?php echo $products[$product['product_id']]['manufacturer']; ?></td>
            <?php } ?>
          </tr>
          <tr>
            <td><?php echo $text_availability; ?></td>
            <?php foreach ($products as $product) { ?>
            <td><?php echo $products[$product['product_id']]['availability']; ?></td>
            <?php } ?>
          </tr>
          <?php if ($review_status) { ?>
          <tr>
            <td><?php echo $text_rating; ?></td>
            <?php foreach ($products as $product) { ?>
            <td class="rating"><?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($products[$product['product_id']]['rating'] < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
              <?php } ?>
              <?php } ?>
              <br />
              <?php echo $products[$product['product_id']]['reviews']; ?></td>
            <?php } ?>
          </tr>
          <?php } ?>
          <tr>
            <td><?php echo $text_summary; ?></td>
            <?php foreach ($products as $product) { ?>
            <td class="description"><?php echo $products[$product['product_id']]['description']; ?></td>
            <?php } ?>
          </tr>
          <tr>
            <td><?php echo $text_weight; ?></td>
            <?php foreach ($products as $product) { ?>
            <td><?php echo $products[$product['product_id']]['weight']; ?></td>
            <?php } ?>
          </tr>
          <tr>
            <td><?php echo $text_dimension; ?></td>
            <?php foreach ($products as $product) { ?>
            <td><?php echo $products[$product['product_id']]['length']; ?> x <?php echo $products[$product['product_id']]['width']; ?> x <?php echo $products[$product['product_id']]['height']; ?></td>
            <?php } ?>
          </tr>
        </tbody>
        <?php foreach ($attribute_groups as $attribute_group) { ?>
        <thead>
          <tr>
            <td colspan="<?php echo count($products) + 1; ?>"><strong><?php echo $attribute_group['name']; ?></strong></td>
          </tr>
        </thead>
        <?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
        <tbody>
          <tr>
            <td><?php echo $attribute['name']; ?></td>
            <?php foreach ($products as $product) { ?>
            <?php if (isset($products[$product['product_id']]['attribute'][$key])) { ?>
            <td><?php echo $products[$product['product_id']]['attribute'][$key]; ?></td>
            <?php } else { ?>
            <td></td>
            <?php } ?>
            <?php } ?>
          </tr>
        </tbody>
        <?php } ?>
        <?php } ?>
        <tr>
          <td></td>
          <?php foreach ($products as $product) { ?>
          <td><input type="button" value="<?php echo $button_cart; ?>" class="btn btn-primary btn-block" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" />
            <a href="<?php echo $product['remove']; ?>" class="btn btn-danger btn-block"><?php echo $button_remove; ?></a></td>
          <?php } ?>
        </tr>
      </table>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-default"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>