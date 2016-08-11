<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" />

<title><?php echo $title; ?> | Simsilk – Москва</title>

    <meta name="locale" content="ru_RU">
    <meta name="DC.title" content="<?php echo $title; ?>" />
    <meta name="DC.subject" content="<?php echo $keywords; ?>" > 
    <meta name="DC.type" content="text" >  
    <?php
        $url = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
    ?>
    <meta name="DC.source" content="<?php echo $url;?>" > 
    <meta name="DC.relation" content="<?php echo $url;?>" >
    <meta name="DC.coverage" content="Moscow,Russia" >  
    <meta name="DC.coverage" content="2000-2015" >  
    <meta name="DC.creator" content="Simsilk" > 
    <meta name="DC.publisher" content="Simsilk" >  
    <meta name="DC.contributor" content="Simsilk" > 
    <meta name="DC.rights" content="Simsilk" > 
    <meta name="DC.date" content="2000-2015" >  
    <meta name="DC.format" content="digital" >  
    <meta name="DC.identifier" content="<?php echo $url;?>" > 
    <meta name="DC.language" content="ru-RU" > 
    <meta name="DC.provenance" content="Simsilk" > 
    <meta name="DC.rightsHolder" content="Simsilk" > 
    <meta name="DC.accrualPeriodicity" content="weekly" > 
    <meta name="DC.accrualPolicy" content="Active" > 
    <meta name="geo.region" content="RU-MOW" /> 
    <meta name="geo.placename" content="Москва" />
    <meta name="geo.position" content="55.764779;37.58023" />
    <meta name="ICBM" content="55.764779, 37.58023" />

    <meta property="og:locale" content="ru_RU" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="<?php echo $title; ?>" />
    <meta property="og:description" content="<?php echo $description; ?>" />
    <meta property="og:url" content="http://simsilk.ru" />
    <meta property="og:site_name" content="Simsilk" />
    <meta property="og:image" content="/catalog/view/theme/default/img/logo.png"/>

<?php if ($robots) { ?>
    <meta name="robots" content="<?php echo $robots; ?>" />
<?php } ?>

<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>

    <!-- FAVICON -->
    <link rel="icon" type="design/image/png" href="favicon-32x32.png" sizes="32x32" />
    <link rel="icon" type="design/image/png" href="favicon-48x48.png" sizes="48x48" />
    <link rel="icon" type="design/image/png" href="favicon-64x64.png" sizes="64x64" />
    <link href="apple-touch-icon.png" rel="apple-touch-icon">


    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <link type="text/css" rel="stylesheet" href="design/css/jquery.bxslider.css"  media="screen,projection"/>
    <link type="text/css" rel="stylesheet" href="design/css/materialize.css"  media="screen,projection"/>
    <link type="text/css" rel="stylesheet" href="design/css/scrollpane.css"  media="screen,projection"/>
    <?php /*
    <link type="text/css" rel="stylesheet" href="design/css/nouislider.min.css" media="screen,projection" />
    */ ?>
	<link type="text/css" rel="stylesheet" href="design/css/flipclock.css" media="screen,projection" />

    <!--Import style.css-->
    <link type="text/css" rel="stylesheet" href="design/css/main.css"  media="screen,projection"/>
	<link type="text/css" rel="stylesheet" href="design/css/print.css" media="all" />

    <?php foreach ($styles as $style) { ?>
        <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>

    <!-- Scripts load -->
    <!--Import jQuery before materialize.js-->
    <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>

    <script src="design/js/materialize.js"></script>
    <script src="design/js/device.min.js"></script>

    <script src="design/js/jquery-ui.min.js"></script>
	<script src="design/js/jquery.bxslider.min.js"></script>
	<script src="design/js/flipclock.min.js"></script>

    <script src="catalog/view/javascript/common.js" type="text/javascript"></script>

<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>

<body class="<?php echo $class; ?>" itemscope="" itemtype=http://schema.org/WebPage >

    <?php require_once DIR_TEMPLATE . 'default/template/common/header_include.tpl'; ?>
