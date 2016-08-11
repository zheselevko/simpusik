			<!-- related-products -->
			<div class="section related-products">
				<div class="block-title">
					<h2 class="left">Каталог товаров</h2>
					<div class="block-title__right right">
						<a href="#">Весь каталог<i class="material-icons">hotel</i></a>
					</div>
				</div>
				<!-- products-list -->
				<ul class="products-list js-related-products-slider">
                    <?php foreach ($products as $product) { ?>
					<li>
						<div class="card product">
							<div class="product__top">
								<a href="<?php echo $product['href']; ?>" class="card-image product__image">
									<img class="responsive-img" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
								</a>
								<div class="product__top-action">
									<a href="#" class="product__top-action-link product__top-action-link--graph">
										<i class="material-icons">insert_chart</i>
									</a>
									<a href="#" class="product__top-action-link product__top-action-link--star"></a>
								</div>
							</div>
							<div class="card-content product__content">
								<h2 class="product__title truncate"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
								<div class="product__content-top">
									<ul class="stars-list">
										<li class="active"><i class="material-icons">star_rate</i></li>
										<li class="active"><i class="material-icons">star_rate</i></li>
										<li class="active"><i class="material-icons">star_rate</i></li>
										<li class="active"><i class="material-icons">star_rate</i></li>
										<li><i class="material-icons">star_rate</i></li>
									</ul>
									<a href="<?php echo $product['href']; ?>&review=1" class="reviews-link">Отзывов 5</a>
								</div>
								<div class="product__consist">
									<span class="product__consist-left">Коллекция:</span><span class="product__consist-right">“Paradise”</span>
									<ul class="product__consist-list">
										<li>
											<div class="product__consist-left"><span>Материал</span></div>
											<div class="product__consist-right">Сатин</div>
										</li>
										<li>
											<div class="product__consist-left"><span>Пододеяльник</span></div>
											<div class="product__consist-right">175 х 215</div>
										</li>
										<li>
											<div class="product__consist-left"><span>Простыня</span></div>
											<div class="product__consist-right">220 х 240</div>
										</li>
										<li>
											<div class="product__consist-left"><span>Наволочка</span></div>
											<div class="product__consist-right">
												<div>70 х 70 (2 шт.)</div>
												<div>50 х 70 (2 шт.)</div>
											</div>
										</li>
									</ul>
								</div>
								<div class="product__content-bottom">
									<div class="input-field">
										<input class="spinner" name="product_count1" value="1" />
									</div>
									<div class="product__prices">
										<div class="product__prices-inner">
                                            <?php if (!$product['special']) { ?>
                                            <?php } else { ?>
											    <div class="product__price product__price--new"><?php echo str_replace('руб.', '', $product['special']); ?> <span class="ruble">o</span></div>
											    <div class="product__price product__price--old"><?php echo str_replace('руб.', '', $product['price']); ?> <span class="ruble">o</span></div>
                                            <?php } ?>
										</div>
									</div>
								</div>
							</div>
							<div class="card-action product__buttons">
								<div class="product__buttons-left">
									<a onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn-floating waves-effect waves-light btn-large btn-orange modal-trigger"><i class="material-icons">add_shopping_cart</i></a>
								</div>
								<div class="product__buttons-right">
									<a href="#modal-quick-order" class="waves-effect waves-light btn-large bold btn-blue modal-trigger">Быстрый заказ</a>
								</div>
							</div>
						</div>
					</li>
                    <?php } ?>

				</ul>
				<!-- products-list end -->
			</div>
			<!-- related-products end -->

<?php /*
<h3><?php echo $heading_title; ?></h3>
<div class="row">
  <?php foreach ($products as $product) { ?>
  <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
        <p><?php echo $product['description']; ?></p>
        <?php if ($product['rating']) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['price']) { ?>
        <p class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </p>
        <?php } ?>
      </div>
      <div class="button-group">
        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
      </div>
    </div>
  </div>
  <?php } ?>
</div>
*/ ?>
