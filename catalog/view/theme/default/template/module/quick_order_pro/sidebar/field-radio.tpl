<div class="form-group<?php if ($required) echo ' required'; ?><?php if (!empty($class)) echo ' ' . $class; ?>">
	<label class="control-label">
		<?php if ($description) { ?>
		<span data-toggle="tooltip" title="<?php echo $description; ?>"><?php echo $title; ?></span><br />
		<?php } else { ?>
		<?php echo $title; ?>
		<?php } ?>
	</label>
	<div class="radio-wrapper">
		<?php foreach ($option as $id => $value) { ?>
		<div class="radio">
			<label>
				<input <?php if ($id == $checked) echo 'checked="checked"'; ?> type="radio" name="fields[<?php echo $field_id; ?>]" value="<?php echo $id; ?>" /> <?php echo $value['value']; ?>
			</label>
		</div>
		<?php } ?>
	</div>
	<?php if (!empty($error)) { ?>
	<?php echo $error; ?>
	<?php } ?>
</div>