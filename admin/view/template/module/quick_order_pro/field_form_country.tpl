<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<button onclick="$('#form').attr('action', $('#form').attr('action') + '&apply=1'); $('#form').submit();" type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_apply; ?>" class="btn"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<?php if ($breadcrumb['href']) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } else { ?>
				<li><?php echo $breadcrumb['text']; ?></li>
				<?php } ?>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<?php if ($success) { ?>
		<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<?php if (isset($attention)) { ?>
		<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $attention; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
						<li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
						<li><a href="#tab-validate" data-toggle="tab"><?php echo $tab_validate; ?></a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab-general">
							<div class="help-block">ID: <kbd><?php echo $field_id; ?></kbd></div>
							<?php if (isset($text_help_field)) { ?>
							<div class="help-block field"><?php echo $text_help_field; ?></div>
							<?php } ?>
							<ul class="nav nav-tabs language">
								<?php foreach ($languages as $language) { ?>
								<li><a href="#tab-language-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
								<?php } ?>
							</ul>
							<?php foreach ($languages as $language) { ?>
							<div id="tab-language-<?php echo $language['language_id']; ?>" class="tab-pane">
								<div class="form-group required">
									<label class="col-sm-2 control-label" for="field-title-<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
									<div class="col-sm-2">
										<input id="field-title-<?php echo $language['language_id']; ?>" type="text" name="field[title][<?php echo $language['language_id']; ?>]" value="<?php if(isset($title[$language['language_id']])) echo $title[$language['language_id']]; ?>" class="form-control" />
										<?php if (isset($error['title'][$language['language_id']])) { ?>
										<div class="text-danger"><?php echo $error['title'][$language['language_id']]; ?></div>
										<?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-description-<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_field_description; ?>"><?php echo $entry_field_description; ?></span></label>
									<div class="col-sm-2">
										<textarea id="field-description-<?php echo $language['language_id']; ?>" rows="7" cols="60" name="field[description][<?php echo $language['language_id']; ?>]" class="form-control"><?php if (isset($description[$language['language_id']])) echo $description[$language['language_id']]; ?></textarea>
									</div>
								</div>
							</div>
							<?php } ?>
						</div>
						<div class="tab-pane" id="tab-data">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="field-country-id"><span data-toggle="tooltip" title="<?php echo $help_country; ?>"><?php echo $entry_country; ?></span></label>
								<div class="col-sm-2">
									<select id="field-country-id" class="form-control" name="field[country_id]" >
										<option value="0"><?php echo $text_none; ?></option>
										<?php foreach ($countries as $country) { ?>
										<option <?php if ($country_id == $country['country_id']) echo 'selected="selected"'; ?> value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="field-required"><span data-toggle="tooltip" title="<?php echo $help_required; ?>"><?php echo $entry_required; ?></span></label>
								<div class="col-sm-1">
									<select name="field[required]" id="field-required" class="form-control">
										<?php foreach ($boolean_variables as $key => $value) { ?>
										<option <?php if ($required == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $value; ?></option>
										<?php } ?>
									</select>
									<div class="alert alert-warning create-customer" style="min-width:300px;"><?php echo $text_help_field_required; ?></div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="uick-order-pro-class"><span data-toggle="tooltip" title="<?php echo $help_css_class_field; ?>"><?php echo $entry_css_class_field; ?></span></label>
								<div class="col-sm-2">
									<input id="uick-order-pro-class" type="text" name="field[class]" value="<?php echo $class_name; ?>" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="field-status"><?php echo $entry_status; ?></label>
								<div class="col-sm-1">
									<select id="field-status" name="field[status]" class="form-control">
										<?php foreach($status_variables as $key => $variable) { ?>
										<option <?php if ($status == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="field-weight"><?php echo $entry_weight; ?></label>
								<div class="col-sm-1">
									<input id="field-weight" type="text" name="field[weight]" value="<?php echo $weight; ?>" size="2" class="form-control" />
									<?php if (isset($error['weight'])) { ?>
									<div class="text-danger"><?php echo $error['weight']; ?></div>
									<?php } ?>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tab-validate">
							<ul class="nav nav-tabs language">
								<?php foreach ($languages as $language) { ?>
								<li><a href="#tab-language-validate-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
								<?php } ?>
							</ul>
							<?php foreach ($languages as $language) { ?>
							<div id="tab-language-validate-<?php echo $language['language_id']; ?>" class="tab-pane">
								<div class="form-group required">
									<label class="col-sm-2 control-label" for="field-error-message-<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_error_message; ?>"><?php echo $entry_error_message; ?></span></label>
									<div class="col-sm-2">
										<p class="link" style="margin-top: 0;"><a class="js"><?php echo $text_tokens; ?></a></p>
										<div class="content" style="display: none;">
											<table class="table token table-bordered">
												<thead>
													<tr>
														<td width="30%" class="text-left"><?php echo $column_token; ?></td>
														<td width="70%" class="text-left"><?php echo $column_value; ?></td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="text-left">{field_name}</td>
														<td class="text-left"><?php echo $text_token_field_name; ?></td>
													</tr>
												</tbody>
											</table>
										</div>
										<textarea id="field-error-message-<?php echo $language['language_id']; ?>" class="form-control" name="field[validate][option][<?php echo $code; ?>][error_message][<?php echo $language['language_id']; ?>]" rows="3" cols="65"><?php if  (isset($validate_option[$code]['error_message'][$language['language_id']])) echo $validate_option[$code]['error_message'][$language['language_id']]; ?></textarea>
										<?php if (isset($error['validate'][$code]['error_message'][$language['language_id']])) { ?>
										<div class="text-danger"><?php echo $error['validate'][$code]['error_message'][$language['language_id']]; ?></div>
										<?php } ?>
									</div>
								</div>
							</div>
							<?php } ?>
						</div>
					</div>
					<input type="hidden" name="field[type][type]" value="select" />
					<input type="hidden" name="field[validate][type]" value="<?php echo $code; ?>" />
					<input type="hidden" name="field[code]" value="<?php echo $code; ?>" />
					<input type="hidden" name="field[field_id]" value="<?php echo $field_id; ?>" />
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"><!--
	
		initTabValidate();
	
		$('*[name="field[required]"]').change(function(event){
			initTabValidate();
		});
	
		function initTabValidate() {
			
			var required = $('*[name="field[required]"]').val();
			
			console.log(required);
			
			if (required == 1) {
				$('a[href="#tab-validate"]').parent().show();
			} else {
				$('a[href="#tab-validate"]').parent().hide();
			}
			
		}

		$('.language').each(function(){
			$('a:first', this).tab('show');
		});
		
	</script>
<?php echo $footer; ?>