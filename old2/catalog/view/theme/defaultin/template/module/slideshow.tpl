<!-- BEGIN slider-wrap 
	<div class="slider-wrap"> 
		<ul class="bxslider">
		<?php foreach ($banners as $banner) { ?>
		  <?php if ($banner['link']) { ?>
          <li><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"></li>
          <?php } else { ?>
          <li><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"></li>
          <?php } ?>
		<?php } ?>
		</ul>
	</div>
	 END slider-wrap -->
	 
	 <!-- BEGIN slider-wrap -->
	<div class="slider-wrap"> 
		<ul class="bxslider">
		  <li><img src="catalog/view/theme/defaultin/images/img-slide.jpg" alt=""></li>
		  <li><img src="catalog/view/theme/defaultin/images/img-slide2.jpg" alt=""></li>
		  <li><img src="catalog/view/theme/defaultin/images/img-slide3.jpg" alt=""></li>
		</ul>
	</div>
	<!-- END slider-wrap -->