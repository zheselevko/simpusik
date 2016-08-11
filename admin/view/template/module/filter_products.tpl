<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-filter-products" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-filter-products" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-filter_products_status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="filter_products_status" id="input-filter_products_status" class="form-control">
                <?php if ($filter_products_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-manufacturer_show_type"><?php echo $entry_manufacturer_show_type; ?></label>
            <div class="col-sm-10">
              <select name="filter_products_data[manufacturer_show_type]" id="input-manufacturer_show_type" class="form-control">
                <?php if ($filter_products_data['manufacturer_show_type'] == 'select') { ?>
                <option value="select" selected="selected"><?php echo $text_show_like_select; ?></option>
                <option value="radio"><?php echo $text_show_like_radio; ?></option>
                <option value="checkbox"><?php echo $text_show_like_checkbox; ?></option>
                <?php } elseif ($filter_products_data['manufacturer_show_type'] == 'radio') { ?>
                <option value="select"><?php echo $text_show_like_select; ?></option>
                <option value="radio" selected="selected"><?php echo $text_show_like_radio; ?></option>
                <option value="checkbox"><?php echo $text_show_like_checkbox; ?></option>
                <?php } else { ?>
                <option value="select"><?php echo $text_show_like_select; ?></option>
                <option value="radio"><?php echo $text_show_like_radio; ?></option>
                <option value="checkbox" selected="selected"><?php echo $text_show_like_checkbox; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-enable_manufacturer"><?php echo $entry_enable_manufacturer; ?></label>
            <div class="col-sm-10">
              <select name="filter_products_data[enable_manufacturer]" id="input-enable_manufacturer" class="form-control">
                <?php if ($filter_products_data['enable_manufacturer'] == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_enable_options; ?></label>
            <div class="col-sm-10">
              <div class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($product_options as $option) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="filter_products_data[product_options_array][]" value="<?php echo $option['option_id']; ?>" <?php echo (!empty($filter_products_data['product_options_array']) && in_array($option['option_id'], $filter_products_data['product_options_array'])) ? 'checked' : ''; ?> /> <?php echo $option['name']; ?>
                  </label>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find('input[type=checkbox]').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').removeAttr('checked');"><?php echo $text_unselect_all; ?></a>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_enable_attributes; ?></label>
            <div class="col-sm-10">
              <div class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($product_attributes as $attribute) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="filter_products_data[product_attributes_array][]" value="<?php echo $attribute['attribute_id']; ?>" <?php echo (!empty($filter_products_data['product_attributes_array']) && in_array($attribute['attribute_id'], $filter_products_data['product_attributes_array'])) ? 'checked' : ''; ?> /> <?php echo $attribute['name']; ?>
                  </label>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find('input[type=checkbox]').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').removeAttr('checked');"><?php echo $text_unselect_all; ?></a>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-attribute_show_type"><?php echo $entry_attribute_show_type; ?></label>
            <div class="col-sm-10">
              <select name="filter_products_data[attribute_show_type]" id="input-attribute_show_type" class="form-control">
                <?php if ($filter_products_data['attribute_show_type'] == 'select') { ?>
                <option value="select" selected="selected"><?php echo $text_show_like_select; ?></option>
                <option value="radio"><?php echo $text_show_like_radio; ?></option>
                <option value="checkbox"><?php echo $text_show_like_checkbox; ?></option>
                <?php } elseif ($filter_products_data['attribute_show_type'] == 'radio') { ?>
                <option value="select"><?php echo $text_show_like_select; ?></option>
                <option value="radio" selected="selected"><?php echo $text_show_like_radio; ?></option>
                <option value="checkbox"><?php echo $text_show_like_checkbox; ?></option>
                <?php } else { ?>
                <option value="select"><?php echo $text_show_like_select; ?></option>
                <option value="radio"><?php echo $text_show_like_radio; ?></option>
                <option value="checkbox" selected="selected"><?php echo $text_show_like_checkbox; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-attribute_delimiter"><?php echo $entry_attribute_delimiter; ?></label>
            <div class="col-sm-10">
              <input type="text" name="filter_products_data[attribute_delimiter]" value="<?php echo $filter_products_data['attribute_delimiter']; ?>" placeholder="<?php echo $entry_attribute_delimiter; ?>" id="input-attribute_delimiter" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-update_results_type"><?php echo $entry_update_results_type; ?></label>
            <div class="col-sm-10">
              <select name="filter_products_data[update_results_type]" id="input-update_results_type" class="form-control">
                <?php if ($filter_products_data['update_results_type'] == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_update_on_button; ?></option>
                <option value="0"><?php echo $text_update_on_changing_values; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_update_on_button; ?></option>
                <option value="0" selected="selected"><?php echo $text_update_on_changing_values; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-update_mask"><?php echo $entry_update_mask; ?></label>
            <div class="col-sm-10">
              <select name="filter_products_data[update_mask]" id="input-update_mask" class="form-control">
                <?php if ($filter_products_data['update_mask'] == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-tax-class-id"><?php echo $entry_tax_class_id; ?></label>
            <div class="col-sm-10">
              <select name="filter_products_data[tax_class_id]" id="input-tax-class-id" class="form-control">
                <option value="0"><?php echo $text_none; ?></option>
                <?php foreach ($tax_classes as $tax_class) { ?>
                <?php if ($tax_class['tax_class_id'] == $filter_products_data['tax_class_id']) { ?>
                <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_enable_categories; ?></label>
            <div class="col-sm-10">
                <div class="well well-sm" style="height: 150px; overflow: auto; padding: 0 9px;">
                <?php $row = 0; foreach ($product_categories as $category) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="filter_products_data[product_categories_array][<?php echo $row; ?>]" value="<?php echo $category['category_id']; ?>" <?php echo (!empty($filter_products_data['product_categories_array'][$row])) ? 'checked' : ''; ?> /> <?php echo $category['name']; ?>
                  </label>
                </div>
                <?php $row++; ?>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
