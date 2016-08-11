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
                 
				<div class="content-top__right-icon right"> <i class="material-icons prefix">account_balance_wallet</i> </div>
			</div>
			<!-- content-top end -->

				<!-- block-payment -->
				<div class="section block-payment">
					<h1>Оплата</h1>
					<!-- payment-steps -->
					<div class="payment-steps">
						<div class="row">
							<div class="col s12 m3 m20">
								<div class="payment-step">
									<h3>1. Резервируйте товар</h3>
									<ul class="payment-step-list">
										<li> <span class="icon-phone-orange"></span>
											<div class="payment-step-list__text">По телефону<br />8(495)189-21-69</div>
										</li>
										<li> <span class="icon-www"></span>
											<div class="payment-step-list__text">На сайте<br /> Simsilk.ru</div>
										</li>
									</ul>
								</div>
							</div>
							<div class="col s12 m5 m40">
								<div class="payment-step payment-step--item2">
									<h3>2. Выберите способ оплаты</h3>
									<div class="row">
										<div class="col s12 m6">
											<ul class="payment-step-list">
												<li> <span class="icon-pay-orange"></span>
													<div class="payment-step-list__text">Безналичный<br /> платеж</div>
												</li>
												<li> <span class="icon-pay2-orange"></span>
													<div class="payment-step-list__text">Оплата<br /> наличными</div>
												</li>
											</ul>
										</div>
										<div class="col s12 m6">
											<ul class="payment-step-list">
												<li> <span class="icon-pay3-orange"></span>
													<div class="payment-step-list__text">Электронными<br /> деньгами</div>
												</li>
												<li> <span class="icon-pay4-orange"></span>
													<div class="payment-step-list__text">Банковским<br /> переводом</div>
												</li>
											</ul>
										</div>
									</div>
									<div class="payment-step__decor"></div>
								</div>
							</div>
							<div class="col s12 m4 m40">
								<div class="payment-step payment-step--last">
									<h3>3. Получите свой заказ</h3>
									<div class="row">
										<div class="col s12 m6">
											<div class="payment-step__info"> <span class="icon-car-orange"></span>
												<p>Доставка курьером или Почтой России</p>
											</div>
										</div>
										<div class="col s12 m6">
											<div class="payment-step__info"> <span class="icon-doc-orange"></span>
												<p>Получение товара и сопроводительных документов</p>
											</div>
										</div>
									</div>
									<div class="payment-step__decor"></div>
								</div>
							</div>
						</div>
					</div>
					<!-- payment-steps end -->
					<!-- payment-methods -->
					<div class="payment-methods">
						<h2>Произвести оплату можно следующими способами</h2>
						<div class="row">
							<div class="col s12 m6">
								<div class="payment-method">
									<div class="payment-method__image"> <img src="design/pic/payment-methods/payment-method-01.png" alt="image" /> </div>
									<div class="payment-method__content">
										<h3>Наличными курьеру</h3>
										<p>Оплата наличными курьеру непосредственно в момент осуществления доставки (только при доставке по Москве и Подмосковью).</p>
									</div>
								</div>
								<div class="payment-method">
									<div class="payment-method__image"> <img src="design/pic/payment-methods/payment-method-02.png" alt="image" /> </div>
									<div class="payment-method__content">
										<h3>Картой VISA или MasterCard</h3>
										<p>При получении товара, а также при самовывозе. Пожалуйста, при подтверждении заказа сообщите оператору, что хотите оплатить заказ картой курьеру.</p>
									</div>
								</div>
							</div>
							<div class="col s12 m6">
								<div class="payment-method">
									<div class="payment-method__image"> <img src="design/pic/payment-methods/payment-method-03.png" alt="image" /> </div>
									<div class="payment-method__content">
										<h3>Электронными деньгами Яндекс.Деньги или WebMoney</h3>
										<p>При подтверждении заказа наши операторы сообщат точную сумму к оплате и реквизиты электронного кошелька.</p>
									</div>
								</div>
								<div class="payment-method">
									<div class="payment-method__image"> <img src="design/pic/payment-methods/payment-method-04.png" alt="image" /> </div>
									<div class="payment-method__content">
										<h3>Безналичным переводом</h3>
										<p>После подтверждения заказа присылайте нам на электронную почту свои реквизиты, чтобы мы выставили счет. Предлагаем организациям выгодные условия сотрудничества и индивидуальный подход к формированию корпоративных заказов.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- payment-methods end -->
					<!-- payment-other -->
					<div class="payment-other">
						<div class="row">
							<div class="col m6 s12">
								<h2>Отказ от заказа</h2>
								<div class="payment-blockquote">
									<p>Если по какой-то причине покупатель отказывается от получения и оплаты товара надлежащего качества, то необходимо компенсировать расходы компании, связанные с доставкой товара (согласно п.3 ст.497 ГК РФ), т.е. оплатить работу курьера, что составляет
										от 200 до 500 рублей, в зависимости от веса заказа.</p>
									<p>В случае фабричного брака (что бывает крайне редко) мы всегда бесплатно приедем и заменим бракованный комплект на такой же или любой другой на Ваш выбор.</p>
								</div>
							</div>
							<div class="col m6 s12">
								<h2>Возврат или обмен товара</h2>
								<div class="payment-blockquote">
									<p>Обмен или возврат товара надлежащего качества может быть произведен потребителем в течение 365 дней в офисе компании в случае, если сохранены товарный вид и потребительские свойства товара (сохранена целостность упаковки и сохранена правильность
										фабричной укладки товара внутри упаковки). </p>
									<p>Возврат денег осуществляется на месте за вычетом расходов, понесенных компанией на доставку данного заказа (если товар доставлялся курьером).</p>
								</div>
							</div>
						</div>
					</div>
					<!-- payment-other end -->
				</div>
				<!-- block-payment end -->

		</div>
		<!-- container end -->
	</main>
	<!-- MAIN CONTENT [END] -->

<?php echo $footer; ?>