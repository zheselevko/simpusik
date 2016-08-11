<!-- block-cart -->
<div class="simplecheckout-block section block-cart" id="simplecheckout_cart" <?php echo $hide ? 'data-hide="true"' : '' ?> <?php echo $display_error && $has_error ? 'data-error="true"' : '' ?>>
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
            	<th class="col-cost" data-field="cost">Цена</th>
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
                <img data-onclick="decreaseProductQuantity" src='<?php echo $additional_path ?>catalog/view/image/minus.png'>
                <input type="text" data-onchange="changeProductQuantity" name="quantity[<?php echo !empty($product['cart_id']) ? $product['cart_id'] : $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
                <img data-onclick="increaseProductQuantity" src='<?php echo $additional_path ?>catalog/view/image/plus.png'>
            </td>
            <td class="col-cost price"><?php echo $product['price']; ?></td>
            <td class="col-cost total"><?php echo $product['total']; ?></td>
            <td class="remove col-delete">
                <img data-onclick="removeProduct" data-product-key="<?php echo !empty($product['cart_id']) ? $product['cart_id'] : $product['key']; ?>" src="<?php echo $additional_path ?>catalog/view/image/close.png" />
            </td>
            </tr>
            <?php } ?>
    </tbody>
</table>

<?php foreach ($totals as $total) { ?>
    <div class="simplecheckout-cart-total" id="total_<?php echo $total['code']; ?>">
        <span><b><?php echo $total['title']; ?>:</b></span>
        <span class="simplecheckout-cart-total-value"><?php echo $total['text']; ?></span>
        <span class="simplecheckout-cart-total-remove">
            <?php if ($total['code'] == 'coupon') { ?>
            <img data-onclick="removeCoupon" src="<?php echo $additional_path ?>catalog/view/image/close.png" />
            <?php } ?>
            <?php if ($total['code'] == 'voucher') { ?>
            <img data-onclick="removeVoucher" src="<?php echo $additional_path ?>catalog/view/image/close.png" />
            <?php } ?>
            <?php if ($total['code'] == 'reward') { ?>
            <img data-onclick="removeReward" src="<?php echo $additional_path ?>catalog/view/image/close.png" />
            <?php } ?>
        </span>
    </div>
<?php } ?>
<?php if (isset($modules['coupon'])) { ?>
    <div class="simplecheckout-cart-total">
        <span class="inputs"><?php echo $entry_coupon; ?>&nbsp;<input type="text" data-onchange="reloadAll" name="coupon" value="<?php echo $coupon; ?>" /></span>
    </div>
<?php } ?>
<?php if (isset($modules['reward']) && $points > 0) { ?>
    <div class="simplecheckout-cart-total">
        <span class="inputs"><?php echo $entry_reward; ?>&nbsp;<input type="text" name="reward" data-onchange="reloadAll" value="<?php echo $reward; ?>" /></span>
    </div>
<?php } ?>
<?php if (isset($modules['voucher'])) { ?>
    <div class="simplecheckout-cart-total">
        <span class="inputs"><?php echo $entry_voucher; ?>&nbsp;<input type="text" name="voucher" data-onchange="reloadAll" value="<?php echo $voucher; ?>" /></span>
    </div>
<?php } ?>
<?php if (isset($modules['coupon']) || (isset($modules['reward']) && $points > 0) || isset($modules['voucher'])) { ?>
    <div class="simplecheckout-cart-total simplecheckout-cart-buttons">
        <span class="inputs buttons"><a id="simplecheckout_button_cart" data-onclick="reloadAll" class="button btn-primary button_oc btn"><span><?php echo $button_update; ?></span></a></span>
    </div>
<?php } ?>
<input type="hidden" name="remove" value="" id="simplecheckout_remove">
<div style="display:none;" id="simplecheckout_cart_total"><?php echo $cart_total ?></div>
<?php if ($display_weight) { ?>
    <div style="display:none;" id="simplecheckout_cart_weight"><?php echo $weight ?></div>
<?php } ?>
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