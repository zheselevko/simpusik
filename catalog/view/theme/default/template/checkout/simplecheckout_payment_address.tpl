<div class="simplecheckout-block" id="simplecheckout_payment_address" <?php echo $hide ? 'data-hide="true"' : '' ?> <?php echo $display_error && $has_error ? 'data-error="true"' : '' ?>>

  <div class="simplecheckout-block-content">
    <?php foreach ($rows as $row) { ?>
      <?php echo $row ?>
    <?php } ?>

    <?php foreach ($hidden_rows as $row) { ?>
      <?php echo $row ?>
    <?php } ?>
  </div>

</div>