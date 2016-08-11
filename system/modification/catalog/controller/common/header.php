<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		$data['title'] = $this->document->getTitle();

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (isset($this->request->get['page'])) {
			$data['page'] = $this->request->get['page'];
		} else {
			$data['page'] = '';
		}

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['robots'] = $this->document->getRobots();	
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
$data['extra_tags'] = $this->document->getExtraTags();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		if ($this->config->get('config_google_analytics_status')) {
			$data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
		} else {
			$data['google_analytics'] = '';
		}

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$data['icon'] = $server . 'image/' . $this->config->get('config_icon');
		} else {
			$data['icon'] = '';
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');
		$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['register'] = $this->url->link('account/register', '', 'SSL');
		$data['login'] = $this->url->link('account/login', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		$data['contact'] = $this->url->link('information/contact');

		$data['telephone']      = $this->config->get('config_telephone');
		$data['phone1']         = $this->config->get('config_phone1');
		$data['phone2']         = $this->config->get('config_phone2');

        $data['address']        = $this->config->get('config_address');
        $data['address_part']   = explode(PHP_EOL, $data['address']);
		$data['open']           = $this->config->get('config_open');

		$data['name']           = $this->config->get('config_name');
		$data['email']          = $this->config->get('config_email');

        /* top menu */
		$data['wishlist']   = $this->url->link('account/wishlist', '', 'SSL');
        $data['compare']    = $this->url->link('product/compare');

		$data['logged']     = $this->customer->isLogged();
        $data['login']      = $this->url->link('account/login', '', 'SSL');
		$data['register']   = $this->url->link('account/register', '', 'SSL');
        /* top menu */


        /* main menu */
		$data['about_us'] = $this->url->link('information/about');
		$data['special']  = $this->url->link('information/news');
		$data['delivery'] = $this->url->link('information/delivery');
		$data['payment']  = $this->url->link('information/payment');
		$data['review']   = $this->url->link('product/testimonial');
		$data['blog']     = $this->url->link('news/ncategory');
		$data['contacts'] = $this->url->link('information/contact');
        /* main menu */

		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}

		// Menu
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$filter_data_L1 = array(
				    'filter_category_id'  => $category['category_id'],
					'filter_sub_category' => true
				);

				// Level 1
				$data['categories'][] = array(
					'name'       => $category['name']. ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data_L1) . ')' : ''),
					'category_id' => $category['category_id'],
					'sort_order' => $category['sort_order'],
					'children'   => $children_data,
					'column'     => $category['column'] ? $category['column'] : 1,
					'href'       => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		//$data['language']   = $this->load->controller('common/language');
		//$data['currency']   = $this->load->controller('common/currency');
		$data['search']     = $this->load->controller('common/search');
		$data['search_top'] = $this->load->controller('common/search_top');
		$data['cart']       = $this->load->controller('common/cart');
		$data['minicart']   = $this->load->controller('common/minicart');

if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} else {
				$class = '';
			}

			$data['class']  = str_replace('/', '-', $this->request->get['route']) . $class;
			$data['active'] = '';
		} else {
			$data['class']  = 'main-page';
			//$data['active'] = 'active';
			$data['active'] = '';
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);
		} else {
			return $this->load->view('default/template/common/header.tpl', $data);
		}
	}
}