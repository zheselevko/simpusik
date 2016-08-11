<div class="form-group<?php if ($required) echo ' required'; ?><?php if (!empty($class)) echo ' ' . $class; ?>">
	<label class="control-label col-sm-2" for="field-edit-<?php echo $field_id; ?>-<?php echo $item_id; ?>">
		<?php if ($description) { ?>
		<span data-toggle="tooltip" title="<?php echo $description; ?>"><?php echo $title; ?></span><br />
		<?php } else { ?>
		<?php echo $title; ?>
		<?php } ?>
	</label>
	<div class="col-sm-3">
		<input type="password" autocomplete="off" maxlength="<?php echo $maxlength; ?>" name="fields[<?php echo $field_id; ?>]" id="field-edit-<?php echo $field_id; ?>-<?php echo $item_id; ?>" value="<?php echo $value; ?>" class="form-control" />
		<?php if (!empty($error)) { ?>
		<?php echo $error; ?>
		<?php } ?>
	</div>
</div>