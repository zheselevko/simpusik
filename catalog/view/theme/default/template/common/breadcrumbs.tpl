<!-- breadcrumbs -->
<div class="breadcrumbs nav-wrapper" xmlns:v="rdf.data-vocabulary.org/#">
    <?php $k = 1; ?>
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <?php if($k == 1) {?>
        <a href="/" class="breadcrumb" typeof="v:Breadcrumb" rel="v:url"><i class="material-icons left">home</i><span property="v:title">Домашний текстиль</span></a>
      <?php } else {?>
        <span class="breadcrumb" typeof="v:Breadcrumb">
          <?php if ($k < count($breadcrumbs)) { ?>
            <a href="<?php echo $breadcrumb['href']; ?>" property="v:title" rel="v:url"><?php echo $breadcrumb['text']; ?></a>
          <?php } else { ?>
            <span href="<?php echo $breadcrumb['href']; ?>" property="v:title" rel="v:url"><?php echo $breadcrumb['text']; ?></span>
          <?php } ?>
        </span>
      <?php } ?>
      <?php $k++; ?>
    <?php } ?>
</div>
<!-- breadcrumbs end -->
