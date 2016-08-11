<section class="reviews">
    <?php if ($testimonials) { ?>
	    <?php foreach ($testimonials as $testimonial) { ?>

					<article class="review">
						<div class="review__top" id="testimonial-<?php echo $testimonial['testimonial_id']; ?>">
							<div class="review__top-left left">
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
							<div class="review__top-right right">
								<div class="review__date"><i class="material-icons left">date_range</i><strong>Добавлено:</strong> <?php echo $testimonial['date_added']; ?></div>
							</div>
						</div>
						<div class="review__content">
							<p><?php echo $testimonial['text']; ?></p>
						</div>
					</article>

	    <?php } ?>
        <div class="text-right"><?php echo $pagination; ?></div>
    <?php } else { ?>
	    <div class="review__content">
		    <p><?php echo $text_no_testimonials; ?></p>
		</div>
    <?php } ?>
</section>