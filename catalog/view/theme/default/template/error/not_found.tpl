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
			</div>
			<!-- content-top end -->

			<!-- block-news-single -->
			<div class="section block-news-single">
				<!-- news-single -->
				<article class="news-single">
					<h1><?php echo $heading_title; ?></h1>

                    <?php echo $text_error; ?>

				</article>
				<!-- news-single end -->
			</div>
			<!-- block-news-single end -->

		</div>
		<!-- container end -->
	</main>
	<!-- MAIN CONTENT [END] -->

<?php echo $footer; ?>
