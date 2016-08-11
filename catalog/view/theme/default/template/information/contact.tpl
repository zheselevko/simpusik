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

				<div class="content-top__right-icon right"> <i class="material-icons">map</i> </div>
			</div>
			<!-- content-top end -->

				<!-- block-contacts -->
				<div class="section block-contacts">
					<h1>Контактная информация</h1>
					<div class="row">
						<div class="col s12 m7">
							<div class="contacts-maps">
								<ul class="tabs">
									<li class="tab col s12 m6"><a class="active" href="#contacts-map1">Яндекс.Карты</a></li>
									<li class="tab col s12 m6"><a href="#contacts-map2">Google Maps</a></li>
								</ul>
								<div id="contacts-map1" class="contacts-maps-item">
									<div id="yandex-map-contacts" class="map" data-left="55.837560776866766" data-right="37.44540149999996" data-zoom="16" data-placemark-left="55.837560776866766" data-placemark-right="37.44540149999996"></div>
								</div>
								<div id="contacts-map2" class="contacts-maps-item">
									<div class="map" id="google-map-contacts">
                                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2240.530671556747!2d37.457676516072944!3d55.83610509303139!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46b548081927c249%3A0x56a2ac698b5690a3!2z0JvQvtC00L7Rh9C90LDRjyDRg9C7LiwgNiwg0JzQvtGB0LrQstCwLCAxMjUzNjI!5e0!3m2!1sru!2sru!4v1468414825939" width="635" height="444" frameborder="0" style="border:0" allowfullscreen></iframe>
                                    </div>
								</div>
							</div>
							<div class="contacts-leave-message">
								<h2>Оставьте сообщение</h2>
								<form id="form-contacts-message" >
									<div class="row">
										<div class="col s12 m4">
											<div class="input-field"> <i class="material-icons prefix">account_circle</i> <input name="contacts_leave_message_name" type="text" placeholder="Ваше имя" /> </div>
										</div>
										<div class="col s12 m4">
											<div class="input-field"> <i class="material-icons prefix">stay_current_portrait</i> <input name="contacts_leave_message_tel" id="icon_prefix" type="tel" placeholder="Номер телефона" /> </div>
										</div>
										<div class="col s12 m4">
											<div class="input-field"> <i class="material-icons prefix">email</i> <input name="contacts_leave_message_email" id="icon_prefix" type="email" placeholder="E-mail" /> </div>
										</div>
									</div>
									<div class="row">
										<div class="col s12"> <textarea name="contacts_leave_message_text" placeholder="Текст вашего сообщения" class="materialize-textarea js-textarea-autoresize"></textarea> </div>
									</div>
									<div class="row">
										<div class="col s12 center-align">
											<div class="contacts-leave-message__buttons center-align"> <button class="btn-large btn-orange bold waves-effect waves-light" type="submit" name="action">Отправить</button> </div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="col s12 m5 vcard">
							<div class="contacts-items">
								<div class="contacts-item">
									<div class="contacts-item__image valign-wrapper"> <img class="valign" src="design/pic/contacts/contacts-01.png" alt="image" /> </div>
									<div class="contacts-item__content adr">
									<span class="category" style="display:none;">Интернет-магазин</span>
   <span class="fn org" style="display:none;">"Simsilk"</span>
										<h3>Адрес:</h3>
										<p>125363, Россия,  <span class="locality">Москва</span>, <span class="street-address">улица Лодочная, д. 6, корп. 216-1, офис 611</span></p>
									</div>
								</div>
								<div class="contacts-item">
									<div class="contacts-item__image valign-wrapper"> <img class="valign" src="design/pic/contacts/contacts-02.png" alt="image" /> </div>
									<div class="contacts-item__content">
										<h3>Как связаться:</h3>
										<div class="contacts-item__content-phones">
											<div class="contacts-item__content-phones-left">Телефоны:</div>
											<div class="contacts-item__content-phones-right"> <strong class="bold tel"><?php echo $phone1; ?></strong> <strong class="bold tel"><?php echo $phone2; ?></strong> </div>
										</div>
										<p>Электронная почта: <a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a></p>
										<p class="icon-phone-green">WhatsApp: <strong class="bold">+7 (926) 277-04-10</strong></p>
										<p class="icon-phone-violet">Viber: <strong class="bold">+7 (926) 277-04-10</strong></p>
									</div>
								</div>
								<div class="contacts-item">
									<div class="contacts-item__image valign-wrapper"> <img class="valign" src="design/pic/contacts/contacts-03.png" alt="image" /> </div>
									<div class="contacts-item__content workhours">
										<h3>Часы работы:</h3>
										<p>Понедельник - Пятница: <strong class="bold">с 9:00 по 19:00</strong><br /> Суббота: <strong class="bold">выходной</strong><br /> Воскресенье: <strong class="bold">выходной</strong></p>
										<p>Если вы заполнили форму заявки в нерабочее время - специалист свяжется с вами в ближайший рабочий час.</p>
									</div>
								</div>
								<div class="contacts-item">
									<div class="contacts-item__image valign-wrapper"> <img class="valign" src="design/pic/contacts/contacts-04.png" alt="image" /> </div>
									<div class="contacts-item__content">
										<h3>Реквизиты:</h3>
										<p>Наименование: общество с ограниченной ответственностью "Симсилк"</p>
										<p><strong>ИНН</strong> 7734579930<br /> <strong>КПП</strong> 773401001<br /> <strong>ОГРН</strong> 1087746304557<br /> <strong>ОКПО</strong> 84871993<br /> <strong>ОКВЭД:</strong> 51.34 52.25 51.70</p>
										<p>Банк: "Сбербанк России" (ПАО)<br /> Р/счет: 40702810738040024399<br /> К/счет: 30101810400000000225</p>
										<p>Местонахождение банка: 117997, г. Москва, ул. Вавилова, д. 19</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- block-contacts end -->

		</div>
		<!-- container end -->
	</main>
	<!-- MAIN CONTENT [END] -->

	<!-- Yandex map -->
	<script src="http://api-maps.yandex.ru/2.0/?load=package.full&amp;lang=ru-RU"></script>

<?php echo $footer; ?>
