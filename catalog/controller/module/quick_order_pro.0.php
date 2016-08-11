<?php

class ControllerModuleQuickOrderPro extends Controller
{
	private $error = array();

	private $available_actions = array(
		'p', // load price
		'o', // create order
		'z', // load zones
	);
	private $form_id;
	private $setting;
	private $store_cart;

	static private $item_id = 0;
	
	public function __construct($registry)
	{
		parent::__construct($registry);
		
		$this->init();
	}
	
	public function __destruct()
	{
		$this->destruct();
	}
	
	public function index($module = array())
	{
		self::$item_id++;
		
		if (!$module['guest_checkout'] && !$this->customer->isLogged()) {
			return false;
		}
		
		if (!$module['autch_checkout'] && $this->customer->isLogged()) {
			return false;
		}
		
		if (array_key_exists('store', $module) && !in_array($this->config->get('config_store_id'), $module['store'])) {
			return false;
		} 
		
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}
		
		if (array_key_exists('customer_group', $module) && !in_array($customer_group_id, $module['customer_group'])) {
			return false;
		}
		
		if (isset($this->request->get['route']) && $this->request->get['route'] == 'product/product') {
			
			if (isset($this->request->get['product_id'])) {
				$product_id = $this->request->get['product_id'];
			} else {
				$product_id = 0;
			}
			
			$this->load->model('catalog/product');
		
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$data['type'] = '1';
			} else {
				return false; // product not found
			}
			
