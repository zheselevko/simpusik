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
                 
				<div class="content-top__right-icon right"> <i class="material-icons">local_shipping</i> </div>
			</div>
			<!-- content-top end -->

				<!-- block-delivery -->
				<div class="section block-delivery">
					<h1>Доставка</h1>
					<div class="delivery-map">
						<div id="yandex-map-delivery" class="map" data-left="55.75399399999374" data-right="37.62209300000001" data-zoom="9" data-placemark-left="55.75399399999374" data-placemark-right="37.62209300000001"></div>
					</div>
					<div class="delivery-info">
						<h2>Доставка по Москве внутри МКАД</h2>
						<div class="row row--nm js-delivery-slider">
							<div class="col s12 m20">
								<div class="delivery-info-item">
									<div class="delivery-info-item__image"> <img src="design/pic/delivery/delivery-01.png" alt=""> </div>
									<h3>Курьером</h3>
									<p>Бесплатная доставка в пределах Московской Кольцевой Автомобильной Дороги</p>
								</div>
							</div>
							<div class="col s12 m20">
								<div class="delivery-info-item">
									<div class="delivery-info-item__image"> <img src="design/pic/delivery/delivery-02.png" alt=""> </div>
									<h3>Время доставки</h3>
									<p>С понедельника по субботу с 9 до 22</p>
								</div>
							</div>
							<div class="col s12 m20">
								<div class="delivery-info-item">
									<div class="delivery-info-item__image"> <img src="design/pic/delivery/delivery-03.png" alt=""> </div>
									<h3>Стоимость</h3>
									<p>Cтоимость доставки заказов суммой менее 2000 рублей — всего 100 руб.</p>
								</div>
							</div>
							<div class="col s12 m20">
								<div class="delivery-info-item">
									<div class="delivery-info-item__image"> <img src="design/pic/delivery/delivery-04.png" alt=""> </div>
									<h3>Минимальная сумма</h3>
									<p>Минимальная сумма заказа для доставки курьером составляет 1000 рублей.</p>
								</div>
							</div>
							<div class="col s12 m20">
								<div class="delivery-info-item">
									<div class="delivery-info-item__image"> <img src="design/pic/delivery/delivery-05.png" alt=""> </div>
									<h3>Расписание</h3>
									<p>Доставка товара возможна в день заказа</p>
								</div>
							</div>
						</div>
					</div>
					<div class="delivery-info">
						<h2>Доставка по Московской обл. и Москве (за МКАД)</h2>
						<div class="row row--nm">
							<div class="col s12 m20">
								<div class="delivery-info-item">
									<div class="delivery-info-item__image"> <img src="design/pic/delivery/delivery-01.png" alt=""> </div>
									<h3>Курьером</h3>
									<p>Бесплатная доставка в пределах Московской Кольцевой Автомобильной Дороги</p>
								</div>
							</div>
							<div class="col s12 m60">
								<div class="delivery-info-paths">
									<div class="delivery-info-paths__table">
										<div class="delivery-info-path"> <input type="radio" name="delivery_info_path" id="delivery_info_path1"> <label for="delivery_info_path1">
											<div class="delivery-info-path__top">0-3 км</div>
											<div class="delivery-info-path__round"></div>
											<div class="delivery-info-path__bottom">100 руб</div>
										</label> </div>
										<div class="delivery-info-path"> <input type="radio" name="delivery_info_path" id="delivery_info_path2" checked> <label for="delivery_info_path2">
											<div class="delivery-info-path__top">3-5 км</div>
											<div class="delivery-info-path__round"></div>
											<div class="delivery-info-path__bottom">150 руб</div>
										</label> </div>
										<div class="delivery-info-path"> <input type="radio" name="delivery_info_path" id="delivery_info_path3"> <label for="delivery_info_path3">
											<div class="delivery-info-path__top">5-10 км</div>
											<div class="delivery-info-path__round"></div>
											<div class="delivery-info-path__bottom">200 руб</div>
										</label> </div>
										<div class="delivery-info-path"> <input type="radio" name="delivery_info_path" id="delivery_info_path4"> <label for="delivery_info_path4">
											<div class="delivery-info-path__top">10-15 км</div>
											<div class="delivery-info-path__round"></div>
											<div class="delivery-info-path__bottom">300 руб</div>
										</label> </div>
									</div>
									<div class="delivery-info-paths__note">(минимальная сумма заказа 3000 руб.)</div>
								</div>
							</div>
							<div class="col s12 m20">
								<div class="delivery-info-item valign-wrapper">
									<p class="valign">Также вы можете подъехать за своим заказом к ближайшей станции метро в заранее обговоренный с оператором временной интервал или забрать заказ у нас в офисе.</p>
								</div>
							</div>
						</div>
					</div>
					<article class="delivery-text">
						<h2>Доставка по России</h2>
						<div class="row">
							<div class="col s12 m6 push-m6 right-align"> <img class="responsive-img" src="design/pic/delivery/delivery-map-01.jpg" alt=""> </div>
							<div class="col s12 m6 pull-m6">
								<p>Доставка заказов в регионы осуществляется Почтой России и транспортными компаниями.<br /> Минимальная сумма заказа для отправки почтой и транспортными компаниями составляет 5000 руб.<br /> Отправка заказа осуществляется после 100% предоплаты на
									наш банковский счет.</p>
								<p>После того, как Вы сделали заказ, мы свяжемся с Вами по телефону или электронной почте. Подтвердим наличие товара на складе, подсчитаем итоговую стоимость заказа с доставкой и скидкой.</p>
								<p>Оплатить заказ можно банковской картой прямо на нашем сайте. Если нужно, то мы вышлем квитанцию с нашими банковскими реквизитами для оплаты в любом отделении банка.<br /> Мы обязуемся выслать заказ в Ваш адрес в течение 3 дней после поступления
									денег на наш банковский счет.</p>
							</div>
						</div>
					</article>
				</div>
				<!-- block-delivery end -->

		</div>
		<!-- container end -->
	</main>
	<!-- MAIN CONTENT [END] -->

	<!-- Yandex map -->
	<script src="http://api-maps.yandex.ru/2.0/?load=package.full&amp;lang=ru-RU"></script>
    
<?php echo $footer; ?>