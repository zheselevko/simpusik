			<!-- block-main-reviews -->
			<div class="section block-main-reviews">
				<div class="block-title">
					<h2 class="left">Отзывы о компании</h2>
					<div class="block-title__right right">
						<a href="<?php echo $show_all_url;?>">Все отзывы<i class="material-icons">comment</i></a>
					</div>
				</div>
				<div class="main-reviews">
					<div class="row js-main-reviews-slider">
                        <?php foreach ($testimonials as $testimonial) { ?>

    						<div class="col s12 m3">
    							<article class="review">
    								<div class="review__top">
    									<div class="review__author"><?php echo $testimonial['name']; ?></div>
    									<ul class="stars-list">
                                            <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                <?php if ($i <= $testimonial['rating']) { ?>
            										<li class="active"><i class="material-icons">star_rate</i></li>
                                                <?php } else { ?>
            										<li><i class="material-icons">star_rate</i></li>
                                                <?php } ?>
                                            <?php } ?>
    									</ul>
    								</div>
    								<div class="review__content">
                                   <!--noindex-->
    									<p><?php echo $testimonial['text']; ?></p><!--/noindex-->
    								</div>
    								<div class="review__more">
    									<a href="<?php echo $show_all_url; ?>#testimonial-<?php echo $testimonial['testimonial_id']; ?>">Читать отзыв полностью →</a>
    								</div>
    							</article>
    						</div>

                        <?php } ?>

					</div>
				</div>
			</div>
			<!-- block-main-reviews end -->
