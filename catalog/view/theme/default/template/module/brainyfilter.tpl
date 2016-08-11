<?php
/**
 * Brainy Filter Ultimate 5.0.5, April 22, 2016 / brainyfilter.com
 * Copyright 2014-2016 Giant Leap Lab / www.giantleaplab.com
 * License: Commercial. Reselling of this software or its derivatives is not allowed. You may use this software for one website ONLY including all its subdomains if the top level domain belongs to you and all subdomains are parts of the same OpenCart store.
 * Support: support@giantleaplab.com
 */
$isHorizontal = $layout_position === 'content_top' || $layout_position === 'content_bottom';
$isResponsive = (bool) $settings['style']['responsive']['enabled'];
$responsivePos = $settings['style']['responsive']['position'] === 'right' ? 'bf-right' : 'bf-left';

if (!function_exists('totalsDecorator')) {
    function totalsDecorator($groupId, $val, $totals = array(), $selected = array()) {
        if (!isset($totals[$groupId][$val]) && !isset($selected[$groupId])) {
            return '';
        }

        $total = isset($totals[$groupId][$val]) ? $totals[$groupId][$val] : 0;
        $addPlusSign = isset($selected[$groupId]);

        return '<span class="bf-count ' . (!$total ? 'bf-empty' : '') . '">' . ($addPlusSign ? '+' : '') . $total . '</span>';
    }
}
if (!function_exists('isEmptyStock')) {
    function isEmptyStock($groupId, $val, $postponedCount, $totals = array(), $selected = array()) {
        $inStock = $postponedCount || (isset($totals[$groupId][$val]) && $totals[$groupId][$val]);
        $inSelected = isset($selected[$groupId]) && in_array($val, $selected[$groupId]);
        return !$inStock && !$inSelected;
    }
}

?>
<style type="text/css">
    .bf-responsive.bf-active.bf-layout-id-<?php echo $layout_id;?> .bf-check-position {
        top: <?php echo (int)$settings['style']['responsive']['offset']; ?>px;
    }
    .bf-responsive.bf-active.bf-layout-id-<?php echo $layout_id;?> .bf-btn-show,
    .bf-responsive.bf-active.bf-layout-id-<?php echo $layout_id;?> .bf-btn-reset {
        top: <?php echo (int)$settings['style']['responsive']['offset']; ?>px;
    }
    .bf-layout-id-<?php echo $layout_id;?> .bf-btn-show {
    <?php if (isset($settings['style']['resp_show_btn_color']['val'])) : ?>
        background: #235B9A;
    <?php endif; ?>
    }
    .bf-layout-id-<?php echo $layout_id;?> .bf-btn-reset {
    <?php if (isset($settings['style']['resp_reset_btn_color']['val'])) : ?>
        background: <?php echo $settings['style']['resp_reset_btn_color']['val']; ?>;
    <?php endif; ?>
    }
    .bf-layout-id-<?php echo $layout_id;?> .bf-attr-header{
        background: #fff;
        color: #577fa5;
        font-weight: 600;
    }
    .bf-layout-id-<?php echo $layout_id;?> .bf-count{
        background: #F8B042;
        color: #fff;
    }
   .bf-layout-id-<?php echo $layout_id;?> .ui-widget-header {
        <?php echo isset($settings['style']['price_slider_area_background']['val']) ? 'background: '.$settings['style']['price_slider_area_background']['val'].';':''; ?>
   }
   .bf-layout-id-<?php echo $layout_id;?> .ui-widget-content {
         <?php echo isset($settings['style']['price_slider_background']['val']) ? 'background: '.$settings['style']['price_slider_background']['val'].';':''; ?> 
         <?php echo isset($settings['style']['price_slider_border']['val']) ? 'border:1px solid '.$settings['style']['price_slider_border']['val'].';':''; ?> 
   }
