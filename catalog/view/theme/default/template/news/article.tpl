
			<!-- block-news-single -->
			<div class="section block-news-single">
				<!-- news-single -->
				<article class="news-single">
					<h1><?php echo $heading_title; ?></h1>

                    <?php echo $description; ?>

				</article>
				<!-- news-single end -->

            	<!-- news-single-meta -->
            	<div class="news-single-meta">
            		<div class="news-single-meta__left">
            			<div class="publish-date"><i class="material-icons left">date_range</i><strong>Дата публикации: <?php echo $date_added; ?></strong></div>
            		</div>
            		<div class="news-single-meta__right">
            			<script type="text/javascript" src="//yastatic.net/es5-shims/0.0.2/es5-shims.min.js" charset="utf-8"></script>
            			<script type="text/javascript" src="//yastatic.net/share2/share.js" charset="utf-8"></script>
            			<div class="ya-share2" data-services="vkontakte,facebook,odnoklassniki,moimir,gplus" data-counter=""></div>
            		</div>
            	</div>
            	<!-- news-single-meta end -->

				<!-- block-last-news -->
				<div class="section block-related-news">
                    <?php if ($articles) { ?>

    					<div class="block-title">
    						<h2 class="left">Похожие новости</h2>
    						<div class="block-title__right right"> <a href="<?php echo $blog; ?>">Все новости<i class="material-icons">import_contacts</i></a> </div>
    					</div>

					    <div class="last-news">
						    <div class="row js-related-news-slider">
                                <?php foreach ($articles as $article) { ?>
        							<div class="col s12 m3">
        								<div class="news-item-small">
        									<a href="<?php echo $article['href']; ?>" class="news-item-small__image"> <img class="responsive-img" src="<?php echo $article['thumb']; ?>" alt="<?php echo $product['name']; ?>" /> </a>
        									<div class="news-item-small__content">
        										<h5 class="news-item-small__title"><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?> →</a></h5>
        										<div class="news-item-small_date"><?php echo $article['date_added']; ?></div>
        									</div>
        								</div>
        							</div>
                                <?php } ?>
    						</div>
					    </div>
                    <?php } ?>
				</div>
				<!-- block-last-news end -->

			</div>
			<!-- block-news-single end -->
<?php /*


<?php if ($article) { ?>
<h2><?php echo $news_related; ?></h2>
  <div class="content blog-content">
	<div class="bnews-list<?php if (count($article)>1) { ?> bnews-list-2<?php } ?>">
		<?php foreach ($article as $articles) { ?>
			<div class="artblock<?php if (count($article)>1) { ?> artblock-2<?php } ?>">
				<?php if ($articles['name']) { ?>
					<div class="name"><a href="<?php echo $articles['href']; ?>"><?php echo $articles['name']; ?></a></div>
				<?php } ?>
				<div class="article-meta">
					<?php if ($articles['author']) { ?>
						<?php echo $text_posted_by; ?> <a href="<?php echo $articles['author_link']; ?>"><?php echo $articles['author']; ?></a> |
					<?php } ?>
					<?php if ($articles['date_added']) { ?>
						<?php if ($articles['author']) { ?><?php echo $text_posted_on; ?><?php } else { ?><?php echo $text_posted_pon; ?><?php } ?> <?php echo $articles['date_added']; ?> |
					<?php } ?>
					<?php if ($articles['du']) { ?>
						<?php echo $text_updated_on; ?> <?php echo $articles['du']; ?> |
					<?php } ?>
					<?php if ($articles['category']) { ?>
						<?php echo $text_posted_in; ?> <?php echo $articles['category']; ?> |
					<?php } ?>
				</div>
				<?php if ($articles['thumb']) { ?>
					<a href="<?php echo $articles['href']; ?>"><img class="article-image" align="left" src="<?php echo $articles['thumb']; ?>" title="<?php echo $articles['name']; ?>" alt="<?php echo $articles['name']; ?>" /></a>
				<?php } ?>
				<?php if ($articles['custom1']) { ?>
					<div class="custom1"><?php echo $articles['custom1']; ?></div>
				<?php } ?>
				<?php if ($articles['custom2']) { ?>
					<div class="custom2"><?php echo $articles['custom2']; ?></div>
				<?php } ?>
				<?php if ($articles['custom3']) { ?>
					<div class="custom3"><?php echo $articles['custom3']; ?></div>
				<?php } ?>
				<?php if ($articles['custom4']) { ?>
					<div class="custom4"><?php echo $articles['custom4']; ?></div>
				<?php } ?>
				<?php if ($articles['description']) { ?>
					<div class="description"><?php echo $articles['description']; ?></div>
				<?php } ?>
				<?php if ($articles['total_comments']) { ?>
				  <?php if (!$disqus_status && !$fbcom_status) { ?>
					<div class="total-comments"><?php echo $articles['total_comments']; ?> <?php echo $text_comments; ?> - <a href="<?php echo $articles['href']; ?>#comments"><?php echo $text_comments_v; ?></a></div>
				  <?php } elseif ($fbcom_status) { ?>
					<div class="total-comments"><fb:comments-count href="<?php echo $articles['href']; ?>"></fb:comments-count> <?php echo $text_comments; ?> - <a href="<?php echo $articles['href']; ?>#comments"><?php echo $text_comments_v; ?></a></div>
				  <?php } else { ?>
					<div class="total-comments"><a data-disqus-identifier="article_<?php echo $articles['article_id']; ?>" href="<?php echo $articles['href']; ?>#disqus_thread"><?php echo $text_comments_v; ?></a></div>
				  <?php } ?>
				<?php } ?>
				<?php if ($articles['button']) { ?>
					<div class="blog-button"><a class="button" href="<?php echo $articles['href']; ?>"><?php echo $button_more; ?></a></div>
				<?php } ?>
			</div>
		<?php } ?>
	</div>
  </div>
<?php } ?>

*/ ?>