<?php
class ControllerModuleCatalog extends Controller {
	public function index($setting) {
		$this->load->language('module/catalog');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['getSymbolRight']	= $this->currency->getSymbolRight();

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		$filter_data = array(
			'filter_upc'    => '1',
			'sort'          => 'p.upc',
			'order'         => 'ASC',
			'start'         => 0,
			'limit'         => $setting['limit']
		);

		$results = $this->model_catalog_product->getProducts($filter_data);

		if ($results) {
			foreach ($results as $result) {

				$data['products'][] = $this->getProduct($result, $setting);
			}

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/catalog.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/catalog.tpl', $data);
			} else {
				return $this->load->view('default/template/module/catalog.tpl', $data);
			}
		}
	}

    public function getProduct($result, $setting) {
	    $this->load->model('catalog/product');
        $this->load->model('tool/image');

        if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
        	$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
        } else {
        	$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
        }

        if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
        	$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
        } else {
        	$price = false;
        }

        if ((float)$result['special']) {
        	$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
        } else {
        	$special = false;
        }

        if ($this->config->get('config_tax')) {
        	$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
        } else {
        	$tax = false;
        }

        if ($this->config->get('config_review_status')) {
        	$rating = $result['rating'];
        } else {
        	$rating = false;
        }

        $product_info = $this->model_catalog_product->getProduct($result['product_id']);

        $attribute_groups = $this->model_catalog_product->getProductAttributes($result['product_id']);

        $attribute_data = array();
        foreach ($attribute_groups as $attribute_group) {
        	foreach ($attribute_group['attribute'] as $attribute) {
        		$attribute_data[] = array(
                    'name' => $attribute['name'],
        		    'text' => $attribute['text']
                );
        	}
        }

        $data = array(
        	'product_id'  => $result['product_id'],
        	'thumb'       => $image,
        	'name'        => $result['name'],
        	'sku'         => $result['sku'],
        	'model'       => $result['model'],
        	'location'    => $result['location'],
			//'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
        	'price'       => $price,
        	'special'     => $special,
        	'tax'         => $tax,
        	'rating'      => $rating,
        	'reviews'     => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
			'attribute'   => $attribute_data,
        	'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
        );

        return $data;

    }

}