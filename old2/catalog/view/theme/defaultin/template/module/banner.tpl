
  <?php foreach ($banners as $banner) { ?>

    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>" class="sidebar-banner"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"></a>
    <?php } else { ?>
    <a href="<?php echo $banner['link']; ?>" class="sidebar-banner"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"></a>
    <?php } ?>

  <?php } ?>

