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

<title><?php echo $title; ?></title>
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

<body class="<?php echo $class; ?>">

    <?php require_once DIR_TEMPLATE . 'default/template/common/header_include.tpl'; ?>
