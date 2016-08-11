<!-- top-bar -->
<div class="top-bar">
	<div class="container">
		<div class="row row--nm">
			<div class="col s12 m2 m20">
				<div class="contact-email-item">E-mail: <a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a><br /> Ежедневно с 9 - 21:00</div>
			</div>
			<div class="col s12 m2 m20">
				<div class="contact-address-item">
                    <?php echo $address_part[0]; ?>
                    <?php if (isset($address_part[1])) { ?>
        			    <br><?php echo $address_part[1]; ?>
                    <?php } ?>
                </div>
			</div>
			<div class="col s12 m2 m20">
				<div class="contact-phone-item"><strong><?php echo $phone1; ?></strong>отдел консультаций</div>
			</div>
			<div class="col s12 m2 m20">
				<div class="contact-phone-item"><strong><?php echo $phone2; ?></strong>отдел гарантии и возврата</div>
			</div>
			<div class="col s12 m2 m20">
				<a href="#modal-callback" class="waves-effect waves-light btn-large btn-orange modal-trigger">Заказать звонок</a>
			</div>
		</div>
	</div>
</div>
<!-- top-bar end -->

<!-- header -->
<div class="header">
	<!-- header__top -->
	<div class="header__top">
		<div class="container">
			<div class="row row--nm">
				<div class="col s12 m20">
					<div class="header__top-logo">
						<span class="hidden-link brand-logo" data-link="/" >Logo</span>
					</div>
				</div>
				<div class="col s12 m60">
					<div class="header__top-search">
                        <?php echo $search; ?>
					</div>
				</div>
                <?php echo $cart; ?>
			</div>
		</div>
	</div>
	<!-- header__top end -->

	<!-- header__bottom -->
	<div class="header__bottom">
		<div class="container">
			<nav class="nav">
				<div class="nav-wrapper" itemscope="" itemtype="http://schema.org/SiteNavigationElement">
					<ul class="nav-list row row--nm" id="nav-mobile">
						<li class="col m20">
							<a class="dropdown-button" data-activates="dropdown-categories">Каталог товаров<i class="material-icons right">expand_more</i></a>
							<ul id="dropdown-categories" class="dropdown-content dropdown-categories">
                                <?php foreach ($categories as $category) { ?>
								    <li>
								     <?php if ($category['category_id'] == $category_id) { ?>
								     <a  title="<?php echo $category['name'];?>"><div class="img"><span class="icon-cat<?php echo $category['sort_order']; ?>"></span></div><?php echo $category['name']; ?></a>	    
<?php } else { ?>
	<a href="<?php echo $category['href']; ?>" title="<?php echo $category['name'];?>" itemprop="discussionUrl"><div class="img"><span class="icon-cat<?php echo $category['sort_order']; ?>"></span></div><?php echo $category['name']; ?></a>
<?php } ?>
								    </li>
                                <?php } ?>
							</ul>
						</li>
					
						<?php if($_SERVER['REQUEST_URI'] == '/about-us') {?>
						<li><a  title="О компании"><i class="material-icons">store</i>О компании</a></li>
						<?php } else { ?>
						<li><a href="<?php echo $about_us; ?>" itemprop="discussionUrl" title="О компании"><i class="material-icons">store</i>О компании</a></li>
						<?php } ?>
						<?php if($_SERVER['REQUEST_URI'] == '/news') {?>
						<li><a  title="Акции"><i class="material-icons">new_releases</i><span>Акции</span></a></li>
						<?php } else { ?>
						<li><a href="<?php echo $special; ?>" itemprop="discussionUrl" title="Акции"><i class="material-icons">new_releases</i><span>Акции</span></a></li>
						<?php } ?>
						<?php if($_SERVER['REQUEST_URI'] == '/delivery') {?>
						<li><a title="Доставка"><i class="material-icons">local_shipping</i><span>Доставка</span></a></li><?php } else { ?>
						<li><a href="<?php echo $delivery; ?>" itemprop="discussionUrl" title="Доставка"><i class="material-icons">local_shipping</i><span>Доставка</span></a></li><?php } ?>
							<?php if($_SERVER['REQUEST_URI'] == '/payment') {?>
						<li><a  title="Оплата"><i class="material-icons">account_balance_wallet</i><span>Оплата</span></a></li>
						<?php } else { ?>
						<li><a href="<?php echo $payment; ?>" itemprop="discussionUrl" title="Оплата"><i class="material-icons">account_balance_wallet</i><span>Оплата</span></a></li><?php } ?>
									<?php if($_SERVER['REQUEST_URI'] == '/testimonial') {?>
						<li><a title="Отзывы"><i class="material-icons">chat</i><span>Отзывы</span></a></li>
						<?php } else { ?>
						<li><a href="<?php echo $review; ?>" itemprop="discussionUrl" title="Отзывы"><i class="material-icons">chat</i><span>Отзывы</span></a></li>
						<?php } ?>
						
										<?php if($_SERVER['REQUEST_URI'] == '/blog-headlines') {?>
						<li><a  title="Новости"><i class="material-icons">chrome_reader_mode</i><span>Новости</span></a></li>
						<?php } else { ?>
						<li><a href="<?php echo $blog; ?>" itemprop="discussionUrl" title="Новости"><i class="material-icons">chrome_reader_mode</i><span>Новости</span></a></li>
						<?php } ?>

										<?php if($_SERVER['REQUEST_URI'] == '/contact-us') {?>
						<li><a title="Контакты"><i class="material-icons">map</i><span>Контакты</span></a></li>
						<?php } else { ?>
						<li><a href="<?php echo $contacts; ?>" itemprop="discussionUrl" title="Контакты"><i class="material-icons">map</i><span>Контакты</span></a></li><?php } ?>
						
						
						
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<!-- header__bottom end -->
</div>
<!-- header end -->


