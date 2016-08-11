<?php echo $header; ?>

  <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <?php echo $content_top; ?>
	<!-- BEGIN content -->
	<div class="content wrap clearfix">
		<!-- BEGIN content-main -->
		<div class="content-main">
		
		<!-- BEGIN breadcrumbs -->
			<ul class="breadcrumbs">
			<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
			<?php if($i+1<count($breadcrumbs)) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li><li class="arrow"></li> 
			<?php } else { ?><li><?php echo $breadcrumb['text']; ?></li><?php } ?>
	        <?php } ?>
            </ul>
			<!-- END breadcrumbs -->
      <h1><?php echo $name; ?></h1>
      <?php if ($articles) { ?>

        <?php foreach ($articles as $article) { ?>
          <div class="content-news clearfix">
				<a href="<?php echo $article['href']; ?>" class="news-heading"><?php echo $article['name']; ?></a>
				<!--noindex--><p><?php echo $article['intro_text']; ?></p><!--/noindex-->
				<div class="news-links clearfix">
					<div class="news-links-inner left">
						<div class="news-date">Дата создания:<span><?php echo $article['date_modified']; ?></span></div>
						<!--<div class="news-views">Просмотры (<span>67</span>)</div>
						<div class="news-comments"><a href="#">Комментарии (<span>12</span>)</a></div>-->
					</div>
					
					<div class="news-links-more right">
						<a href="<?php echo $article['href']; ?>">Подробнее</a>
					</div>
				</div>
			</div>
        <?php } ?>

      <div class="row">
        <?php echo $pagination; ?>
        
      </div>
      <?php } ?>
      <?php if (!$articles) { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $column_right; ?>
		</div>
		<!-- END content-main -->
		
		<!-- BEGIN sidebar-wrap -->
		<aside class="sidebar-wrap">
			<div class="sidebar">
			<?php echo $content_bottom; ?>	
			</div>
		</aside>
		<!-- END sidebar-wrap -->
	</div>
	<!-- END content -->




<?php echo $footer; ?>