			$data['product_id'] = $product_id;
			
		} elseif (!$this->cart->hasProducts() || !empty($this->session->data['vouchers'])) {
			return false; // cart empty
    	} else {
			$data['type'] = '0';
		}
		
		$this->document->addScript('catalog/view/javascript/quick_order_pro/quick_order_pro.js');
		
		$backtrace = debug_backtrace(FALSE);
		
		$module['position'] = 'column_left';
		
		foreach ($backtrace as $item) {

			if (!empty($item['class'])) {
				
				if ($item['class'] == 'ControllerCommonColumnLeft') {
					$module['position'] = 'column_left';
					break;
				} elseif ($item['class'] == 'ControllerCommonColumnRight') {
					$module['position'] = 'column_right';
					break;
				} elseif ($item['class'] == 'ControllerCommonContentBottom') {
					$module['position'] = 'content_bottom';
					break;
				} elseif ($item['class'] == 'ControllerCommonContentTop') {
					$module['position'] = 'content_tottom';
					break;
				}
				
			}
		}
		
		$position = (in_array($module['position'], array('column_left', 'column_right'))) ? 'sidebar' : 'content';
		
		$key_parts = array($module['module_id'], $data['type'], (int)($position == 'content'), self::$item_id/*, $module['layout_id']*/);
		
		if ($data['type'] == 1) $key_parts[] = $product_id;
		
		$key = implode(id::$separator, $key_parts);
		
		oc::registry()->message->data['form_id'] = $data['form_id'] = $this->form_id = id::encode($key);
		
		$this->language->load('module/quick_order_pro');
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validate()) {
			
			$this->doCreateOrder($this->request->post, $module);
			
			if ($module['redirect']) {
				$redirect = $this->url->link('checkout/success');
			} else {
				$redirect = $this->request->server['HTTP_REFERER'];
				message::setState('success', $module['success_message'], $this->form_id, 'success');
				
				
				$this->session->data['quick_order_pro_success'][$this->form_id] = $module['success_message'];
			}
			
			$this->redirect($redirect);
		}
		
		$data['total'] = false;
		
		$data['fields'] = field::renderFields($module['fields']);
		
		if ($data['type'] == '1') { // product
			
			if ($product_info['quantity'] <= 0 && !$module['stock_checkout']) {
				return;
			}
			
			$data['product_info'] = array(
				'name'		=> $product_info['name'],
				'option'	=> array(),
				'quantity'	=> $product_info['minimum'],
			);
			
			if ($module['use_option'] && $module['show_option']) {
			
				foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
					
					if (in_array($option['type'], array('text', 'textarea', 'date', 'datetime', 'time')) && !empty($option['value'])) {
						
						$data['product_info']['option'][] = array(
							'name'	=> $option['name'],
							'value'	=> (utf8_strlen($option['value']) > 20 ? utf8_substr($option['value'], 0, 20) . '..' : $option['value'])
						);
						
					}
					
				}
			
			}
			
		}
		
		if ($module['show_total'] && ($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
		
			$price_args = array(
				'module_id' => $module['module_id']
			);
			
			if ($data['type'] == '1') { // product
			
				$price_args += array(
					'product_id' => $this->request->get['product_id']
				);
				
			}
			
			$price_info = $this->getTotal($data['type'], $price_args);
			
			if ($module['show_total']) {
				$data['total'] = $this->currency->format($price_info['total']);
			}
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/stylesheet/quick_order_pro/quick_order_pro.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/quick_order_pro/quick_order_pro.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/quick_order_pro/quick_order_pro.css');
		}
		
		$language_id = $this->config->get('config_language_id');
		
		$data['text_process'] = $this->language->get('text_process');
		$data['text_required'] = $this->language->get('text_required');
		$data['text_total'] = $this->language->get('text_total');
		$data['text_shipping_total'] = $this->language->get('text_shipping_total');
		
		if (!empty($module['button'][$language_id])) {
			$data['button_send'] = $module['button'][$language_id];
		} else {
			$data['button_send'] = $this->language->get('button_send');
		}
		
		if (array_key_exists($language_id, $module['title']) && $this->_stripText($module['title'][$language_id]) != '') {
			$data['heading_title'] = $this->prepareMessage($module['title'][$language_id]);
		} else {
			$data['heading_title'] = FALSE;
		}
		
		if (array_key_exists($language_id, $module['description']) && $this->_stripText($module['description'][$language_id]) != '') {
			$data['description'] = $this->prepareMessage($module['description'][$language_id]);
		} else {
			$data['description'] = FALSE;
		}
		
		$class = $position;
		
		if ($this->_stripText($module['class']) != '') {
			$class .= ' ' . $this->_stripText($module['class']);
		}
		
		if (!$data['heading_title'] && !$data['description']) {
			$class .= ' eh';
		}
		
		$data['class'] = $class;
		$data['module_info'] = $module;
		$data['item_id'] = self::$item_id;
		
		if (!empty(oc::registry()->message->data['error'])) {
			
			if (array_key_exists('fields', oc::registry()->message->data['error'])) {
				unset(oc::registry()->message->data['error']['fields']);
			}
			
			$data['error'] = oc::registry()->message->data['error'];
		} else {
			$data['error'] = NULL;
		}
		
		$data['success'] = message::getState('success', $this->form_id, 'success');

		return $this->load->view(tpl::find($position, id::decode($this->form_id)), $data);
	}
	
	private function getTotal($type = 0, $data = array())
	{
		$response = array(
			'total' => 0
		);
		
		if ($type == 1) {
			
			$this->storeCatr();
			
			$this->load->model('catalog/product');
			
			$this->cart->clear();
			
			if (isset($data['product_id'])) {
				$product_id = $data['product_id'];
			} else {
				$product_id = 0;
			}
			
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				
				if (isset($data['quantity'])) {
					$quantity = $data['quantity'];
				} else {
					$quantity = $product_info['minimum'];
				}
				
				if (isset($data['option'])) {
					$option = array_filter($data['option']);
				} else {
					$option = array();	
				}
				
				if (isset($this->request->post['recurring_id'])) {
					$recurring_id = $this->request->post['recurring_id'];
				} else {
					$recurring_id = 0;
				}
				
				$this->cart->add($product_id, $quantity, $option, $recurring_id);
			}
			
		}
		
		$this->load->model('extension/extension');
		
		// Totals
		$total_data = array();					
		$total = 0;
		$taxes = $this->cart->getTaxes();
		
		$sort_order = array();

		$results = $this->model_extension_extension->getExtensions('total');

		foreach ($results as $key => $value) {
			$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
		}

		array_multisort($sort_order, SORT_ASC, $results);

		foreach ($results as $result) {
			
			if ($this->config->get($result['code'] . '_status')) {
				
				$this->load->model('total/' . $result['code']);

				$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
			}
			
		}
		
		$response['total'] = $total;
		
		if ($this->cartIsStored()) {
			$this->restoreCart();
		} elseif ($type != 0) {
			$this->cart->clear();
		}
		
		return $response;
	}

	private function storeCatr()
	{
		$this->store_cart = $this->cart->getProducts();
	}

	private function restoreCart()
	{
		$this->cart->clear();

		if ($this->cartIsStored()) {

			$products = $this->store_cart;

			foreach ($products as $product) {

				$option_data = array();

				foreach ($product['option'] as $option) {

					if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'image') {
						$option_data[$option['product_option_id']] = $option['product_option_value_id'];
					} elseif($option['type'] == 'checkbox') {

						if (!isset($option_data[$option['product_option_id']])) {
							$option_data[$option['product_option_id']] = array();
						}

						$option_data[$option['product_option_id']][] = $option['product_option_value_id'];

					} else {
						$option_data[$option['product_option_id']] = $option['value'];
					}

				}

				if ($product['recurring']) {
					$recurring_id = $product['recurring']['recurring_id'];
				} else {
					$recurring_id = 0;
				}

				$this->cart->add($product['product_id'], $product['quantity'], $option_data, $recurring_id);

			}

		}
	}

	private function cartIsStored()
	{
		return !empty($this->store_cart);
	}
	
	private function getWeight($type = 0, $data = array())
	{
		if ($type == 1) {
			
			$this->load->model('catalog/product');

			$this->storeCatr();
			
			$this->cart->clear();
			
			if (isset($data['product_id'])) {
				$product_id = $data['product_id'];
			} else {
				$product_id = 0;
			}
			
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				
				if (isset($data['quantity'])) {
					$quantity = $data['quantity'];
				} else {
					$quantity = $product_info['minimum'];
				}
				
				if (isset($data['option'])) {
					$option = array_filter($data['option']);
				} else {
					$option = array();	
				}
				
				if (isset($this->request->post['recurring_id'])) {
					$recurring_id = $this->request->post['recurring_id'];
				} else {
					$recurring_id = 0;
				}
				
				$this->cart->add($product_id, $quantity, $option, $recurring_id);
			}
			
		}
		
		$weight = $this->cart->getWeight();
		
		if ($type == 1) {
			$this->restoreCart();
		}
		
		return $weight;
	}
	
	public function captcha()
	{
		if (!isset($this->request->get['key']) || !$form_info = id::decode($this->request->get['key'])) {
			return;
		}
		
		if (!empty($form_info['module_id'])) {
			$module_id = $form_info['module_id'];
		} else {
			$module_id = 0;
		}
		
		$this->load->model('extension/module');
		
		$module_info = $this->model_extension_module->getModule($module_id);
		
		if (!$module_info) {
			return;
		}
		
		if (isset($this->request->get['a']) && $this->request->get['a'] == 'reload') {
			
			$json = array(
				'url' => str_replace('&amp;', '&', $this->url->link('module/quick_order_pro/captcha', 'key=' . $this->request->get['key'] . '&r=' . uniqid()))
			);
			
			$this->response->setOutput(json_encode($json));
			
		} else {
			
			$captcha = new Captcha($module_info['captcha_alphabet'], (int)$module_info['captcha_count_items']);
			$captcha->line_color = explode(',', $module_info['captcha_line_color']);
			$captcha->text_color = explode(',', $module_info['captcha_color']);
			$captcha->showLine = (int)$module_info['captcha_show_lines'];
			
			if ($form_info['position'] == 0) { // content
				$captcha->width	= 120;
				$captcha->height = 40;
			}
			
			if (!array_key_exists('quick_order_pro_captcha', $this->session->data)) {
				$this->session->data['quick_order_pro_captcha'] = array();
			}
			
			$this->session->data['quick_order_pro_captcha'][$this->request->get['key']] = $captcha->getCode();
			
			$captcha->showImage();
		}
	}
	
	public function ajax()
	{
		if ($this->isAjax() && $this->request->server['REQUEST_METHOD'] == 'POST') { // ajax only
		
			$json = array();
			
			$status = 'ok';
			
			if ($this->checkRequest()) {
				
				switch ($this->request->post['a']) {
					case 'z':
						$json += $this->getZones();
						break;
					case 'p':
						$json += $this->getPrice();
						break;
					case 'o':
						$json += $this->createOrder();
						break;
				}
				
			} else {
				
				$status = 'error';
				
				$json += array(
					'message' => 'Error invalid arguments!'
				);
				
			}
			
			if (!empty(oc::registry()->message->data['error'])) {
				
				$status = 'error';
				
				$json += array(
					'error' => oc::registry()->message->data['error']
				);
				
			} elseif (!empty($json['error']))  {
				$status = 'error';
			}
			
			if (!empty($json['error'])) {
				$this->prepareMessage($json['error']);
			}
			
			$json['status'] = $status;
			
			$this->response->setOutput(json_encode($json));
			
		} else {
			return $this->forward('error/not_found');
		}
		
	}
	
	private function prepareMessage(&$message)
	{
		if (is_array($message)) {
			
			foreach ($message as &$item) {
				$this->prepareMessage($item);
			}
			
			return false;
		}
		
		$message = strtr($message, $this->getTokens());
		
		$message = html_entity_decode($message, ENT_QUOTES, 'UTF-8');
		
		return $message;		
	}
	
	private function getTokens() {
		
		static $tokens = NULL;
		
		if (empty($tokens)) {
			
			$tokens = array(
				'{config::name}'			=> $this->config->get('config_name'),
				'{config::title}'			=> $this->config->get('config_title'),
				'{config::owner}'			=> $this->config->get('config_owner'),
				'{config::address}'			=> $this->config->get('config_address'),
				'{config::email}'			=> $this->config->get('config_email'),
				'{config::telephone}'		=> $this->config->get('config_telephone'),
				'{config::fax}'				=> $this->config->get('config_fax'),
				'{customer::firstname}'		=> $this->customer->getFirstname(),
				'{customer::lastname}'		=> $this->customer->getLastname(),
				'{customer::email}'			=> $this->customer->getEmail(),
				'{customer::telephone}'		=> $this->customer->getTelephone(),
				'{customer::fax}'			=> $this->customer->getFax(),
				'{customer::rewardpoints}'	=> (float)$this->customer->getRewardPoints()
			);
			
		}
		
		return $tokens;		
	}
	
	private function _stripText($text) {
		
		$text = html_entity_decode($text, ENT_QUOTES, 'UTF-8');
		$text = strip_tags($text);
		$text = trim($text);
		
		return $text;
	}
	
	private function _getOptionValue($product_option_value_id) {
		
		$this->load->model('module/quick_order_pro');
		
		$data = array();
		
		$option_value_info = $this->model_module_quick_order_pro->getProductOptionValue($product_option_value_id);
		
		if ($option_value_info) {
			
			$data = array(
				'price'			=> $option_value_info['price'],
				'price_prefix'	=> $option_value_info['price_prefix'],
				'value'			=> (utf8_strlen($option_value_info['name']) > 20 ? utf8_substr($option_value_info['name'], 0, 20) . '..' :$option_value_info['name'])
			);								
		}
		
		return $data;
	}
	
	private function getPrice()
	{
		$data = array();
		
		$this->language->load('module/quick_order_pro');

		$this->load->model('catalog/product');
		$this->load->model('module/quick_order_pro');
		
		if (isset($this->request->post['form_id']) && $setting = id::decode($this->request->post['form_id'])) {

			$this->load->model('extension/module');
			
			$module_info = $this->model_extension_module->getModule($setting['module_id']);
			
			if ($module_info) {
				
				if ($setting['type'] == 1) {
				
					if (isset($this->request->post['product_id'])) {
						$product_id = $this->request->post['product_id'];
					} else {
						$product_id = 0;
					}
					
					$product_info = $this->model_catalog_product->getProduct($product_id);
					
					if ($product_info) {
						
						if (isset($this->request->post['quantity'])) {
							$quantity = $this->request->post['quantity'];
						} else {
							$quantity = 1;
						}
						
						$data['quantity'] = $quantity;
						
						if (is_numeric($quantity) && $quantity > 0) {
							
							$option_price = 0;
							
							if ($module_info['use_option']) {
							
								if (isset($this->request->post['option'])) {
									$options = array_filter($this->request->post['option']);
								} else {
									$options = array();
								}
								
								if ($module_info['show_option']) {
								
									$product_option_ids = array_keys($options);
									$product_option_ids = array_map('intval', $product_option_ids);
									
									$product_options = $this->model_module_quick_order_pro->getProductOptions($product_option_ids);
									
									foreach ($options as $product_option_id => $option_value) {
										
										if (array_key_exists($product_option_id, $product_options)) {
											
											$option_info = $product_options[$product_option_id];
										
											if (in_array($option_info['type'], array('select', 'radio', 'image'))) {
												
												$option_value_info = $this->_getOptionValue($option_value);
												
												if ($option_value_info) {
													
													if ($option_value_info['price_prefix'] == '+') {
														$option_price += $option_value_info['price'];
													} elseif ($option_value_info['price_prefix'] == '-') {
														$option_price -= $option_value_info['price'];
													}
													
													$data['options'][] = array(
														'name'	=> $option_info['name'],
														'value'	=> $option_value_info['value']
													);
													
												}
												
											} elseif ($option_info['type'] == 'checkbox' && is_array($option_value)) {
												
												foreach ($option_value as $product_option_value_id) {
													
													$option_value_info = $this->_getOptionValue($product_option_value_id);
													
													if ($option_value_info) {
														
														if ($option_value_info['price_prefix'] == '+') {
															$option_price += $option_value_info['price'];
														} elseif ($option_value_info['price_prefix'] == '-') {
															$option_price -= $option_value_info['price'];
														}
														
														$data['options'][] = array(
															'name'	=> $option_info['name'],
															'value'	=> $option_value_info['value']
														);
														
													}
													
												}
																	
											} elseif (in_array($option_info['type'], array('text', 'textarea', 'file', 'date', 'datetime', 'time'))) {
												
												if ($option_info['type'] != 'file') {
													$option_value = $option_value;
												} else {
													$this->load->library('encryption');
											
													$encryption = new Encryption($this->config->get('config_encryption'));
													$option_value = substr($encryption->decrypt($option_value), 0, strrpos($encryption->decrypt($option_value), '.'));
												}
												
												$data['options'][] = array(
													'name'	=> $option_info['name'],
													'value'	=> (utf8_strlen($option_value) > 20 ? utf8_substr($option_value, 0, 20) . '..' : $option_value)
												);						
											}
										}
									}
								}
							}
							
						} else {
							$this->error['quantity'] = $this->language->get('error_quantity');
						}
					
					} else {
						$this->error['product'] = $this->language->get('error_product');
					}
					
				}
				
				$data['total'] = 0;
				
				if (isset($this->request->post['product_id']) && ($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
			
					$price_args = array(
						'module_id' => $setting['module_id']
					);
					
					if ($setting['type'] == '1') { // product
					
						$price_args += array(
							'product_id'	=> $product_id,
							'quantity'		=> $quantity
						);
						
						if (!empty($options)) {
							$price_args['option'] = $options;
						}
					}
					
					oc::registry()->message->data['form_id'] = $this->request->post['form_id'];
					
					$price_info = $this->getTotal($setting['type'], $price_args);
					
					if ($module_info['show_total']) {
						$data['total'] = $this->currency->format($price_info['total']);
					}
					
				}
				
			
			} else {
				$this->error['system'] = $this->language->get('error_form_id');
			}
			
		} else {
			$this->error['system'] = $this->language->get('error_form_id');
		}
		
		return $data;
	}
	
	private function getZones() {
		
		$data = array();
		
		$this->load->model('localisation/country');
    	$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);
		
		if ($country_info) {
			
			$this->load->model('localisation/zone');

			$data = $country_info += array(
				'zone' => $this->model_localisation_zone->getZonesByCountryId($this->request->post['country_id']),
			);
		}
		
		return $data;
	}
	
	private function isAjax() {
		return (isset($this->request->server['HTTP_X_REQUESTED_WITH']) && $this->request->server['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest');
	}
	
	private function validate() {
		
		$post = $this->request->post;
		
		if (!isset($this->request->post['form_id']) || !$setting = id::decode($this->request->post['form_id'])) {
			oc::registry()->message->data['error']['warning'] = $this->language->get('error_system_fields');
		} else {
			
			oc::registry()->message->data['form_id'] = $form_id = $this->request->post['form_id'];
			
			if (isset($this->form_id) && $this->form_id != $form_id) return false;
			
			$this->load->model('extension/module');
		
			$module_info = $this->model_extension_module->getModule($setting['module_id']);
			
			if ($setting['type'] == '0') { // cart, category...
				
				if (!$this->cart->hasStock() && (!$module_info['stock_checkout'])) {
					oc::registry()->message->data['error']['warning'] = $this->language->get('error_stock');
				}
				
				if ($module_info['minimum']) {
				
					$products = $this->cart->getProducts();
					
					foreach ($products as $product) {
						$product_total = 0;
							
						foreach ($products as $product_2) {
							if ($product_2['product_id'] == $product['product_id']) {
								$product_total += $product_2['quantity'];
							}
						}			
						
						if ($product['minimum'] > $product_total) {
							oc::registry()->message->data['error']['warning'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);
						}				
							
					}
				
				}
			
			} else { // product
				
				if ($this->isAjax()) {
					
					$this->load->model('catalog/product');
					
					if (isset($this->request->get['product_id'])) {
						$product_id = $this->request->get['product_id'];
					} elseif (isset($this->request->post['product_id'])) {
						$product_id = $this->request->post['product_id'];
					} else {
						$product_id = 0;
					}
				
					if ($module_info['minimum']) {
						
						$product_info = $this->model_catalog_product->getProduct($product_id);
						
						if (isset($this->request->post['quantity'])) {
							$quantity = $this->request->post['quantity'];
						} else {
							$quantity = 1;
						}
						
						if ($quantity <= 0) {
							oc::registry()->message->data['error']['warning'] = sprintf($this->language->get('error_minimum'), $product_info['name'], 1);
						} elseif ($product_info['minimum'] > $quantity) {
							oc::registry()->message->data['error']['warning'] = sprintf($this->language->get('error_minimum'), $product_info['name'], $product_info['minimum']);
						}
						
					}

					if (isset($this->request->post['profile_id'])) {
						$profile_id = $this->request->post['profile_id'];
					} else {
						$profile_id = 0;
					}

					$profiles = $this->model_catalog_product->getProfiles($product_id);

					if ($profiles) {

						$profile_ids = array();

						foreach ($profiles as $profile) {
							$profile_ids[] = $profile['profile_id'];
						}

						if (!in_array($profile_id, $profile_ids)) {
							$json['error']['profile'] = $this->language->get('error_profile_required');
						}
					}
					
					if ($module_info['use_option'] && $module_info['option_required']) {
					
						if (isset($this->request->post['option'])) {
							$option = array_filter($this->request->post['option']);
						} else {
							$option = array();	
						}
						
						$required_options = array();
			
						$product_options = $this->model_catalog_product->getProductOptions($product_id);
						
						foreach ($product_options as $product_option) {
							
							if ($product_option['required'] && (!isset($option[$product_option['product_option_id']]) || !$option[$product_option['product_option_id']])) {
								$required_options[] = trim($product_option['name']);
							}
						}
						
						if (!empty($required_options)) {
							oc::registry()->message->data['error']['warning'] = sprintf($this->language->get('error_required_options'), implode(', ', $required_options));
						}
					
					}
				}
			}
			
			$args = array(
				'module_id' => $setting['module_id']
			);
			
			if ($setting['type'] == '1') { // product
			
				if (isset($this->request->get['product_id'])) {
					$product_id = $this->request->get['product_id'];
				} elseif (isset($this->request->post['product_id'])) {
					$product_id = $this->request->post['product_id'];
				} else {
					$product_id = 0;
				}
				
				if (isset($this->request->post['quantity'])) {
					$quantity = $this->request->post['quantity'];
				} else {
					$quantity = 1;
				}
				
				$args += array(
					'product_id'	=> $product_id,
					'quantity'		=> $quantity
				);

				if (isset($this->request->post['option'])) {
					$options = array_filter($this->request->post['option']);
				} else {
					$options = array();
				}
				
				if (!empty($options)) {
					$args['option'] = $options;
				}
			}
			
			$total_info = $this->getTotal($setting['type'], $args);
			
			$min_total = (float)$module_info['min_total'];
			$max_total = (float)$module_info['max_total'];
			
			if ($min_total > 0 && $total_info['total'] < $min_total) {
				oc::registry()->message->data['error']['warning'] = sprintf($this->language->get('error_min_total'), $this->currency->format($min_total));
			} elseif ( ($max_total > 0 && $total_info['total'] > $max_total)) {
				oc::registry()->message->data['error']['warning'] = sprintf($this->language->get('error_max_total'), $this->currency->format($min_total));
			}
			
			$weight = $this->getWeight($setting['type'], $args);
			
			$min_weight = (float)$module_info['min_weight'];
			$max_weight = (float)$module_info['max_weight'];
			
			if ($min_weight > 0 && $weight < $min_weight) {
				oc::registry()->message->data['error']['warning'] = sprintf($this->language->get('error_min_weight'), $this->weight->format($min_weight, $this->config->get('config_weight_class_id'), $this->language->get('decimal_point'), $this->language->get('thousand_point')));
			} elseif ($max_weight > 0 && $weight > $max_weight) {
				oc::registry()->message->data['error']['warning'] = sprintf($this->language->get('error_max_weight'), $this->weight->format($max_weight, $this->config->get('config_weight_class_id'), $this->language->get('decimal_point'), $this->language->get('thousand_point')));
			}
			
			if (!$this->customer->isLogged() && $module_info['create_customer'] && !empty($post['fields']['field_email'])) {
				
				$this->load->model('module/quick_order_pro');
				
				$total_customers = $this->model_module_quick_order_pro->getTotalCustomersByEmail($post['fields']['field_email']);
				
				if ($total_customers) {
					oc::registry()->message->data['error']['warning'] = sprintf($this->language->get('error_customer'), $post['fields']['field_email'], $this->url->link('account/login'));
				}
				
			}
			
			$language_id = $this->config->get('config_language_id');
			
			foreach ($module_info['fields'] as $field_id => $field_info) {
				
				if (!$field_info['status']) continue;				
					
				if (isset($post['fields'][$field_id]) || in_array($field_info['type']['type'], array('radio', 'checkbox'))) {

					$value = isset($post['fields'][$field_id]) ? $post['fields'][$field_id] : false; // field value
					$isEmpty = ($value === false || (empty($value) && $value !== '0'));
					
					if ($isEmpty) {
						
						if ($field_info['required']) {
							oc::registry()->message->data['error']['fields'][$field_id] = message::renderItem($this->language->get('error_required'), $this->request->post['form_id'], 'error');
						}
						
					} elseif (!empty($field_info['validate']) && $validator = validator::getInstance($field_info)) {
							
						if (!$validator->validate($value)) {
							oc::registry()->message->data['error']['fields'][$field_id] = message::renderItem($validator->getErrorMessage(), $this->request->post['form_id'], 'error');
						}
						
					}
					
				} else {

					oc::registry()->message->data['error']['system'] = sprintf($this->language->get('error_field_empty'), $field_info['title'][$language_id]);

					break;
				}
				
			}
			
		}
		
		return (bool)empty(oc::registry()->message->data['error']);
	}
	
	private function checkRequest()
	{
		if (!array_key_exists('a', $this->request->post) || !$this->validateAction($this->request->post['a'])) {
			$this->error['warning'] = $this->language->get('error_system_fields');
		}
		
		return (bool)!count($this->error);
	}
	
	private function validateAction($action) {
		return in_array($action, $this->available_actions);
	}
	
	private function createOrder()
	{
		$this->language->load('module/quick_order_pro');
		
		$data = array();
		
		if ($this->validate()) {
			
			$setting = id::decode($this->request->post['form_id']);
			
			$this->load->model('extension/module');
		
			$module_info = $this->model_extension_module->getModule($setting['module_id']);
			
			$this->doCreateOrder($this->request->post, $module_info);
			
			if ($module_info['redirect']) {
				$data['redirect'] = str_replace('&amp;', '&', $this->url->link('checkout/success'));
			} else {
				$data['success'] = html_entity_decode($module_info['success_message'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
			}
			
		}
		
		return $data;
	}
	
	private function doCreateOrder($post, $module_info)
	{
		$this->load->model('extension/extension');
		$this->load->model('localisation/country');
		$this->load->model('localisation/zone');
		$this->load->model('module/quick_order_pro');
		
		$setting = id::decode($post['form_id']);
		
		$this->storeCatr();
		
		if ($setting['type'] == 1) { // product page
		
			if (!$module_info['checkout_cart_append']) {
				$this->cart->clear();
			}
			
			if (isset($this->request->get['product_id'])) {
				$product_id = $this->request->get['product_id'];
			} elseif (isset($this->request->post['product_id'])) {
				$product_id = $this->request->post['product_id'];
			} else {
				$product_id = 0;
			}
			
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if (!$product_info) return;
			
			if (isset($this->request->post['quantity'])) {
				$quantity = $this->request->post['quantity'];
			} else {
				$quantity = $product_info['minimum'];
			}
			
			if (isset($this->request->post['option'])) {
				$option = array_filter($this->request->post['option']);
			} else {
				$option = array();	
			}
			
			if (isset($this->request->post['recurring_id'])) {
				$recurring_id = $this->request->post['recurring_id'];
			} else {
				$recurring_id = 0;
			}
			
			$this->cart->add($product_id, $quantity, $option, $recurring_id);
		}
		
		// Totals
		$total_data = array();					
		$total = 0;
		$taxes = $this->cart->getTaxes();
		
		$sort_order = array(); 
			
		$results = $this->model_extension_extension->getExtensions('total');
		
		foreach ($results as $key => $value) {
			$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
		}
		
		array_multisort($sort_order, SORT_ASC, $results);
		
		foreach ($results as $result) {
			
			if ($this->config->get($result['code'] . '_status')) {
				$this->load->model('total/' . $result['code']);
	
				$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
			}
			
			$sort_order = array(); 
		  
			foreach ($total_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $total_data);			
		}
		
		$this->language->load('checkout/checkout');
		
		$data = array();
		
		$data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
		$data['store_id'] = $this->config->get('config_store_id');
		$data['store_name'] = $this->config->get('config_name');
		
		if ($data['store_id']) {
			$data['store_url'] = $this->config->get('config_url');		
		} else {
			$data['store_url'] = HTTP_SERVER;	
		}
		
		$language_id = $this->config->get('config_language_id');
		
		$data['fields'] = array();
		
		foreach ($module_info['fields'] as $field_id => $field_info) {
			
			if (isset($post['fields'][$field_id]) && !in_array($field_info['code'], array('captcha', 'country', 'zone'))) {
				
				$value = $post['fields'][$field_id];
				
				$isEmpty = ($value === FALSE || (empty($value) && $value !== '0'));
				
				if (!$isEmpty) {
					
					if (in_array($field_info['type']['type'], array('select', 'radio', 'checkbox'))) {
						
						$result = array();
						
						$options = is_array($value) ? $value : array($value);
						
						foreach ($options as $option_id) {
							
							if (array_key_exists($option_id, $field_info['type']['option'])) {
								$result[] = $field_info['type']['option'][$option_id]['value'];
							}
							
						}
						
						$result = array_filter($result);
						
						if (!$result) continue;
						
						$value = implode(', ', $result);
					}
					
					$key = ($field_info['code'] == 'custom_field') ? $field_id : $field_info['code'];
					
					$data['fields'][$key] = array(
						'title'		=> $field_info['title'][$language_id],
						'value'		=> $this->_stripText($value),	
						'weight'	=> $field_info['weight']
					);
				
				}
				
			}
			
		}
		
		$sort_order = array(); 
		  
		foreach ($data['fields'] as $key => $value) {
			$sort_order[$key] = $value['weight'];
		}

		array_multisort($sort_order, SORT_ASC, $data['fields']);	
		
		foreach (array('firstname', 'lastname', 'telephone', 'email', 'address', 'comment') as $field) {

			if (array_key_exists($field, $data['fields'])) {
				$data[$field] = $data['fields'][$field]['value'];
			} else {
				$data[$field] = '';
			}

		}
		
		if (!$data['email'] && $this->customer->isLogged()) {
			$data['email'] = $this->customer->getEmail();
		}
		
		if (!empty($post['fields']['field_country'])) {
			$country_id = (int)$post['fields']['field_country'];
		} else {
			$country_id = $this->config->get('config_country_id');
		}
		
		$data['payment_country_id'] = $data['shipping_country_id'] = $country_id;
		
		$country_info = $this->model_localisation_country->getCountry($country_id);
		
		if ($country_info) {
			$country_name = $country_info['name'];
		} else {
			$country_name = '';
		}
		
		if (!empty($post['fields']['field_zone'])) {
			$zone_id = (int)$post['fields']['field_zone'];
		} else {
			$zone_id = $this->config->get('config_zone_id');
		}
		
		$data['payment_zone_id'] = $data['shipping_zone_id'] = $zone_id;
		
		$zone_info = $this->model_localisation_zone->getZone($zone_id);
		
		if ($zone_info) {
			$zone_name = $zone_info['name'];
		} else {
			$zone_name = '';
		}
		
		$data['payment_firstname'] = $data['shipping_firstname'] = $data['firstname'];
		$data['payment_lastname'] = $data['shipping_lastname'] = $data['lastname'];
		$data['payment_company'] = $data['shipping_company'] = '';
		$data['payment_company_id'] = '';
		$data['payment_tax_id'] = '';
		$data['payment_address_1'] = $data['shipping_address_1'] = $data['address'];
		$data['payment_address_2'] = $data['shipping_address_2'] = '';
		$data['payment_city'] = $data['shipping_city'] = '';
		$data['payment_postcode'] = $data['shipping_postcode'] = '';
		$data['payment_zone'] = $data['shipping_zone'] = $zone_name;
		$data['payment_country'] = $data['shipping_country'] = $country_name;
		$data['payment_address_format'] = $data['shipping_address_format'] = '';
		$data['payment_method'] = $data['shipping_method'] = '';
		$data['shipping_code'] = '';
		$data['payment_code'] = 'cod';
		
		if ($this->customer->isLogged()) {
			
			$data['customer_id'] = $this->customer->getId();
			$data['customer_group_id'] = $this->customer->getGroupId();
			$data['fax'] = $this->customer->getFax();
			
		} else {
			
			$data['fax'] = '';
			
			if ($module_info['create_customer'] && !empty($data['email'])) {
				
				if ($module_info['new_customer_group']) {
					$data['customer_group_id'] = $module_info['new_customer_group'];
				} else {
					$data['customer_group_id'] = $this->config->get('config_customer_group_id');
				}
								
				if (!empty($module_info['new_customer_random_password'])) {
					$password = substr(sha1(uniqid(mt_rand(), true)), 6, 16);
				} elseif ($module_info['new_customer_password']) {
					$password = $module_info['new_customer_password'];
				} else {
					$password = '123456';
				}
				
				oc::registry()->message->data['customer_password'] = $password;
				
				$customer_data = $data + array(
					'password' 		=> $password,
					'company'		=> '',
					'address_1'		=> '',
					'address_2'		=> '',
					'city'			=> '',
					'postcode'		=> '',
					'country_id'	=> $data['payment_country_id'],
					'zone_id'		=> $data['payment_zone_id']
				);
				
				$data['customer_id'] = $this->model_module_quick_order_pro->addCustomer($customer_data, $module_info);
				
				if ($module_info['new_customer_login']) {
					$this->customer->login($customer_data['email'], $customer_data['password']);
				}
				
			} else {
				$data['customer_id'] = 0;
				$data['customer_group_id'] = $this->config->get('config_customer_group_id');
			}
			
		}
		
		$product_data = array();
	
		foreach ($this->cart->getProducts() as $product) {

			$option_data = array();

			foreach ($product['option'] as $option) {
				
				if ($option['type'] != 'file') {
					$value = $option['value'];
				} else {
					$encryption = new Encryption($this->config->get('config_encryption'));
					$value = $encryption->decrypt($option['value']);
				}
				
				$option_data[] = array(
					'product_option_id'       => $option['product_option_id'],
					'product_option_value_id' => $option['product_option_value_id'],
					'option_id'               => $option['option_id'],
					'option_value_id'         => $option['option_value_id'],								   
					'name'                    => $option['name'],
					'value'                   => $value,
					'type'                    => $option['type']
				);	
				
			}
 
			$product_data[] = array(
				'product_id' => $product['product_id'],
				'name'       => $product['name'],
				'model'      => $product['model'],
				'option'     => $option_data,
				'download'   => $product['download'],
				'quantity'   => $product['quantity'],
				'subtract'   => $product['subtract'],
				'price'      => $product['price'],
				'total'      => $product['total'],
				'tax'        => $this->tax->getTax($product['total'], $product['tax_class_id']),
				'reward'     => $product['reward']
			); 
		}
		 
		$data['vouchers'] = array();	
		$data['products'] = $product_data;
		$data['totals'] = $total_data;
		$data['total'] = $total;
		
		if (isset($this->request->cookie['tracking'])) {
			
			$data['tracking'] = $this->request->cookie['tracking'];

			$subtotal = $this->cart->getSubTotal();

			// Affiliate
			$this->load->model('affiliate/affiliate');

			$affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);

			if ($affiliate_info) {
				$data['affiliate_id'] = $affiliate_info['affiliate_id'];
				$data['commission'] = ($subtotal / 100) * $affiliate_info['commission'];
			} else {
				$data['affiliate_id'] = 0;
				$data['commission'] = 0;
			}

			// Marketing
			$this->load->model('checkout/marketing');

			$marketing_info = $this->model_checkout_marketing->getMarketingByCode($this->request->cookie['tracking']);

			if ($marketing_info) {
				$data['marketing_id'] = $marketing_info['marketing_id'];
			} else {
				$data['marketing_id'] = 0;
			}
		} else {
			$data['affiliate_id'] = 0;
			$data['commission'] = 0;
			$data['marketing_id'] = 0;
			$data['tracking'] = '';
		}
		
		$data['language_id'] = $this->config->get('config_language_id');
		$data['currency_id'] = $this->currency->getId();
		$data['currency_code'] = $this->currency->getCode();
		$data['currency_value'] = $this->currency->getValue($this->currency->getCode());
		$data['ip'] = $this->request->server['REMOTE_ADDR'];
		
		if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
			$data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];	
		} elseif(!empty($this->request->server['HTTP_CLIENT_IP'])) {
			$data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];	
		} else {
			$data['forwarded_ip'] = '';
		}
		
		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];	
		} else {
			$data['user_agent'] = '';
		}
		
		if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
			$data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];	
		} else {
			$data['accept_language'] = '';
		}
		
		$this->load->model('checkout/order');
		
		$this->session->data['order_id'] = $this->model_checkout_order->addOrder($data);
		
		$this->model_module_quick_order_pro->confirm($this->session->data['order_id'], $data, $module_info);
		
		if ($setting['type'] == 1) { // product page
			$this->restoreCart();
		}
		
		if (!$module_info['redirect']) {
			
			if ($module_info['checkout_cart_append']) {
				$this->cart->clear();
			}
			
			unset($this->session->data['order_id']);

		} else {

			$this->session->data['guest']['firstname'] = $data['firstname'];
			$this->session->data['guest']['lastname'] = $data['lastname'];

		}
		
	}
	
	private function init()
	{
		require_once dirname(__FILE__) . '/includes/' . 'class.oc.php';

		oc::registry()->create($this->registry);
		
		$this->setting = $this->getSetting();
		
		spl_autoload_register(array($this, 'autoloader'));
		spl_autoload_extensions('.php');
		
		oc::registry()->message = new message;
	}
	
	private function destruct()
	{
		spl_autoload_unregister(array($this, 'autoloader'));
		spl_autoload_unregister(array('field', 'autoloader_field'));
	}
	
	private function getSetting()
	{
		return $this->config->get('quick_order_pro_setting');
	}
	
	static public function autoloader($name)
	{
		if (class_exists($name)) {
			return false;
		}
		
		$file_name = dirname(__FILE__) . DIRECTORY_SEPARATOR . 'includes' . DIRECTORY_SEPARATOR . 'class.' . str_replace('_', '.', $name) . '.php';
		$file_name = strtolower($file_name);
		
		if (file_exists($file_name)) {
			include_once $file_name;
		}
		
	}
}
