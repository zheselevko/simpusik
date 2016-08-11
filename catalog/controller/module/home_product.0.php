<?php
class ControllerModuleHomeProduct extends Controller {
	public function index($setting) {
		$this->load->language('module/home_product');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['getSymbolRight']	= $this->currency->getSymbolRight();

		$this->load->model('catalog/product');

		$data['products_1'] = array();
		$data['products_2'] = array();
		$data['products_3'] = array();
		$data['products_4'] = array();

        /*** Хиты каталога ***/
		$filter_data1 = array(
			'filter_ean'    => '1',
			'sort'          => 'p.ean',
			'order'         => 'ASC',
			'start'         => 0,
			'limit'         => $setting['limit']
		);

		//$results1 = $this->model_catalog_product->getProducts($filter_data1);
		$results1 = $this->model_catalog_product->getPopularProducts($setting['limit']);

		if ($results1) {
			foreach ($results1 as $result) {
				$data['products_1'][] = $this->getProduct($result, $setting);
			}
		}
        /*** Alex Lysenko alys2008@gmail.com ***/

        /*** Акции ***/
		$filter_data2 = array(
			'filter_jan'    => '1',
			'sort'          => 'p.jan',
			'order'         => 'ASC',
			'start'         => 0,
			'limit'         => $setting['limit']
		);

		//$results2 = $this->model_catalog_product->getProducts($filter_data2);
        $results2 = $this->model_catalog_product->getProductSpecials($filter_data2);

		if ($results2) {
			foreach ($results2 as $result) {
				$data['products_2'][] = $this->getProduct($result, $setting);
			}
		}
        /*** Alex Lysenko alys2008@gmail.com ***/

        /*** Новинки ***/
		$filter_data3 = array(
			'sort'          => 'p.date_added',
			'order'         => 'DESC',
			'start'         => 0,
			'limit'         => $setting['limit']
		);

		$results3 = $this->model_catalog_product->getProducts($filter_data3);
		if ($results3) {
			foreach ($results3 as $result) {
				$data['products_3'][] = $this->getProduct($result, $setting);
			}
		}
        /*** Alex Lysenko alys2008@gmail.com ***/

        /*** Распродажа ***/
		$filter_data4 = array(
			'filter_isbn'   => '1',
			'sort'          => 'p.isbn',
			'order'         => 'ASC',
			'start'         => 0,
			'limit'         => $setting['limit']
		);

		$results4 = $this->model_catalog_product->getProducts($filter_data4);
		if ($results4) {
			foreach ($results4 as $result) {
				$data['products_4'][] = $this->getProduct($result, $setting);
			}
		}
        /*** Alex Lysenko alys2008@gmail.com ***/


		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/home_product.tpl')) {
		    return $this->load->view($this->config->get('config_template') . '/template/module/home_product.tpl', $data);
		} else {
		    return $this->load->view('default/template/module/home_product.tpl', $data);
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
        $attribute_data = array();

        $data = array(
        	'product_id'  => $result['product_id'],
        	'thumb'       => $image,
        	'name'        => $result['name'],
        	'sku'         => $result['sku'],
        	'model'       => $result['model'],
        	'location'    => $result['location'],
        	'price'       => $price,
        	'special'     => $special,
        	'tax'         => $tax,
        	'rating'      => $rating,
        	'reviews'     => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
        	'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
        );

        return $data;

    }
}