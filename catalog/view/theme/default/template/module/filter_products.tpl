<!-- side-filters -->
<div class="side-filters">
    <h3 class="side-filters__title">подбор по параметрам<i class="material-icons">filter_list</i></h3>
	    <div class="side-filters__content">
		    <div id="filter-products-form" class="box-content filtered">

                <input type="hidden" name="category_id" value="<?php echo $category_id; ?>" />
                <input type="hidden" name="manufacturer_id" value="<?php echo $manufacturer_id; ?>" />
                <input type="hidden" name="sort" value="" />
                <input type="hidden" name="order" value="" />
                <input type="hidden" name="limit" value="" />
                <input type="hidden" name="page" value="<?php echo $page; ?>" />
                <input type="hidden" name="path" value="<?php echo $path; ?>" />


				<!-- side-filter -->
				<div class="side-filter">
					<div class="side-filter__head">
						<div class="side-filter__head-title">Ценовой диапазон</div>
					</div>

					<div class="side-filter__content">
						<div class="range-slider-holder">
							<div id="range-slider"></div>
						</div>
						<div class="range-slider-values">
							<div class="left"><?php echo $price_min; ?></div>
							<div class="right"><?php echo $price_max; ?></div>
						</div>
						<div class="range-slider-form">
                            <label for="input_price_min">от</label>
							<div class="input-field">
                                <input name="input_price_min" id="input_price_min" type="text" placeholder="<?php echo $price_min; ?>" value="<?php echo $price_min; ?>" />
                            </div>
                            <label for="input_price_max">до</label>
							<div class="input-field">
                                <input name="input_price_max" id="input_price_max" type="text" placeholder="<?php echo $price_max; ?>" value="<?php echo $price_max; ?>"/>
                            </div>
                            <span>руб.</span>
                        </div>
					</div>
				</div>
				<!-- side-filter end -->

				<!-- side-filter -->
				<div class="side-filter">
					<div class="side-filter__head">
						<div class="side-filter__head-title left">Размер белья</div> <input class="side-filter__head-reset right js-side-reset" type="reset" value="Сбросить" /> </div>
					<div class="side-filter__content">
						<ul class="checkbox-list">
							<li> <input type="checkbox" class="filled-in" name="sidebar_underwear_size" id="sidebar_underwear_size" /> <label for="sidebar_underwear_size">Евро <span class="label-count">148</span></label> </li>
							<li> <input type="checkbox" class="filled-in" name="sidebar_underwear_size2" id="sidebar_underwear_size2" /> <label for="sidebar_underwear_size2">2-х спальное <span class="label-count">117</span></label> </li>
							<li> <input type="checkbox" class="filled-in" name="sidebar_underwear_size3" id="sidebar_underwear_size3" /> <label for="sidebar_underwear_size3">Семейное <span class="label-count">117</span></label> </li>
							<li> <input type="checkbox" class="filled-in" name="sidebar_underwear_size4" id="sidebar_underwear_size4" /> <label for="sidebar_underwear_size4">1,5 спальное <span class="label-count">111</span></label> </li>
						</ul>
					</div>
				</div>
				<!-- side-filter end -->

				<!-- side-filter -->
				<div class="side-filter">
					<div class="side-filter__head">
						<div class="side-filter__head-title left">Ткань</div> <input class="side-filter__head-reset right js-side-reset" type="reset" value="Сбросить" /> </div>
					<div class="side-filter__content">
						<ul class="checkbox-list">
							<li> <input type="checkbox" class="filled-in" name="sidebar_cloth" id="sidebar_cloth" /> <label for="sidebar_cloth">Бязь <span class="label-count">1</span></label> </li>
							<li> <input type="checkbox" class="filled-in" name="sidebar_cloth2" id="sidebar_cloth2" /> <label for="sidebar_cloth2">Жаккард <span class="label-count">13</span></label> </li>
							<li> <input type="checkbox" class="filled-in" name="sidebar_cloth3" id="sidebar_cloth3" /> <label for="sidebar_cloth3">Микрофибра <span class="label-count">19</span></label> </li>
							<li> <input type="checkbox" class="filled-in" name="sidebar_cloth4" id="sidebar_cloth4" /> <label for="sidebar_cloth4">Модал <span class="label-count">4</span></label> </li>
							<li> <input type="checkbox" class="filled-in" name="sidebar_cloth5" id="sidebar_cloth5" /> <label for="sidebar_cloth5">Поликоттон <span class="label-count">6</span></label> </li>
							<li> <input type="checkbox" class="filled-in" name="sidebar_cloth6" id="sidebar_cloth6" /> <label for="sidebar_cloth6">Поплин <span class="label-count">138</span></label> </li>
							<li> <input type="checkbox" class="filled-in" name="sidebar_cloth7" id="sidebar_cloth7" /> <label for="sidebar_cloth7">Сатин <span class="label-count">311</span></label> </li>
							<li> <input type="checkbox" class="filled-in" name="sidebar_cloth8" id="sidebar_cloth8" /> <label for="sidebar_cloth8">Тенесел <span class="label-count">1</span></label> </li>
						</ul>
					</div>
				</div>
				<!-- side-filter end -->
				<!-- side-filters__buttons -->
				<div class="side-filters__buttons">
					<div class="row">
						<div class="col s6"> <button class="btn btn-large btn-aqua waves-effect waves-light" type="submit" name="action">Показать	</button> </div>
						<div class="col s6"> <button class="btn btn-large btn-gray waves-effect waves-light" type="reset" name="action">Сбросить	</button> </div>
					</div>
				</div>
				<!-- side-filters__buttons end -->

        </div>
    </div>
