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
						<li><a href="#tab-type" data-toggle="tab"><?php echo $tab_type; ?></a></li>
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
								<label class="col-sm-2 control-label" for="field-required"><span data-toggle="tooltip" title="<?php echo $help_required; ?>"><?php echo $entry_required; ?></span></label>
								<div class="col-sm-1">
									<?php if ($required_field) { ?>
									<p class="form-control-static"><?php echo $text_yes; ?></p>
									<input type="hidden" name="field[required]" value="1" />
									<?php } else { ?>
									<select name="field[required]" id="field-required" class="form-control">
										<?php foreach ($boolean_variables as $key => $value) { ?>
										<option <?php if ($required == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $value; ?></option>
										<?php } ?>
									</select>
									<?php } ?>
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
									<?php if ($required_field) { ?>
									<p class="form-control-static"><?php echo $text_enabled; ?></p>
									<input type="hidden" name="field[status]" value="1" />
									<?php } else { ?>
									<select id="field-status" name="field[status]" class="form-control">
										<?php foreach($status_variables as $key => $variable) { ?>
										<option <?php if ($status == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
										<?php } ?>
									</select>
									<?php } ?>
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
						<div class="tab-pane" id="tab-type">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="field-type"><?php echo $entry_field_type; ?></label>
								<div class="col-sm-2">
									<?php if (count($field_types) == 1) { ?>
									<p class="form-control-static"><?php echo $type; ?></p>
									<input type="hidden" name="field[type][type]" value="<?php echo key($field_types); ?>" />
									<?php } else { ?>
									<select id="field-type" name="field[type][type]" class="form-control">
										<?php foreach ($field_types as $key => $type_info) { ?>
										<option <?php if ($type == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $key; ?></option>
										<?php } ?>
									</select>
									<?php } ?>
									<?php foreach ($field_types as $key => $type_info) { ?>
									<div id="help-item-<?php echo $key; ?>" class="help-item alert alert-info info"<?php if ($key != $type) echo ' style="display:none;"'; ?>><?php echo $type_info['description']; ?></div>
									<?php } ?>
								</div>
							</div>
							<div id="field-type-text" class="field-type"<?php if ($type != 'text') echo ' style="display:none;"'; ?>>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-type-text-maxlength"><span data-toggle="tooltip" title="<?php echo $help_field_maxlength; ?>"><?php echo $entry_field_maxlength; ?></span></label>
									<div class="col-sm-1">
										<?php if ($order_field) { ?>
										<p class="form-control-static">128</p>
										<input type="hidden" name="field[type][option][text][maxlength]" value="128" />
										<?php } else { ?>
										<input id="field-type-text-maxlength" type="text" name="field[type][option][text][maxlength]" value="<?php if (!empty($type_option['text']['maxlength'])) echo $type_option['text']['maxlength']; ?>" maxlength="2" class="form-control" />
										<?php } ?>						
										<?php if (isset($error['type']['text']['maxlength'])) { ?>
										<div class="text-danger"><?php echo $error['type']['text']['maxlength']; ?></div>
										<?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-type-text-placeholder"><span data-toggle="tooltip" title="<?php echo $help_field_placeholder; ?>"><?php echo $entry_field_placeholder; ?></span></label>
									<div class="col-sm-2">
										<input id="field-type-text-placeholder" class="form-control" type="text" name="field[type][option][text][placeholder]" value="<?php if (!empty($type_option['text']['placeholder'])) echo $type_option['text']['placeholder']; ?>" /></td>
									</div>
								</div>
								<div class="form-group parent">
									<label class="col-sm-2 control-label" for="field-type-text-use-mask"><?php echo $entry_field_use_mask; ?></label>
									<div class="col-sm-2">
										<select id="field-type-text-use-mask" name="field[type][option][text][use_mask]" class="slider form-control">
											<?php foreach($status_variables as $key => $variable) { ?>
											<option <?php if (!empty($type_option['text']['use_mask']) && $type_option['text']['use_mask'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="children"<?php if (empty($type_option['text']['use_mask'])) echo ' style="display:none;"'; ?>>
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="field-type-text-mask"><span data-toggle="tooltip" title="<?php echo $help_field_mask; ?>"><?php echo $entry_field_mask; ?></span></label>
										<div class="col-sm-2">
											<input id="field-type-text-mask" class="form-control" type="text" name="field[type][option][text][mask]" value="<?php if (!empty($type_option['text']['mask'])) echo $type_option['text']['mask']; ?>" />
											<?php if (isset($error['type']['text']['mask'])) { ?>
											<div class="text-danger"><?php echo $error['type']['text']['mask']; ?></div>
											<?php } ?>
											<div class="alert alert-info info"><?php echo $text_mash_example; ?></div>
										</div>
									</div>
								</div>
							</div>
							<div id="field-type-textarea" class="field-type"<?php if ($type != 'textarea') echo ' style="display:none;"'; ?>>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-type-textarea-placeholder"><?php echo $entry_field_placeholder; ?></label>
									<div class="col-sm-2">
										<input id="field-type-textarea-placeholder" class="form-control" type="text" name="field[type][option][textarea][placeholder]" value="<?php if (!empty($type_option['textarea']['placeholder'])) echo $type_option['textarea']['placeholder']; ?>" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-type-textarea-rows"><span data-toggle="tooltip" title="<?php echo $help_field_textarea_rows; ?>"><?php echo $entry_field_textarea_rows; ?></span></label>
									<div class="col-sm-1">
										<input id="field-type-textarea-rows" class="form-control" type="text" name="field[type][option][textarea][rows]" value="<?php if (!empty($type_option['textarea']['placeholder'])) echo $type_option['textarea']['rows']; ?>" />
										<?php if (isset($error['type']['textarea']['rows'])) { ?>
										<div class="text-danger"><?php echo $error['type']['textarea']['rows']; ?></div>
										<?php } ?>
									</div>
								</div>
							</div>
							<div id="field-type-select" class="field-type"<?php if ($type != 'select') echo ' style="display:none"'; ?>>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-type-select-multiple"><?php echo $entry_field_select_multiple; ?></label>
									<div class="col-sm-1">
										<select id="field-type-select-multiple" class="form-control" name="field[type][option][select][multiple]">
											<?php foreach($boolean_variables as $key => $variable) { ?>
											<option <?php if (!empty($type_option['select']['multiple']) && $type_option['select']['multiple'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<?php if (isset($error['type']['select']['option']) && is_scalar($error['type']['select']['option'])) { ?>
								<div class="alert alert-danger"><?php echo $error['type']['select']['option']; ?></div>
								<?php } ?>
								<table class="table table-striped table-hover">
									<thead>
										<tr>
											<td class="text-left" colspan="2"><?php echo $column_value; ?></td>
											<td class="text-left"><?php echo $column_active_item; ?></td>
											<td class="text-right">&nbsp;</td>
										</tr>
									</thead>
									<tbody>
										<?php if (!empty($type_option['select']['option'])) { ?>
										<?php foreach ($type_option['select']['option'] as $select_option_id => $option) { ?>
											<tr id="row-select-<?php echo $select_option_id; ?>" data-row="<?php echo $select_option_id; ?>">
												<td class="text-left drag" width="1"><a title="<?php echo $text_drag; ?>">&nbsp;</a></td>
												<td class="text-left col-sm-2">
													<input class="form-control" type="text" value="<?php echo $option['value']; ?>" name="field[type][option][select][option][<?php echo $select_option_id; ?>][value]" />
													<input type="hidden" class="weight" value="<?php echo $option['weight']; ?>" name="field[type][option][select][option][<?php echo $select_option_id; ?>][weight]" />
													<?php if (isset($error['type']['select']['option'][$select_option_id])) { ?>
													<div class="text-danger"><?php echo $error['type']['select']['option'][$select_option_id]; ?></div>
													<?php } ?>
												</td>
												<td class="text-left"><input <?php if (!empty($type_option['select']['selected']) && $type_option['select']['selected'] == $select_option_id) echo 'checked="checked"'; ?> type="radio" value="<?php echo $select_option_id; ?>" name="field[type][option][select][selected]" /></td>
												<td class="text-right">
													<button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
												</td>
											</tr>
											
										<?php } ?>
										<?php } ?>
									</tbody>
								</table>
								<div class="form-inline">
									<input type="text" value="" class="form-control add-value" /> <a id="add-select-option" href="javascript:void(0);" data-toggle="tooltip" title="<?php echo $button_add_value; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
								</div>
							</div>
							<div id="field-type-checkbox" class="field-type"<?php if ($type != 'checkbox') echo ' style="display:none;"'; ?>>
								<?php if (isset($error['type']['checkbox']['option']) && is_scalar($error['type']['checkbox']['option'])) { ?>
								<div class="alert alert-danger"><?php echo $error['type']['checkbox']['option']; ?></div>
								<?php } ?>
								<table class="table table-striped table-hover">
									<thead>
										<tr>
											<td class="text-left" colspan="2"><?php echo $column_value; ?></td>
											<td class="text-left"><?php echo $column_active_item; ?></td>
											<td class="text-right">&nbsp;</td>
										</tr>
									</thead>
									<tbody>
										<?php if (!empty($type_option['checkbox']['option'])) { ?>
										<?php foreach ($type_option['checkbox']['option'] as $checkbox_item_id => $item) { ?>
											<tr id="row-checkbox-<?php echo $checkbox_item_id; ?>" data-row="<?php echo $checkbox_item_id; ?>">
												<td class="text-left drag" width="1"><a title="<?php echo $text_drag; ?>">&nbsp;</a></td>
												<td class="text-left col-sm-2">
													<input class="form-control" type="text" value="<?php echo $item['value']; ?>" name="field[type][option][checkbox][option][<?php echo $checkbox_item_id; ?>][value]" />
													<input type="hidden" class="weight" value="<?php echo $item['weight']; ?>" name="field[type][option][checkbox][option][<?php echo $checkbox_item_id; ?>][weight]" />
													<?php if (isset($error['type']['checkbox']['option'][$checkbox_item_id])) { ?>
													<div class="text-danger"><?php echo $error['type']['checkbox']['option'][$checkbox_item_id]; ?></div>
													<?php } ?>
												</td>
												<td class="text-left"><input class="form-control" type="checkbox" <?php if (!empty($type_option['checkbox']['checked']) &&  is_array($type_option['checkbox']['checked']) && in_array($checkbox_item_id, $type_option['checkbox']['checked'])) echo  'checked="checked"'; ?> value="<?php echo $checkbox_item_id; ?>" name="field[type][option][checkbox][checked][]" /></td>
												<td class="text-right">
													<button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
												</td>
											</tr>
										<?php } ?>
										<?php } ?>
									</tbody>
								</table>
								<div class="form-inline">
									<input type="text" value="" class="form-control add-value" /> <a id="add-checkbox-item" href="javascript:void(0);" data-toggle="tooltip" title="<?php echo $button_add_value; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
								</div>
							</div>
							<div id="field-type-radio" class="field-type"<?php if ($type != 'radio') echo ' style="display:none;"'; ?>>
								<?php if (isset($error['type']['radio']['option']) && is_scalar($error['type']['radio']['option'])) { ?>
								<div class="alert alert-danger"><?php echo $error['type']['radio']['option']; ?></div>
								<?php } ?>
								<table class="table table-striped table-hover">
									<thead>
										<tr>
											<td class="text-left" colspan="2"><?php echo $column_value; ?></td>
											<td class="text-left"><?php echo $column_active_item; ?></td>
											<td class="text-right">&nbsp;</td>
										</tr>
									</thead>
									<tbody>
										<?php if (!empty($type_option['radio']['option'])) { ?>
										<?php foreach ($type_option['radio']['option'] as $radio_item_id => $item) { ?>
											<tr id="row-checkbox-<?php echo $radio_item_id; ?>" data-row="<?php echo $radio_item_id; ?>">
												<td class="text-left drag" width="1"><a title="<?php echo $text_drag; ?>">&nbsp;</a></td>
												<td class="text-left col-sm-2">
													<input class="form-control" type="text" value="<?php echo $item['value']; ?>" name="field[type][option][radio][option][<?php echo $radio_item_id; ?>][value]" />
													<input type="hidden" class="weight" value="<?php echo $item['weight']; ?>" name="field[type][option][radio][option][<?php echo $radio_item_id; ?>][weight]" />
													<?php if (isset($error['type']['radio']['option'][$radio_item_id])) { ?>
													<div class="text-danger"><?php echo $error['type']['radio']['option'][$radio_item_id]; ?></div>
													<?php } ?>
												</td>
												<td class="text-left"><input class="form-control" type="radio" <?php if (!empty($type_option['radio']['checked']) && $type_option['radio']['checked'] == $radio_item_id) echo 'checked="checked"'; ?> value="<?php echo $radio_item_id; ?>" name="field[type][option][radio][checked]" /></td>
												<td class="text-right">
													<button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
												</td>
											</tr>
										<?php } ?>
										<?php } ?>
									</tbody>
								</table>
								<div class="form-inline">
									<input type="text" value="" class="form-control add-value" /> <a id="add-radio-item" href="javascript:void(0);" data-toggle="tooltip" title="<?php echo $button_add_value; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tab-validate">
							<p class="help-block validate"><?php echo $text_help_validate; ?></p>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="field-validate"><?php echo $entry_field_validate; ?></label>
								<div class="col-sm-2">
									<select id="field-validate" name="field[validate][type]" class="form-control">
										<option value=""><?php echo $text_none; ?></option>
										<?php foreach ($validate_types as $key => $validate_info) { ?>
										<option class="<?php echo implode(' ', $validate_info['destination']); ?>"<?php if (reset($validate_info['destination']) != '*' && !in_array($type, $validate_info['destination'])) echo ' disabled="disabled"'; ?> <?php if ($validate == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $validate_info['title']; ?></option>
										<?php } ?>
									</select>
									<?php foreach ($validate_types as $key => $validate_info) { ?>
									<?php if ($validate_info['description']) { ?>
									<div id="help-validate-<?php echo $key; ?>" class="help-validate alert alert-info info"<?php if ($key != $validate) echo ' style="display:none"'; ?>><?php echo $validate_info['description']; ?></div>
									<?php } ?>
									<?php } ?>
								</div>
							</div>
							<div id="field-validate-pcre" class="field-validate"<?php if ($validate != 'pcre') echo ' style="display:none"'; ?>>
								<div class="form-group required">
									<label class="col-sm-2 control-label" for="field-validate-pcre-pattern"><span data-toggle="tooltip" title="<?php echo $help_pcre_pattern; ?>"><?php echo $entry_pcre_pattern; ?></span></label>
									<div class="col-sm-2">
										<input id="field-validate-pcre-pattern" class="form-control" type="text" name="field[validate][option][pcre][pattern]" value="<?php if (!empty($validate_option['pcre']['pattern'])) echo $validate_option['pcre']['pattern']; ?>" />
										<?php if (isset($error['validate']['pcre']['pattern'])) { ?>
										<div class="text-danger"><?php echo $error['validate']['pcre']['pattern']; ?></div>
										<?php } ?>
									</div>
								</div>
								<ul class="nav nav-tabs language">
									<?php foreach ($languages as $language) { ?>
									<li><a href="#tab-language-validate-pcre-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>
								<?php foreach ($languages as $language) { ?>
								<div id="tab-language-validate-pcre-<?php echo $language['language_id']; ?>" class="tab-pane">
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="field-validate-pcre-error-message-<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_error_message; ?>"><?php echo $entry_error_message; ?></span></label>
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
											<textarea id="field-validate-pcre-error-message-<?php echo $language['language_id']; ?>" class="form-control" name="field[validate][option][pcre][error_message][<?php echo $language['language_id']; ?>]" rows="3" cols="65"><?php if (!empty($validate_option['pcre']['error_message'][$language['language_id']])) echo $validate_option['pcre']['error_message'][$language['language_id']]; ?></textarea>
											<?php if (isset($error['validate']['pcre']['error_message'][$language['language_id']])) { ?>
											<div class="text-danger"><?php echo $error['validate']['pcre']['error_message'][$language['language_id']]; ?></div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
							</div>
							<div id="field-validate-length" class="field-validate"<?php if ($validate != 'length') echo ' style="display:none"'; ?>>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-validate-length-min"><span data-toggle="tooltip" title="<?php echo $help_int; ?>"><?php echo $entry_int_min_value; ?></span></label>
									<div class="col-sm-1">
										<input id="field-validate-length-min" class="form-control" type="text" name="field[validate][option][length][min]" value="<?php if (isset($validate_option['length']['min'])) echo $validate_option['length']['min']; ?>" />
										<?php if (isset($error['validate']['length']['min'])) { ?>
										<div class="text-danger"><?php echo $error['validate']['length']['min']; ?></div>
										<?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-validate-length-max"><span data-toggle="tooltip" title="<?php echo $help_int; ?>"><?php echo $entry_int_max_value; ?></span></label>
									<div class="col-sm-1">
										<input id="field-validate-length-max" class="form-control" type="text" name="field[validate][option][length][max]" value="<?php if (isset($validate_option['length']['max'])) echo $validate_option['length']['max']; ?>" size="2" />
										<?php if (isset($error['validate']['length']['max'])) { ?>
										<div class="text-danger"><?php echo $error['validate']['length']['max']; ?></div>
										<?php } ?>
									</div>
								</div>
								<ul class="nav nav-tabs language">
									<?php foreach ($languages as $language) { ?>
									<li><a href="#tab-language-validate-length-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>
								<?php foreach ($languages as $language) { ?>
								<div id="tab-language-validate-length-<?php echo $language['language_id']; ?>" class="tab-pane">
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="field-validate-length-error-message-<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_error_message; ?>"><?php echo $entry_error_message; ?></span></label>
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
														<tr>
															<td class="text-left">{field_min}</td>
															<td class="text-left"><?php echo $text_token_field_min; ?></td>
														</tr>
														<tr>
															<td class="text-left">{field_max}</td>
															<td class="text-left"><?php echo $text_token_field_max; ?></td>
														</tr>
													</tbody>
												</table>
											</div>
											<textarea id="field-validate-length-error-message-<?php echo $language['language_id']; ?>" class="form-control" name="field[validate][option][length][error_message][<?php echo $language['language_id']; ?>]" rows="3" cols="65"><?php if (!empty($validate_option['length']['error_message'][$language['language_id']])) echo $validate_option['length']['error_message'][$language['language_id']]; ?></textarea>
											<?php if (isset($error['validate']['length']['error_message'][$language['language_id']])) { ?>
											<div class="text-danger"><?php echo $error['validate']['length']['error_message'][$language['language_id']]; ?></div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
							</div>
							<div id="field-validate-number_of_words" class="field-validate"<?php if ($validate != 'number_of_words') echo ' style="display:none"'; ?>>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-validate-number-of-words-min"><?php echo $entry_int_min_value; ?></label>
									<div class="col-sm-1">
										<input id="field-validate-number-of-words-min" class="form-control" type="text" name="field[validate][option][number_of_words][min]" value="<?php if (isset($validate_option['number_of_words']['min'])) echo $validate_option['number_of_words']['min']; ?>" size="2" />
										<?php if (isset($error['validate']['number_of_words']['min'])) { ?>
										<div class="text-danger"><?php echo $error['validate']['number_of_words']['min']; ?></div>
										<?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-validate-number-of-words-max"><?php echo $entry_int_max_value; ?></label>
									<div class="col-sm-1">
										<input id="field-validate-number-of-words-max" class="form-control" type="text" name="field[validate][option][number_of_words][max]" value="<?php if (isset($validate_option['number_of_words']['max'])) echo $validate_option['number_of_words']['max']; ?>" size="2" />
										<?php if (isset($error['validate']['number_of_words']['max'])) { ?>
										<div class="text-danger"><?php echo $error['validate']['number_of_words']['max']; ?></div>
										<?php } ?>
									</div>
								</div>
								<ul class="nav nav-tabs language">
									<?php foreach ($languages as $language) { ?>
									<li><a href="#tab-language-validate-number-of-words-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>
								<?php foreach ($languages as $language) { ?>
								<div id="tab-language-validate-number-of-words-<?php echo $language['language_id']; ?>" class="tab-pane">
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="field-validate-number-of-words-error-message-<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_error_message; ?>"><?php echo $entry_error_message; ?></span></label>
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
														<tr>
															<td class="text-left">{field_min}</td>
															<td class="text-left"><?php echo $text_token_field_min; ?></td>
														</tr>
														<tr>
															<td class="text-left">{field_max}</td>
															<td class="text-left"><?php echo $text_token_field_max; ?></td>
														</tr>
													</tbody>
												</table>
											</div>
											<textarea id="field-validate-number-of-words-error-message-<?php echo $language['language_id']; ?>" class="form-control" name="field[validate][option][number_of_words][error_message][<?php echo $language['language_id']; ?>]" rows="3" cols="65"><?php if (!empty($validate_option['number_of_words']['error_message'][$language['language_id']])) echo $validate_option['number_of_words']['error_message'][$language['language_id']]; ?></textarea>
											<?php if (isset($error['validate']['number_of_words']['error_message'][$language['language_id']])) { ?>
											<div class="text-danger"><?php echo $error['validate']['number_of_words']['error_message'][$language['language_id']]; ?></div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
							</div>
							<div id="field-validate-words_blacklist" class="field-validate"<?php if ($validate != 'words_blacklist') echo ' style="display:none"'; ?>>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-validate-words-blacklist-list"><span data-toggle="tooltip" title="<?php echo $help_blacklist; ?>"><?php echo $entry_blacklist; ?></span></label>
									<div class="col-sm-3">
										<textarea id="field-validate-words-blacklist-list" class="form-control" name="field[validate][option][words_blacklist][list]" rows="4"><?php if (!empty($validate_option['words_blacklist']['list'])) echo $validate_option['words_blacklist']['list']; ?></textarea>
									</div>
								</div>
								<ul class="nav nav-tabs language">
									<?php foreach ($languages as $language) { ?>
									<li><a href="#tab-language-validate-words-blacklist-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>
								<?php foreach ($languages as $language) { ?>
								<div id="tab-language-validate-words-blacklist-<?php echo $language['language_id']; ?>" class="tab-pane">
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="field-validate-words-blacklist-error-message-<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_error_message; ?>"><?php echo $entry_error_message; ?></span></label>
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
											<textarea id="field-validate-words-blacklist-error-message-<?php echo $language['language_id']; ?>" class="form-control" name="field[validate][option][words_blacklist][error_message][<?php echo $language['language_id']; ?>]" rows="3" cols="65"><?php if (!empty($validate_option['words_blacklist']['error_message'][$language['language_id']])) echo $validate_option['words_blacklist']['error_message'][$language['language_id']]; ?></textarea>
											<?php if (isset($error['validate']['words_blacklist']['error_message'][$language['language_id']])) { ?>
											<div class="text-danger"><?php echo $error['validate']['words_blacklist']['error_message'][$language['language_id']]; ?></div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
							</div>
							<div id="field-validate-specific_value" class="field-validate"<?php if ($validate != 'specific_value') echo ' style="display:none"'; ?>>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-validate-specific-value-list"><span data-toggle="tooltip" title="<?php echo $help_specific_value_list; ?>"><?php echo $entry_specific_value_list; ?></span></label>
									<div class="col-sm-3">
										<textarea id="field-validate-specific-value-list" class="form-control" name="field[validate][option][specific_value][list]" rows="4"><?php if (!empty($validate_option['specific_value']['list'])) echo $validate_option['specific_value']['list']; ?></textarea>
									</div>
								</div>
								<ul class="nav nav-tabs language">
									<?php foreach ($languages as $language) { ?>
									<li><a href="#tab-language-validate-specific-value-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>
								<?php foreach ($languages as $language) { ?>
								<div id="tab-language-validate-specific-value-<?php echo $language['language_id']; ?>" class="tab-pane">
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="field-validate-specific-value-error-message-<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_error_message; ?>"><?php echo $entry_error_message; ?></span></label>
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
											<textarea id="field-validate-specific-value-error-message-<?php echo $language['language_id']; ?>" class="form-control" name="field[validate][option][specific_value][error_message][<?php echo $language['language_id']; ?>]" rows="3" cols="65"><?php if (!empty($validate_option['specific_value']['error_message'][$language['language_id']])) echo $validate_option['specific_value']['error_message'][$language['language_id']]; ?></textarea>
											<?php if (isset($error['validate']['specific_value']['error_message'][$language['language_id']])) { ?>
											<div class="text-danger"><?php echo $error['validate']['specific_value']['error_message'][$language['language_id']]; ?></div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
							</div>
							<div id="field-validate-numeric" class="field-validate"<?php if ($validate != 'numeric') echo ' style="display:none"'; ?>>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-validate-numeric-min"><?php echo $entry_int_min_value; ?></label>
									<div class="col-sm-1">
										<input id="field-validate-numeric-min" class="form-control" type="text" name="field[validate][option][numeric][min]" value="<?php if (isset($validate_option['numeric']['min'])) echo $validate_option['numeric']['min']; ?>" size="2" />
										<?php if (isset($error['validate']['numeric']['min'])) { ?>
										<div class="text-danger"><?php echo $error['validate']['numeric']['min']; ?></div>
										<?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-validate-numeric-max"><?php echo $entry_int_max_value; ?></label>
									<div class="col-sm-1">
										<input id="field-validate-numeric-max" class="form-control" type="text" name="field[validate][option][numeric][max]" value="<?php if (isset($validate_option['numeric']['max'])) echo $validate_option['numeric']['max']; ?>" size="2" />
										<?php if (isset($error['validate']['numeric']['max'])) { ?>
										<div class="text-danger"><?php echo $error['validate']['numeric']['max']; ?></div>
										<?php } ?>
									</div>
								</div>
								<ul class="nav nav-tabs language">
									<?php foreach ($languages as $language) { ?>
									<li><a href="#tab-language-validate-numeric-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>
								<?php foreach ($languages as $language) { ?>
								<div id="tab-language-validate-numeric-<?php echo $language['language_id']; ?>" class="tab-pane">
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="field-validate-numeric-error-message-<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_error_message; ?>"><?php echo $entry_error_message; ?></span></label>
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
														<tr>
															<td class="text-left">{field_min}</td>
															<td class="text-left"><?php echo $text_token_field_min; ?></td>
														</tr>
														<tr>
															<td class="text-left">{field_max}</td>
															<td class="text-left"><?php echo $text_token_field_max; ?></td>
														</tr>
													</tbody>
												</table>
											</div>
											<textarea id="field-validate-numeric-error-message-<?php echo $language['language_id']; ?>" class="form-control" name="field[validate][option][numeric][error_message][<?php echo $language['language_id']; ?>]" rows="3" cols="65"><?php if (!empty($validate_option['numeric']['error_message'][$language['language_id']])) echo $validate_option['numeric']['error_message'][$language['language_id']]; ?></textarea>
											<?php if (isset($error['validate']['numeric']['error_message'][$language['language_id']])) { ?>
											<div class="text-danger"><?php echo $error['validate']['numeric']['error_message'][$language['language_id']]; ?></div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
							</div>
							<div id="field-validate-int" class="field-validate"<?php if ($validate != 'int') echo ' style="display:none"'; ?>>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-validate-int-min"><?php echo $entry_int_min_value; ?></label>
									<div class="col-sm-1">
										<input id="field-validate-int-min" class="form-control" type="text" name="field[validate][option][int][min]" value="<?php if (isset($validate_option['int']['min'])) echo $validate_option['int']['min']; ?>" size="2" />
										<?php if (isset($error['validate']['int']['min'])) { ?>
										<div class="text-danger"><?php echo $error['validate']['int']['min']; ?></div>
										<?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-validate-int-max"><?php echo $entry_int_max_value; ?></label>
									<div class="col-sm-1">
										<input id="field-validate-int-max" class="form-control" type="text" name="field[validate][option][int][max]" value="<?php if (isset($validate_option['int']['max'])) echo $validate_option['int']['max']; ?>" size="2" />
										<?php if (isset($error['validate']['int']['max'])) { ?>
										<div class="text-danger"><?php echo $error['validate']['int']['max']; ?></div>
										<?php } ?>
									</div>
								</div>
								<ul class="nav nav-tabs language">
									<?php foreach ($languages as $language) { ?>
									<li><a href="#tab-language-validate-int-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>		
								<?php foreach ($languages as $language) { ?>
								<div id="tab-language-validate-int-<?php echo $language['language_id']; ?>" class="tab-pane">
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="field-validate-int-error-message-<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_error_message; ?>"><?php echo $entry_error_message; ?></span></label>
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
														<tr>
															<td class="text-left">{field_min}</td>
															<td class="text-left"><?php echo $text_token_field_min; ?></td>
														</tr>
														<tr>
															<td class="text-left">{field_max}</td>
															<td class="text-left"><?php echo $text_token_field_max; ?></td>
														</tr>
													</tbody>
												</table>
											</div>
											<textarea id="field-validate-int-error-message-<?php echo $language['language_id']; ?>" class="form-control" name="field[validate][option][int][error_message][<?php echo $language['language_id']; ?>]" rows="3" cols="65"><?php if (!empty($validate_option['int']['error_message'][$language['language_id']])) echo $validate_option['int']['error_message'][$language['language_id']]; ?></textarea>
											<?php if (isset($error['validate']['int']['error_message'][$language['language_id']])) { ?>
											<div class="text-danger"><?php echo $error['validate']['int']['error_message'][$language['language_id']]; ?></div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
							</div>
							<div id="field-validate-email" class="field-validate"<?php if ($validate != 'email') echo ' style="display:none"'; ?>>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-validate-email-check-domain"><?php echo $entry_field_email_check_domain; ?></label>
									<div class="col-sm-1">
										<select id="field-validate-email-check-domain" class="form-control" name="field[validate][option][email][check_domain]" >
											<?php foreach($status_variables as $key => $variable) { ?>
											<option <?php if (!empty($validate_option['email']['check_domain']) && $validate_option['email']['check_domain'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<ul class="nav nav-tabs language">
									<?php foreach ($languages as $language) { ?>
									<li><a href="#tab-language-validate-email-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>
								<?php foreach ($languages as $language) { ?>
								<div id="tab-language-validate-email-<?php echo $language['language_id']; ?>" class="tab-pane">
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="field-validate-email-error-message-<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_error_message; ?>"><?php echo $entry_error_message; ?></span></label>
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
											<textarea id="field-validate-email-error-message-<?php echo $language['language_id']; ?>" class="form-control" name="field[validate][option][email][error_message][<?php echo $language['language_id']; ?>]" rows="3" cols="65"><?php if (!empty($validate_option['email']['error_message'][$language['language_id']])) echo $validate_option['email']['error_message'][$language['language_id']]; ?></textarea>
											<?php if (isset($error['validate']['email']['error_message'][$language['language_id']])) { ?>
											<div class="text-danger"><?php echo $error['validate']['email']['error_message'][$language['language_id']]; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group required field-check-domain"<?php if (empty($validate_option['email']['check_domain'])) echo ' style="display:none"'; ?>>
										<label class="col-sm-2 control-label" for="field-validate-email-error-message-domain-<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_error_message_email_domain; ?>"><?php echo $entry_error_message_email_domain; ?></span></label>
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
														<tr>
															<td class="text-left">{field_domain}</td>
															<td class="text-left"><?php echo $text_token_field_domain; ?></td>
														</tr>
													</tbody>
												</table>
											</div>
											<textarea id="field-validate-email-error-message-domain-<?php echo $language['language_id']; ?>" class="form-control" name="field[validate][option][email][error_message_domain][<?php echo $language['language_id']; ?>]" rows="3" cols="65"><?php if (!empty($validate_option['email']['error_message_domain'][$language['language_id']])) echo $validate_option['email']['error_message_domain'][$language['language_id']]; ?></textarea>
											<?php if (isset($error['validate']['email']['error_message_domain'][$language['language_id']])) { ?>
											<div class="text-danger"><?php echo $error['validate']['email']['error_message_domain'][$language['language_id']]; ?></div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
							</div>
							<div id="field-validate-url" class="field-validate"<?php if ($validate != 'url') echo ' style="display:none"'; ?>>
								<ul class="nav nav-tabs language">
									<?php foreach ($languages as $language) { ?>
									<li><a href="#tab-language-validate-url-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>
								<?php foreach ($languages as $language) { ?>
								<div id="tab-language-validate-url-<?php echo $language['language_id']; ?>" class="tab-pane">
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="field-validate-url-error-message-<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_error_message; ?>"><?php echo $entry_error_message; ?></span></label>
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
											<textarea id="field-validate-url-error-message-<?php echo $language['language_id']; ?>" class="form-control" name="field[validate][option][url][error_message][<?php echo $language['language_id']; ?>]" rows="3" cols="65"><?php if (!empty($validate_option['url']['error_message'][$language['language_id']])) echo $validate_option['url']['error_message'][$language['language_id']]; ?></textarea>
											<?php if (isset($error['validate']['url']['error_message'][$language['language_id']])) { ?>
											<div class="text-danger"><?php echo $error['validate']['url']['error_message'][$language['language_id']]; ?></div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
							</div>
							<div id="field-validate-plain_text" class="field-validate"<?php if ($validate != 'plain_text') echo ' style="display:none"'; ?>>
								<ul class="nav nav-tabs language">
									<?php foreach ($languages as $language) { ?>
									<li><a href="#tab-language-validate-plain-text-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>
								<?php foreach ($languages as $language) { ?>
								<div id="tab-language-validate-plain-text-<?php echo $language['language_id']; ?>" class="tab-pane">
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="field-validate-plain-text-error-message-<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_error_message; ?>"><?php echo $entry_error_message; ?></span></label>
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
											<textarea id="field-validate-plain-text-error-message-<?php echo $language['language_id']; ?>" class="form-control" name="field[validate][option][plain_text][error_message][<?php echo $language['language_id']; ?>]" rows="3" cols="65"><?php if (!empty($validate_option['plain_text']['error_message'][$language['language_id']])) echo $validate_option['plain_text']['error_message'][$language['language_id']]; ?></textarea>
											<?php if (isset($error['validate']['plain_text']['error_message'][$language['language_id']])) { ?>
											<div class="text-danger"><?php echo $error['validate']['plain_text']['error_message'][$language['language_id']]; ?></div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
							</div>
						</div>
					</div>
					<input type="hidden" name="field[code]" value="<?php echo $code; ?>" />
					<input type="hidden" name="field[field_id]" value="<?php echo $field_id; ?>" />
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"><!--

		$('#field-validate-email-check-domain').change(function(event){
			
			if ($(this).val() == 1) {
				$('.field-check-domain').show();
			} else {
				$('.field-check-domain').hide();
			}
			
		});
	
		$('select#field-type').change(function(event){
			
			var type = $(this).val();
			
			$('.field-type').hide();
			$('#field-type-' + type).fadeIn('fast');
			
			// help
			$('.help-item').hide();
			$('#help-item-' + type).fadeIn('fast');
			
			// validation
			$("select#field-validate option:gt(0)[class!='*'][class!=" + type + "]").attr('disabled', 'disabled');
			$('select#field-validate option[class*=' + type + ']').removeAttr('disabled');
			
			initTabValidate();
			
			if ($("select#field-validate option:selected").is(':disabled')) {
				
				$('select#field-validate option:selected').each(function(){
					this.selected=false;
				});
				
				$('select#field-validate').trigger('change');
			}
		});
		
		initTabValidate();
		
		$('select#field-validate').change(function(event){
			
			var validate_type = $(this).val();
			
			$('.field-validate').hide();
			$('#field-validate-' + validate_type).fadeIn('fast');
			
			// help
			$('.help-validate').hide();
			$('#help-validate-' + validate_type).fadeIn('fast');
		});
		
		$('#add-select-option').click(function(event){
			
			event.preventDefault();
			
			var parent = $(this).closest('.field-type');
			var source = $(this).prev('input.add-value');
			var value = source.val();
			
			if (value != '') {
				
				var table = $('table.table', parent);
				var weight = getWeight(table);
				
				var select_option_id = -1;
				
				$('tbody tr', table).each(function(){
					
					var row_id = $(this).data('row');
					
					if (parseInt(row_id) > select_option_id) {
						select_option_id = row_id;
					}
					
				});
				
				select_option_id++;
				
				var html = '<tr id="row-select-' + select_option_id + '" data-row="' + select_option_id + '">';
				html += '		<td class="text-left drag" width="1"><a title="<?php echo $text_drag; ?>">&nbsp;</a></td>';
				html += '		<td class="text-left col-sm-2">';
				html += '			<input class="form-control" type="text" value="' + value + '" name="field[type][option][select][option][' + select_option_id + '][value]" />';
				html += '			<input type="hidden" class="weight" value="' + weight + '" name="field[type][option][select][option][' + select_option_id + '][weight]" />';
				html += '		</td>';
				html += '		<td class="text-left"><input class="form-control" type="radio" value="' + select_option_id + '" name="field[type][option][select][selected]" /></td>';
				html += '		<td class="text-right"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
				html += '	</tr>';
				
				$('tbody', table).append(html);
				
				source.val('');
				
				$('#row-select-' + select_option_id + ' button[data-toggle=tooltip]').tooltip('destroy').tooltip();
				
				addTableDnD(table);
			}
		});
		
		$('#add-checkbox-item').click(function(event){
			
			event.preventDefault();
			
			var parent = $(this).closest('.field-type');
			var source = $(this).prev('input.add-value');
			var value = source.val();
			
			if (value != '') {
				
				var table = $('table.table', parent);
				var weight = getWeight(table);
				
				var checkbox_item_id = -1;
				
				$('tbody tr', table).each(function(){
					
					var row_id = $(this).data('row');
					
					if (parseInt(row_id) > checkbox_item_id) {
						checkbox_item_id = row_id;
					}
					
				});
				
				checkbox_item_id++;
				
				var html = '<tr id="row-checkbox-' + checkbox_item_id + '" data-row="' + checkbox_item_id + '">';
				html += '		<td class="left drag" width="1"><a title="<?php echo $text_drag; ?>">&nbsp;</a></td>';
				html += '		<td class="text-left col-sm-2">';
				html += '			<input class="form-control" type="text" value="' + value + '" name="field[type][option][checkbox][option][' + checkbox_item_id + '][value]" />';
				html += '			<input type="hidden" class="weight" value="' + weight + '" name="field[type][option][checkbox][option][' + checkbox_item_id + '][weight]" />';
				html += '		</td>';
				html += '		<td class="text-left"><input class="form-control" type="checkbox" value="' + checkbox_item_id + '" name="field[type][option][checkbox][checked][]" /></td>';
				html += '		<td class="text-right"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
				html += '	</tr>';
				
				$('tbody', table).append(html);
				
				source.val('');
				
				$('#row-checkbox-' + checkbox_item_id + ' button[data-toggle=tooltip]').tooltip('destroy').tooltip();
				
				addTableDnD(table);
			}
		});
		
		$('#add-radio-item').click(function(event){
			
			event.preventDefault();
			
			var parent = $(this).closest('.field-type');
			var source = $(this).prev('input.add-value');
			var value = source.val();
			
			if (value != '') {
				
				var table = $('table.table', parent);
				var weight = getWeight(table);
				
				var radio_item_id = -1;
				
				$('tbody tr', table).each(function(){
					
					var row_id = $(this).data('row');
					
					if (parseInt(row_id) > radio_item_id) {
						radio_item_id = row_id;
					}
					
				});
				
				radio_item_id++;
				
				var html = '<tr id="row-radio-' + radio_item_id + '" data-row="' + radio_item_id + '">';
				html += '		<td class="left drag" width="1"><a title="<?php echo $text_drag; ?>">&nbsp;</a></td>';
				html += '		<td class="text-left col-sm-2">';
				html += '			<input class="form-control" type="text" value="' + value + '" name="field[type][option][radio][option][' + radio_item_id + '][value]" />';
				html += '			<input type="hidden" class="weight" value="' + weight + '" name="field[type][option][radio][option][' + radio_item_id + '][weight]" />';
				html += '		</td>';
				html += '		<td class="text-left"><input class="form-control" type="radio" value="' + radio_item_id + '" name="field[type][option][radio][checked]" /></td>';
				html += '		<td class="text-right"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
				html += '	</tr>';
				
				$('tbody', table).append(html);
				
				source.val('');
				
				$('#row-radio-' + radio_item_id + ' button[data-toggle=tooltip]').tooltip('destroy').tooltip();
				
				addTableDnD(table);
			}
		});
		
		function getWeight(table) {
			
			var weight = -1;
			
			$('tbody tr', table).each(function(i, el){
				var item_weight = $('input.weight', el).val();
				if (item_weight > weight) weight = item_weight;
			});
			
			return ++weight;
		}
		
		$('.field-type table.table').each(function(){
			addTableDnD(this);
		});
		
		function addTableDnD(el) {
			$(el).tableDnD({
				onDrop: function(table, row) {
					
					$('tbody tr', table).each(function(){
						$('td input.weight', this).val($(this).index());
					});
					
					$(row).addClass('changed').find('td:eq(1)');
					
					var change = $(row).find('td:eq(1)');
					
					if (!$('span.required', change).length) {
						$(change).append(' <span class="required" title="<?php echo $text_edit_sort_value; ?>">*</span>');
					}
					
				},
				onDragClass: 'draggable',
				dragHandle: ".drag"
			}).addClass('table-dnd');
		}
		
		function initTabValidate() {
			
			if ($('select#field-validate option:not(:disabled)').length == 1) {
				$('#tabs a[href=#tab-validate]').css('visibility', 'hidden')
			} else {
				$('#tabs a[href=#tab-validate]').attr('style', 'display:inline');
			}
			
		}
	
		$('body').on('click', '.field-type .btn.btn-danger', function(event){
			event.preventDefault();
			$('button[data-toggle=tooltip]', $(this).closest('tr')).tooltip('destroy');
			$(this).closest('tr').remove();
		});
		
		$('.language').each(function(){
			$('a:first', this).tab('show');
		});
		
	</script>
<?php echo $footer; ?>