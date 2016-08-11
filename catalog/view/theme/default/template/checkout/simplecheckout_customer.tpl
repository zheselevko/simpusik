<!-- buyer-info-form -->
<div class="simplecheckout-block buyer-info-form" id="simplecheckout_customer" <?php echo $hide ? 'data-hide="true"' : '' ?> <?php echo $display_error && $has_error ? 'data-error="true"' : '' ?>>
  <?php if ($display_header || $display_login) { ?>
    <div class="checkout-heading"><span><?php echo $text_checkout_customer ?></span>
      <?php if ($display_login) { ?>
        <span class="checkout-heading-button">
          <a href="javascript:void(0)" data-onclick="openLoginBox"><?php echo $text_checkout_customer_login ?></a>
        </span>
      <?php } ?>
    </div>
  <?php } ?>

  <div class="simplecheckout-block-content">
    <?php foreach ($rows as $row) { ?>
      <?php echo $row ?>
    <?php } ?>
  </div>

    <?php /*
	<div class="col s12 m5">
	  <div class="input-field">
        <i class="material-icons prefix">account_circle</i>
        <input type="text" name="customer[firstname]" id="customer_firstname" value="" placeholder="Ваше имя" data-reload-payment-form="true" />
      </div>

	  <div class="input-field">
        <i class="material-icons prefix">stay_current_portrait</i>
        <input class="js-phone-mask" type="tel" name="customer[telephone]" id="customer_telephone" value="" placeholder="+7 (___) ___-__-__" data-reload-payment-form="true">
      </div>

	  <div class="input-field">
        <i class="material-icons prefix">email</i>
        <input type="email" name="customer[email]" id="customer_email" value="" placeholder="E-mail" data-reload-payment-form="true">
      </div>
	</div>
	<div class="col s12 m7"> <textarea name="buyer_info_form_text" placeholder="Ваш адрес" class="materialize-textarea js-textarea-autoresize"></textarea> </div>
    */ ?>


</div>