</div>
<!-- side-filters end -->


<div class="box" id="ismobile">
  <div class="box-content filtered">
    <form id="filter-products-form">

    <?php if (isset($products_data['options']) && $products_data['options']) { ?>
      <?php foreach ($products_data['options'] as $option) { ?>
      <div class="inner-box expanded">
        <div class="item-title">
        	<a class="list-group-item item-name"><span class="name"><?php echo $option['name']; ?></span><span class="link"><i class="fa fa-minus"></i></span></a>
        </div>
        <div class="list-group-item item-content">
        <?php if ($option['type'] == 'select') { ?>
            <select name="o_val[<?php echo $option['option_id']?>]" class="form-control">
              <option value=""><?php echo $text_select_value; ?></option>
              <?php foreach ($option['product_option_value'] as $product_option_value) { ?>
              <option id="o_val_<?php echo $product_option_value['option_value_id']?>" value="<?php echo $product_option_value['option_value_id'] ?>"><?php echo $product_option_value['name']; ?></option>
              <?php }?>
            </select>
          <?php } elseif ($option['type'] == 'checkbox') {?>
            <?php foreach ($option['product_option_value'] as $product_option_value) { ?>
              <div class="checkbox">
                <label>
                  <input id="o_val_<?php echo $product_option_value['option_value_id']?>"
                     type="checkbox" name="o_val[<?php echo $option['option_id']?>][]"
                     value="<?php echo $product_option_value['option_value_id']?>" />
                  <?php echo $product_option_value['name']; ?>
                </label>
              </div>
            <?php } ?>
          <?php } elseif ($option['type'] == 'radio') {?>
            <?php foreach ($option['product_option_value'] as $product_option_value) { ?>
              <!-- <div class="radio">
                <label>
                  <input id="o_val_<?php echo $product_option_value['option_value_id']?>"
                   type="radio" name="o_val[<?php echo $option['option_id']?>]"
                   value="<?php echo $product_option_value['option_value_id']?>" />
                  <?php echo $product_option_value['name']; ?>
                </label>
              </div> -->
              <div class="checkbox">
                <label>
                  <input id="o_val_<?php echo $product_option_value['option_value_id']?>"
                     type="checkbox" name="o_val[<?php echo $option['option_id']?>][]"
                     value="<?php echo $product_option_value['option_value_id']?>" />
                  <?php echo $product_option_value['name']; ?>
                </label>
              </div>
            <?php } ?>
          <?php } elseif ($option['type'] == 'image') {?>
            <?php foreach ($option['product_option_value'] as $product_option_value) { ?>
              <div class="checkbox-image">
                <label>
                  <input id="o_val_<?php echo $product_option_value['option_value_id']?>"
                  type="checkbox" style="display:none;" name="o_val[<?php echo $option['option_id']?>][]"
                  value="<?php echo $product_option_value['option_value_id']?>" />
                  <img src="<?php echo $product_option_value['image']?>" alt="<?php echo $product_option_value['name']; ?>" title="<?php echo $product_option_value['name']; ?>" class="select-image" />
                </label>
              </div>
            <?php } ?>
          <?php } ?>
        </div>
        </div>
      <?php } ?>
    <?php } ?>
    <?php if (isset($products_data['attributes']) && $products_data['attributes']) { ?>
      <?php foreach($products_data['attributes'] as $attribute_group_id => $attribute) { ?>
        <?php foreach($attribute['product_attribute_data'] as $attribute_value_id => $attribute_value) { ?>
        <div class="inner-box expanded">
        <div class="item-title">
        	<a class="list-group-item item-name"><span class="name"><?php echo $attribute_value['name']; ?></span><span class="link"><i class="fa fa-minus"></i></span></a>
        </div>
          <div class="list-group-item item-content">
            <?php if ($filter_products_data['attribute_show_type'] == 'select') { ?>
              <select name="a_val[<?php echo $attribute_value_id; ?>]" class="form-control">
                <option value=""><?php echo $text_select_value; ?></option>
                <?php asort($attribute_value['attr_values']); foreach($attribute_value['attr_values'] as $value) { ?>
                <option id="a_val_<?php echo md5($value); ?>" value="<?php echo $value ?>"><?php echo $value; ?></option>
                <?php }?>
              </select>
            <?php } elseif ($filter_products_data['attribute_show_type'] == 'checkbox') {?>
              <?php asort($attribute_value['attr_values']); foreach($attribute_value['attr_values'] as $value) { ?>
                <div class="checkbox">
                  <label>
                    <input id="a_val_<?php echo md5($value); ?>" type="checkbox" name="a_val[<?php echo $attribute_value_id; ?>][]" value="<?php echo $value ?>" />
                    <?php echo $value; ?>
                  </label>
                </div>
              <?php } ?>
            <?php } elseif ($filter_products_data['attribute_show_type'] == 'radio') {?>
              <?php asort($attribute_value['attr_values']); foreach($attribute_value['attr_values'] as $value) { ?>
                <div class="radio">
                  <label>
                    <input id="a_val_<?php echo md5($value); ?>" type="radio" name="a_val[<?php echo $attribute_value_id; ?>]" value="<?php echo $value ?>" />
                    <?php echo $value; ?>
                  </label>
                </div>
              <?php } ?>
            <?php } ?>
          </div>
          </div>
        <?php } ?>
      <?php } ?>
    <?php } ?>
    <?php if (isset($products_data['manufacturers']) && $products_data['manufacturers']) { ?>
    <div class="inner-box expanded manufacturers-filter">
    	<div class="item-title">
        	<a class="list-group-item item-name"><span class="name"><?php echo $text_manufacturer; ?></span><span class="link"><i class="fa fa-minus"></i></span></a>
        </div>
      <div class="list-group-item item-content">
        <?php if ($filter_products_data['manufacturer_show_type'] == 'select') { ?>
          <select name="m_val" class="form-control">
            <option value=""><?php echo $text_select_value; ?></option>
            <?php foreach($products_data['manufacturers'] as $manufacturer) { ?>
            <option id="m_val_<?php echo $manufacturer['manufacturer_id']?>" value="<?php echo $manufacturer['manufacturer_id']?>"><?php echo $manufacturer['name']; ?></option>
            <?php } ?>
          </select>
        <?php } elseif ($filter_products_data['manufacturer_show_type'] == 'checkbox') {?>
          <?php foreach($products_data['manufacturers'] as $manufacturer) { ?>
            <div class="checkbox">
              <label>
                <input id="m_val_<?php echo $manufacturer['manufacturer_id']?>" type="checkbox" name="m_val[]" value="<?php echo $manufacturer['manufacturer_id']?>" />
                <?php echo $manufacturer['name']; ?>
              </label>
            </div>
          <?php } ?>
        <?php } elseif ($filter_products_data['manufacturer_show_type'] == 'radio') {?>
          <?php foreach($products_data['manufacturers'] as $manufacturer) { ?>
            <div class="radio">
              <label>
                <input id="m_val_<?php echo $manufacturer['manufacturer_id']?>" type="radio" name="m_val" value="<?php echo $manufacturer['manufacturer_id']?>" />
                <?php echo $manufacturer['name']; ?>
              </label>
            </div>
          <?php } ?>
        <?php } ?>
      </div>
      </div>
    <?php } ?>
    <div id="selected-filters"></div>
    </form>
    <?php if ($filter_products_data['update_results_type']) { ?>
    <div class="list-group-item item-content" style="border:0;">
      <button type="button" id="button-filter" class="btn button"><?php echo $button_filter; ?></button>
    </div>
  <?php } ?>
  </div>
  
