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

				<div class="content-top__right-icon right">
					<span class="icon-book"></span>
				</div>
			</div>
			<!-- content-top end -->

				<!-- news-single -->
				<article class="news-single">
					<h1><?php echo $heading_title; ?></h1>

                    <?php echo $description; ?>

				</article>
				<!-- news-single end -->

				<!-- news-single-meta -->
				<div class="news-single-meta">
					<div class="news-single-meta__left">
						<div class="publish-date"><i class="material-icons left">date_range</i><strong>Дата публикации: <?php echo $date; ?></strong></div>
					</div>
					<div class="news-single-meta__right">
						<script type="text/javascript" src="//yastatic.net/es5-shims/0.0.2/es5-shims.min.js" charset="utf-8"></script>
						<script type="text/javascript" src="//yastatic.net/share2/share.js" charset="utf-8"></script>
						<div class="ya-share2" data-services="vkontakte,facebook,odnoklassniki,moimir,gplus" data-counter=""></div>
					</div>
				</div>
				<!-- news-single-meta end -->

		</div>
		<!-- container end -->
	</main>
	<!-- MAIN CONTENT [END] -->

<?php echo $footer; ?>
