									<li>
										<div class="card product">
											<div class="compare-product">
												<div class="product__top" itemscope="" itemtype="http://schema.org/ImageObject">
        										    <a href="<?php echo $product['href']; ?>" title="<?php echo $product['name'];?>" class="card-image product__image">
                                                        <img class="responsive-img" itemprop="contentUrl"  title="<?php echo $product['name']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
                                                    </a>
													<div class="product__top-action">
														<a href="<?php echo $product['remove']; ?>" class="product__top-action-link product__top-action-link--close"></a>
													</div>
												</div>
												<div class="card-content product__content">
													<h2 class="product__title truncate"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
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
            											<a href="<?php echo $product['href']; ?>&review=1" title="<?php echo $product['reviews']; ?>" class="reviews-link"><?php echo $product['reviews']; ?></a>
                                                    </div>

                    								<div class="product__content-bottom">
                    									<div class="input-field">
                    										<input class="spinner" name="product_count1" value="1" />
                    									</div>
                    									<div class="product__prices">
                    										<div class="product__prices-inner">
                                                                <?php if (!$product['special']) { ?>
                    											    <div class="product__price product__price--new">Цена: <?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
                                                                <?php } else { ?>
                    											    <div class="product__price product__price--new">Цена: <?php echo str_replace($getSymbolRight, '', $product['special']); ?> <span class="ruble">o</span></div>
                    											    <div class="product__price product__price--old">Цена: <?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
                                                                <?php } ?>
                    										</div>
                    									</div>
                    								</div>
												</div>

												<div class="card-action product__buttons">
													<div class="product__buttons-left"> <a onclick="cart.add('<?php echo $product['product_id']; ?>');"  class="btn-floating waves-effect waves-light btn-large btn-orange"><i class="material-icons">add_shopping_cart</i></a> </div>
													<div class="product__buttons-right"> <a data-product="<?php echo $product['product_id']; ?>" class="button-modal-quick-order waves-effect waves-light btn-large bold btn-blue">Быстрый заказ</a> </div>
												</div>
											</div>
											<div class="compare-rows">
												<ul class="compare-rows-list">
                                                    <?php foreach($product['attribute'] as $attribute) { ?>
                    								    <li class="<?php echo $attribute['different']; ?>">
                    									    <div><?php echo $attribute['text']; ?></div>
                    									</li>
                                                    <?php } ?>
												</ul>
											</div>
										</div>
									</li>