</div>
<?php if ($filter_products_data['update_mask']) { ?>
<style type="text/css">
.masked {
  position: absolute;
  z-index: 10000;
  width: 100%;
  height: 100%;
  background: #eee;
  opacity: 0.4;
  left: 0;
  top: 0;
}
.masked_loading {
  background: url(catalog/view/javascript/filter_products/ring-alt.svg) no-repeat center center;
  width: 100%;
  height: 100%;
  position: absolute;
  z-index: 10001;
  top: 0;
  left: 0;
}
#res-products {
  position: relative;
}
.selected-filters-label {
  padding-left: 0 !important;
}
</style>
<?php } ?>

<script type="text/javascript"><!--
$(document).ready(function() {
    sliderRange();
});
//--></script>

<script type="text/javascript"><!--
$(function(){
	if ((navigator.userAgent.match(/iPad/i) <= 0)) {
		$('body').prepend('<div id="filter-mobile"></div>');
		$('.mobile-category-header').prepend('<div id="filter-button" class="button"><i class="fa fa-search"></i> <?php echo $heading_title; ?></div>');
		$('.box-heading').prepend('<div id="filter-close"><i class="fa fa-times"></i></div>');
		
		var portraitWidth = $(window).width();
	    if (portraitWidth <= '768'){
		    $("#ismobile") .appendTo("#filter-mobile");
	    }
	    
	    $("#filter-button").click(function() {
		  $("#filter-mobile").toggleClass("filter-show");
		  return false;
		});
		
		$("#filter-close").click(function() {
		  $("#filter-mobile").removeClass("filter-show");
		  return false;
		});
	}
	
  $(document).on('click', '#filter-products-form a.list-group-item .link', function(e) {
    $(this).parent().parent().parent().toggleClass( "expanded" );
    $(this).find("i").toggleClass("fa-minus").addClass("fa-plus");
  });
  
  $(document).on('click', '#filter-products-form a.list-group-item .name', function(e) {
    $(this).parent().parent().parent().toggleClass( "expanded" );
    $(this).next().find("i").toggleClass("fa-minus").addClass("fa-plus");
  });

  $('.pagination li a').on('click', function() {
    var get_link = $(this).attr('href');
    var get_page = get_link.match(/page=(\d+)/);
    $('input[name=page]').val(get_page[1]);
    filtering();
    scroll_to_products();
    return false;
  });
  
  $(".select-image").click(function() {
  	$(this).toggleClass('highlight');
  });
  
  if ($('#input-sort').length) {
    $('#input-sort').get(0).onchange = null;

    $('#input-sort').on('change', function() {
      var get_query = $(this).val().split('&');
      $('input[name=sort]').val(get_query[0]);
      $('input[name=order]').val(get_query[1]);
      filtering();
    });

    $('#input-sort option').each(function() {
      var get_value = $(this).val();
      var get_value_sort = url_value(get_value, 'sort');
      if (get_value_sort == 'rating') {
        $(this).remove();
      } else {
        $(this).val(get_value_sort + '&' + url_value(get_value, 'order'));
      }
    });
  }

  if ($('#input-limit').length) {
    $('#input-limit').get(0).onchange = null;

    $('#input-limit').on('change', function() {
      $('input[name=limit]').val($(this).val());
      filtering();
    });

    $('#input-limit option').each(function() {
      $(this).val(url_value($(this).val(), 'limit'));
    });
  }

  if ($('#input-sort').length) {
    if ($('input[name=sort]').val()) {
      $('#input-sort').val($('input[name=sort]').val() + '&' + $('input[name=order]').val());
    } else {
      var get_query = $('#input-sort').val().split('&');
      $('input[name=sort]').val(get_query[0]);
      $('input[name=order]').val(get_query[1]);
    }
  }

  if ($('input[name=limit]').length) {
    if ($('input[name=limit]').val()) {
      $('#input-limit').val($('input[name=limit]').val());
    } else {
      $('input[name=limit]').val($('#input-limit').val());
    }
  }

  <?php if ($price_min || $price_max || $m_vals || $o_vals || $a_vals) { ?>
    $('#input_price_min').val('<?php echo $price_min; ?>');
    $('#input_price_max').val('<?php echo $price_max; ?>');
    
    <?php if ($o_vals) { ?>
    <?php foreach ($o_vals as $o_val) { ?>
    if ($($('#o_val_<?php echo $o_val; ?>')).prop("tagName") == 'INPUT') {
      $('#o_val_<?php echo $o_val; ?>').attr('checked', true);
      $('#o_val_<?php echo $o_val; ?>').parent().find('img').addClass('highlight');
    } else {
      $('#o_val_<?php echo $o_val; ?>').attr('selected', true);
    }
    <?php } ?>    
    <?php } ?>

    <?php if ($a_vals) { ?>
    <?php foreach ($a_vals as $a_val) { ?>
    if ($($('#a_val_<?php echo $a_val; ?>')).prop("tagName") == 'INPUT') {
      $('#a_val_<?php echo $a_val; ?>').attr('checked', true);
    } else {
      $('#a_val_<?php echo $a_val; ?>').attr('selected', true);
    }
    <?php } ?>    
    <?php } ?>

    <?php if ($m_vals) { ?>
    <?php foreach ($m_vals as $m_val) { ?>
    $('#m_val_<?php echo $m_val; ?>').attr('checked', true);
    <?php } ?>    
    <?php } ?>
  <?php } ?>
  <?php if ($auto_load) { ?>
  filtering();
  <?php } ?>
});