.bf-layout-id-<?php echo $layout_id;?> .ui-state-default {
         <?php echo isset($settings['style']['price_slider_handle_background']['val']) ? 'background: '.$settings['style']['price_slider_handle_background']['val'].';':''; ?> 
         <?php echo isset($settings['style']['price_slider_handle_border']['val']) ? 'border:1px solid '.$settings['style']['price_slider_handle_border']['val'].';':''; ?> 
   }
  .bf-layout-id-<?php echo $layout_id;?> .bf-attr-group-header{
        <?php echo isset($settings['style']['group_block_header_background']['val']) ? 'background: '.$settings['style']['group_block_header_background']['val'].';':''; ?> 
       <?php echo isset($settings['style']['group_block_header_text']['val']) ? 'color: '.$settings['style']['group_block_header_text']['val'].';':''; ?> 
  }
  <?php if ($settings['behaviour']['hide_empty']) : ?>
  .bf-layout-id-<?php echo $layout_id;?> .bf-row.bf-disabled, 
  .bf-layout-id-<?php echo $layout_id;?> .bf-horizontal .bf-row.bf-disabled {
      display: none;
  }
  <?php endif; ?>
</style>
<?php if (count($filters)) : ?>
<div class="side-filters bf-responsive bf-left bf-panel-wrapper bf-layout-id-<?php echo $layout_id;?>">
    <div class="bf-btn-show"></div>
    <a class="bf-btn-reset" onclick="BrainyFilter.reset();"></a>
    <div class="box bf-check-position">
	    <h3 class="side-filters__title">подбор по параметрам<i class="material-icons">filter_list</i></h3>

        <div class="brainyfilter-panel" <?php if ($settings['submission']['hide_panel']) : ?>bf-hide-panel<?php endif; ?>" style="background-color: #fff;" >
            <form class="bf-form
                    <?php if ($settings['behaviour']['product_count']) : ?> bf-with-counts<?php endif; ?> 
                    <?php if ($sliding) : ?> bf-with-sliding<?php endif; ?>
                    <?php if ($settings['submission']['submit_type'] === 'button' && $settings['submission']['submit_button_type'] === 'float') : ?> bf-with-float-btn<?php endif; ?>
                    <?php if ($limit_height) : ?> bf-with-height-limit<?php endif; ?>"
                  data-height-limit="<?php echo $limit_height_opts; ?>"
                  data-visible-items="<?php echo $slidingOpts; ?>"
                  data-hide-items="<?php echo $slidingMin; ?>"
                  data-submit-type="<?php echo $settings['submission']['submit_type']; ?>"
                  data-submit-delay="<?php echo (int)$settings['submission']['submit_delay_time']; ?>"
                  data-resp-max-width="<?php echo (int)$settings['style']['responsive']['max_width']; ?>"
                  data-resp-collapse="<?php echo (int)$settings['style']['responsive']['collapsed']; ?>"
                  data-resp-max-scr-width ="<?php echo (int)$settings['style']['responsive']['max_screen_width']; ?>"
                  method="get" action="index.php">
                <?php if ($currentRoute === 'product/search') : ?>
                <input type="hidden" name="route" value="product/search" />
                <?php else : ?>
                <input type="hidden" name="route" value="product/category" />
                <?php endif; ?>
                <?php if ($currentPath) : ?>
                <input type="hidden" name="path" value="<?php echo $currentPath; ?>" />
                <?php endif; ?>
                <?php if ($manufacturerId) : ?>
                <input type="hidden" name="manufacturer_id" value="<?php echo $manufacturerId; ?>" />
                <?php endif; ?>

                <?php foreach ($filters as $i => $section) : ?>
                        
                    <?php if ($section['type'] == 'price') : ?>
                        <div class="side-filter" style="border-top: 1px solid #F8F8F8;">
                            <div class="side-filter__head">
                                <div class="side-filter__head-title">Ценовой диапазон</div>
                            </div>
                            <div class="side-filter__content">
                                <div class="bf-price-container bf-attr-filter">
                                    <div class="range-slider-holder">
                                        <div class="bf-slider-range"></div>
                                    </div>

            						<div class="range-slider-values">
            							<div class="left"><?php echo $price_min; ?></div>
            							<div class="right"><?php echo $price_max; ?></div>
            						</div>

            						<div class="range-slider-form">
                                        <label for="input_price_min">от</label>
            							<div class="input-field">
                                            <input type="text" class="bf-range-min" name="bfp_price_min" value="<?php echo $lowerlimit; ?>" placeholder="<?php echo $lowerlimit; ?>" />
                                        </div>
                                        <label for="input_price_max">до</label>
            							<div class="input-field">
                                            <input type="text" class="bf-range-max" name="bfp_price_max" value="<?php echo $upperlimit; ?>" placeholder="<?php echo $upperlimit; ?>" />
                                        </div>
                                        <span>руб.</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                    <?php else : ?>
                        
                        <?php $curGroupId = null; ?>
                        <?php foreach ($section['array'] as $groupId => $group) : ?>
                            <?php if (isset($group['group_id']) && $settings['behaviour']['attribute_groups']) : ?>
                                <?php if ($curGroupId != $group['group_id']) : ?>
                                    <div class="bf-attr-group-header"><?php echo $group['group']; ?></div>
                                    <?php $curGroupId = $group['group_id']; ?>
                                <?php endif; ?>
                                
                            <?php endif; ?>
                            <?php $groupUID = substr($section['type'], 0, 1) . $groupId; ?>
                            <div class="side-filter bf-attr-block<?php if (in_array($group['type'], array('slider', 'slider_lbl', 'slider_lbl_inp'))) : ?> bf-slider<?php endif; ?>">
                            <div class="bf-attr-header<?php if ($section['collapsed']) : ?> bf-collapse<?php endif; ?><?php if (!$i) : ?> bf-w-line<?php endif; ?>">
                                <?php echo $group['name']; ?><span class="bf-arrow"></span>
                            </div>
                            <div class="bf-attr-block-cont">
                                <?php $group['type'] = isset($group['type']) ? $group['type'] : 'checkbox'; ?>
                                
                                <?php if ($group['type'] == 'select') : ?>
                                
                                    <div class="bf-attr-filter bf-attr-<?php echo $groupUID; ?> bf-row">
                                        <div class="bf-cell">
                                            <select name="<?php echo "bfp_{$groupUID}"; ?>">
                                                <option value="" class="bf-default"><?php echo $default_value_select; ?></option>
                                                <?php foreach ($group['values'] as $value) : ?>
                                                    <?php $isSelected = isset($selected[$groupUID]) && in_array($value['id'], $selected[$groupUID]); ?>
                                                    <option value="<?php echo $value['id']; ?>" class="bf-attr-val" <?php if ($isSelected) : ?>selected="true"<?php endif; ?>><?php echo $value['name']; ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                    </div>
                                
                                <?php elseif (in_array($group['type'], array('slider', 'slider_lbl', 'slider_lbl_inp'))) : ?>
                                
                                <div class="bf-attr-filter bf-attr-<?php echo $groupUID; ?> bf-row">
                                    <div class="bf-cell">
                                        <div class="bf-slider-inputs">
                                            <?php $isMinSet = isset($selected[$groupUID]['min']); ?>
                                            <?php $isMaxSet = isset($selected[$groupUID]['max']); ?>
                                            <?php $sliderType = $group['type'] === 'slider_lbl_inp' ? 3 : ($group['type'] === 'slider_lbl' ? 2 : 1); ?>
                                            <input type="hidden" name="bfp_min_<?php echo $groupUID; ?>" value="<?php echo $isMinSet ? $selected[$groupUID]['min'] : 'na'; ?>" class="bf-attr-min-<?php echo $groupUID; ?>" data-min-limit="<?php echo $group['min']['s']; ?>" />
                                            <input type="hidden" name="bfp_max_<?php echo $groupUID; ?>" value="<?php echo $isMaxSet ? $selected[$groupUID]['max'] : 'na'; ?>" class="bf-attr-max-<?php echo $groupUID; ?>" data-max-limit="<?php echo $group['max']['s']; ?>" /> 
                                            <?php if ($group['type'] !== 'slider_lbl') : ?>
                                            <?php $minLbl = ''; $maxLbl = '';
                                                if ($isMinSet) {
                                                    foreach ($group['values'] as $v) {
                                                        if ($v['s'] == $selected[$groupUID]['min']) {
                                                            $minLbl = $v['n'];
                                                            break;
                                                        }
                                                    } 
                                                }
                                                if ($isMaxSet) {
                                                    foreach ($group['values'] as $v) {
                                                        if ($v['s'] == $selected[$groupUID]['max']) {
                                                            $maxLbl = $v['n'];
                                                            break;
                                                        }
                                                    } 
                                                }
                                            ?>
                                            <input type="text" name="" class="bf-slider-text-inp-min bf-slider-input" value="<?php echo $minLbl; ?>" placeholder="<?php echo $lang_empty_slider; ?>" />
                                            <span class="ndash">&#8211;</span>
                                            <input type="text" name="" class="bf-slider-text-inp-max bf-slider-input" value="<?php echo $maxLbl; ?>" placeholder="<?php echo $lang_empty_slider; ?>" />
                                            <?php endif; ?>
                                        </div>
                                        <div class="bf-slider-container-wrapper <?php if($sliderType === 2 || $sliderType === 3): ?>bf-slider-with-labels<?php endif; ?>">
                                            <div class="bf-slider-container" data-slider-group="<?php echo $groupUID; ?>" data-slider-type="<?php echo $sliderType; ?>"></div>
                                        </div>
                                    </div>
                                </div>
                                
                                <?php elseif ($group['type'] === 'grid') : ?>
                                
                                <div class="bf-attr-filter bf-attr-<?php echo $groupUID; ?> bf-row">
                                    <div class="bf-grid">
                                        <?php foreach ($group['values'] as $value) : ?>
                                        <?php $valueId  = $value['id']; ?>
                                        <div class="bf-grid-item">
                                            <input id="bf-attr-<?php echo $groupUID . '_' . $valueId . '_' . $layout_id; ?>" class="bf-hidden"
                                                    data-filterid="bf-attr-<?php echo $groupUID . '_' . $valueId; ?>"
                                                    type="radio" 
                                                    name="<?php echo "bfp_{$groupUID}"; ?>"
                                                    value="<?php echo $valueId; ?>" 
                                                    <?php if (isset($selected[$groupUID]) && in_array($valueId, $selected[$groupUID])) : ?>checked="true"<?php endif; ?> />
                                            <label for="bf-attr-<?php echo $groupUID . '_' . $valueId . '_' . $layout_id; ?>">
                                                <img src="image/<?php echo $value['image'];?>" alt="<?php echo $value['name']; ?>" />
                                            </label>
                                            <span class="bf-hidden bf-attr-val"><?php echo $valueId; ?></span>
                                        </div>
                                        <?php endforeach; ?>
                                    </div>
                                </div>
                                
                                <?php else : ?>
                                
                                    <?php foreach ($group['values'] as $value) : ?>
                                    <?php $valueId  = $value['id']; ?>
                                    <div class="bf-attr-filter bf-attr-<?php echo $groupUID; ?> bf-row <?php 
                                    if (isset($totals) && isEmptyStock($groupUID, $valueId, $postponedCount, $totals, $selected) && $settings['behaviour']['hide_empty']):
                                        ?>bf-disabled<?php endif; ?>">
                                        <span class="bf-cell bf-c-1">
                                            <input id="bf-attr-<?php echo $groupUID . '_' . $valueId . '_' . $layout_id; ?>"
                                                   data-filterid="bf-attr-<?php echo $groupUID . '_' . $valueId; ?>"
                                                   type="<?php echo $group['type']; ?>" 
                                                   name="<?php echo "bfp_{$groupUID}"; ?><?php if ($group['type'] === 'checkbox') { echo "_{$valueId}"; } ?>"
                                                   value="<?php echo $valueId; ?>" 
                                                   <?php if (isset($selected[$groupUID]) && in_array($valueId, $selected[$groupUID])) : ?>checked="true"<?php endif; ?> />
                                        </span>
                                        <span class="bf-cell bf-c-2 <?php if ($section['type'] == 'rating') echo 'bf-rating-' . $valueId; ?>">
                                            <span class="bf-hidden bf-attr-val"><?php echo $valueId; ?></span>
                                            <label for="bf-attr-<?php echo $groupUID . '_' . $valueId . '_' . $layout_id; ?>">
                                                <?php if ($section['type'] === 'option') : ?>
                                                    <?php if ($group['mode'] === 'img' || $group['mode'] === 'img_label') : ?>
                                                        <img src="image/<?php echo $value['image'];?>" alt="<?php echo $value['name']; ?>" />
                                                    <?php endif; ?>
                                                    <?php if ($group['mode'] === 'label' || $group['mode'] === 'img_label') : ?>
                                                        <?php echo $value['name']; ?>
                                                    <?php endif; ?>
                                                <?php else : ?>
                                                    <?php echo $value['name']; ?>
                                                <?php endif; ?>
                                            </label>
                                        </span>
                                        <span class="bf-cell bf-c-3"><?php if (isset($totals)) echo totalsDecorator($groupUID, $valueId, $totals, $selected); ?></span>
                                    </div>
                                    <?php endforeach; ?>
                                <?php endif; ?>
                            </div>
                            </div>
                        <?php endforeach; ?>
                    <?php endif; ?>
                    
                <?php endforeach; ?>

				<div class="side-filters__buttons">
				    <div class="row">
					    <div class="col s6">
                            <button class="btn btn-large btn-aqua waves-effect waves-light" type="submit" onclick="BrainyFilter.sendRequest(jQuery(this));BrainyFilter.loadingAnimation();return false;">Показать</button>
                        </div>
                        <div class="col s6">
                            <button class="btn btn-large btn-gray waves-effect waves-light" type="reset" onclick="BrainyFilter.reset();return false;">Сбросить</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
