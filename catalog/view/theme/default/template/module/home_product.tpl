			<!-- main-catalog -->
			<div class="section main-catalog">
				<ul class="tabs">
					<li class="tab col s12 m3"><a class="active" href="#main-catalog1"><i class="material-icons">thumb_up</i><span>Хиты каталога</span></a></li>
					<li class="tab col s12 m3"><a href="#main-catalog2"><span class="icon-percent-blue"></span><span>Акции</span></a></li>
					<li class="tab col s12 m3"><a href="#main-catalog3"><i class="material-icons">new_releases</i><span>Новинки</span></a></li>
					<li class="tab col s12 m3"><a href="#main-catalog4"><i class="material-icons">card_giftcard</i><span>Распродажа</span></a></li>
				</ul>
				<div class="main-catalog-tab" id="main-catalog1" itemscope itemtype="http://schema.org/ItemList">
            		<div class="main-catalog-tab-menu">
            			<ul class="main-catalog-tab-menu-list" id="dropdown-main-catalog-tab-menu">
                            <?php if ($categories) { ?>
                                <?php $category = $categories[0]; ?>
                				<li class="current"><a href="<?php echo $category['href']; ?>">Все</a></li>
                            <?php } ?>
                            <?php foreach ($categories as $category) { ?>
            				<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                            <?php } ?>
            			</ul>
            			<div class="main-catalog-tab-menu-mobile"> <a class="dropdown-button" href="#!" data-activates="dropdown-main-catalog-tab-menu">Выберите категорию<i class="material-icons right">menu</i></a> </div>
            		</div>

					<!-- products-scrollbar -->
					<div class="products-scrollbar">
						<!-- scrollpane-horizontal -->
						<div class="scrollpane-horizontal">
							<!-- similar-products -->
							<div class="similar-products js-main-similar-products-slider">
                                <?php $current='current'; ?>
                                <?php foreach ($products_1 as $product) { ?>
                                            <div class="card product <?php echo $current; $current='';  ?>" itemprop="itemListElement" itemscope itemtype="http://schema.org/Product">
                                                <div class="product__top" itemscope="" itemtype="http://schema.org/ImageObject">
                                                    <span data-link="<?php echo $product['href']; ?>"  class="hidden-link card-image product__image"> <img class="responsive-img" src="<?php echo $product['thumb']; ?>" itemprop="image" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /> </span>
                                                    <div class="product__top-action">
                                                        <a onclick="compare.add('<?php echo $product['product_id']; ?>');" class="product__top-action-link product__top-action-link--graph"> <i class="material-icons">insert_chart</i> </a>
                                                        <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="product__top-action-link product__top-action-link--star"></a>
                                                    </div>
                                                </div>
                                                <div class="card-content product__content">
                                                    <h2 class="product__title truncate"><a href="<?php echo $product['href']; ?>" itemprop="url" title="<?php echo $product['name'];?>"><span itemprop="name"><?php echo $product['name']; ?></span></a></h2>
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
                                                        <span data-link="<?php echo $product['href']; ?>&review=1"  class="hidden-link reviews-link"><?php echo $product['reviews']; ?></span>
                                                    </div>

                                                    <div class="product__consist"> <span class="product__consist-left">Коллекция:</span><span class="product__consist-right"><?php echo $product['location']; ?></span>
                                                        <ul class="product__consist-list" itemprop="description">
                                                            <?php foreach($product['attribute'] as $attribute) { ?>
                                                                <li>
                                                                    <div class="product__consist-left"><span><?php echo $attribute['name']; ?></span></div>
                                                                    <div class="product__consist-right"><?php echo $attribute['text']; ?></div>
                                                                </li>
                                                            <?php } ?>
                                                        </ul>
                                                    </div>
                        
                                                    <div class="product__content-bottom">
                                                        <div class="input-field">
                                                            <input class="spinner" name="product_count1" value="1" />
                                                        </div>
                                                        <div class="product__prices">
                                                            <div class="product__prices-inner" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                                                <?php if (!$product['special']) { ?>
                                                                    <div class="product__price product__price--new"><?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
                                                                    <meta itemprop="price" content="<?php echo str_replace($getSymbolRight, '', $product['price']); ?>">
    <meta itemprop="priceCurrency" content="RUB">
                                                                <?php } else { ?>
                                                                    <div class="product__price product__price--new" itemprop="price"><?php echo str_replace($getSymbolRight, '', $product['special']); ?> <span class="ruble">o</span></div>

    <meta itemprop="priceCurrency" content="RUB">
                                                                    <div class="product__price product__price--old" itemprop="price"><?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
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
				<div class="main-catalog-tab" id="main-catalog2" itemscope itemtype="http://schema.org/ItemList">

					<!-- products-scrollbar -->
					<div class="products-scrollbar">
						<!-- scrollpane-horizontal -->
						<div class="scrollpane-horizontal">
							<!-- similar-products -->
							<div class="similar-products js-main-similar-products-slider">
                                <?php $current='current'; ?>
                                <?php foreach ($products_2 as $product) { ?>
    							                    <div class="card product <?php echo $current; $current='';  ?>" itemprop="itemListElement" itemscope itemtype="http://schema.org/Product">
                                                <div class="product__top" itemscope="" itemtype="http://schema.org/ImageObject">
                                                    <span data-link="<?php echo $product['href']; ?>"  class="hidden-link card-image product__image"> <img class="responsive-img" src="<?php echo $product['thumb']; ?>" itemprop="image" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /> </span>
                                                    <div class="product__top-action">
                                                        <a onclick="compare.add('<?php echo $product['product_id']; ?>');" class="product__top-action-link product__top-action-link--graph"> <i class="material-icons">insert_chart</i> </a>
                                                        <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="product__top-action-link product__top-action-link--star"></a>
                                                    </div>
                                                </div>
                                                <div class="card-content product__content">
                                                    <h2 class="product__title truncate"><a href="<?php echo $product['href']; ?>" itemprop="url" title="<?php echo $product['name'];?>"><span itemprop="name"><?php echo $product['name']; ?></span></a></h2>
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
                                                        <span data-link="<?php echo $product['href']; ?>&review=1"  class="hidden-link reviews-link"><?php echo $product['reviews']; ?></span>
                                                    </div>

                                                    <div class="product__consist"> <span class="product__consist-left">Коллекция:</span><span class="product__consist-right"><?php echo $product['location']; ?></span>
                                                        <ul class="product__consist-list" itemprop="description">
                                                            <?php foreach($product['attribute'] as $attribute) { ?>
                                                                <li>
                                                                    <div class="product__consist-left"><span><?php echo $attribute['name']; ?></span></div>
                                                                    <div class="product__consist-right"><?php echo $attribute['text']; ?></div>
                                                                </li>
                                                            <?php } ?>
                                                        </ul>
                                                    </div>
                        
                                                    <div class="product__content-bottom">
                                                        <div class="input-field">
                                                            <input class="spinner" name="product_count1" value="1" />
                                                        </div>
                                                        <div class="product__prices">
                                                            <div class="product__prices-inner" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                                                <?php if (!$product['special']) { ?>
                                                                    <div class="product__price product__price--new"><?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
                                                                    <meta itemprop="price" content="<?php echo str_replace($getSymbolRight, '', $product['price']); ?>">
    <meta itemprop="priceCurrency" content="RUB">
                                                                <?php } else { ?>
                                                                    <div class="product__price product__price--new" itemprop="price"><?php echo str_replace($getSymbolRight, '', $product['special']); ?> <span class="ruble">o</span></div>

    <meta itemprop="priceCurrency" content="RUB">
                                                                    <div class="product__price product__price--old" itemprop="price"><?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
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
				<div class="main-catalog-tab" id="main-catalog3" itemscope itemtype="http://schema.org/ItemList">

					<!-- products-scrollbar -->
					<div class="products-scrollbar">
						<!-- scrollpane-horizontal -->
						<div class="scrollpane-horizontal">
							<!-- similar-products -->
							<div class="similar-products js-main-similar-products-slider">
                                <?php $current='current'; ?>
                                <?php foreach ($products_3 as $product) { ?>
    								                    <div class="card product <?php echo $current; $current='';  ?>" itemprop="itemListElement" itemscope itemtype="http://schema.org/Product">
                                                <div class="product__top" itemscope="" itemtype="http://schema.org/ImageObject">
                                                    <span data-link="<?php echo $product['href']; ?>"  class="hidden-link card-image product__image"> <img class="responsive-img" src="<?php echo $product['thumb']; ?>" itemprop="image" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /> </span>
                                                    <div class="product__top-action">
                                                        <a onclick="compare.add('<?php echo $product['product_id']; ?>');" class="product__top-action-link product__top-action-link--graph"> <i class="material-icons">insert_chart</i> </a>
                                                        <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="product__top-action-link product__top-action-link--star"></a>
                                                    </div>
                                                </div>
                                                <div class="card-content product__content">
                                                    <h2 class="product__title truncate"><a href="<?php echo $product['href']; ?>" itemprop="url" title="<?php echo $product['name'];?>"><span itemprop="name"><?php echo $product['name']; ?></span></a></h2>
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
                                                        <span data-link="<?php echo $product['href']; ?>&review=1"  class="hidden-link reviews-link"><?php echo $product['reviews']; ?></span>
                                                    </div>

                                                    <div class="product__consist"> <span class="product__consist-left">Коллекция:</span><span class="product__consist-right"><?php echo $product['location']; ?></span>
                                                        <ul class="product__consist-list" itemprop="description">
                                                            <?php foreach($product['attribute'] as $attribute) { ?>
                                                                <li>
                                                                    <div class="product__consist-left"><span><?php echo $attribute['name']; ?></span></div>
                                                                    <div class="product__consist-right"><?php echo $attribute['text']; ?></div>
                                                                </li>
                                                            <?php } ?>
                                                        </ul>
                                                    </div>
                        
                                                    <div class="product__content-bottom">
                                                        <div class="input-field">
                                                            <input class="spinner" name="product_count1" value="1" />
                                                        </div>
                                                        <div class="product__prices">
                                                            <div class="product__prices-inner" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                                                <?php if (!$product['special']) { ?>
                                                                    <div class="product__price product__price--new"><?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
                                                                    <meta itemprop="price" content="<?php echo str_replace($getSymbolRight, '', $product['price']); ?>">
    <meta itemprop="priceCurrency" content="RUB">
                                                                <?php } else { ?>
                                                                    <div class="product__price product__price--new" itemprop="price"><?php echo str_replace($getSymbolRight, '', $product['special']); ?> <span class="ruble">o</span></div>

    <meta itemprop="priceCurrency" content="RUB">
                                                                    <div class="product__price product__price--old" itemprop="price"><?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
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
				<div class="main-catalog-tab" id="main-catalog4" itemscope itemtype="http://schema.org/ItemList">

					<!-- products-scrollbar -->
					<div class="products-scrollbar">
						<!-- scrollpane-horizontal -->
						<div class="scrollpane-horizontal">
							<!-- similar-products -->
							<div class="similar-products js-main-similar-products-slider">
                                <?php $current='current'; ?>
                                <?php foreach ($products_4 as $product) { ?>
    							    <div class="card product <?php echo $current; $current='';  ?>" itemprop="itemListElement" itemscope itemtype="http://schema.org/Product">
                                                <div class="product__top" itemscope="" itemtype="http://schema.org/ImageObject">
                                                    <span data-link="<?php echo $product['href']; ?>"  class="hidden-link card-image product__image"> <img class="responsive-img" src="<?php echo $product['thumb']; ?>" itemprop="image" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /> </span>
                                                    <div class="product__top-action">
                                                        <a onclick="compare.add('<?php echo $product['product_id']; ?>');" class="product__top-action-link product__top-action-link--graph"> <i class="material-icons">insert_chart</i> </a>
                                                        <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="product__top-action-link product__top-action-link--star"></a>
                                                    </div>
                                                </div>
                                                <div class="card-content product__content">
                                                    <h2 class="product__title truncate"><a href="<?php echo $product['href']; ?>" itemprop="url" title="<?php echo $product['name'];?>"><span itemprop="name"><?php echo $product['name']; ?></span></a></h2>
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
                                                        <span data-link="<?php echo $product['href']; ?>&review=1"  class="hidden-link reviews-link"><?php echo $product['reviews']; ?></span>
                                                    </div>

                                                    <div class="product__consist"> <span class="product__consist-left">Коллекция:</span><span class="product__consist-right"><?php echo $product['location']; ?></span>
                                                        <ul class="product__consist-list" itemprop="description">
                                                            <?php foreach($product['attribute'] as $attribute) { ?>
                                                                <li>
                                                                    <div class="product__consist-left"><span><?php echo $attribute['name']; ?></span></div>
                                                                    <div class="product__consist-right"><?php echo $attribute['text']; ?></div>
                                                                </li>
                                                            <?php } ?>
                                                        </ul>
                                                    </div>
                        
                                                    <div class="product__content-bottom">
                                                        <div class="input-field">
                                                            <input class="spinner" name="product_count1" value="1" />
                                                        </div>
                                                        <div class="product__prices">
                                                            <div class="product__prices-inner" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                                                <?php if (!$product['special']) { ?>
                                                                    <div class="product__price product__price--new"><?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
                                                                    <meta itemprop="price" content="<?php echo str_replace($getSymbolRight, '', $product['price']); ?>">
    <meta itemprop="priceCurrency" content="RUB">
                                                                <?php } else { ?>
                                                                    <div class="product__price product__price--new" itemprop="price"><?php echo str_replace($getSymbolRight, '', $product['special']); ?> <span class="ruble">o</span></div>

    <meta itemprop="priceCurrency" content="RUB">
                                                                    <div class="product__price product__price--old" itemprop="price"><?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
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
