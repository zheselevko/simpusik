<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/defaultin/style/jquery-ui.css">
<link rel="stylesheet" href="catalog/view/theme/defaultin/style/main.css">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
<script src="catalog/view/theme/defaultin/js/jquery.bxslider.min.js"></script>
<script src="catalog/view/theme/defaultin/js/jquery-ui.min.js"></script>
<script src="catalog/view/theme/defaultin/js/cloud-zoom.js"></script>
<script src="catalog/view/theme/defaultin/js/main.js"></script>
</head>
<body>
<!-- BEGIN all-page -->
	<div class="all-page">
		<header class="header-main"> 
			<!-- BEGIN header-top -->
			<div class="header-top">
				<div class="wrap clearfix">
					<div class="header-top-menu"> 
						<a href="#">Москва и Подмосковье</a>
					</div>
					
					<div class="social clearfix">
						<a class="social-1" href="#">vk</a>
						<a class="social-2" href="#">ok</a>
					</div>
					
					<div class="user-navigation">
						<?php if ($logged) { ?>
                        <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>/
                        <a href="<?php echo $order; ?>"><?php echo $text_order; ?></a>/
                        <a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a>/
                        <a href="<?php echo $download; ?>"><?php echo $text_download; ?></a>/
                        <a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>/
                        <?php } else { ?>
                        <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a>/
                        <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
                        <?php } ?>
					</div>
					
					<div class="header-links clearfix">
						<div class="link-1"><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></div>
						<div class="link-2"><a href="/index.php?route=product/compare">Сравнение</a></div>
					</div>
				</div>
			</div>
			<!-- END header-top -->
			
			<!-- BEGIN header-middle -->
			<div class="header-middle">
				<div class="wrap clearfix">
				    <?php if ($logo) { ?>
                    <a href="<?php echo $home; ?>" title="На главную" class="header-logo"><img src="<?php echo $logo; ?>" alt="<?php echo $name; ?>"></a>
                    <?php } else { ?>
                    <a href="<?php echo $home; ?>" title="На главную" class="header-logo"><img src="<?php echo $logo; ?>" alt="<?php echo $name; ?>"></a>
                    <?php } ?>
					
					<div class="header-phone-basket clearfix">
						<div class="phone-block"> 
							<span><?php echo $telephone; ?></span>
						</div>
						<?php echo $cart; ?>
					</div>
					
					<?php echo $search; ?>
				</div>
			</div>
			<!-- END header-middle -->
			
			<!-- BEGIN header-bottom -->
			<div class="header-bottom"> 
				<div class="wrap"> 
					<nav class="header-nav">
						<ul class="clearfix">
							<li><a href="#"><img src="images/about.png" alt=""><span>О компании</span></a></li>
							<li><a href="#"><img src="images/sale.png" alt=""><span>Акции</span></a></li>
							<li><a href="#"><img src="images/delivery.png" alt=""><span>Доставка</span></a></li>
							<li><a href="#"><img src="images/pay.png" alt=""><span>Оплата</span></a></li>
							<li><a href="#"><img src="images/comment.png" alt=""><span>Отзывы</span></a></li>
							<li><a href="news.php"><img src="images/news.png" alt=""><span>Новости</span></a></li>
							<li><a href="#"><img src="images/contacts.png" alt=""><span>Контакты</span></a></li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- END header-bottom -->	
		</header>