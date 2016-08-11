			<!-- main-catalog -->
			<div class="section main-catalog">
				<ul class="tabs">
					<li class="tab col s12 m3"><a class="active" href="#main-catalog1"><i class="material-icons">thumb_up</i><span>Хиты каталога</span></a></li>
					<li class="tab col s12 m3"><a href="#main-catalog2"><span class="icon-percent-blue"></span><span>Акции</span></a></li>
					<li class="tab col s12 m3"><a href="#main-catalog3"><i class="material-icons">new_releases</i><span>Новинки</span></a></li>
					<li class="tab col s12 m3"><a href="#main-catalog4"><i class="material-icons">card_giftcard</i><span>Распродажа</span></a></li>
				</ul>
				<div class="main-catalog-tab" id="main-catalog1">

					<!-- products-scrollbar -->
					<div class="products-scrollbar">
						<!-- scrollpane-horizontal -->
						<div class="scrollpane-horizontal">
							<!-- similar-products -->
							<div class="similar-products js-main-similar-products-slider">
                                <?php $current='current'; ?>
                                <?php foreach ($products_1 as $product) { ?>
    								<div class="card product <?php echo $current; $current='';  ?>">
    									<div class="product__top">
    										<a href="<?php echo $product['href']; ?>" class="card-image product__image">
    											<img class="responsive-img" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
    										</a>
    									</div>
    									<div class="card-content product__content">
    										<h2 class="product__title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
    										<div class="product__content-top">
    											<ul class="stars-list">
                                                    <?php for ($k = 1;$k <= 5;$k++) { ?>
                                                        <?php if ($k < $product['rating']) { ?>
            										        <li class="active"><i class="material-icons">star_rate</i></li>
                                                        <?php } else { ?>
                    										<li><i class="material-icons">star_rate</i></li>
                                                        <?php } ?>
                                                    <?php } ?>
    											</ul>
    											<a href="<?php echo $product['href']; ?>&review=1" class="reviews-link"><?php echo $product['reviews']; ?></a>
    										</div>
    										<div class="product__content-bottom">
    											<div class="input-field">
    												<input class="spinner" name="product_count1" value="1" />
    											</div>
    											<div class="product__prices">
    												<div class="product__prices-inner">
                                                        <?php if (!$product['special']) { ?>
            											    <div class="product__price product__price--new"><?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
                                                        <?php } else { ?>
            											    <div class="product__price product__price--new"><?php echo str_replace($getSymbolRight, '', $product['special']); ?> <span class="ruble">o</span></div>
            											    <div class="product__price product__price--old"><?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
                                                        <?php } ?>
    												</div>
    											</div>
    										</div>
    									</div>
    									<div class="card-action product__buttons">
    										<a onclick="cart.add('<?php echo $product['product_id']; ?>');" class="waves-effect waves-light btn-large bold btn-orange">Купить<i class="material-icons">add_shopping_cart</i></a>
    									</div>
    								</div>
                                <?php } ?>
							</div>
							<!-- similar-products end -->
						</div>
						<!-- scrollpane-horizontal end -->

						<!-- products-scrollbar__controls -->
						<div class="products-scrollbar__controls">
							<a href="#" class="products-scrollbar__controls-left"></a>
							<a href="#" class="products-scrollbar__controls-right"></a>
						</div>
						<!-- products-scrollbar__controls end -->
					</div>
					<!-- products-scrollbar end -->
				</div>
				<div class="main-catalog-tab" id="main-catalog2">

					<!-- products-scrollbar -->
					<div class="products-scrollbar">
						<!-- scrollpane-horizontal -->
						<div class="scrollpane-horizontal">
							<!-- similar-products -->
							<div class="similar-products js-main-similar-products-slider">
                                <?php $current='current'; ?>
                                <?php foreach ($products_2 as $product) { ?>
    								<div class="card product <?php echo $current; $current='';  ?>">
    									<div class="product__top">
    										<a href="#" class="card-image product__image">
    											<img class="responsive-img" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
    										</a>
    									</div>
    									<div class="card-content product__content">
    										<h2 class="product__title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
    										<div class="product__content-top">
    											<ul class="stars-list">
                                                    <?php for ($k = 1;$k <= 5;$k++) { ?>
                                                        <?php if ($k < $product['rating']) { ?>
            										        <li class="active"><i class="material-icons">star_rate</i></li>
                                                        <?php } else { ?>
                    										<li><i class="material-icons">star_rate</i></li>
                                                        <?php } ?>
                                                    <?php } ?>
    											</ul>
    											<a href="<?php echo $product['href']; ?>&review=1" class="reviews-link"><?php echo $product['reviews']; ?></a>
    										</div>
    										<div class="product__content-bottom">
    											<div class="input-field">
    												<input class="spinner" name="product_count1" value="1" />
    											</div>
    											<div class="product__prices">
    												<div class="product__prices-inner">
                                                        <?php if (!$product['special']) { ?>
            											    <div class="product__price product__price--new"><?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
                                                        <?php } else { ?>
            											    <div class="product__price product__price--new"><?php echo str_replace($getSymbolRight, '', $product['special']); ?> <span class="ruble">o</span></div>
            											    <div class="product__price product__price--old"><?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
                                                        <?php } ?>
    												</div>
    											</div>
    										</div>
    									</div>
    									<div class="card-action product__buttons">
    										<a onclick="cart.add('<?php echo $product['product_id']; ?>');" class="waves-effect waves-light btn-large bold btn-orange">Купить<i class="material-icons">add_shopping_cart</i></a>
    									</div>
    								</div>
                                <?php } ?>
							</div>
							<!-- similar-products end -->
						</div>
						<!-- scrollpane-horizontal end -->

						<!-- products-scrollbar__controls -->
						<div class="products-scrollbar__controls">
							<a href="#" class="products-scrollbar__controls-left"></a>
							<a href="#" class="products-scrollbar__controls-right"></a>
						</div>
						<!-- products-scrollbar__controls end -->
					</div>
					<!-- products-scrollbar end -->

				</div>
				<div class="main-catalog-tab" id="main-catalog3">

					<!-- products-scrollbar -->
					<div class="products-scrollbar">
						<!-- scrollpane-horizontal -->
						<div class="scrollpane-horizontal">
							<!-- similar-products -->
							<div class="similar-products js-main-similar-products-slider">
                                <?php $current='current'; ?>
                                <?php foreach ($products_3 as $product) { ?>
    								<div class="card product <?php echo $current; $current='';  ?>">
    									<div class="product__top">
    										<a href="#" class="card-image product__image">
    											<img class="responsive-img" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
    										</a>
    									</div>
    									<div class="card-content product__content">
    										<h2 class="product__title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
    										<div class="product__content-top">
    											<ul class="stars-list">
                                                    <?php for ($k = 1;$k <= 5;$k++) { ?>
                                                        <?php if ($k < $product['rating']) { ?>
            										        <li class="active"><i class="material-icons">star_rate</i></li>
                                                        <?php } else { ?>
                    										<li><i class="material-icons">star_rate</i></li>
                                                        <?php } ?>
                                                    <?php } ?>
    											</ul>
    											<a href="<?php echo $product['href']; ?>&review=1" class="reviews-link"><?php echo $product['reviews']; ?></a>
    										</div>
    										<div class="product__content-bottom">
    											<div class="input-field">
    												<input class="spinner" name="product_count1" value="1" />
    											</div>
    											<div class="product__prices">
    												<div class="product__prices-inner">
                                                        <?php if (!$product['special']) { ?>
            											    <div class="product__price product__price--new"><?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
                                                        <?php } else { ?>
            											    <div class="product__price product__price--new"><?php echo str_replace($getSymbolRight, '', $product['special']); ?> <span class="ruble">o</span></div>
            											    <div class="product__price product__price--old"><?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
                                                        <?php } ?>
    												</div>
    											</div>
    										</div>
    									</div>
    									<div class="card-action product__buttons">
    										<a onclick="cart.add('<?php echo $product['product_id']; ?>');" class="waves-effect waves-light btn-large bold btn-orange">Купить<i class="material-icons">add_shopping_cart</i></a>
    									</div>
    								</div>
                                <?php } ?>
							</div>
							<!-- similar-products end -->
						</div>
						<!-- scrollpane-horizontal end -->

						<!-- products-scrollbar__controls -->
						<div class="products-scrollbar__controls">
							<a href="#" class="products-scrollbar__controls-left"></a>
							<a href="#" class="products-scrollbar__controls-right"></a>
						</div>
						<!-- products-scrollbar__controls end -->
					</div>
					<!-- products-scrollbar end -->

				</div>
				<div class="main-catalog-tab" id="main-catalog4">

					<!-- products-scrollbar -->
					<div class="products-scrollbar">
						<!-- scrollpane-horizontal -->
						<div class="scrollpane-horizontal">
							<!-- similar-products -->
							<div class="similar-products js-main-similar-products-slider">
                                <?php $current='current'; ?>
                                <?php foreach ($products_4 as $product) { ?>
    								<div class="card product <?php echo $current; $current='';  ?>">
    									<div class="product__top">
    										<a href="#" class="card-image product__image">
    											<img class="responsive-img" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
    										</a>
    									</div>
    									<div class="card-content product__content">
    										<h2 class="product__title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
    										<div class="product__content-top">
    											<ul class="stars-list">
                                                    <?php for ($k = 1;$k <= 5;$k++) { ?>
                                                        <?php if ($k < $product['rating']) { ?>
            										        <li class="active"><i class="material-icons">star_rate</i></li>
                                                        <?php } else { ?>
                    										<li><i class="material-icons">star_rate</i></li>
                                                        <?php } ?>
                                                    <?php } ?>
    											</ul>
    											<a href="<?php echo $product['href']; ?>&review=1" class="reviews-link"><?php echo $product['reviews']; ?></a>
    										</div>
    										<div class="product__content-bottom">
    											<div class="input-field">
    												<input class="spinner" name="product_count1" value="1" />
    											</div>
    											<div class="product__prices">
    												<div class="product__prices-inner">
                                                        <?php if (!$product['special']) { ?>
            											    <div class="product__price product__price--new"><?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
                                                        <?php } else { ?>
            											    <div class="product__price product__price--new"><?php echo str_replace($getSymbolRight, '', $product['special']); ?> <span class="ruble">o</span></div>
            											    <div class="product__price product__price--old"><?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
                                                        <?php } ?>
    												</div>                                                
    											</div>
    										</div>
    									</div>
    									<div class="card-action product__buttons">
    										<a onclick="cart.add('<?php echo $product['product_id']; ?>');" class="waves-effect waves-light btn-large bold btn-orange">Купить<i class="material-icons">add_shopping_cart</i></a>
    									</div>
    								</div>
                                <?php } ?>
							</div>
							<!-- similar-products end -->
						</div>
						<!-- scrollpane-horizontal end -->

						<!-- products-scrollbar__controls -->
						<div class="products-scrollbar__controls">
							<a href="#" class="products-scrollbar__controls-left"></a>
							<a href="#" class="products-scrollbar__controls-right"></a>
						</div>
						<!-- products-scrollbar__controls end -->
					</div>
					<!-- products-scrollbar end -->

				</div>
			</div>
			<!-- main-catalog end -->
