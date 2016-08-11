
    <?php require_once DIR_TEMPLATE . 'default/template/common/callback.tpl'; ?>
    <?php require_once DIR_TEMPLATE . 'default/template/common/add_to_cart.tpl'; ?>
    <?php require_once DIR_TEMPLATE . 'default/template/common/add_to_compare.tpl'; ?>
    <?php require_once DIR_TEMPLATE . 'default/template/common/add_to_wishlist.tpl'; ?>
    <?php require_once DIR_TEMPLATE . 'default/template/product/quick_order.tpl'; ?>
    <?php require_once DIR_TEMPLATE . 'default/template/common/testimonial_form.tpl'; ?>


	<!-- footer -->
	<footer class="page-footer">
		<div class="container">
			<div class="row page-footer__top">
				<div class="col m3 s12">
					<div class="page-footer__logo">
						<span class="hidden-link brand-logo" data-link="/" >Logo</span>
					</div>
				</div>
				<div class="col m5 s12">
					<div class="page-footer__menu">
						<div class="row">
							<div class="col m6 s12">
								<ul class="footer-list">
								<!--noindex-->
            						<li><span class="hidden-link" data-link="<?php echo $about_us; ?>">О компании</span></li>
            						<li><span class="hidden-link" data-link="<?php echo $special; ?>">Акции</span></li>
            						<li><span class="hidden-link" data-link="<?php echo $delivery; ?>">Доставка</span></li>
            						<li><span class="hidden-link" data-link="<?php echo $payment; ?>">Оплата</span></li>
            						<!--/noindex-->
								</ul>
							</div>
							<div class="col m6 s12">
								<ul class="footer-list">
									<!--noindex-->
									<li><span class="hidden-link" data-link="<?php echo $review; ?>">Отзывы</span></li>
            						<li><span class="hidden-link" data-link="<?php echo $blog; ?>">Новости</span></li>
            						<li><span class="hidden-link" data-link="<?php echo $contacts; ?>">Контакты</span></li>
            						<!--/noindex-->
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col m4 s12">
					<div class="page-footer__search">
                        <?php echo $search_footer; ?>
						<div class="row">
							<div class="col m6 s12">
								<ul class="footer-contacts-list">
									<li><div class="contact-email-item">E-mail: <a href="mailto:<?php echo $email; ?>" title="Email"><?php echo $email; ?></a><br /> Ежедневно <?php echo $open; ?></div></li>
									<li>
                                        <div class="contact-address-item">
                                            <?php echo $address_part[0]; ?>
                                            <?php if (isset($address_part[1])) { ?>
        						                <br><?php echo $address_part[1]; ?>
                                            <?php } ?>
                                        </div>
                                    </li>
								</ul>
							</div>
							<div class="col m6 s12">
								<ul class="footer-contacts-list">
									<li><div class="contact-phone-item"><strong><?php echo $phone1; ?></strong>отдел консультаций</div></li>
									<li><div class="contact-phone-item"><strong><?php echo $phone2; ?></strong>отдел гарантии и возврата</div></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row page-footer__bottom">
				<div class="col m3 s12">
					<div class="page-footer__contacts valign-wrapper">
						<i class="material-icons valign">info_outline</i>
						<div class="contact-email-item valign">E-mail адрес: <a href="mailto:<?php echo $email; ?>" title="Email"><?php echo $email; ?></a><br />
						Работаем ежедневно <?php echo $open; ?></div>
					</div>
				</div>
				<div class="col m9 s12">
					<div class="page-footer__social">
						<span>Мы в социальных сетях:</span>
						<a href="https://vk.com/simsilk" class="icon-vk" title="Vkontakte"></a>
						<a href="#" class="icon-odn" title="Odnoklassniki"></a>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-copyright">
			<div class="container">
				<div class="footer-copyright__text">&copy; 2015–2016, Интернет-магазин постельного белья “Simsilk”</div>
			</div>
		</div>
	</footer>
	<!-- footer END -->

	<!-- header-mobile -->
	<div class="header-mobile header-mobile--footer">
		<!-- header-mobile__main -->
		<div class="header-mobile__main">
			<div class="container">
				<i class="material-icons header-mobile-menu-link">menu</i>
				<i class="material-icons header-mobile-search-link">search</i>
				<i class="material-icons header-mobile-phone-link">phone</i>
				<a href="<?php echo $cart; ?>" class="material-icons header-mobile-cart-link">shopping_cart</a>
				<a href="/" class="header-mobile__logo">Simsilk</a>
			</div>
		</div>
		<!-- header-mobile__main end -->

		<!-- header-mobile-menu -->
		<div class="header-mobile-menu">
			<div class="row">
				<div class="col s4">
					<ul class="header-mobile-menu-list">

						<li><a href="<?php echo $about_us; ?>"" title="О компании">О компании</span></li>
						<li><a href="<?php echo $special; ?>" title="Акции">Акции</a></li>
						<li><a href="<?php echo $delivery; ?>" title="Доставка">Доставка</a></li>
						<li><a href="<?php echo $payment; ?>" title="Оплата">Оплата</a></li>
						<li><a href="<?php echo $review; ?>" title="Отзывы">Отзывы</a></li>
						<li><a href="<?php echo $blog; ?>" title="Новости">Новости</a></li>
						<li><a href="<?php echo $contacts; ?>" title="Контакты">Контакты</a></li>
					</ul>
				</div>
				<div class="col s8">
					<ul class="header-mobile-contacts-list">
						<li>
							<div>E-mail: <?php echo $email; ?></div>
							<div>Ежедневно <?php echo $open; ?></div>
						</li>
						<li>
    						<div><?php echo $address_part[0]; ?></div>
                            <?php if (isset($address_part[1])) { ?>
        						<div><?php echo $address_part[1]; ?></div>
                            <?php } ?>
						</li>
						<li>
							<div><strong><?php echo $phone1; ?></strong></div>
							<div>отдел консультаций</div>
						</li>
						<li>
							<div><strong><?php echo $phone2; ?></strong></div>
							<div>отдел гарантии<br /> и возврата</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- header-mobile-menu end -->

		<!-- header-mobile-search -->
		<div class="header-mobile-search">
            <?php echo $search_footer; ?>
		</div>
		<!-- header-mobile-search end -->
	</div>
	<!-- header-mobile end -->

	<div class="mobile-res"></div>
<script>$('.hidden-link').click(function(){window.location.href =$(this).data('link');return false;});</script>
	<script src="design/js/scrollpane.js"></script>
    <script src="design/js/validation.js"></script>
    <script src="design/js/masked-input.js"></script>
    <script src="design/js/init.js"></script>
    <script src="design/js/main.js"></script>

  </body>
</html>
