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
			
			<h1><?php echo $heading_title; ?></h1>
			
            <form class="form-horizontal" id="form-review">
                <?php if ($review_status) { ?>
                <div id="review"></div>
                <?php if ($review_guest) { ?>
                <h2><?php echo $text_write; ?></h2>
                <div class="form-group required">
                    <div class="col-sm-12">
                        <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                        <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control"/>
                    </div>
                </div>
                <div class="form-group required">
                    <div class="col-sm-12">
                        <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                        <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>

                        
                    </div>
                </div>
                <div class="form-group required">
                    <div class="col-sm-12">
                        <label class="control-label"><?php echo $entry_rating; ?></label>
                        &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                        <input type="radio" name="rating" value="1" />
                        &nbsp;
                        <input type="radio" name="rating" value="2" />
                        &nbsp;
                        <input type="radio" name="rating" value="3" />
                        &nbsp;
                        <input type="radio" name="rating" value="4" />
                        &nbsp;
                        <input type="radio" name="rating" value="5" />
                        &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php if (isset($site_key) && $site_key) { ?>
                <div class="form-group">
                    <div class="col-sm-12">
                        <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                    </div>
                </div>
                <?php } elseif(isset($captcha) && $captcha){ ?>
                <?php echo $captcha; ?>
                <?php } ?>
                <div class="buttons clearfix">
                    <div class="pull-right">
                        <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>"
                                class="btn btn-primary"><?php echo $button_continue; ?></button>
                    </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
                <?php } ?>
            </form>
			
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
	<script type="text/javascript"><!--
        $('#review').delegate('.pagination a', 'click', function (e) {
            e.preventDefault();
            $('#review').load(this.href);
        });

        $('#review').load('index.php?route=review/store_review/review');

        $('#button-review').on('click', function () {
            if ($("textarea").is("#g-recaptcha-response")) {
                grecaptcha.reset();
            }

            $.ajax({
                url: 'index.php?route=review/store_review/write',
                type: 'post',
                dataType: 'json',
                data:  $("#form-review").serialize(),
                beforeSend: function () {
                    $('#button-review').button('loading');
                },
                complete: function () {
                    $('#button-review').button('reset');
                },
                success: function (json) {
                    $('.alert-success, .alert-danger').remove();
                    if (json['error']) {
                        $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                    }
                    if (json['success']) {
                        $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                        $('input[name=\'name\']').val('');
                        $('textarea[name=\'text\']').val('');
                        $('input[name=\'rating\']:checked').prop('checked', false);
                    }
                }
            });
        });
        //--></script>
	<?php echo $footer; ?>