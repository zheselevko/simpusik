	<!-- modal-callback -->
	<div id="modal-callback" class="modal modal-callback" style="display:block !important;">
		<div class="modal-header">
			<h2>Заказать звонок</h2>
		</div>
		<div class="modal-content">
			<div class="modal-callback-form">
				<form action="#" id="form-callback">
					<div class="row">
						<div class="col s12 m6">
							<div class="input-field">
								<i class="material-icons prefix">account_circle</i>
								<input name="modal_callback_name" type="text" placeholder="Ваше имя" />
							</div>
						</div>
						<div class="col s12 m6">
							<div class="input-field">
								<i class="material-icons prefix">stay_current_portrait</i>
								<input name="modal_callback_phone" id="icon_prefix" type="tel" placeholder="Номер телефона" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col s12 center-align">
							<div class="modal-callback-form__buttons center-align">
								<button id="button-callback" class="btn-large btn-orange bold waves-effect waves-light" type="submit" name="action">Отправить</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<a href="#" class="modal-close js-modal-close"></a>
	</div>
	<!-- modal-callback end -->

	<!-- modal-message -->
	<div id="modal-message" class="modal modal-message">
		<div class="modal-header">
			<h2 id="modal-message-text">success</h2>
		</div>
		<a href="#" class="modal-close js-modal-close"></a>
	</div>
	<!-- modal-message end -->

    <?php /*
	<!-- modal-added-tocart -->
	<div id="modal-added-tocart" class="modal modal-added-tocart">
		<div class="modal-header">
			<h2>Товар добавлен в корзину</h2>
		</div>
		<div class="modal-content">
			<div class="modal-added-tocart__buttons">
				<div class="row">
					<div class="col s12 m6 m48-5">
						<a class="waves-effect waves-light btn-large bold btn-orange">Перейти в корзину</a>
					</div>
					<div class="col s12 m6 m51-5">
						<a class="waves-effect waves-light btn-large bold btn-blue js-modal-close">Продолжить покупки</a>
					</div>
				</div>
			</div>
		</div>
		<a href="#" class="modal-close js-modal-close"></a>
	</div>
	<!-- modal-added-tocart end -->
    */ ?>

	<!-- modal-quick-order -->
	<div id="modal-quick-order" class="modal modal-quick-order">
		<div class="modal-header">
			<h2>Быстрый заказ</h2>
		</div>
		<div class="modal-content">
			<form action="#">
				<table class="bordered centered modal-quick-order-table">
					<tbody>
						<tr>
							<td class="col-image">
								<a href="#" class="product__image">
									<img class="responsive-img" src="design/pic/products-table/product-table-01.jpg" alt="" />
								</a>
							</td>
							<td class="col-title">
								<h4 class="product__title"><a href="#">Постельное белье cs557-3</a></h4>
								<ul class="stars-list">
									<li class="active"><i class="material-icons">star_rate</i></li>
									<li class="active"><i class="material-icons">star_rate</i></li>
									<li class="active"><i class="material-icons">star_rate</i></li>
									<li class="active"><i class="material-icons">star_rate</i></li>
									<li><i class="material-icons">star_rate</i></li>
								</ul>
							</td>
							<td class="col-index">
								<div class="product__index">Артикул: fdgdd-732</div>
							</td>
							<td class="col-action">
								<div class="product__price">6,200 <span class="ruble">o</span></div>
								<div class="input-field">
									<input class="spinner" name="product_count1" value="1" />
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
								<input name="modal_quick_order_name" type="text" placeholder="Ваше имя" />
							</div>
						</div>
						<div class="col s12 m6">
							<div class="input-field">
								<i class="material-icons prefix">stay_current_portrait</i>
								<input name="modal_quick_order_phone" id="icon_prefix" type="tel" placeholder="Номер телефона" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col s12">
							<textarea name="modal_quick_order_text" placeholder="Ваш адрес" class="materialize-textarea js-textarea-autoresize"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="col s12 center-align">
							<div class="modal-quick-order-form__buttons center-align">
								<button class="btn-large btn-orange bold waves-effect waves-light" type="submit" name="action">Отправить</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<a href="#" class="modal-close js-modal-close"></a>
	</div>
	<!-- modal-quick-order end -->