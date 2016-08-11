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

				<!-- content-top end -->
				<!-- block-product-full -->
				<div class="section block-product-full" itemscope itemtype="http://schema.org/Product">
					<!-- product-full-top -->
					<div class="product-full-top">
						<div class="row">
							<div class="col s12 m7 m60-5">
								<h1 itemprop="name"><?php echo $heading_title; ?></h1>
								<div class="product-full-index"><span><?php echo $model; ?></span></div>
							</div>
							<div class="col s12 m5 m39-5">
								<ul class="product-full-share-list">
									<li><a href="#" class="print-link js-print-link"><i class="material-icons">print</i>Распечатать</a></li>
                                    <?php /*
									<li><a href="#" class="email-link"><i class="material-icons">email</i>Отправить на E-mail</a></li>
                                    */ ?>
									<li>
                                        <script type="text/javascript" src="//yastatic.net/es5-shims/0.0.2/es5-shims.min.js" charset="utf-8"></script>
                                        <script type="text/javascript" src="//yastatic.net/share2/share.js" charset="utf-8"></script>
                                        <div class="ya-share2 share-list" data-services="vkontakte,facebook,odnoklassniki,moimir,gplus,twitter"></div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- product-full-top end -->

					<!-- product-full-layout -->
					<div class="product-full-layout">
						<div class="row">
							<div class="col s12 m7 m60-5">
								<!-- product-full-images -->
								<div class="product-full-images">
									<div class="product-full-images__left">
										<ul class="slider-list js-product-full-images-left-slider">
                                            <?php if ($images) { ?>
                                                <?php $i = 0; ?>
                                                <?php $class = 'active'; ?>
                                                <?php foreach ($images as $image) { ?>
                                                    <li>
                                                        <a itemprop="image" data-slide-index="<?php echo $i++; ?>" class="<?php echo $class; ?>" title="<?php echo $heading_title; ?>">
                                                            <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                                        </a>
                                                    </li>
                                                <?php } ?>
                                            <?php } ?>
										</ul>
									</div>
									<div class="product-full-images__right">
										<ul class="slider-list js-product-full-images-right-slider">
                                            <?php if ($images) { ?>
                                                <?php $i = 0; ?>
                                                <?php foreach ($images as $image) { ?>
                                                    <li>
                                                        <img itemprop="image" src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                                    </li>
                                                <?php } ?>
                                            <?php } ?>
										</ul>
									</div>
								</div>
								<!-- product-full-images end -->

								<!-- product-full-main -->
								<div class="product-full-main">
									<div class="product-full-main__top">
										<ul class="tabs">
											<li class="tab"><a class="active" href="#product-full-tab1">Характеристики</a></li>
											<li class="tab"><a href="#product-full-tab2">С этим товаром покупают<sup><?php echo count($product_kits); ?></sup></a></li>
											<li class="tab"><a href="#product-full-tab3">Отзывы<sup><?php echo count($reviews); ?></sup></a></li>
											<li class="tab"><a href="#product-full-tab4">Похожие товары<sup><?php echo count($products); ?></sup></a></li>
										</ul>
									</div>
									<div class="product-full-main__content">
										<!-- product-full__characteristics -->
										<div class="product-full__characteristics" id="product-full-tab1">
											<h5>Характеристики</h5>
											<ul class="characteristics-list">
                                                <?php if (!empty($location)) { ?>
    												<li>
	    												<div class="characteristics-list__left"> <span>Коллекция</span> </div>
		    											<div class="characteristics-list__right"><?php echo $location; ?></div>
			    									</li>
                                                <?php } ?>

                                                <?php foreach($attributes as $attribute) { ?>
        										    <li>
        											    <div class="characteristics-list__left"><span><?php echo $attribute['name']; ?></span></div>
        											    <div class="characteristics-list__right"><?php echo $attribute['text']; ?></div>
        										    </li>
                                                <?php } ?>
											</ul>
											<h5>Описание</h5>
                                           <div itemprop="description"> <?php echo $description; ?></div>

											<div class="delivery-item">
												<div class="delivery-item__image">
													<div class="delivery-item__image-inner"> <span class="icon-car2-orange"></span> </div>
												</div>
												<div class="delivery-item__content">
													<h3>Доставка возможна<br /> в течении 48 часов</h3>
													<p>Если товар имеется в наличии на складе</p>
												</div>
											</div>
										</div>
										<!-- product-full__characteristics end -->

										<!-- product-full__purchased -->
										<div class="product-full__purchased" id="product-full-tab2">
                                            <?php foreach($product_kits as $product) { ?>
											<div class="products-purchased">
												<ul class="products-purchased-list">
													<li>
														<div class="product-purchased">
															<a class="product-purchased__image">
                                                                <img class="responsive-img" src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" />
                                                            </a>
															<div class="product-purchased__content">
                                                                <input type="checkbox" class="filled-in" name="product_purchased1" id="product_purchased1" checked="checked" />
                                                                <label for="product_purchased1">
																    <a><?php echo $heading_title; ?></a>
															    </label>
                                                            </div>
														</div>
													</li>
													<li>
														<div class="product-purchased">
															<a class="product-purchased__image">
                                                                <img class="responsive-img" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
                                                            </a>
															<div class="product-purchased__content">
                                                                <input type="checkbox" class="filled-in" name="product_purchased2" id="product_purchased2" checked="checked" />
                                                                <label for="product_purchased2">
																    <a><?php echo $product['name']; ?></a>
															    </label>
                                                            </div>
														</div>
													</li>
													<li>
														<div class="products-purchased-total">
															<div class="products-purchased-total__title">Ваша цена:</div>
															<div class="product__price product__price--medium"><?php echo str_replace($getSymbolRight, '', $product['price_kit']); ?> <span class="ruble">o</span></div>
                                                            <a onclick="addKitToCart('<?php echo $product['product_id']; ?>');" class="waves-effect waves-light btn-large bold btn-orange">Купить<i class="material-icons">add_shopping_cart</i></a>
                                                        </div>
													</li>
												</ul>
											</div>
                                            <?php } ?>
										</div>
										<!-- product-full__purchased end -->

										<!-- product-full__reviews -->
										<div class="product-full__reviews" id="product-full-tab3">
											<!-- leave-review-form -->
											<div class="leave-review-form">
												<form id="form-review">
													<div class="row">
														<div class="col s12 m4">
															<div class="input-field">
                                                                <i class="material-icons prefix">account_circle</i>
                                                                <input type="text" name="leave_review_name" id="input-name" placeholder="Ваше имя" />
                                                            </div>
														</div>
														<div class="col s12 m4">
															<div class="input-field">
                                                                <i class="material-icons prefix">email</i>
                                                                <input type="email" name="leave_review_email" id="input-email" placeholder="E-mail адрес" />
                                                            </div>
														</div>
														<div class="col s12 m4">
															<div class="form-rules">
                                                                <span class="tooltip" data-tooltip="tooltip1">
																    <i class="material-icons">help_outline</i>
                                                                    <span class="tooltip__text">Правила публикации</span>
                                                                </span>
																<div class="form-rules__text">E-mail на сайте не публикуется</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col s12">
															<div class="input-field">
                                                                <textarea name="leave_review_text" placeholder="Текст вашего отзыва" id="input-text" class="materialize-textarea js-textarea-autoresize"></textarea>
                                                            </div>
														</div>
													</div>
													<div class="leave-review-form__buttons">
														<div class="row">
															<div class="col s12 m4">
																<div class="rating-stars active"> <span>Ваша оценка:</span>
																	<ul class="stars-list">
                                                                        <?php for ($k = 1;$k <= 5;$k++) { ?>
                                                                            <?php if ($k <= $rating) { ?>
                                										        <li class="active"><i class="material-icons">star_rate</i></li>
                                                                            <?php } else { ?>
                                        										<li><i class="material-icons">star_rate</i></li>
                                                                            <?php } ?>
                                                                        <?php } ?>
																	</ul>
                                                                    <input type="hidden" id="input-rating" name="leave_review_rating" value="<?php echo $rating; ?>"/>
                                                                </div>
															</div>
															<div class="col s12 m8">
                                                                <label class="upload-link">
																    <input type="file" name="leave_review_files" />
															    </label>
                                                                <input type="hidden" name="leave_review_product_id" value="<?php echo $product_id; ?>"/>
                                                                <button type="submit" id="button-review" class="btn-large btn-orange bold waves-effect waves-light">Отправить</button>
                                                            </div>
														</div>
													</div>
												</form>
											</div>
											<!-- leave-review-form end -->

                                            <?php require DIR_TEMPLATE . 'default/template/product/review.tpl'; ?>

										</div>
										<!-- product-full__reviews end -->

										<!-- product-full__characteristics -->
										<div class="product-full__characteristics" id="product-full-tab4">
											<!-- similar-products -->
											<div class="similar-products">
												<!-- products-list -->
												<ul class="products-list" itemscope="" itemtype="http://schema.org/ItemList">
                                                    <?php foreach ($products as $product) { ?>
                                                        <?php require DIR_TEMPLATE . 'default/template/product/block_product_related.tpl'; ?>
                                                    <?php } ?>
												</ul>
												<!-- products-list end -->
											</div>
											<!-- similar-products end -->
										</div>
										<!-- product-full__characteristics end -->
									</div>
								</div>
								<!-- product-full-main end -->
							</div>
							<div class="col s12 m5 m39-5">
								<!-- product-full-actions -->
								<div class="product-full-actions" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
									<div class="product-full-actions__prices">
										<div class="product-full-actions__prices-title">Цена:</div>
										<meta itemprop="price" content="<?php echo str_replace($getSymbolRight, '', $price); ?>">
    <meta itemprop="priceCurrency" content="RUB">
										<div class="product__price product__price--large"><?php echo str_replace($getSymbolRight, '', $price); ?> <span class="ruble">o</span></div>
                                        <div class="product-availability">

                                        <?php if ($quantity > 0) { ?>
                                        <link itemprop="availability" href="http://schema.org/InStock">
										    <i class="material-icons">check</i>В наличии
                                        <?php } ?>
                                        </div>
									</div>
									<div class="product-full-actions__action">
										<ul class="product-full-actions__action-list">
											<li><a onclick="compare.add('<?php echo $product_id; ?>');" class="compare-link"><i class="material-icons">insert_chart</i>Сравнить</a></li>
											<li><a onclick="wishlist.add('<?php echo $product_id ?>');" class="like-link"><span class="icon-heart-orange"></span>Отложить</a></li>
										</ul>
									</div>
									<div class="divider clearfix"></div>
									<div class="product-full-actions__buttons">
										<div class="input-field"> <input class="spinner" id="quantity" name="quantity" value="1" /> </div>
										<div class="product-full-actions__buttons-left"> <a onclick="addToCart();" class="waves-effect waves-light btn-large bold btn-orange">Купить</a> </div>
										<div class="product-full-actions__buttons-right"> <a data-product="<?php echo $product_id; ?>" class="button-modal-quick-order waves-effect waves-light btn-large bold btn-blue">Быстрый заказ</a> </div>
									</div>
									<div class="divider mobile-hidden"></div>
									<div class="product-full-actions__phones"> <i class="material-icons">settings_phone</i> Для заказов: <span><?php echo $phone1; ?></span> </div>
								</div>
								<!-- product-full-actions end -->

								<!-- side-paydeliv -->
								<div class="side-paydeliv">
									<div class="side-paydeliv__title">
										<h3>доставка и оплата</h3> </div>
									<div class="side-paydeliv__content">
										<div class="side-paydeliv__content-pay"> <a href="#">г. Москва и область</a>
											<p>Возможность доставки уточняйте у менеджеров</p>
										</div>
										<div class="divider"></div>
										<div class="side-paydeliv__content-deliv">
											<h5>способы оплаты:</h5>
											<ul class="side-delivery-list">
												<li class="nal-icon">Наличными курьеру</li>
												<li class="card-icon">Картой Visa или MasterCard</li>
												<li class="webm-icon">Электронными деньгами Яндекс.Деньги или Webmoney</li>
												<li class="beznal-icon">Безналичным переводом</li>
											</ul>
										</div>
									</div>
								</div>
								<!-- side-paydeliv end -->

								<!-- side-advantages -->
								<div class="side-advantages">
									<div class="side-advantages__title">
										<h3>наши преимущества</h3> </div>
									<div class="side-advantages__content">
										<ul class="side-advantages-list">
											<li class="medal-icon">Гарантия лучшей цены</li>
											<li class="shield-icon">Гарантия 12 месяцев</li>
											<li class="change-icon">Возврат и обмен без проблем</li>
											<li class="pay-icon">Различные способы оплаты</li>
										</ul>
									</div>
								</div>
								<!-- advantages end -->
							</div>
						</div>
					</div>
					<!-- product-full-layout end -->
				</div>
				<!-- block-product-full end -->
			</div>
			<!-- container end -->
		</main>
	    <!-- MAIN CONTENT [END] -->

		<!-- tooltip-fixed -->
		<div class="tooltip-fixed" id="tooltip1">
			<div class="tooltip-fixed__title">
				<h5>Все отзывы проходят модерацию</h5> </div>
			<div class="tooltip-fixed__content">
				<p>Какие отзывы не публикуются?</p>
				<ol>
					<li>Содержащие нецензурную лексику.</li>
					<li>Отзывы, основанные только на эмоциональных высказываниях (”ваще классное белье!”, “крутая подушка”)</li>
					<li>Набранные ЗАГЛАВНЫМИ буквами.</li>
					<li>Просьбы подобрать товар.</li>
					<li>Повторяющиеся отзывы</li>
				</ol>
			</div>
		</div>
		<!-- tooltip-fixed end -->