<!-- header-fixed -->
<div class="header-fixed">
	<!-- header-fixed__top -->
	<div class="header-fixed__top">
		<div class="container">
			<div class="row row--nm">
				<div class="col s12 m2 m20">
					<i class="header-menu-link material-icons">menu</i>
					<ul class="header-fixed-list">
						<li><i class="material-icons">visibility</i><span>12</span></li>
						<li><a href="<?php echo $wishlist; ?>"><i class="material-icons">equalizer</i></a><span id="wishlist-total"><?php echo $text_wishlist; ?></span></li>
						<li><a href="<?php echo $compare; ?>"><i class="material-icons">favorite</i></a><span><?php echo $text_compare; ?></span></li>
					</ul>
				</div>
				<div class="col s12 m8 m60">
					<ul class="header-fixed-list header-fixed-list--middle">
						<li><a href="<?php echo $login; ?>"><i class="material-icons">account_circle</i></a></li>
						<li><a href="<?php echo $register; ?>"><i class="material-icons">lock</i></a></li>
					</ul>
					<div class="header__top-search">
                        <?php echo $search_top; ?>
					</div>
				</div>
                <?php echo $minicart;  ?>
			</div>
		</div>
	</div>
	<!-- header-fixed__top end -->
	
	<!-- nav -->
	<nav class="nav">
		<div class="nav-wrapper">
			<ul class="nav-list row row--nm">
				<?php if($_SERVER['REQUEST_URI'] == '/about-us') {?>
						<li><a  title="О компании"><i class="material-icons">store</i>О компании</a></li>
						<?php } else { ?>
						<li><a href="<?php echo $about_us; ?>" itemprop="discussionUrl" title="О компании"><i class="material-icons">store</i>О компании</a></li>
						<?php } ?>
						<?php if($_SERVER['REQUEST_URI'] == '/news') {?>
						<li><a  title="Акции"><i class="material-icons">new_releases</i><span>Акции</span></a></li>
						<?php } else { ?>
						<li><a href="<?php echo $special; ?>" itemprop="discussionUrl" title="Акции"><i class="material-icons">new_releases</i><span>Акции</span></a></li>
						<?php } ?>
						<?php if($_SERVER['REQUEST_URI'] == '/delivery') {?>
						<li><a title="Доставка"><i class="material-icons">local_shipping</i><span>Доставка</span></a></li><?php } else { ?>
						<li><a href="<?php echo $delivery; ?>" itemprop="discussionUrl" title="Доставка"><i class="material-icons">local_shipping</i><span>Доставка</span></a></li><?php } ?>
							<?php if($_SERVER['REQUEST_URI'] == '/payment') {?>
						<li><a  title="Оплата"><i class="material-icons">account_balance_wallet</i><span>Оплата</span></a></li>
						<?php } else { ?>
						<li><a href="<?php echo $payment; ?>" itemprop="discussionUrl" title="Оплата"><i class="material-icons">account_balance_wallet</i><span>Оплата</span></a></li><?php } ?>
									<?php if($_SERVER['REQUEST_URI'] == '/testimonial') {?>
						<li><a title="Отзывы"><i class="material-icons">chat</i><span>Отзывы</span></a></li>
						<?php } else { ?>
						<li><a href="<?php echo $review; ?>" itemprop="discussionUrl" title="Отзывы"><i class="material-icons">chat</i><span>Отзывы</span></a></li>
						<?php } ?>
						
										<?php if($_SERVER['REQUEST_URI'] == '/blog-headlines') {?>
						<li><a  title="Новости"><i class="material-icons">chrome_reader_mode</i><span>Новости</span></a></li>
						<?php } else { ?>
						<li><a href="<?php echo $blog; ?>" itemprop="discussionUrl" title="Новости"><i class="material-icons">chrome_reader_mode</i><span>Новости</span></a></li>
						<?php } ?>

										<?php if($_SERVER['REQUEST_URI'] == '/contact-us') {?>
						<li><a title="Контакты"><i class="material-icons">map</i><span>Контакты</span></a></li>
						<?php } else { ?>
						<li><a href="<?php echo $contacts; ?>" itemprop="discussionUrl" title="Контакты"><i class="material-icons">map</i><span>Контакты</span></a></li><?php } ?>
						
			</ul>
		</div>
	</nav>
	<!-- nav end -->
