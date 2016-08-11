<?php echo $header; ?>
<div class="content wrap clearfix">

  <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="content-main"><?php echo $content_top; ?>
	  <!-- BEGIN breadcrumbs -->
			<ul class="breadcrumbs">
				<li><a href="/">Главная</a></li>
				<li class="arrow"></li>
				<li><a href="news.php">Новости</a></li>
				<li class="arrow"></li>
				<li>Комфортный сон или как подобрать одеяло</li>
			</ul>
			<!-- END breadcrumbs -->
			
      <h1><?php echo $heading_title; ?></h1>
      <?php if ($thumb || $description) { ?>
      <?php } ?>
      <?php if ($categories) { ?>
      
      <?php if (count($categories) <= 5) { ?>
      
            <?php foreach ($categories as $category) { ?>
            
            <?php } ?>
          
      <?php } else { ?>
      
        <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
       
            <?php foreach ($categories as $category) { ?>
            
            <?php } ?>
          
        <?php } ?>
      
      <?php } ?>
      <?php } ?>
      <?php if ($products) { ?>
      
      
      <br />
      <div class="row">
        <?php foreach ($products as $product) { ?>
        
		
		 <div class="content-product-inner"> 
						<a href="<?php echo $product['href']; ?>">
							<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
							<span class="product-title"><?php echo $product['name']; ?></span>
						</a>
						
						<div class="product-rating-price">
							<?php if ($product['rating']) { ?>
                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php } ?>
							
							<div class="product-price-wrap clearfix">
								<?php if ($product['price']) { ?>
								<div class="product-price">
								<?php if (!$product['special']) { ?>
                                <?php echo $product['price']; ?>
                                <?php } else { ?>
                                <?php echo $product['special']; ?> <span class="discount-price"><?php echo $product['price']; ?></span>
                                <?php } ?>
                                <?php if ($product['tax']) { ?>
                                <?php } ?>
								</div>
								<?php } ?>
								<a href="#" class="product-basket"></a>
							</div>
						</div>
					</div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div></div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?>
</div>
<?php echo $footer; ?>