<?php if($review) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
    $('a[href="#product-full-tab3"]').trigger('click');
    $('html, body').animate({ scrollTop: $('a[href="#product-full-tab3"]').offset().top - 5}, 250);
    return false;
});
//--></script>
<?php } ?>

<script type="text/javascript"><!--
var kit_id = <?php echo $product_id ?>;

function addToCart() {

    var qnty = $('#quantity').val();

    $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: 'product_id=' + kit_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
        dataType: 'json',
            beforeSend: function() {
            $('#cart > button').button('loading');
        },
        complete: function() {
            $('#cart > button').button('reset');
        },
        success: function(json) {
            if (json['redirect']) {
    	        location = json['redirect'];
            }

            if (json['success']) {
            	$('#cart > ul').load('index.php?route=common/cart/info ul li');

                $('.cart-mini-count').html(json['cart_count']);
                $('.cart-totals').html(json['text_items']);

                $('.modal:visible').closeModal();
                $('body').showModal({'modal_id':'#modal-added-tocart'});
            }
        }
    });

}

function addKitToCart(product_id) {

    $.ajax({
        url: 'index.php?route=checkout/cart/addKitToCart',
        type: 'post',
        data: { product_id: kit_id, quantity: "1", products: product_id + ":1"  },
        dataType: 'json',
    	success: function(json) {
		    if (json['redirect']) {
			    location = json['redirect'];
			}

			if (json['success']) {
			    $('#cart > ul').load('index.php?route=common/cart/info ul li');

                $('.cart-mini-count').html(json['cart_count']);
                $('.cart-totals').html(json['text_items']);

                $('.modal:visible').closeModal();
                $('body').showModal({'modal_id':'#modal-added-tocart'});
			}
        }
    });
}
//--></script>
<?php echo $footer; ?>

