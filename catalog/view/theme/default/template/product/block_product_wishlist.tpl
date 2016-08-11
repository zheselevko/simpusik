                                        <li>
                                            <div class="card product" itemprop="itemListElement" itemscope itemtype="http://schema.org/Product">
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
                                                                    <div class="product__price product__price--new">Цена: <?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
                                                                    <meta itemprop="price" content="<?php echo str_replace($getSymbolRight, '', $product['price']); ?>">
    <meta itemprop="priceCurrency" content="RUB">
                                                                <?php } else { ?>
                                                                    <div class="product__price product__price--new" itemprop="price">Цена: <?php echo str_replace($getSymbolRight, '', $product['special']); ?> <span class="ruble">o</span></div>

    <meta itemprop="priceCurrency" content="RUB">
                                                                    <div class="product__price product__price--old" itemprop="price">Цена: <?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
                                                                <?php } ?>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="card-action product__buttons">
                                                    <div class="row">
                                                        <div class="col s40"> <a onclick="cart.add('<?php echo $product['product_id']; ?>');" class="waves-effect waves-light btn-large bold btn-orange">Купить</a> </div>
                                                        <div class="col s60"> <a data-product="<?php echo $product['product_id']; ?>" class="button-modal-quick-order waves-effect waves-light btn-large bold btn-blue">Быстрый заказ</a> </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </li>
