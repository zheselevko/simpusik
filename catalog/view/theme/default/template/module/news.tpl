		<!-- block-last-news -->
		<div class="section block-last-news">
			<div class="container">
				<div class="block-title">
					<h2 class="left"><?php echo $heading_title; ?></h2>
					<div class="block-title__right right">
						<a href="<?php echo $newslink; ?>">Все новости<i class="material-icons">import_contacts</i></a>
					</div>
				</div>
				<div class="last-news">
					<div class="row js-related-news-slider">

                		<?php foreach ($article as $articles) { ?>
    						<div class="col s12 m3">
    							<div class="news-item-small">
    								<a href="<?php echo $articles['href']; ?>" class="news-item-small__image">
    									<img class="responsive-img" src="<?php echo $articles['thumb']; ?>" title="<?php echo $articles['name']; ?>" alt="<?php echo $articles['name']; ?>" />
    								</a>
    								<div class="news-item-small__content">
    									<h5 class="news-item-small__title"><a href="<?php echo $articles['href']; ?>"><?php echo $articles['name']; ?> →</a></h5>
    									<div class="news-item-small_date"><?php echo $articles['date_added']; ?></div>
    								</div>
    							</div>
    						</div>
                		<?php } ?>

					</div>
				</div>
			</div>
		</div>
		<!-- block-last-news end -->
