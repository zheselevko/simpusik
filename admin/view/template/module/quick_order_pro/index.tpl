<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<button onclick="$('#form').attr('action', $('#form').attr('action') + '&apply=1'); $('#form').submit();" type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_apply; ?>" class="btn"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			</div>
			<h1><?php echo $heading_title; ?><span class="version"><?php echo $version; ?></span></h1>
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
						<?php if (!$new) { ?>
						<li><a href="#tab-fields" data-toggle="tab"><?php echo $tab_fields; ?></a></li>
						<?php } ?>
						<li><a href="#tab-setting" data-toggle="tab"><?php echo $tab_setting; ?></a></li>
					</ul>
					<div class="tab-content">
            			<div class="tab-pane active" id="tab-general">
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
								<div class="col-sm-2">
									<input type="text" name="module[name]" value="<?php if(isset($module_info['name'])) echo $module_info['name']; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
									<?php if (isset($error['name'])) { ?>
									<div class="text-danger"><?php echo $error['name']; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="module-status"><?php echo $entry_status; ?></label>
								<div class="col-sm-1">
									<select id="module-status" name="module[status]" class="form-control">
										<?php foreach($status_variables as $key => $variable) { ?>
										<option <?php if (!empty($module_info['status']) && $module_info['status'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<ul class="nav nav-tabs" id="language">
								<?php foreach ($languages as $language) { ?>
								<li><a href="#tab-language-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
								<?php } ?>
							</ul>
							<?php foreach ($languages as $language) { ?>
							<div id="tab-language-<?php echo $language['language_id']; ?>" class="tab-pane">
								<div class="form-group">
									<label class="col-sm-2 control-label" for="template-title-<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
										<div class="col-sm-2">
											<input id="template-title-<?php echo $language['language_id']; ?>" type="text" name="module[title][<?php echo $language['language_id']; ?>]" value="<?php if(isset($module_info['title'][$language['language_id']])) echo $module_info['title'][$language['language_id']]; ?>" class="form-control" />
										</div>
								</div>
								<div class="form-group description">
									<label class="col-sm-2 control-label" for="template-description-<?php echo $language['language_id']; ?>">
										<span data-toggle="tooltip" title="<?php echo $help_description; ?>"><?php echo $entry_description; ?></span><br />
										<a class="js show-hide-editor help"><?php echo (isset($module_info['editor'][$language['language_id']]) && $module_info['editor'][$language['language_id']]) ? $text_disable_editor : $text_enabled_editor; ?></a>
									</label>
									<div class="col-sm-10">
										<p class="link">
											<a class="js"><?php echo $text_tokens; ?></a>
										</p>
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
														<td class="text-left" colspan="2"><span class="title"><?php echo $text_title_shop; ?></span></td>
													</tr>
													<tr>
														<td class="text-left">{config::name}</td>
														<td class="text-left"><?php echo $text_token_config_name; ?></td>
													</tr>
													<tr>
														<td class="text-left">{config::title}</td>
														<td class="text-left"><?php echo $text_token_config_title; ?></td>
													</tr>
													<tr>
														<td class="text-left">{config::owner}</td>
														<td class="text-left"><?php echo $text_token_config_owner; ?></td>
													</tr>
													<tr>
														<td class="text-left">{config::address}</td>
														<td class="text-left"><?php echo $text_token_config_address; ?></td>
													</tr>
													<tr>
														<td class="text-left">{config::email}</td>
														<td class="text-left"><?php echo $text_token_config_email; ?></td>
													</tr>
													<tr>
														<td class="text-left">{config::telephone}</td>
														<td class="text-left"><?php echo $text_token_config_telephone; ?></td>
													</tr>
													<tr>
														<td class="text-left">{config::fax}</td>
														<td class="text-left"><?php echo $text_token_config_fax; ?></td>
													</tr>
													<tr>
														<td class="text-left" colspan="2"><span class="title"><?php echo $text_title_customer; ?></span> <sup>[1]</sup></td>
													</tr>
													<tr>
														<td class="text-left">{customer::firstname}</td>
														<td class="text-left"><?php echo $text_token_customer_firstname; ?></td>
													</tr>
													<tr>
														<td class="text-left">{customer::lastname}</td>
														<td class="text-left"><?php echo $text_token_customer_lastname; ?></td>
													</tr>
													<tr>
														<td class="text-left">{customer::email}</td>
														<td class="text-left"><?php echo $text_token_customer_email; ?></td>
													</tr>
													<tr>
														<td class="text-left">{customer::telephone}</td>
														<td class="text-left"><?php echo $text_token_customer_telephone; ?></td>
													</tr>
													<tr>
														<td class="text-left">{customer::fax}</td>
														<td class="text-left"><?php echo $text_token_customer_fax; ?></td>
													</tr>
													<tr>
														<td class="text-left">{customer::rewardpoints}</td>
														<td class="text-left"><?php echo $text_token_customer_reward; ?></td>
													</tr>
												</tbody>
											</table>
											<dl class="dl-horizontal">
												<dt><sup>[1]</sup></dt>
												<dd><?php echo $text_help_tokens_customer; ?></dd>
											</dl>
										</div>
										<textarea class="form-control<?php echo (isset($module_info['editor'][$language['language_id']]) && $module_info['editor'][$language['language_id']]) ? ' enabled' : ' disable'; ?>" id="template-description-<?php echo $language['language_id']; ?>" rows="19" cols="120" name="module[description][<?php echo $language['language_id']; ?>]"><?php if (isset($module_info['description'][$language['language_id']])) echo $module_info['description'][$language['language_id']]; ?></textarea>
										<input type="hidden" name="module[editor][<?php echo $language['language_id']; ?>]" value="<?php echo (isset($module_info['editor'][$language['language_id']]) ? $module_info['editor'][$language['language_id']] : 0); ?>" />
									</div>
								</div>												
							</div>
							<?php } ?>
						</div>
						<?php if (!$new) { ?>
						<div class="tab-pane" id="tab-fields">
							<table class="table m">
								<thead>
									<tr>
										<td class="text-left" colspan="2" ><?php echo $column_field_title; ?></td>
										<td class="text-left"><?php echo $column_field_id; ?></td>
										<td class="text-left"><?php echo $column_field_type; ?></td>
										<td class="text-left"><?php echo $column_status; ?></td>
										<td class="text-left"><?php echo $column_required; ?></td>
										<td class="text-right"><?php echo $column_action; ?></td>
									</tr>
								</thead>
								<tbody>
									<?php if ($fields) { ?>
									<?php $class = 'odd'; ?>
									<?php foreach ($fields as $field) { ?>
									<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
									<tr id="row-<?php echo $field['field_id']; ?>" class="<?php echo $class; ?><?php if (!$field['status']) echo ' row-status-disabled'; ?>">
										<td class="text-left drag" width="1"><a title="<?php echo $text_drag; ?>">&nbsp;</a></td>
										<td class="text-left"><?php echo $field['title']; ?></td>
										<td class="text-left">
											<?php echo $field['field_id']; ?>
											<input type="hidden" class="order" name="module[fields][<?php echo $field['field_id']; ?>][weight]" value="<?php echo $field['weight']; ?>" />
										</td>
										<td class="text-left" width="20%"><?php echo $field['type']; ?></td>
										<td class="text-left">
											<?php if ($field['base']) { ?>
											<?php echo $text_enabled; ?>
											<input name="module[fields][<?php echo $field['field_id']; ?>][status]" type="hidden" value="1" />
											<?php } else { ?>
											<div class="form-inline">
												<select name="module[fields][<?php echo $field['field_id']; ?>][status]" class="status form-control">
													<?php foreach($status_variables as $key => $variable) { ?>
													<option <?php if ($field['status'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
													<?php } ?>
												</select>
											</div>
											<?php } ?>
										</td>
										<td class="text-left">
											<?php if ($field['base']) { ?>
											<?php echo $text_yes; ?>
											<input name="module[fields][<?php echo $field['field_id']; ?>][required]" type="hidden" value="1" />
											<?php } else { ?>
											<div class="form-inline">
												<select name="module[fields][<?php echo $field['field_id']; ?>][required]" class="form-control">
													<?php foreach($boolean_variables as $key => $variable) { ?>
													<option <?php if ($field['required'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
													<?php } ?>
												</select>
											</div>
											<?php } ?>
										</td>
										<td class="text-right">
											<?php foreach ($field['action'] as $action) { ?>
											<a href="<?php echo $action['href']; ?>" data-toggle="tooltip" title="<?php echo $action['text']; ?>" class="<?php echo $action['btn_class']; ?>"><i class="<?php echo $action['class']; ?>"></i></a>
											<?php } ?>
										</td>
									</tr>
									<?php } ?>
									<?php } else { ?>
									<tr>
										<td class="text-center" colspan="5"><?php echo $text_no_results; ?></td>
									</tr>
									<?php } ?>
								</tbody>
							</table>
							<div class="form-inline">
								<?php echo $text_select_field; ?>&nbsp;
								<select class="available-fields form-control">
									<option value="0"><?php echo $text_none; ?></option>
									<?php foreach ($available_fields as $key => $value) { ?>
									<option <?php if (array_key_exists($key, $fields)) echo 'class="hidden"'; ?> value="<?php echo $key; ?>"><?php echo $value; ?></option>
									<?php } ?>
								</select>&nbsp;
								<a id="add-field" data-toggle="tooltip" title="<?php echo $button_insert; ?>" class="btn btn-primary" style="display: none;"><i class="fa fa-plus"></i></a>
							</div>
							<div class="help-block"><?php echo $text_help_custom_fields; ?></div>
						</div>
						<?php } ?>
						<div class="tab-pane" id="tab-setting">
							<div class="row">
								<div class="col-sm-2">
									<ul class="nav nav-pills nav-stacked">
										<li class="active"><a href="#tab-setting-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
										<li><a href="#tab-setting-product" data-toggle="tab"><?php echo $tab_product; ?></a></li>
										<li><a href="#tab-catcha" data-toggle="tab"><?php echo $tab_catcha; ?></a></li>
										<li><a href="#tab-notifications" data-toggle="tab"><?php echo $tab_notifications; ?></a></li>
									</ul>
								</div>
								<div class="col-sm-10">
									<div class="tab-content">
										<div class="tab-pane active" id="tab-setting-general">
											<div class="form-group">
												<label class="col-sm-2 control-label" for="template-order-status-id"><?php echo $entry_order_status; ?></label>
												<div class="col-sm-2">
													<select id="template-order-status-id" name="module[order_status_id]" class="form-control">
														<?php foreach ($order_statuses as $order_status) { ?>
														<option value="<?php echo $order_status['order_status_id']; ?>" <?php if (!empty($module_info['order_status_id']) && $module_info['order_status_id'] == $order_status['order_status_id']) echo 'selected="selected"'; ?>><?php echo $order_status['name']; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_store; ?>"><?php echo $entry_store; ?></span></label>
												<div class="col-sm-3">
													<div class="well well-sm" style="height: 150px; overflow: auto;">
														<?php foreach ($stores as $store) { ?>
														<div class="checkbox">
															<label>
																<input type="checkbox" name="module[store][]" value="<?php echo $store['store_id']; ?>" <?php  if (!empty($module_info['store']) && in_array($store['store_id'], $module_info['store'])) echo 'checked="checked"'; ?> />
																<?php echo $store['name']; ?>
															</label>
														</div>
														<?php } ?>
													</div>
													<a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_customer_group; ?>"><?php echo $entry_customer_group; ?></span></label>
												<div class="col-sm-3">
													<div class="well well-sm" style="height: 150px; overflow: auto;">
														<?php foreach ($customer_groups as $group_info) { ?>
														<div class="checkbox">
															<label>
																<input type="checkbox" name="module[customer_group][]" value="<?php echo $group_info['customer_group_id']; ?>" <?php if (!empty($module_info['customer_group']) && in_array($group_info['customer_group_id'], $module_info['customer_group'])) echo 'checked="checked"'; ?> />
																<?php echo $group_info['name']; ?>
															</label>
														</div>
														<?php } ?>
													</div>
													<a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
												</div>
											</div>
											<div class="form-group parent">
												<label class="col-sm-2 control-label" for="template-guest-checkout"><span data-toggle="tooltip" title="<?php echo $help_guest_checkout; ?>"><?php echo $entry_guest_checkout; ?></span></label>
												<div class="col-sm-2">
													<select id="template-guest-checkout" name="module[guest_checkout]" class="slider form-control">
														<?php foreach($status_variables as $key => $variable) { ?>
														<option <?php if (!empty($module_info['guest_checkout']) && $module_info['guest_checkout'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
											<div class="children"<?php if (empty($module_info['guest_checkout'])) echo ' style="display:none;"'; ?>>
												<div class="form-group parent">
													<label class="col-sm-2 control-label" for="template-create-customer"><span data-toggle="tooltip" title="<?php echo $help_create_customer; ?>"><?php echo $entry_create_customer; ?></span></label>
													<div class="col-sm-2">
														<select id="template-create-customer" name="module[create_customer]" class="slider form-control">
															<?php foreach($status_variables as $key => $variable) { ?>
															<option <?php if (!empty($module_info['create_customer']) && $module_info['create_customer'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
															<?php } ?>
														</select>
														<div class="alert alert-warning create-customer"<?php if (empty($module_info['create_customer'])) echo ' style="display:none"'; ?>><?php echo $text_help_create_new_customer; ?></div>
													</div>
												</div>
												<div class="children"<?php if (empty($module_info['create_customer']) || !$module_info['create_customer']) echo ' style="display:none;"'; ?>>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="template-new-customer-login"><span data-toggle="tooltip" title="<?php echo $help_new_customer_login; ?>"><?php echo $entry_new_customer_login; ?></span></label>
														<div class="col-sm-2">
															<select id="template-new-customer-login" name="module[new_customer_login]" class="form-control">
																<?php foreach($status_variables as $key => $variable) { ?>
																<option <?php if (!empty($module_info['new_customer_login']) && $module_info['new_customer_login'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="template-new-customer-group"><span data-toggle="tooltip" title="<?php echo $help_new_customer_group; ?>"><?php echo $entry_new_customer_group; ?></span></label>
														<div class="col-sm-2">
															<select id="template-new-customer-group" name="module[new_customer_group]" class="form-control">
																<?php foreach ($customer_groups as $customer_group) { ?>
																<option <?php if (!empty($module_info['new_customer_group']) && $module_info['new_customer_group'] == $customer_group['customer_group_id']) echo 'selected="selected"'; ?> value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
																<?php } ?>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="template-new-customer-password"><span data-toggle="tooltip" title="<?php echo $help_new_customer_password; ?>"><?php echo $entry_new_customer_password; ?></span></label>
														<div class="col-sm-2">
															<input type="text" id="template-new-customer-password" name="module[new_customer_password]" value="<?php if (isset($module_info['new_customer_password'])) echo $module_info['new_customer_password']; ?>" <?php if (isset($module_info['new_customer_random_password']) && $module_info['new_customer_random_password']) echo 'disabled="disabled"'; ?> class="form-control" /> 
															<div class="checkbox">
																<label><input type="checkbox" value="1" id="template-new-customer-random-password" name="module[new_customer_random_password]" <?php if (isset($module_info['new_customer_random_password']) && $module_info['new_customer_random_password']) echo 'checked="checked"'; ?> /> <?php echo $entry_new_customer_random_password; ?></label>
															</div>
															<?php if (isset($error['new_customer_password'])) { ?>
															<div class="text-danger"><?php echo $error['new_customer_password']; ?></div>
															<?php } ?>
														</div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label" for="template-autch-checkout"><?php echo $entry_autch_checkout; ?></label>
													<div class="col-sm-2">
													<select id="template-autch-checkout" name="module[autch_checkout]" class="form-control">
														<?php foreach($status_variables as $key => $variable) { ?>
														<option <?php if (isset($module_info['autch_checkout']) && $module_info['autch_checkout'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label" for="template-subtract"><span data-toggle="tooltip" title="<?php echo $help_subtract; ?>"><?php echo $entry_subtract; ?></span></label>
													<div class="col-sm-2">
													<select id="template-subtract" name="module[subtract]" class="form-control">
														<?php foreach($status_variables + array('default' => $text_product_setting) as $key => $variable) { ?>
														<option <?php if (!empty($module_info['subtract']) && $module_info['subtract'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label" for="template-stock-checkout"><span data-toggle="tooltip" title="<?php echo $help_stock_checkout; ?>"><?php echo $entry_stock_checkout; ?></span></label>
													<div class="col-sm-2">
													<select id="template-stock-checkout" name="module[stock_checkout]" class="form-control">
														<?php foreach($status_variables as $key => $variable) { ?>
														<option <?php if (isset($module_info['stock_checkout']) && $module_info['stock_checkout'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label" for="quick-order-min-total"><?php if (!empty($currency_title)) { ?><span data-toggle="tooltip" title="<?php echo $currency_title; ?>"><?php echo $entry_min_total; ?></span><?php } else { ?><?php echo $entry_min_total; ?><?php } ?></label>
													<div class="col-sm-2">
													<input id="quick-order-min-total" type="text" name="module[min_total]" value="<?php if (isset($module_info['min_total'])) echo $module_info['min_total']; ?>" class="form-control" />
													<?php if (isset($error['min_total'])) { ?>
													<div class="text-danger"><?php echo $error['min_total']; ?></div>
													<?php } ?>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label" for="quick-order-max-total"><?php if (!empty($currency_title)) { ?><span data-toggle="tooltip" title="<?php echo $currency_title; ?>"><?php echo $entry_max_total; ?></span><?php } else { ?><?php echo $entry_max_total; ?><?php } ?></label>
												<div class="col-sm-2">
													<input id="quick-order-max-total" type="text" name="module[max_total]" value="<?php if (isset($module_info['max_total'])) echo $module_info['max_total']; ?>" class="form-control" />
													<?php if (isset($error['max_total'])) { ?>
													<div class="text-danger"><?php echo $error['max_total']; ?></div>
													<?php } ?>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label" for="quick-order-min-weight"><?php if (!empty($weight_title)) { ?><span data-toggle="tooltip" title="<?php echo $weight_title; ?>"><?php echo $entry_min_weight; ?></span><?php } else { ?><?php echo $entry_min_weight; ?><?php } ?></label>
													<div class="col-sm-2">
													<input id="quick-order-min-weight" type="text" name="module[min_weight]" value="<?php if (isset($module_info['min_weight'])) echo $module_info['min_weight']; ?>" class="form-control" />
													<?php if (isset($error['min_weight'])) { ?>
													<div class="text-danger"><?php echo $error['min_weight']; ?></span>
													<?php } ?>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label" for="quick-order-max-weight"><?php if (!empty($weight_title)) { ?><span data-toggle="tooltip" title="<?php echo $weight_title; ?>"><?php echo $entry_max_weight; ?></span><?php } else { ?><?php echo $entry_max_weight; ?><?php } ?></label>
													<div class="col-sm-2">
													<input id="quick-order-max-weight" type="text" name="module[max_weight]" value="<?php if (isset($module_info['max_weight'])) echo $module_info['max_weight']; ?>" class="form-control" />
													<?php if (isset($error['max_weight'])) { ?>
													<div class="text-danger"><?php echo $error['max_weight']; ?></span>
													<?php } ?>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label" for="template-minimum"><span data-toggle="tooltip" title="<?php echo $help_minimum; ?>"><?php echo $entry_minimum; ?></span></label>
													<div class="col-sm-2">
													<select id="template-minimum" name="module[minimum]" class="form-control">
														<?php foreach($status_variables as $key => $variable) { ?>
														<option <?php if (isset($module_info['minimum']) && $module_info['minimum'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label" for="template-show-total"><?php echo $entry_show_total; ?></label>
													<div class="col-sm-2">
													<select id="template-show-total" name="module[show_total]" class="form-control">
														<?php foreach($status_variables as $key => $variable) { ?>
														<option <?php if (isset($module_info['show_total']) && $module_info['show_total'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
											<div class="form-group parent">
												<label class="col-sm-2 control-label" for="template-redirect"><?php echo $entry_redirect_success; ?></label>
												<div class="col-sm-2">
													<select id="template-redirect" name="module[redirect]" class="slider form-control">
														<?php foreach($status_variables as $key => $variable) { ?>
														<option <?php if (isset($module_info['redirect']) && $module_info['redirect'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
											<div class="children"<?php if (isset($module_info['redirect']) && $module_info['redirect']) echo ' style="display:none"'; ?>>
												<div class="form-group required">
													<label class="col-sm-2 control-label"><?php echo $entry_success_message; ?></label>
													<div class="col-sm-3">
														<?php foreach ($languages as $language) { ?>
														<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
														<textarea name="module[success_message][<?php echo $language['language_id']; ?>]" class="form-control" rows="4"><?php if  (isset($module_info['success_message'][$language['language_id']])) echo $module_info['success_message'][$language['language_id']]; ?></textarea>
														
														</div>
														<?php } ?>
														<?php if (isset($error['success_message'])) { ?>
														<div class="text-danger"><?php echo $error['success_message']; ?></div>
														<?php } ?>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_button_label; ?>"><?php echo $entry_button_label; ?></span></label>
												<div class="col-sm-2">
													<?php foreach ($languages as $language) { ?>
													<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
													<input type="text" name="module[button][<?php echo $language['language_id']; ?>]" value="<?php echo isset($module_info['button'][$language['language_id']]) ? $module_info['button'][$language['language_id']] : ''; ?>" class="form-control" />
													</div>
													<?php if (isset($error_name[$language['language_id']])) { ?>
													<div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
													<?php } ?>
													<?php } ?>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label" for="quick-order-class"><span data-toggle="tooltip" title="<?php echo $help_css_class; ?>"><?php echo $entry_css_class; ?></span></label>
													<div class="col-sm-2">
													<input id="quick-order-class" type="text" name="module[class]" value="<?php if (isset($module_info['class'])) echo $module_info['class']; ?>" class="form-control" />
												</div>
											</div>
										</div>
										<div class="tab-pane" id="tab-setting-product">
											<div class="form-group parent">
												<label class="col-sm-2 control-label" for="template-use-option"><?php echo $entry_use_option; ?></label>
												<div class="col-sm-2">
													<select id="template-use-option" name="module[use_option]" class="slider form-control">
														<?php foreach($status_variables as $key => $variable) { ?>
														<option <?php if (isset($module_info['use_option']) && $module_info['use_option'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
											<div class="children"<?php if (empty($module_info['use_option'])) echo ' style="display:none;"'; ?>>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="template-option-required"><span data-toggle="tooltip" title="<?php echo $help_option_required; ?>"><?php echo $entry_option_required; ?></span></label>
													<div class="col-sm-2">
														<select id="template-option-required" name="module[option_required]" class="form-control">
															<?php foreach($status_variables as $key => $variable) { ?>
															<option <?php if (isset($module_info['option_required']) && $module_info['option_required'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
															<?php } ?>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="template-show-option"><span data-toggle="tooltip" title="<?php echo $help_show_option; ?>"><?php echo $entry_show_option; ?></span></label>
													<div class="col-sm-2">
														<select id="template-show-option" name="module[show_option]" class="form-control">
															<?php foreach($status_variables as $key => $variable) { ?>
															<option <?php if (isset($module_info['show_option']) && $module_info['show_option'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
															<?php } ?>
														</select>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label" for="template-checkout-cart-append"><?php echo $entry_checkout_cart_append; ?></label>
												<div class="col-sm-2">
													<select id="template-checkout-cart-append" name="module[checkout_cart_append]" class="form-control">
														<?php foreach($status_variables as $key => $variable) { ?>
														<option <?php if (isset($module_info['checkout_cart_append']) && $module_info['checkout_cart_append'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>
										<div class="tab-pane" id="tab-catcha">
											<div class="form-group parent">
												<label class="col-sm-2 control-label" for="template-captcha-show-lines"><?php echo $entry_captcha_show_lines; ?></label>
												<div class="col-sm-2">
													<select id="template-captcha-show-lines" name="module[captcha_show_lines]" class="slider form-control">
														<?php foreach($status_variables as $key => $variable) { ?>
														<option <?php if (!empty($module_info['captcha_show_lines']) && $module_info['captcha_show_lines'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
											<div class="children"<?php if (empty($module_info['captcha_show_lines'])) echo ' style="display:none"'; ?>>
												<div class="form-group">
													<label class="col-sm-2 control-label"><?php echo $entry_captcha_color_line; ?></label>
													<div class="col-sm-2">
														<div class="colorpicker_item">
															<div style="background-color: rgb(<?php echo $module_info['captcha_line_color']; ?>);">&nbsp;</div>
														</div>
														<input id="template-captcha-line-color" type="hidden" name="module[captcha_line_color]" value="<?php echo $module_info['captcha_line_color']; ?>" />
														<?php if (isset($error['captcha_line_color'])) { ?>
														<div class="text-danger"><?php echo $error['captcha_line_color']; ?></div>
														<?php } ?>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label"><?php echo $entry_captcha_text_color; ?></label>
												<div class="col-sm-2">
													<div class="colorpicker_item">
														<div style="background-color: rgb(<?php echo $module_info['captcha_color']; ?>);">&nbsp;</div>
													</div>
													<input id="template-captcha-color" type="hidden" name="module[captcha_color]" value="<?php echo $module_info['captcha_color']; ?>" />
													<?php if (isset($error['captcha_color'])) { ?>
													<div class="text-danger"><?php echo $error['captcha_color']; ?></div>
													<?php } ?>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label" for="template-captcha-count-items"><?php echo $entry_captcha_count_items; ?></label>
												<div class="col-sm-1">
													<select id="template-captcha-count-items" name="module[captcha_count_items]" class="form-control">
														<?php foreach($captcha_count_items as $key) { ?>
														<option <?php if (!empty($module_info['captcha_count_items']) && $module_info['captcha_count_items'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $key; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
											<div class="form-group required">
												<label class="col-sm-2 control-label" for="template-captcha-alphabet"><?php echo $entry_captcha_alphabet; ?></label>
												<div class="col-sm-2">
													<input id="template-captcha-alphabet" type="text" name="module[captcha_alphabet]" value="<?php echo $module_info['captcha_alphabet']; ?>" class="form-control" />
													<?php if (isset($error['captcha_alphabet'])) { ?>
													<div class="text-danger"><?php echo $error['captcha_alphabet']; ?></div>
													<?php } ?>
												</div>
											</div>
										</div>
										<div class="tab-pane" id="tab-notifications">
											<div class="form-group parent">
												<label class="col-sm-2 control-label" for="quick-order-pro-setting-alert-customer"><?php echo $entry_alert_customer; ?></label>
												<div class="col-sm-2">
													<select id="quick-order-pro-setting-alert-customer" name="module[alert_customer]" class="slider form-control">
														<?php foreach($status_variables as $key => $variable) { ?>
														<option <?php if (!empty($module_info['alert_customer']) && $module_info['alert_customer'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
											<div class="children"<?php if (empty($module_info['alert_customer'])) echo ' style="display:none"'; ?>>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="quick-order-pro-setting-customer-email-show-ip"><?php echo $entry_customer_email_show_ip; ?></label>
													<div class="col-sm-2">
														<select id="quick-order-pro-setting-customer-email-show-ip" name="module[customer_email_show_ip]" class="form-control">
															<?php foreach($status_variables as $key => $variable) { ?>
															<option <?php if (!empty($module_info['customer_email_show_ip']) && $module_info['customer_email_show_ip'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
															<?php } ?>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="quick-order-pro-setting-customer-email-show-ip"><?php echo $entry_customer_email_show_date_added; ?></label>
													<div class="col-sm-2">
														<select id="quick-order-pro-setting-customer-email-show-ip" name="module[customer_email_show_date_added]" class="form-control">
															<?php foreach($status_variables as $key => $variable) { ?>
															<option <?php if (!empty($module_info['customer_email_show_date_added']) && $module_info['customer_email_show_date_added'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
															<?php } ?>
														</select>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label" for="template-new-customer-mail"><span data-toggle="tooltip" title="<?php echo $help_new_customer_mail; ?>"><?php echo $entry_new_customer_mail; ?></span></label>
												<div class="col-sm-2">
													<select id="template-new-customer-mail" name="module[new_customer_mail]" class="form-control">
														<?php foreach($status_variables as $key => $variable) { ?>
														<option <?php if (!empty($module_info['new_customer_mail']) && $module_info['new_customer_mail'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
											<div class="form-group parent">
												<label class="col-sm-2 control-label" for="quick-order-pro-setting-alert-admin"><?php echo $entry_alert_admin; ?></label>
												<div class="col-sm-2">
													<select id="quick-order-pro-setting-alert-admin" name="module[alert_admin]" class="slider form-control">
														<?php foreach($status_variables as $key => $variable) { ?>
														<option <?php if (!empty($module_info['alert_admin']) && $module_info['alert_admin'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
											<div class="children"<?php if (empty($module_info['alert_admin'])) echo ' style="display:none"'; ?>>
												<div class="form-group required">
													<label class="col-sm-2 control-label" for="quick-order-pro-setting-admin-email-type"><?php echo $entry_admin_email_type; ?></label>
													<div class="col-sm-2">
														<select id="quick-order-pro-setting-admin-email-type" name="module[admin_email_type]" class="form-control">
															<?php foreach($email_types as $key => $variable) { ?>
															<option <?php if (!empty($module_info['admin_email_type']) && $module_info['admin_email_type'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
															<?php } ?>
														</select>
														<input <?php if (empty($module_info['admin_email_type']) || $module_info['admin_email_type'] == 'config') echo 'style="display:none"'; ?> placeholder="<?php echo $text_alert_email; ?>" type="text" size="35" maxlength="120" name="module[alert_email]" value="<?php if (!empty($module_info['alert_email'])) echo $module_info['alert_email']; ?>" class="form-control" />
														<?php if (isset($error['alert_email'])) { ?>
														<div class="text-danger"><?php echo $error['alert_email']; ?></div>
														<?php } ?>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="quick-order-pro-setting-admin-emails"><span data-toggle="tooltip" title="<?php echo $help_admin_emails; ?>"><?php echo $entry_admin_emails; ?></span></label>
													<div class="col-sm-3">
														<textarea id="quick-order-pro-setting-admin-emails" rows="4" cols="60" name="module[admin_emails]" class="form-control"><?php if (!empty($module_info['admin_emails'])) echo $module_info['admin_emails']; ?></textarea>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="quick-order-pro-setting-admin-email-same-customer"><span data-toggle="tooltip" title="<?php echo $help_admin_email_same_customer; ?>"><?php echo $entry_admin_email_same_customer; ?></span></label>
													<div class="col-sm-2">
														<select id="quick-order-pro-setting-admin-email-same-customer" name="module[admin_email_same_customer]" class="form-control">
															<?php foreach($status_variables as $key => $variable) { ?>
															<option <?php if (!empty($module_info['admin_email_same_customer']) && $module_info['admin_email_same_customer'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
															<?php } ?>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="quick-order-pro-setting-admin-email-send-password"><span data-toggle="tooltip" title="<?php echo $help_admin_email_send_password; ?>"><?php echo $entry_admin_email_send_password; ?></span></label>
													<div class="col-sm-2">
														<select id="quick-order-pro-setting-admin-email-send-password" name="module[admin_email_send_password]" class="form-control">
															<?php foreach($status_variables as $key => $variable) { ?>
															<option <?php if (!empty($module_info['admin_email_send_password']) && $module_info['admin_email_send_password'] == $key) echo 'selected="selected"'; ?> value="<?php echo $key; ?>"><?php echo $variable; ?></option>
															<?php } ?>
														</select>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<input type="hidden" name="module[module_id]" value="<?php echo $module_id; ?>" />
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"><!--
	
		$('.colorpicker_item').each(function(){
		
			var self = this;
			var input = $(self).next('input');
			var rgb_parts = $(input).attr('value').split(',');
			var rgb = {
				r: rgb_parts[0],
				g: rgb_parts[1],
				b: rgb_parts[2]
			};
			
			$(this).ColorPicker({
				color: rgb,
				onShow: function (colpkr) {
					$(colpkr).fadeIn(500);
					return false;
				},
				onHide: function (colpkr) {
					$(colpkr).fadeOut(500);
					return false;
				},
				onChange: function (hsb, hex, rgb) {
					$('div', self).css('backgroundColor', '#' + hex);
					$(input).attr('value', rgb.r + ',' + rgb.g + ',' + rgb.b);
				}
			});
			
		});
		
		$('#quick-order-pro-setting-admin-email-type').change(function(event){
			
			var type = $(this).val();
			
			if (type == 'other') {
				$("input[name='module[alert_email]']").show();
			} else {
				$("input[name='module[alert_email]']").hide().removeClass('error_field').next('.error').remove();
			}
			
		});
		
		<?php if(!empty($base_url)) { ?>
	
		$('#add-field').click(function(event){
			
			event.preventDefault();
			
			var field_key = $('select.available-fields').val();
			
			if (field_key == 0) return;
			
			window.location = '<?php echo $base_url; ?>' + field_key;
		});
		
		<?php } ?>
		
		$('select.available-fields').change(function(event){
		
			event.preventDefault();
			var field_key = $(this).val();
			
			if (field_key == 0) {
				$('#add-field').hide();
			} else {
				$('#add-field').show();
			}
			
		});
		
		$('.show-hide-editor').click(function(event){
			
			event.preventDefault();
			
			var context = $(this).closest('.form-group');
			
			var textarea = $('textarea', context);
			
			if ($('.note-editor', context).length) {
				
				var val = 0;
				$(textarea).destroy();
				var help_text = '<?php echo $text_enabled_editor; ?>';
				
			} else {
				
				var val = 1;
				addEditor(textarea);
				var help_text = '<?php echo $text_disable_editor; ?>';
			}
			
			$('input[type=hidden]', context).val(val);
			
			$(this).text(help_text);
		});
		
		<?php foreach ($languages as $language) { ?>
			if ($('#template-description-<?php echo $language['language_id']; ?>').hasClass('enabled')) {
				addEditor('template-description-<?php echo $language['language_id']; ?>');
			}
		<?php } ?>
		
		$('#tab-fields .table.m td select').change(function(event){
			
			if ($(this).hasClass('status')) {
				
				var status = $(this).val();
				var parent = $(this).closest('tr');
				var disabled_class = 'row-status-disabled';
				
				$(parent).removeClass(disabled_class);
				
				if (status == 0) $(parent).addClass(disabled_class);
				
			}
			
			changeAjax();
		});
		
		$('#tab-fields .table').tableDnD({
			onDrop: function(table, row) {
				
				$('tbody tr', table).each(function(){
					$('td input.order', this).val($(this).index());
				});
				
				$('tbody tr', table).removeClass('odd even');
				
				$('tbody tr:odd', table).addClass('odd');
				$('tbody tr:even', table).addClass('even');
				
				changeAjax()
			},
			onDragClass: 'draggable',
			dragHandle: ".drag"
		}).addClass('table-dnd');
		
		$('#template-create-customer').change(function(event){
		
			var context = $(this).parent();
			
			if ($(this).val() == 1) {
				$('div.alert-warning', context).show();
			} else {
				$('div.alert-warning', context).hide();
			}
			
		});
		
		$('#template-new-customer-random-password').change(function(event){
			
			if ($(this).is(':checked')) {
				$('#template-new-customer-password').attr('disabled', 'disabled');
			} else {
				$('#template-new-customer-password').attr('disabled', '').removeAttr('disabled');
			}
			
		});
		
		$('#language a:first').tab('show');
		
		function addEditor(el) {
			
			$(el).summernote({
				height: 300
			});
		}
		
		function changeAjax() {
			
			var container = $('body');
			
			if ($(container).data('is_active') == 1) return FALSE;
	
			$.ajax({
				url: 'index.php?route=module/quick_order_pro/ajax&token=<?php echo $token; ?>&module_id=<?php echo $module_id; ?>',
				data: $('input, select', '#tab-fields table.table.m'),
				type: 'POST',
				dataType: "json",
				beforeSend: function(jqXHR, settings){
					$(container).css('cursor', 'wait').data('is_active', 1);
				},
				complete: function(jqXHR, textStatus) {
					$(container).css('cursor', 'default').data('is_active', 0);
				}
			});
			
		}
		
	</script>
<?php echo $footer; ?>