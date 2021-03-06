<div class="form-group<?php if ($required) echo ' required'; ?><?php if (!empty($class)) echo ' ' . $class; ?>">
	<label class="control-label" for="field-edit-<?php echo $field_id; ?>-<?php echo $item_id; ?>">
		<?php if ($description) { ?>
		<span data-toggle="tooltip" title="<?php echo $description; ?>"><?php echo $title; ?></span><br />
		<?php } else { ?>
		<?php echo $title; ?>
		<?php } ?>
	</label>
	<select name="fields[<?php echo $field_id; ?>]" id="field-edit-<?php echo $field_id; ?>-<?php echo $item_id; ?>" class="form-control">
		<option value=""><?php echo $text_select; ?></option>
		<?php foreach ($option as $id => $value) { ?>
		<option <?php if (in_array($id, $selected)) echo 'selected="selected"'; ?> value="<?php echo $id; ?>"><?php echo $value['value']; ?></option>
		<?php } ?>
	</select>
	<?php if (!empty($error)) { ?>
	<?php echo $error; ?>
	<?php } ?>
</div>