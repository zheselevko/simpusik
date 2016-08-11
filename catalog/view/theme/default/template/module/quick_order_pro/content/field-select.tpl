<div class="form-group<?php if ($required) echo ' required'; ?><?php if (!empty($class)) echo ' ' . $class; ?>">
	<label class="control-label col-sm-2" for="field-edit-<?php echo $field_id; ?>-<?php echo $item_id; ?>">
		<?php if ($description) { ?>
		<span data-toggle="tooltip" title="<?php echo $description; ?>"><?php echo $title; ?></span><br />
		<?php } else { ?>
		<?php echo $title; ?>
		<?php } ?>
	</label>
	<div class="col-sm-3">
		<select name="fields[<?php echo $field_id; ?>]" <?php if ($multiple) echo 'multiple="multiple"'; ?> id="field-edit-<?php echo $field_id; ?>-<?php echo $item_id; ?>" class="form-control">
			<?php if (!$required) { ?>
			<option value=""><?php echo $text_select; ?></option>
			<?php } ?>
			<?php foreach ($option as $id => $value) { ?>
			<option <?php if (in_array($id, $selected)) echo 'selected="selected"'; ?> value="<?php echo $id; ?>"><?php echo $value['value']; ?></option>
			<?php } ?>
		</select>
		<?php if (!empty($error)) { ?>
		<?php echo $error; ?>
		<?php } ?>
	</div>
</div>