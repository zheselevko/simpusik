<!-- block-cart -->
<div class="simplecheckout-block" id="simplecheckout_cart" <?php echo $hide ? 'data-hide="true"' : '' ?> <?php echo $display_error && $has_error ? 'data-error="true"' : '' ?>>
    <h1>Корзина</h1>

<?php if ($attention) { ?>
    <div class="simplecheckout-warning-block"><?php echo $attention; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
    <div class="simplecheckout-warning-block"><?php echo $error_warning; ?></div>
<?php } ?>
    <!-- cart-table -->
	<table class="bordered centered cart-table">
	    <thead>
		    <tr>
			    <th class="col-id" data-field="id"></th>
				<th class="col-image" data-field="image"></th>
            	<th class="col-name" data-field="name">Наименование</th>
            	<th class="col-index" data-field="index">Артикул</th>
            	<th class="col-count" data-field="count">Количество</th>
            	<th class="col-cost" data-field="cost">Стоимость</th>
            	<th class="col-delete" data-field="delete">Удалить</th>
            </tr>
        </thead>
        <?php /*
        <thead>
            <tr>
                <th class="image"><?php echo $column_image; ?></th>
                <th class="name"><?php echo $column_name; ?></th>
                <th class="model"><?php echo $column_model; ?></th>
                <th class="quantity"><?php echo $column_quantity; ?></th>
                <th class="price"><?php echo $column_price; ?></th>
                <th class="total"><?php echo $column_total; ?></th>
                <th class="remove"></th>
            </tr>
        </thead>
        */ ?>
    <tbody>
      <?php $k = 1; ?>
      <?php foreach ($products as $product) { ?>
          <tr data-price="6200">
            <td class="col-id"><?php echo $k++; ?>.</td>
            <td class="col-image image">
                <?php if ($product['thumb']) { ?>
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                <?php } ?>
            </td>
            <td class="col-name name">
			    <h3 class="product__title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
                <?php if (!$product['stock'] && ($config_stock_warning || !$config_stock_checkout)) { ?>
                    <span class="product-warning">***</span>
                <?php } ?>
                <div class="options">
                <?php foreach ($product['option'] as $option) { ?>
                &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                <?php } ?>
                <?php if (!empty($product['recurring'])) { ?>
                - <small><?php echo $text_payment_profile ?>: <?php echo $product['profile_name'] ?></small>
                <?php } ?>
                </div>
                <?php if ($product['reward']) { ?>
                <small><?php echo $product['reward']; ?></small>
                <?php } ?>
            </td>
            <td class="col-index model"><?php echo $product['model']; ?></td>
            <td class="col-count quantity">

                <span class="ui-spinner ui-widget ui-widget-content ui-corner-all">
                    <input type="text" class="spinner ui-spinner-input valid" data-onchange="changeProductQuantity" name="quantity[<?php echo !empty($product['cart_id']) ? $product['cart_id'] : $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
                    <a data-onclick="increaseProductQuantity" class="ui-spinner-button ui-spinner-up ui-corner-tr ui-button ui-widget ui-state-default ui-button-text-only" tabindex="-1" role="button"><span class="ui-button-text"><span class="ui-icon ui-icon-triangle-1-n">+</span></span></a>
                    <a data-onclick="decreaseProductQuantity" class="ui-spinner-button ui-spinner-down ui-corner-br ui-button ui-widget ui-state-default ui-button-text-only" tabindex="-1" role="button"><span class="ui-button-text"><span class="ui-icon ui-icon-triangle-1-s">-</span></span></a>
                </span>

                <?php /*
                <img data-onclick="decreaseProductQuantity" src='<?php echo $additional_path ?>catalog/view/image/minus.png'>
                <input type="text" class="spinner ui-spinner-input valid" data-onchange="changeProductQuantity" name="quantity[<?php echo !empty($product['cart_id']) ? $product['cart_id'] : $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
                <img data-onclick="increaseProductQuantity" src='<?php echo $additional_path ?>catalog/view/image/plus.png'>
                */ ?>
            </td>
            <td class="col-cost total product__price"><?php echo $product['total']; ?></td>
            <td class="remove col-delete">
                <i data-onclick="removeProduct" data-product-key="<?php echo !empty($product['cart_id']) ? $product['cart_id'] : $product['key']; ?>" class="material-icons js-remove-row">highlight_off</i>
            </td>
          </tr>
      <?php } ?>

	  <tfoot>
        <?php foreach ($totals as $total) { ?>
          <?php if ($total['code'] == 'total') { ?>
	      <tr>
		    <td colspan="4">&nbsp;</td>
			  <td>
			    <div class="cart-total__title"><?php echo $total['title']; ?>:</div>
			  </td>
			  <td class="product__price product__price--new">
			    <?php echo $total['text']; ?>
			  </td>
			<td>&nbsp;</td>
		  </tr>
          <?php } ?>
        <?php } ?>
	  </tfoot>
    </tbody>
</table>

<input type="hidden" name="remove" value="" id="simplecheckout_remove">

<div style="display:none;" id="simplecheckout_cart_total"><?php echo $cart_total ?></div>

<?php if (!$display_model) { ?>
    <style>
    .simplecheckout-cart col.model,
    .simplecheckout-cart th.model,
    .simplecheckout-cart td.model {
        display: none;
    }
    </style>
<?php } ?>
</div>
