<?php include ("header.php") ?>
	
	<!-- BEGIN content -->
	<div class="content wrap clearfix">
		<!-- BEGIN content-main -->
		<div class="content-main">
		
			<!-- BEGIN breadcrumbs -->
			<ul class="breadcrumbs">
				<li><a href="/">Главная</a></li>
				<li class="arrow"></li>
				<li>Оформление заказа</li>
			</ul>
			<!-- END breadcrumbs -->
			
			<h1>Оформление заказа</h1>
			
			<!-- BEGIN form-basket -->
			<form action="#" class="form-basket">
				<h3>Информация о заказе</h3>
				
				<div class="form-table">
					<div class="row">
						<div class="coll-row">Изображение</div>
						<div class="coll-row">Наименование</div>
						<div class="coll-row">Цена, руб.</div>
						<div class="coll-row">Кол-во</div>
						<div class="coll-row">Сумма, руб.</div>
						<div class="coll-row">Удалить</div>
					</div>
					<div class="row">
						<div class="coll-row"><img src="images/basket.jpg" alt=""></div>
						<div class="coll-row"><a href="#">Комплект постельного белья Silk Place SP-018</a></div>
						<div class="coll-row">4 600</div>
						<div class="coll-row"><input type="text" placeholder="11"></div>
						<div class="coll-row">50 600</div>
						<div class="coll-row"><a href="#" class="form-remove"></a></div>
					</div>
					<div class="row">
						<div class="coll-row"><img src="images/basket.jpg" alt=""></div>
						<div class="coll-row"><a href="#">Комплект постельного белья Silk Place SP-018</a></div>
						<div class="coll-row">4 600</div>
						<div class="coll-row"><input type="text" placeholder="11"></div>
						<div class="coll-row">50 600</div>
						<div class="coll-row"><a href="#" class="form-remove"></a></div>
					</div>
				</div>
				
				<h3>Контактные данные</h3>
				
				<div class="form-contacts clearfix"> 
					<div class="form-contacts-block left"> 
						<div class="row">
							<div class="coll-row"><label for="name">Имя: <span class="star">*</span></label></div>
							<div class="coll-row"><input id="name" type="text" required></div>
						</div>
						<div class="row">
							<div class="coll-row"><label for="email">Email: <span class="star">*</span></label></div>
							<div class="coll-row"><input id="email" type="email" required></div>
						</div>
					</div>
					
					<div class="form-contacts-block right">
						<div class="row">
							<div class="coll-row"><label for="tel">Телефон: <span class="star">*</span></label></div>
							<div class="coll-row"><input type="tel" id="tel" required></div>
						</div>
						<div class="row">
							<div class="coll-row"><label for="address">Адрес:</label></div>
							<div class="coll-row"><input type="text" id="address"></div>
						</div>
					</div>
				</div>
				
				<h3>Доставка и оплата</h3>
				
				<div class="form-contacts clearfix">
					<div class="form-delivery">
						<label for="address-delivery">Адрес доставки: <span class="star">*</span></label><input type="text" id="address-delivery"  required>
					</div>
					<div class="form-delivery-select">
						<div>Способ доставки</div>
						<select id="delivery-select">
							<option value="">курьером до МКАД</option>
							<option value="">что-тоТамЕщё</option>
							<option value="">что-тоТамЕщё</option>
							<option value="">что-тоТамЕщё</option>
							<option value="">что-тоТамЕщё</option>
						</select>
						<div>Способ оплаты</div>
						<select id="pay-select">
							<option value="">наличными курьеру</option>
							<option value="">что-тоТамЕщё</option>
							<option value="">что-тоТамЕщё</option>
							<option value="">что-тоТамЕщё</option>
							<option value="">что-тоТамЕщё</option>
						</select>
					</div>
				</div>
				<div class="form-required"><span class="star">*</span> поля обязательные для заполнения</div>
				
				<div class="form-btn clearfix">
					<a href="#" class="back-catalog left">Продолжить покупки</a>
					<input class="checkout-btn right" type="submit" value="оформить заказ">
				</div>
			</form>
			<!-- END form-basket -->
			
			<!-- BEGIN content-block -->
			<div class="content-block"> 
				<div class="heading"><span>Рекомендуем</span></div>
				<div class="content-product clearfix">
					<!-- BEGIN content-product-inner -->
					<div class="content-product-inner"> 
						<a href="#">
							<img src="images/img9.jpg" alt="">
							<span class="product-title">Наволочка Luxberry "ЭЛЕГИЯ"</span>
						</a>
						
						<div class="product-rating-price">
							<div class="rating">
								<div class="product-rating">		
									<span class="rating-value">&#9733;</span>
									<span class="rating-value">&#9733;</span>
									<span class="rating-value">&#9733;</span>
									<span class="rating-value">&#9733;</span>
									<span class="rating-value">&#9733;</span>
								</div>
								<span class="number">(9)</span>
							</div>
							
							<div class="product-price-wrap clearfix">
								<div class="product-price">
									1740 руб.
									<span class="discount-price">2350 руб.</span>
								</div>
								<a href="#" class="product-basket"></a>
							</div>
						</div>
					</div>
					<!-- END content-product-inner -->
					
					<!-- BEGIN content-product-inner -->
					<div class="content-product-inner"> 
						<a href="#">
							<img src="images/img10.jpg" alt="">
							<span class="product-title">Вафельный набор MARINE Maison D`or</span>
						</a>
						
						<div class="product-rating-price">
							<div class="rating">
								<div class="product-rating">		
									<span class="rating-value">&#9733;</span>
									<span class="rating-value">&#9733;</span>
									<span class="rating-value">&#9733;</span>
									<span class="rating-value">&#9733;</span>
									<span class="rating-value">&#9733;</span>
								</div>
								<span class="number">(34)</span>
							</div>
							
							<div class="product-price-wrap clearfix">
								<div class="product-price">
									6000 руб.
									<span class="discount-price">7120 руб.</span>
								</div>
								<a href="#" class="product-basket"></a>
							</div>
						</div>
					</div>
					<!-- END content-product-inner -->
					
					<!-- BEGIN content-product-inner -->
					<div class="content-product-inner"> 
						<a href="#">
							<img src="images/img11.jpg" alt="">
							<span class="product-title">Комплект постельного белья Asabella 698</span>
						</a>
						
						<div class="product-rating-price">
							<div class="rating">
								<div class="product-rating">		
									<span class="rating-value">&#9733;</span>
									<span class="rating-value">&#9733;</span>
									<span class="rating-value">&#9733;</span>
									<span class="rating-value">&#9733;</span>
									<span class="rating-value">&#9733;</span>
								</div>
								<span class="number">(34)</span>
							</div>
							
							<div class="product-price-wrap clearfix">
								<div class="product-price">
									6000 руб.
									<span class="discount-price">7120 руб.</span>
								</div>
								<a href="#" class="product-basket"></a>
							</div>
						</div>
					</div>
					<!-- END content-product-inner -->
					
					<!-- BEGIN content-product-inner -->
					<div class="content-product-inner"> 
						<a href="#">
							<img src="images/img12.jpg" alt="">
							<span class="product-title">Комплект постельного белья Sofi De MarkO Эдита</span>
						</a>
						
						<div class="product-rating-price">
							<div class="rating">
								<div class="product-rating">		
									<span class="rating-value">&#9733;</span>
									<span class="rating-value">&#9733;</span>
									<span class="rating-value">&#9733;</span>
									<span class="rating-value">&#9733;</span>
									<span class="rating-value">&#9733;</span>
								</div>
								<span class="number">(59)</span>
							</div>
							
							<div class="product-price-wrap clearfix">
								<div class="product-price">
									6800 руб.
									<span class="discount-price">7550 руб.</span>
								</div>
								<a href="#" class="product-basket"></a>
							</div>
						</div>
					</div>
					<!-- END content-product-inner -->
				</div>
				<div class="btn-more right"><a href="#">Показать еще</a></div>
			</div>
			<!-- END content-block -->
		</div>
		<!-- END content-main -->
		
		<!-- BEGIN sidebar-wrap -->
		<aside class="sidebar-wrap">
			<div class="sidebar">
				<!-- BEGIN content-block -->
				<div class="content-block"> 
					<div class="heading"><span>Каталог товаров</span></div>
					<ul class="sidebar-menu">
						<li><a class="sidebar-menu-item1" href="#">Постельное белье (<span>89</span>)</a></li>
						<li><a class="sidebar-menu-item2" href="#">Одеяла и подушки (<span>127</span>)</a></li>
						<li><a class="sidebar-menu-item3" href="#">Пледы (<span>84</span>)</a></li>
						<li><a class="sidebar-menu-item4" href="#">Детские товары (<span>59</span>)</a></li>
						<li><a class="sidebar-menu-item5" href="#">Текстиль для ванной (<span>156</span>)</a></li>
						<li><a class="sidebar-menu-item6" href="#">Текстиль для кухни (<span>49</span>)</a></li>
						<li><a class="sidebar-menu-item7" href="#">Сопутствующие товары (<span>187</span>)</a></li>
					</ul>
				</div>
				<!-- END content-block -->
			</div>	
		</aside>
		<!-- END sidebar-wrap -->
	</div>
	<!-- END content -->
	
<?php include ("footer.php") ?>