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

				<div class="content-top__right-icon right">
				    <i class="material-icons">new_releases</i>
                </div>
			</div>
			<!-- content-top end -->

				<!-- content-top end -->
				<!-- block-product-full -->
				<div class="section block-product-full">
					<!-- product-full-top -->
					<div class="product-full-top">
						<div class="row">
							<div class="col s12 m7 m60-5">
								<h1><?php echo $heading_title; ?></h1>
								<div class="product-full-index"><span><?php echo $model; ?></span></div>
							</div>
							<div class="col s12 m5 m39-5">
								<ul class="product-full-share-list">
									<li><a href="#" class="print-link js-print-link"><i class="material-icons">print</i>Распечатать</a></li>
									<li><a href="#" class="email-link"><i class="material-icons">email</i>Отправить на E-mail</a></li>
									<li>
                                        <script type="text/javascript" src="//yastatic.net/es5-shims/0.0.2/es5-shims.min.js" charset="utf-8"></script>
                                        <script type="text/javascript" src="//yastatic.net/share2/share.js" charset="utf-8"></script>
                                        <div class="ya-share2 share-list" data-services="vkontakte,facebook,odnoklassniki,moimir,gplus,twitter"></div>

                                        <?php /*
										<ul class="share-list">
											<li>
												<a href="#" class="soc-vk-square"></a>
											</li>
											<li>
												<a href="#" class="soc-fb-square"></a>
											</li>
											<li>
												<a href="#" class="soc-odn-square"></a>
											</li>
											<li>
												<a href="#" class="soc-mailru-square"></a>
											</li>
											<li>
												<a href="#" class="soc-gplus-square"></a>
											</li>
											<li>
												<a href="#" class="soc-tw-square"></a>
											</li>
										</ul>
                                        */ ?>
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
                                                        <a data-slide-index="<?php echo $i++; ?>" class="<?php echo $class; ?>" title="<?php echo $heading_title; ?>">
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
                                                        <img src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
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
											<li class="tab"><a href="#product-full-tab2">С этим товаром покупают<sup>7</sup></a></li>
											<li class="tab"><a href="#product-full-tab3">Отзывы<sup>3</sup></a></li>
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
                                            <?php echo $description; ?>

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
											<div class="products-purchased">
												<ul class="products-purchased-list">
													<li>
														<div class="product-purchased">
															<a href="#" class="product-purchased__image"> <img class="responsive-img" src="pic/products-purchased/product-purchased-01.jpg" alt="" /> </a>
															<div class="product-purchased__content"> <input type="checkbox" class="filled-in" name="product_purchased1" id="product_purchased1" checked="checked" /> <label for="product_purchased1">
																<a href="#">Постельное белье CS4190-1-70</a>
															</label> </div>
														</div>
													</li>
													<li>
														<div class="product-purchased">
															<a href="#" class="product-purchased__image"> <img class="responsive-img" src="pic/products-purchased/product-purchased-02.jpg" alt="" /> </a>
															<div class="product-purchased__content"> <input type="checkbox" class="filled-in" name="product_purchased2" id="product_purchased2" checked="checked" /> <label for="product_purchased2">
																<a href="#">Подушки PD228-1</a>
															</label> </div>
														</div>
													</li>
													<li>
														<div class="products-purchased-total">
															<div class="products-purchased-total__title">Ваша цена:</div>
															<div class="product__price product__price--medium">9,350 <span class="ruble">o</span></div> <a href="#modal-added-tocart" class="waves-effect waves-light btn-large bold btn-orange modal-trigger">Купить<i class="material-icons">add_shopping_cart</i></a> </div>
													</li>
												</ul>
											</div>
										</div>
										<!-- product-full__purchased end -->

										<!-- product-full__reviews -->
										<div class="product-full__reviews" id="product-full-tab3">
											<!-- leave-review-form -->
											<div class="leave-review-form">
												<form action="#">
													<div class="row">
														<div class="col s12 m4">
															<div class="input-field"> <i class="material-icons prefix">account_circle</i> <input name="leave_review_name" type="text" placeholder="Ваше имя" /> </div>
														</div>
														<div class="col s12 m4">
															<div class="input-field"> <i class="material-icons prefix">email</i> <input name="leave_review_email" type="email" placeholder="E-mail адрес" /> </div>
														</div>
														<div class="col s12 m4">
															<div class="form-rules"> <span class="tooltip" data-tooltip="tooltip1">
																<i class="material-icons">help_outline</i><span class="tooltip__text">Правила публикации</span> </span>
																<div class="form-rules__text">E-mail на сайте не публикуется</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col s12">
															<div class="input-field"> <textarea name="leave_review_text" placeholder="Текст вашего отзыва" class="materialize-textarea js-textarea-autoresize"></textarea> </div>
														</div>
													</div>
													<div class="leave-review-form__buttons">
														<div class="row">
															<div class="col s12 m4">
																<div class="rating-stars active"> <span>Ваша оценка:</span>
																	<ul class="stars-list">
                                                                        <?php for ($k = 1;$k <= 5;$k++) { ?>
                                                                            <?php if ($k < $rating) { ?>
                                										        <li class="active"><i class="material-icons">star_rate</i></li>
                                                                            <?php } else { ?>
                                        										<li><i class="material-icons">star_rate</i></li>
                                                                            <?php } ?>
                                                                        <?php } ?>
																	</ul>
                                                                    <input type="hidden" name="rating_stars" />
                                                                </div>
															</div>
															<div class="col s12 m8"> <label class="upload-link">
																<i class="material-icons">file_upload</i>
																<span class="upload-link__text">Добавить фотографии</span>
																<input type="file" name="leave_review_files" />
															</label> <button class="btn-large btn-orange bold waves-effect waves-light" type="submit" name="action">Отправить</button> </div>
														</div>
													</div>
												</form>
											</div>
											<!-- leave-review-form end -->

											<!-- reviews -->
											<section class="reviews">
												<article class="review">
													<div class="review__top">
														<div class="review__top-left left">
															<div class="review__author">Ярослава<br /> Всеяславская</div>
															<ul class="stars-list">
																<li class="active"><i class="material-icons">star_rate</i></li>
																<li class="active"><i class="material-icons">star_rate</i></li>
																<li class="active"><i class="material-icons">star_rate</i></li>
																<li class="active"><i class="material-icons">star_rate</i></li>
																<li><i class="material-icons">star_rate</i></li>
															</ul>
														</div>
														<div class="review__top-right right">
															<div class="review__date"><i class="material-icons left">date_range</i><strong>Добавлено:</strong> 27 февраля 2016 года в 10:20</div>
														</div>
													</div>
													<div class="review__content">
														<p>Добавлю, что горизонт ожидания образует общекультурный цикл, таким образом, сходные законы контрастирующего развития характерны и для процессов в психике. Очевидно, что эйдос монотонно заканчивает канон биографии. Комплекс агрессивности
															заканчивает персональный катарсис.</p>
													</div>
													<div class="review__bottom">
														<div class="vote-useful">
															<div class="vote-useful__title">Полезен ли отзыв?</div>
															<div class="vote-useful__column">
																<div class="vote-useful__column-value vote-useful__column-value--orange js-vote-count-yes">29</div> <a href="#" class="waves-effect waves-light btn-orange js-vote-btn-yes"><i class="material-icons">thumb_up</i><span>да</span></a> </div>
															<div class="vote-useful__column">
																<div class="vote-useful__column-value vote-useful__column-value--gray js-vote-count-no">1</div> <a href="#" class="waves-effect waves-light btn-dark-gray js-vote-btn-no"><i class="material-icons">thumb_down</i><span>нет</span></a> </div>
														</div>
													</div>
												</article>
												<article class="review">
													<div class="review__top">
														<div class="review__top-left left">
															<div class="review__author">Регина<br /> Федоровна</div>
															<ul class="stars-list">
																<li class="active"><i class="material-icons">star_rate</i></li>
																<li class="active"><i class="material-icons">star_rate</i></li>
																<li class="active"><i class="material-icons">star_rate</i></li>
																<li class="active"><i class="material-icons">star_rate</i></li>
																<li><i class="material-icons">star_rate</i></li>
															</ul>
														</div>
														<div class="review__top-right right">
															<div class="review__date"><i class="material-icons left">date_range</i><strong>Добавлено:</strong> 20 февраля 2016 года в 20:45</div>
														</div>
													</div>
													<div class="review__content">
														<p>Фабула, следовательно, представляет собой сокращенный классицизм, однако само по себе состояние игры всегда амбивалентно. Богатство мировой литературы от Платона до Ортеги-и-Гассета свидетельствует о том, что эзотерическое выстраивает инвариант.
															Ролевое поведение аккумулирует героический миф, подобный исследовательский подход к проблемам художественной типологии можно обнаружить у К.Фосслера.</p>
														<p>Реконструктивный подход диссонирует фактографический постмодернизм. Художественная элита трансформирует определенный цвет. Экзистенциализм монотонно начинает механизм эвокации. Канон, в том числе, имитирует композиционный психологический
															параллелизм.</p>
													</div>
													<div class="review__bottom">
														<div class="vote-useful">
															<div class="vote-useful__title">Полезен ли отзыв?</div>
															<div class="vote-useful__column">
																<div class="vote-useful__column-value vote-useful__column-value--orange js-vote-count-yes">29</div> <a href="#" class="waves-effect waves-light btn-orange js-vote-btn-yes"><i class="material-icons">thumb_up</i><span>да</span></a> </div>
															<div class="vote-useful__column">
																<div class="vote-useful__column-value vote-useful__column-value--gray js-vote-count-no">1</div> <a href="#" class="waves-effect waves-light btn-dark-gray js-vote-btn-no"><i class="material-icons">thumb_down</i><span>нет</span></a> </div>
														</div>
													</div>
												</article>
											</section>
											<!-- reviews end -->
										</div>
										<!-- product-full__reviews end -->

										<!-- product-full__characteristics -->
										<div class="product-full__characteristics" id="product-full-tab4">
											<!-- similar-products -->
											<div class="similar-products">
												<!-- products-list -->
												<ul class="products-list">
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
								<div class="product-full-actions">
									<div class="product-full-actions__prices">
										<div class="product-full-actions__prices-title">Цена:</div>
										<div class="product__price product__price--large"><?php echo str_replace($getSymbolRight, '', $price); ?> <span class="ruble">o</span></div>
										<div class="product-availability"><i class="material-icons">check</i>В наличии</div>
									</div>
									<div class="product-full-actions__action">
										<ul class="product-full-actions__action-list">
											<li><a href="#" class="compare-link"><i class="material-icons">insert_chart</i>Сравнить</a></li>
											<li><a href="#" class="like-link"><span class="icon-heart-orange"></span>Отложить</a></li>
										</ul>
									</div>
									<div class="divider clearfix"></div>
									<div class="product-full-actions__buttons">
										<div class="input-field"> <input class="spinner" name="product_count1" value="1" /> </div>
										<div class="product-full-actions__buttons-left"> <a href="#modal-added-tocart" class="waves-effect waves-light btn-large bold btn-orange modal-trigger">Купить</a> </div>
										<div class="product-full-actions__buttons-right"> <a href="#modal-quick-order" class="waves-effect waves-light btn-large bold btn-blue modal-trigger">Быстрый заказ</a> </div>
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