</div>
<!-- header-fixed end -->

<!-- header-mobile -->
<div class="header-mobile">
	<!-- header-mobile__main -->
	<div class="header-mobile__main">
		<div class="container">
			<i class="material-icons header-mobile-menu-link">menu</i>
			<i class="material-icons header-mobile-search-link">search</i>
			<i class="material-icons header-mobile-phone-link">phone</i>
			<a href="<?php echo $checkout; ?>" class="material-icons header-mobile-cart-link">shopping_cart</a>
			<a href="/" class="header-mobile__logo">Simsilk</a>
		</div>
	</div>
	<!-- header-mobile__main end -->
	
	<!-- header-mobile-menu -->
	<div class="header-mobile-menu">
		<div class="row">
			<div class="col s4">
				<ul class="header-mobile-menu-list">
					<li><a href="<?php echo $about_us; ?>">О компании</a></li>
					<li><a href="<?php echo $special; ?>">Акции</a></li>
					<li><a href="<?php echo $delivery; ?>">Доставка</a></li>
					<li><a href="<?php echo $payment; ?>">Оплата</a></li>
					<li><a href="<?php echo $review; ?>">Отзывы</a></li>
					<li><a href="<?php echo $blog; ?>">Новости</a></li>
					<li><a href="<?php echo $contacts; ?>">Контакты</a></li>
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
		<div class="search-block">
			<nav>
				<div class="nav-wrapper">
					<form action="#">
						<div class="input-field">
							<input id="search" name="block_search_text" type="search" placeholder="Введите название товара для поиска" required>
							<label for="search"><i class="material-icons">search</i></label>
							<i class="material-icons">close</i>
						</div>
					</form>
				</div>
			</nav>
		</div>
	</div>
	<!-- header-mobile-search end -->
</div>
<!-- header-mobile end -->



