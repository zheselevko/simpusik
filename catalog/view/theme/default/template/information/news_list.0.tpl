<?php echo $header; ?>

	<!-- content -->
	<main>
		<!-- container -->
		<div class="container">
		    <!-- content-top -->
			<div class="section content-top">
                <?php require_once DIR_TEMPLATE . 'default/template/common/breadcrumbs.tpl'; ?>

    			<div class="content-top__bottom">
    			    <h1 class="left"><?php echo $heading_title; ?></h1>
    			    <div class="content-top__right-icon right"> <i class="material-icons">new_releases</i></div>
    			</div>

			</div>
			<!-- content-top end -->

				<!-- block-sales -->
				<div class="section block-sales">
					<div class="row">
						<div class="col s12 m6">
                            <?php for($k = 0;$k < count($all_news);$k += 2) { ?>
                                <?php $news = $all_news[$k];  ?>
    							<div class="sale-item">
    								<div class="sale-item__left">
    									<div class="sale-item__date"><?php echo $news['terminate']; ?></div>
    									<a href="<?php echo $news['href']; ?>" class="sale-item__image"> <img class="responsive-img" src="<?php echo $news['image']; ?>" alt="<?php echo $news['title']; ?>"> </a>
    								</div>
    								<div class="sale-item__right">
    									<h2><a href="<?php echo $news['href']; ?>"><?php echo $news['title']; ?></a></h2>
                                        <?php echo $news['short_description']; ?>
    								</div>
    							</div>
                            <?php } ?>
						</div>
						<div class="col s12 m6">
                            <?php for($k = 1;$k < count($all_news);$k += 2) { ?>
                                <?php $news = $all_news[$k];  ?>
    							<div class="sale-item">
    								<div class="sale-item__left">
    									<div class="sale-item__date"><?php echo $news['terminate']; ?></div>
    									<a href="<?php echo $news['href']; ?>" class="sale-item__image"> <img class="responsive-img" src="<?php echo $news['image']; ?>" alt="<?php echo $news['title']; ?>"> </a>
    								</div>
    								<div class="sale-item__right">
    									<h2><a href="<?php echo $news['href']; ?>"><?php echo $news['title']; ?></a></h2>
                                        <?php echo $news['short_description']; ?>
    								</div>
    							</div>
                            <?php } ?>
						</div>
					</div>
					<ul class="pagination">
						<li class="waves-effect"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
						<li class="active"><a href="#!">1</a></li>
						<li class="waves-effect"><a href="#!">2</a></li>
						<li class="waves-effect"><a href="#!">3</a></li>
						<li class="waves-effect"><a href="#!">4</a></li>
						<li class="waves-effect"><a href="#!">5</a></li>
						<li class="waves-effect"><a href="#!">6</a></li>
						<li class="waves-effect"><a href="#!">7</a></li>
						<li class="waves-effect"><a href="#!">8</a></li>
						<li class="waves-effect"><a href="#!">9</a></li>
						<li class="waves-effect"><a href="#!">10</a></li>
						<li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
					</ul>
				</div>
				<!-- block-sales end -->


		</div>
		<!-- container end -->
	</main>
	<!-- MAIN CONTENT [END] -->

<?php echo $footer; ?>

<?php /*
<div class="container">

  <div class="row">
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <table class="table table-bordered table-striped table-hover">
	    <thead>
		  <tr>
			<th></th>
			<th><?php echo $text_title; ?></th>
			<th><?php echo $text_description; ?></th>
			<th><?php echo $text_date; ?></th>
			<th class="text-right"></th>
		  </tr>
		</thead>
		<tbody>
		<?php foreach ($all_news as $news) { ?>
		  <tr>
		   <td style="vertical-align:middle" class="text-center"><img src="<?php echo $news['image']; ?>" /></td>
		   <td style="vertical-align:middle"><?php echo $news['title']; ?></td>
		   <td style="vertical-align:middle"><?php echo $news['description']; ?></td>
		   <td style="vertical-align:middle"><?php echo $news['date_added']; ?></td>
		   <td style="vertical-align:middle" class="text-right"><a href="<?php echo $news['view']; ?>"><?php echo $text_view; ?></a></td>
		  </tr>
		<?php } ?>
		</tbody>
	  </table>
	  <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
	  <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
*/ ?>