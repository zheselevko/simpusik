<?php if ($articles) { ?>
    <!-- block-news -->
	<div class="section block-news">
	    <section class="news-section">
            <?php foreach($articles as $article) { ?>
		        <article class="card news-item">
			        <div class="card-image news-item__image"> <img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" />
					    <div class="news-item__date"><?php echo $article['date_added']; ?></div>
					</div>
					<div class="card-content news-item__content">
					    <h2><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h2>
                        <!--noindex--><?php echo $article['description']; ?><!--/noindex-->
					</div>
			    </article>
            <?php } ?>
		</section>

        <?php echo $pagination; ?>
	</div>
    <!-- block-news end -->
<?php } ?>