var bfLang = {
    show_more : '<?php echo $lang_show_more; ?>',
    show_less : '<?php echo $lang_show_less; ?>',
    empty_list : '<?php echo $lang_empty_list; ?>'
};
BrainyFilter.requestCount = BrainyFilter.requestCount || <?php echo $settings['behaviour']['product_count'] ? 'true' : 'false'; ?>;
BrainyFilter.requestPrice = BrainyFilter.requestPrice || <?php echo $settings['behaviour']['sections']['price']['enabled'] ? 'true' : 'false'; ?>;
BrainyFilter.separateCountRequest = BrainyFilter.separateCountRequest || <?php echo $postponedCount ? 'true' : 'false'; ?>;
BrainyFilter.min = BrainyFilter.min || <?php echo $priceMin; ?>;
BrainyFilter.max = BrainyFilter.max || <?php echo $priceMax; ?>;
BrainyFilter.lowerValue = BrainyFilter.lowerValue || <?php echo $lowerlimit; ?>; 
BrainyFilter.higherValue = BrainyFilter.higherValue || <?php echo $upperlimit; ?>;
BrainyFilter.currencySymb = BrainyFilter.currencySymb || '<?php echo $currency_symbol; ?>';
BrainyFilter.hideEmpty = BrainyFilter.hideEmpty || <?php echo (int)$settings['behaviour']['hide_empty']; ?>;
BrainyFilter.baseUrl = BrainyFilter.baseUrl || "<?php echo $base; ?>";
BrainyFilter.currentRoute = BrainyFilter.currentRoute || "<?php echo $currentRoute; ?>";
BrainyFilter.selectors = BrainyFilter.selectors || {
    'container' : '<?php echo $settings['behaviour']['containerSelector']; ?>',
    'paginator' : '<?php echo $settings['behaviour']['paginatorSelector']; ?>'
};
<?php if ($redirectToUrl) : ?>
BrainyFilter.redirectTo = BrainyFilter.redirectTo || "<?php echo $redirectToUrl; ?>";
<?php endif; ?>
jQuery(function() {
    if (! BrainyFilter.isInitialized) {  
        BrainyFilter.isInitialized = true;
        if (typeof jQuery.fn.slider === 'undefined' || true) {
            jQuery.getScript('catalog/view/javascript/jquery-ui.slider.min.js', function(){
                jQuery('head').append('<link rel="stylesheet" href="catalog/view/theme/default/stylesheet/jquery-ui.slider.min.css" type="text/css" />');
                BrainyFilter.init();
            });
        } else {
            BrainyFilter.init();
        }
    }
});
BrainyFilter.sliderValues = BrainyFilter.sliderValues || {};
<?php if (count($filters)) : ?>
<?php foreach ($filters as $i => $section) : ?>
<?php if (isset($section['array']) && count($section['array'])) : ?>
<?php foreach ($section['array'] as $groupId => $group) : ?>
<?php $groupUID = substr($section['type'], 0, 1) . $groupId; ?>
<?php if (in_array($group['type'], array('slider', 'slider_lbl', 'slider_lbl_inp'))) : ?>
BrainyFilter.sliderValues['<?php echo $groupUID; ?>'] = <?php echo json_encode($group['values']); ?>;
<?php endif; ?>
<?php endforeach; ?>
<?php endif; ?>
<?php endforeach; ?>
<?php endif; ?>
</script>
<?php endif;

