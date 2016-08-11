<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-news" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-news" class="form-horizontal">
          <ul class="nav nav-tabs" id="language">
			<?php foreach ($languages as $language) { ?>
			<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
			<?php } ?>
		  </ul>
		  <div class="tab-content">
			<?php foreach ($languages as $language) { ?>
			<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
			  <div class="form-group required">
				<label class="col-sm-2 control-label" for="input-title<?php echo $language['language_id']; ?>"><?php echo $text_terminate; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="news[<?php echo $language['language_id']; ?>][terminate]" value="<?php echo isset($news[$language['language_id']]) ? $news[$language['language_id']]['terminate'] : ''; ?>" placeholder="<?php echo $text_terminate; ?>" id="input-title<?php echo $language['language_id']; ?>" class="form-control" />
				</div>
			  </div>
			  <div class="form-group required">
				<label class="col-sm-2 control-label" for="input-title<?php echo $language['language_id']; ?>"><?php echo $text_title; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="news[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($news[$language['language_id']]) ? $news[$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $text_title; ?>" id="input-title<?php echo $language['language_id']; ?>" class="form-control" />
				</div>
			  </div>
			  <div class="form-group required">
				<label class="col-sm-2 control-label" for="input-short<?php echo $language['language_id']; ?>"><?php echo $text_short_description; ?></label>
				<div class="col-sm-10">
				  <textarea name="news[<?php echo $language['language_id']; ?>][short_description]" rows="5" placeholder="<?php echo $text_short_description; ?>" id="input-short<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($news[$language['language_id']]) ? $news[$language['language_id']]['short_description'] : ''; ?></textarea>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $text_description; ?></label>
				<div class="col-sm-10">
				  <textarea name="news[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $text_description; ?>" id="input-description<?php echo $language['language_id']; ?>"><?php echo isset($news[$language['language_id']]) ? $news[$language['language_id']]['description'] : ''; ?></textarea>
				</div>
			  </div>
			</div>
			<?php } ?>
		  </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-date-end"><?php echo $entry_date_end; ?></label>
            <div class="col-sm-3">
              <div class="input-group date">
                <input type="text" name="date_end" value="<?php echo $date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date-end" class="form-control" />
                <span class="input-group-btn">
                  <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span>
              </div>
            </div>
          </div>

		  <div class="form-group">
			<label class="col-sm-2 control-label" for="input-image"><?php echo $text_image; ?></label>
			<div class="col-sm-10">
			  <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $no_image; ?>" /></a>
			  <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
			</div>
		  </div>
		  <div class="form-group">
			<label class="col-sm-2 control-label" for="input-keyword"><?php echo $text_keyword; ?></label>
			<div class="col-sm-10">
              <div class="input-group keyword">
			    <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-keyword" class="form-control" />
                <span class="input-group-btn">
                  <button class="btn btn-default" type="button"><i class="fa fa-link"></i></button>
                </span>
			  </div>
			</div>
		  </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-related"><span data-toggle="tooltip" title="<?php echo $help_related; ?>"><?php echo $entry_related; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="related" value="" placeholder="<?php echo $entry_related; ?>" id="input-related" class="form-control" />
              <div id="product-related" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($news_related as $product_related) { ?>
                  <div id="product-related<?php echo $product_related['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_related['name']; ?>
                    <input type="hidden" name="news_related[]" value="<?php echo $product_related['product_id']; ?>" />
                  </div>
                <?php } ?>
              </div>
            </div>
          </div>

		  <div class="form-group">
			<label class="col-sm-2 control-label" for="input-status"><?php echo $text_status; ?></label>
			<div class="col-sm-10">
			  <select name="status" id="input-status" class="form-control">
				<?php if ($status) { ?>
				<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				<?php } ?>
			  </select>
			</div>
		  </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$('#language a:first').tab('show');

<?php foreach ($languages as $language) { ?>
$('#input-description<?php echo $language['language_id']; ?>').summernote({height: 300});
<?php } ?>
</script>

<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script>

<script type="text/javascript"><!--
// Related
$('input[name=\'related\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'related\']').val('');

		$('#product-related' + item['value']).remove();

		$('#product-related').append('<div id="product-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="news_related[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-related').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script>
<?php echo $footer; ?>