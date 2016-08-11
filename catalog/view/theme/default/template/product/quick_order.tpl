		<!-- modal-quick-order -->
		<div id="modal-quick-order" class="modal modal-quick-order">
			<div class="modal-header">
			    <h2>Быстрый заказ</h2>
		    </div>

			<div class="modal-content">
			    <form id="form-quick-order">
			        <input type="hidden" name="a" value="o" />
			        <input type="hidden" name="form_id" value="NTA6MTowOjE6NTM5OQ==" />
			        <input type="hidden" name="product_id" value="<?php echo $product['product_id']; ?>" />
					<table class="bordered centered modal-quick-order-table">
						<tbody>
							<tr>
								<td class="col-image">
								<a href="<?php echo $product['href']; ?>" class="product__image">
									<img class="responsive-img" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
								</a>
								</td>
								<td class="col-title">
    								<h4 class="product__title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
    								<ul class="stars-list">
                                        <?php for ($k = 1;$k <= 5;$k++) { ?>
                                            <?php if ($k < $product['rating']) { ?>
                        					    <li class="active"><i class="material-icons">star_rate</i></li>
                                            <?php } else { ?>
                                			    <li><i class="material-icons">star_rate</i></li>
                                            <?php } ?>
                                        <?php } ?>
    								</ul>
								</td>
								<td class="col-index">
									<div class="product__index">Артикул: <?php echo $product['model']; ?></div>
								</td>
								<td class="col-action">
									<div class="product__price"><?php echo str_replace($getSymbolRight, '', $product['price']); ?> <span class="ruble">o</span></div>
									<div class="input-field">
                                        <input class="spinner" name="quantity" value="1" />
                                    </div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="modal-quick-order-form">
						<div class="row">
							<div class="col s12 m6">
								<div class="input-field">
                                    <i class="material-icons prefix">account_circle</i>
                                    <input name="fields[field_firstname]" type="text" placeholder="Ваше имя" />
                                </div>
							</div>
							<div class="col s12 m6">
								<div class="input-field">
                                    <i class="material-icons prefix">stay_current_portrait</i>
                                    <input name="fields[field_telephone]" id="icon_prefix" type="tel" placeholder="Номер телефона" />
                                </div>
							</div>
						</div>
						<div class="row">
						<div class="col s12">
							<textarea name="fields[field_address]" placeholder="Ваш адрес" class="materialize-textarea js-textarea-autoresize"></textarea>
						</div>
						</div>
						<div class="row">
							<div class="col s12 center-align">
							<div class="modal-quick-order-form__buttons center-align">
								<button class="btn-large btn-orange bold waves-effect waves-light" type="submit">Отправить</button>
							</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<a class="modal-close js-modal-close"></a>

        </div>
	<!-- modal-quick-order end -->