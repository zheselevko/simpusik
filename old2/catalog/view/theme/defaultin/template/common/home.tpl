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