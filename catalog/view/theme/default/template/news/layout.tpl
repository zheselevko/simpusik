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

                <?php if ($news_total) { ?>
    				<div class="content-top__bottom">
    				    <h1 class="left">Последние новости</h1>
    					<div class="content-top__right-icon right"> <span class="icon-book"></span> </div>
    				</div>
                <?php } else {?>
    				<div class="content-top__right-icon right">
    					<span class="icon-book"></span>
    				</div>
                <?php } ?>
			</div>
			<!-- content-top end -->

            <?php echo $description; ?>

		</div>
		<!-- container end -->
	</main>
	<!-- MAIN CONTENT [END] -->

<?php echo $footer; ?>