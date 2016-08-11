<!-- BEGIN content-block -->
<div class="content-block"> 
<div class="heading"><span>Каталог товаров</span></div>
<ul class="sidebar-menu">
  <?php foreach ($categories as $category) { ?>
  <?php if ($category['category_id'] == $category_id) { ?>
  <li><a href="<?php echo $category['href']; ?>" class="sidebar-menu-item1"><?php echo $category['name']; ?></a></li>
  <?php if ($category['children']) { ?>
  <?php foreach ($category['children'] as $child) { ?>
  <?php if ($child['category_id'] == $child_id) { ?>
  <a href="<?php echo $child['href']; ?>" style="text-transform:uppercase;color:#1569b2;padding-left:33px;display:block;position:relative;margin-top:5px;"><?php echo $child['name']; ?></a>
  <?php } else { ?>
  <a href="<?php echo $child['href']; ?>" style="text-transform:uppercase;color:#1569b2;padding-left:33px;display:block;position:relative;margin-top:5px;"><?php echo $child['name']; ?></a>
  <?php } ?>
  <?php } ?>
  <?php } ?>
  <?php } else { ?>
  <li><a href="<?php echo $category['href']; ?>" class="sidebar-menu-item1"><?php echo $category['name']; ?></a></li>
  <?php } ?>
  <?php } ?>
</ul>
</div>
<!-- END content-block -->

