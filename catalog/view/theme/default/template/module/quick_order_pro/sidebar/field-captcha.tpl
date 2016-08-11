<div class="form-group captcha<?php if ($required) echo ' required'; ?><?php if (!empty($class)) echo ' ' . $class; ?>">
	<label class="control-label" for="field-edit-<?php echo $field_id; ?>-<?php echo $item_id; ?>">
		<?php if ($description) { ?>
		<span data-toggle="tooltip" title="<?php echo $description; ?>"><?php echo $title; ?></span><br />
		<?php } else { ?>
		<?php echo $title; ?>
		<?php } ?>
	</label>
	<span class="captcha-wrapper cf">
		<img src="index.php?route=module/quick_order_pro/captcha&key=<?php echo $form_id; ?>" alt="" />
		<a class="captcha icon" title="<?php echo $text_captcha_reload; ?>"></a>
	</span>
	<input type="text" maxlength="<?php echo $maxlength; ?>" size="<?php echo $maxlength; ?>" name="fields[<?php echo $field_id; ?>]" id="field-edit-<?php echo $field_id; ?>-<?php echo $item_id; ?>" value="<?php echo $value; ?>"  class="form-control" />
	<?php if (!empty($error)) { ?>
	<?php echo $error; ?>
	<?php } ?>
</div>