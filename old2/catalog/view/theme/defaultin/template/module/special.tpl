  <div class="content-block">
  <div class="heading"><span>Товар недели</span></div>
  <div class="action">
  <?php foreach ($products as $product) { ?>
        <a href="<?php echo $product['href']; ?>" class="action-inner"> 
			<span class="action-title"><?php echo $product['name']; ?></span>
			<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
		</a>
		
        <div class="btn-more"><a href="<?php echo $product['href']; ?>">Подробнее</a></div>
  <?php } ?>
</div>
</div>