<?php echo $footer; ?>

<?php /*

          <?php if ($thumb || $images) { ?>
          <ul class="thumbnails">
            <?php if ($thumb) { ?>
            <li><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php } ?>
            <?php if ($images) { ?>
            <?php foreach ($images as $image) { ?>
            <li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
            <?php if ($attribute_groups) { ?>
            <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
            <?php } ?>
            <?php if ($review_status) { ?>
            <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
            <?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php if ($site_key) { ?>
                  <div class="form-group">
                    <div class="col-sm-12">
                      <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                    </div>
                  </div>
                <?php } ?>
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
          </div>
        </div>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-4'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <div class="btn-group">
            <button type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
            <button type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>
          </div>
          <h1><?php echo $heading_title; ?></h1>
          <ul class="list-unstyled">
            <?php if ($manufacturer) { ?>
            <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
            <?php } ?>
            <li><?php echo $text_model; ?> <?php echo $model; ?></li>
            <?php if ($reward) { ?>
            <li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
            <?php } ?>
            <li><?php echo $text_stock; ?> <?php echo $stock; ?></li>
          </ul>
          <?php if ($price) { ?>
          <ul class="list-unstyled">
            <?php if (!$special) { ?>
            <li>
              <h2><?php echo $price; ?></h2>
            </li>
            <?php } else { ?>
            <li><span style="text-decoration: line-through;"><?php echo $price; ?></span></li>
            <li>
              <h2><?php echo $special; ?></h2>
            </li>
            <?php } ?>
            <?php if ($tax) { ?>
            <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
            <?php } ?>
            <?php if ($points) { ?>
            <li><?php echo $text_points; ?> <?php echo $points; ?></li>
            <?php } ?>
            <?php if ($discounts) { ?>
            <li>
              <hr>
            </li>
            <?php foreach ($discounts as $discount) { ?>
            <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
          <div id="product">
            <div class="form-group">
              <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
              <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
              <br />
              <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?></button>
            </div>
            <?php if ($minimum > 1) { ?>
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
            <?php } ?>
          </div>
          <?php if ($review_status) { ?>
          <div class="rating">
            <p>
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
              <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> / <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a></p>
            <hr>
            <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
            <!-- AddThis Button END -->
          </div>
          <?php } ?>
        </div>
      </div>
      <?php if ($products) { ?>
      <h3><?php echo $text_related; ?></h3>
      <div class="row">
        <?php $i = 0; ?>
        <?php foreach ($products as $product) { ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
        <?php } else { ?>
        <?php $class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <div class="product-thumb transition">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div class="caption">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <p><?php echo $product['description']; ?></p>
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
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
              <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <?php if (($column_left && $column_right) && ($i % 2 == 0)) { ?>
        <div class="clearfix visible-md visible-sm"></div>
        <?php } elseif (($column_left || $column_right) && ($i % 3 == 0)) { ?>
        <div class="clearfix visible-md"></div>
        <?php } elseif ($i % 4 == 0) { ?>
        <div class="clearfix visible-md"></div>
        <?php } ?>
        <?php $i++; ?>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
</div>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>
<?php echo $footer; ?>
*/ ?>