function uncheck_option(id) {
  if ($($('#o_val_'+id)).prop("tagName") == 'INPUT') {
    $('#o_val_'+id).attr('checked', false);
    $('#o_val_'+id).parent().find('img').removeClass('highlight');
  } else {
    $('#o_val_'+id).attr('selected', false);
  }
  filtering();
}

function uncheck_attribute(id) {
  if ($($('#a_val_'+id)).prop("tagName") == 'INPUT') {
    $('#a_val_'+id).attr('checked', false);
  } else {
    $('#a_val_'+id).attr('selected', false);
  }
  filtering();
}

function uncheck_manufacturer(id) {
  $('#m_val_'+id).attr('checked', false);
  filtering();
}

function url_value(value, query) {
  var result = '',
      part = String(value).split('?');

  if (part[1]) {
    var sub_part = part[1].split('&');
    for (var n = 0; n <= (sub_part.length); n++) {
      if (sub_part[n]) {
        var sub_part_val = sub_part[n].split('=');

        if (sub_part_val[0] && sub_part_val[0] == query) {
          result = sub_part_val[1]
        }
      }
    }
  }
  return result;
}

$('.slider').slider({
  min: <?php echo $products_data['prices']['price_min']; ?>,
  max: <?php echo $products_data['prices']['price_max']; ?>,
  range: true,
  values: [<?php echo $price_min; ?>, <?php echo $price_max; ?>],
  rest: 'label'
// }).slider('pips', {
//   rest: false
}).on("slidechange", function(e, ui) {
  $('#input_price_min').val(ui['values'][0]);
  $('#input_price_max').val(ui['values'][1]);
  filtering();
});
//--></script>
<script type="text/javascript"><!--
$(document).on('click', '#button-reset', function() {
  $('#filter-products-form input[type=\'radio\']').removeAttr('checked');
  $('#filter-products-form input[type=\'checkbox\']').removeAttr('checked');
  $('#filter-products-form select').val('');
  $('.highlight').removeClass('highlight');
  $slider = $(".slider");
  $slider.slider("values", [<?php echo $products_data['prices']['price_min']; ?>,<?php echo $products_data['prices']['price_max']; ?>]);
  $('#input_price_min').val(<?php echo $products_data['prices']['price_min']; ?>);
  $('#input_price_max').val(<?php echo $products_data['prices']['price_max']; ?>);
  filtering();
});

