<div class="form-group<?php if ($required) echo ' required'; ?><?php if (!empty($class)) echo ' ' . $class; ?>">
	<label class="control-label" for="field-edit-<?php echo $field_id; ?>-<?php echo $item_id; ?>">
		<?php if ($description) { ?>
		<span data-toggle="tooltip" title="<?php echo $description; ?>"><?php echo $title; ?></span><br />
		<?php } else { ?>
		<?php echo $title; ?>
		<?php } ?>
	</label>
	<textarea<?php if (!empty($placeholder)) echo ' placeholder="' . $placeholder . '"'; ?> name="fields[<?php echo $field_id; ?>]" id="field-edit-<?php echo $field_id; ?>-<?php echo $item_id; ?>" rows="<?php echo $rows; ?>" class="form-control"><?php echo $value; ?></textarea>
	<?php if (!empty($error)) { ?>
	<?php echo $error; ?>
	<?php } ?>
</div>