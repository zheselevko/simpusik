<?php if ($reviews) { ?>
    <!-- reviews -->
    <section class="reviews">
        <?php foreach ($reviews as $review) { ?>
		    <article class="review">
			    <div class="review__top">
				    <div class="review__top-left left">
					    <div class="review__author"><?php echo $review['author']; ?></div>
						<ul class="stars-list">
                            <?php for ($i = 1; $i <= 5; $i++) { ?>
                                <?php if ($review['rating'] < $i) { ?>
								    <li><i class="material-icons">star_rate</i></li>
                                <?php } else { ?>
								    <li class="active"><i class="material-icons">star_rate</i></li>
                                <?php } ?>
                            <?php } ?>
						</ul>
					</div>
					<div class="review__top-right right">
					    <div class="review__date"><i class="material-icons left">date_range</i><strong>Добавлено:</strong> <?php echo $review['date_added']; ?></div>
					</div>
				</div>
				<div class="review__content">
                    <p><?php echo $review['text']; ?></p>
				</div>
				<div class="review__bottom">
				    <div class="vote-useful">
					    <div class="vote-useful__title">Полезен ли отзыв?</div>
						<div class="vote-useful__column">
						    <div class="vote-useful__column-value vote-useful__column-value--orange js-vote-count-yes">29</div>
                            <a href="#" class="waves-effect waves-light btn-orange js-vote-btn-yes"><i class="material-icons">thumb_up</i><span>да</span></a>
                        </div>
						<div class="vote-useful__column">
						    <div class="vote-useful__column-value vote-useful__column-value--gray js-vote-count-no">1</div>
                            <a href="#" class="waves-effect waves-light btn-dark-gray js-vote-btn-no"><i class="material-icons">thumb_down</i><span>нет</span></a>
                        </div>
					</div>
				</div>
			</article>

        <?php } ?>
    </section>
    <!-- reviews end -->
<?php } ?>