<?php if ($filter_products_data['update_results_type']) { ?>
$('#button-filter').on('click', function() {
filtering();
<?php } else { ?>
$(document).on('change', '#filter-products-form input[type=\'text\'], #filter-products-form input[type=\'radio\'], #filter-products-form input[type=\'checkbox\'], #filter-products-form select', function() {
filtering();
<?php } ?>
});

function filtering() {
  <?php if ($filter_products_data['update_mask']) { ?>
  masked('#filter-products-form', true);
  masked('#res-products', true);
  <?php } ?>

  $.ajax({
    type: 'post',
    <?php if ($page_type == 'category') { ?>
    url: 'index.php?route=module/filter_products/getProductsByCategory',
    <?php } elseif ($page_type == 'manufacturer') { ?>
    url: 'index.php?route=module/filter_products/getProductsByManufacturer',  
    <?php } ?>
    
    dataType: 'json',
    data: $('#filter-products-form input[type=\'hidden\'], #filter-products-form input[type=\'text\'], #filter-products-form input[type=\'radio\']:checked, #filter-products-form input[type=\'checkbox\']:checked, #filter-products-form select'),
    success: function(json) {

      selected_filters = '<div class="inner-box expanded">';
        selected_filters += '<div class="item-title">';
          selected_filters += '<a class="list-group-item item-name"><span class="name">'+json['text_selected_filters']+'</span><span class="link"><i class="fa fa-minus"></i></span></a>';
        selected_filters += '</div>';
        selected_filters += '<div class="list-group-item item-content">';

        if (json['selected_options']) {
          $.each(json['selected_options'], function(i,value) {
            selected_filters += '<div class="checkbox"><b>'+value['name']+':</b></div>';
            if (value['option_values']) {
              $.each(value['option_values'], function(b,sub_value) {
                selected_filters += '<div class="checkbox">';
                  selected_filters += '<label class="selected-filters-label" onclick="uncheck_option('+sub_value['option_value_id']+');"><i class="fa fa-times-circle"></i> ' + sub_value['name'] + '</label>';
                selected_filters += '</div>';
              });
            }
          });
        }

        if (json['selected_attributes']) {
          $.each(json['selected_attributes'], function(i,value) {
            selected_filters += '<div class="checkbox"><b>'+value['name']+':</b></div>';
            if (value['attribute_values']) {
              $.each(value['attribute_values'], function(b,sub_value) {
                selected_filters += '<div class="checkbox">';
                  selected_filters += '<label class="selected-filters-label" onclick="uncheck_attribute(\''+sub_value['attribute_value']+'\');"><i class="fa fa-times-circle"></i> ' + sub_value['name'] + '</label>';
                selected_filters += '</div>';
              });
            }
          });
        }

        if (json['selected_manufacturers']) {
          $.each(json['selected_manufacturers'], function(i,value) {
            selected_filters += '<div class="checkbox"><b>'+value['name']+':</b></div>';
            if (value['manufacturer_values']) {
              $.each(value['manufacturer_values'], function(b,sub_value) {
                selected_filters += '<div class="checkbox">';
                  selected_filters += '<label class="selected-filters-label" onclick="uncheck_manufacturer('+sub_value['manufacturer_id']+');"><i class="fa fa-times-circle"></i> ' + sub_value['name'] + '</label>';
                selected_filters += '</div>';
              });
            }
          });
        }
        selected_filters += '<div><button type="button" id="button-reset" class="btn button"><?php echo $button_reset; ?></button></div>';
        selected_filters += '</div>';
      selected_filters += '</div>';

      $('#selected-filters').html(selected_filters);

      if (!json['selected_options_empty'] && !json['selected_attributes_empty'] && !json['selected_manufacturers_empty']) {
        $('#selected-filters').hide();
      } else {
        $('#selected-filters').show();
      }

      if (json['go_back']) {
        $('input[name=page]').val(1);
        window.location.href = json['go_back'];
      }

      if (json['products']) {
        product = '<ul class="products-list js-products-viewed">';

        if (json['empty']) {
          product += '<div class="col-sm-12"><p>'+json['empty']+'</p></div>';
        }

        $.each(json['products'], function(i,value) {
          product += '<li>';
          product += '  <div class="card product">';
		  product += '    <div class="product__top">';
		  product += '      <a href="' + value['href'] + '" class="card-image product__image"> <img class="responsive-img" src="' + value['thumb'] + '" alt="' + value['name'] + '" /> </a>';
		  product += '      <div class="product__top-action">';
		  product += '        <a href="#" class="product__top-action-link product__top-action-link--graph"> <i class="material-icons">insert_chart</i> </a>';
		  product += '        <a href="#" class="product__top-action-link product__top-action-link--star"></a>';
		  product += '      </div>';
		  product += '    </div>';
		  product += '    <div class="card-content product__content">';
		  product += '      <h2 class="product__title truncate"><a href="' + value['href'] + '">' + value['name'] + '</a></h2>';
		  product += '      <div class="product__content-top">';

          /*
              if (value['price']) {
                product += '<div class="price">';
                if (!value['special']) {
                  product += value['price'];
                } else {
                  product += '<span class="price-old">'+value['price']+'</span> <span class="price-new">'+value['special']+'</span>';
                }
                product += '</div>';
              }
              product += '<div class="product-buttons">';
                if (value['rating']) {
                  product += '<div class="rating"><img src="catalog/view/theme/sstore/images/stars-'+value['rating']+'.png" /></div>';
                }
          */

		  product += '    </div>';
		  product += '    <div class="card-action product__buttons">';
		  product += '      <div class="row">';
		  product += '        <div class="col s40"> <a onclick="cart.add(\'' + value['product_id'] + '\');" class="waves-effect waves-light btn-large bold btn-orange">Купить</a> </div>';
		  product += '        <div class="col s60"> <a href="#modal-quick-order" class="waves-effect waves-light btn-large bold btn-blue modal-trigger">Быстрый заказ</a> </div>';
		  product += '      </div>';
		  product += '    </div>';
		  product += '  </div>';
          product += '</li>';
        });
        product += '</ul>';

        //product += '<div class="clearfix pagination">'+json['pagination']+'</div>';

        product += '</div>';

        //$('#res-products').html(product);
        $('.pagination').replaceWith('<div class="clearfix pagination">'+json['pagination']+'</div>');


        <?php if ($filter_products_data['update_mask']) { ?>
        masked('#filter-products-form', false);
        masked('#res-products', false);
        <?php } ?>


        // tooltips on hover
        $('[data-toggle=\'tooltip\']').tooltip({container: 'body'});

        $('.pagination li a').on('click', function () {
          var get_link = $(this).attr('href');
          var get_page = get_link.match(/page=(\d+)/);
          $('input[name=page]').val(get_page[1]);
          filtering();
          scroll_to_products();
          return false;
        });

        history.pushState({}, json['heading_title'], json['url']);
      }
    } 
  });
}

function scroll_to_products() {
  $("html, body").animate({
    scrollTop: $('#content').offset().top + "px"
  }, {
    duration: 900,
    easing: "swing"
  });
}

function masked(element, status) {
  if (status == true) {
    $('<div/>')
    .attr({ 'class':'masked' })
    .prependTo(element);
    $('<div class="masked_loading" />').insertAfter($('.masked'));
  } else {
    $('.masked').remove();
    $('.masked_loading').remove();
  }
}

function sliderRange(){
	if ( $('#range-slider').length ){
		// init slider

		//var min_value = parseInt($('#sidebar_price_from').val());
		var min_value = parseInt($('#input_price_min').val());
		var max_value = parseInt($('#input_price_max').val());

        console.log(min_value);
        console.log(max_value);

        var data = {
            connect: true,
            start: [min_value, max_value],
			step: 100,
			range: {
				min: min_value,
				max: max_value
			}
        }

        console.log(data);

		var range_slider = document.getElementById('range-slider');
		noUiSlider.create(range_slider, data);

		// update inputs/slider
		// When the slider value changes, update the input and span
		range_slider.noUiSlider.on('update', function( values, handle ) {
			if ( handle ) {
                $('#input_price_max').val(parseInt(values[handle]));
			} else {
                $('#input_price_min').val(parseInt(values[handle]));
			}
		});

		var valueInputFrom = document.getElementById('input_price_max');
		var valueInputTo = document.getElementById('input_price_min');

		// When the input changes, set the slider value
		valueInputFrom.addEventListener('change', function(){
			range_slider.noUiSlider.set([this.value,null]);
		});
		valueInputTo.addEventListener('change', function(){
			range_slider.noUiSlider.set([null,this.value]);
		});
	}
}
/* sliderRange end */

//--></script>
