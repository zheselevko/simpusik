<?php
class ControllerModuleQuickOrderPro extends Controller { 

	const VERSION = '3.0';
	
	private $error = array();
	
	private $required_fields;
	private $available_fields;
	private $available_order_fields;

	public function __construct($registry) {
		
		parent::__construct($registry);
		
		$this->init();
	}
	 
	public function index() {
		
		$this->load->language('module/quick_order_pro');
		
		if (!empty($this->request->get['module_id'])) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$post = $this->request->post['module'];
			
			// Новый модуль
			if (empty($module_info)) {
				
				$post += array(
					'fields' => $this->getDefaultFields()
				);

				$this->model_extension_module->addModule('quick_order_pro', $post);

				$modules = $this->model_extension_module->getModulesByCode('quick_order_pro');

				$module_id = 0;

				foreach ($modules as $module) {

					if ($module['module_id'] > $module_id) {
						$module_id = $module['module_id'];
					}

				}

				$this->request->get['module_id'] = $post['module_id'] = $module_id;
				
			} else {
				
				$fields = $module_info['fields'];
			
				foreach ($post['fields'] as $field_id => $field_info) {
					
					if (array_key_exists($field_id, $fields)) {
						$fields[$field_id]['weight'] = (int)$field_info['weight'];
					}
					
				}
				
				$post['fields'] = $fields;
				
			}
			
			$this->model_extension_module->editModule($this->request->get['module_id'], $post);
			
			$url = '';
			
			if (isset($this->request->get['module_id'])) {
				$url .= '&module_id=' . $this->request->get['module_id'];
			}
			
			if (array_key_exists('redirect', $this->request->get) && $this->request->get['redirect'] == 'fields') {
				$url = $this->url->link('module/quick_order_pro/field', 'token=' . $this->session->data['token'] . $url, 'SSL');
			} elseif (isset($this->request->get['apply'])) {
				$url = $this->url->link('module/quick_order_pro', 'token=' . $this->session->data['token'] . $url, 'SSL');
			} else {
				$url = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
			}
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($url);
		}
		
		$this->document->addStyle('view/stylesheet/quick_order_pro/colorpicker/colorpicker.css');
		
		$this->document->addScript('view/javascript/jquery/quick_order_pro/jquery.tablednd.0.7.min.js');
		$this->document->addScript('view/javascript/jquery/quick_order_pro/colorpicker/colorpicker.js');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled_editor'] = $this->language->get('text_enabled_editor');
		$data['text_disable_editor'] = $this->language->get('text_disable_editor');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_help_custom_fields'] = $this->language->get('text_help_custom_fields');
		$data['text_add_field'] = $this->language->get('text_add_field');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_select_field'] = $this->language->get('text_select_field');
		$data['text_product_setting'] = $this->language->get('text_product_setting');
		$data['text_drag'] = $this->language->get('text_drag');
		$data['text_required'] = $this->language->get('text_required');
		$data['text_tokens'] = $this->language->get('text_tokens');
		$data['text_title_shop'] = $this->language->get('text_title_shop');
		$data['text_token_config_name'] = $this->language->get('text_token_config_name');
		$data['text_token_config_title'] = $this->language->get('text_token_config_title');
		$data['text_token_config_owner'] = $this->language->get('text_token_config_owner');
		$data['text_token_config_address'] = $this->language->get('text_token_config_address');
		$data['text_token_config_email'] = $this->language->get('text_token_config_email');
		$data['text_token_config_telephone'] = $this->language->get('text_token_config_telephone');
		$data['text_token_config_fax'] = $this->language->get('text_token_config_fax');
		$data['text_title_customer'] = $this->language->get('text_title_customer');
		$data['text_token_customer_firstname'] = $this->language->get('text_token_customer_firstname');
		$data['text_token_customer_lastname'] = $this->language->get('text_token_customer_lastname');
		$data['text_token_customer_email'] = $this->language->get('text_token_customer_email');
		$data['text_token_customer_telephone'] = $this->language->get('text_token_customer_telephone');
		$data['text_token_customer_fax'] = $this->language->get('text_token_customer_fax');
		$data['text_token_customer_reward'] = $this->language->get('text_token_customer_reward');
		$data['text_help_tokens_customer'] = $this->language->get('text_help_tokens_customer');
		$data['text_help_create_new_customer'] = $this->language->get('text_help_create_new_customer');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_select_all'] = $this->language->get('text_select_all');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_unselect_all'] = $this->language->get('text_unselect_all');
		$data['text_alert_email'] = $this->language->get('text_alert_email');
		
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_stock_checkout'] = $this->language->get('entry_stock_checkout');
		$data['entry_minimum'] = $this->language->get('entry_minimum');
		$data['entry_show_option'] = $this->language->get('entry_show_option');
		$data['entry_use_option'] = $this->language->get('entry_use_option');
		$data['entry_option_required'] = $this->language->get('entry_option_required');
		$data['entry_show_total'] = $this->language->get('entry_show_total');
		$data['entry_captcha'] = $this->language->get('entry_captcha');
		$data['entry_redirect_success'] = $this->language->get('entry_redirect_success');
		$data['entry_success_message'] = $this->language->get('entry_success_message');
		$data['entry_css_class'] = $this->language->get('entry_css_class');
		$data['entry_button_label'] = $this->language->get('entry_button_label');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_checkout_cart_append'] = $this->language->get('entry_checkout_cart_append');
		$data['entry_min_total'] = $this->language->get('entry_min_total');
		$data['entry_max_total'] = $this->language->get('entry_max_total');
		$data['entry_min_weight'] = $this->language->get('entry_min_weight');
		$data['entry_max_weight'] = $this->language->get('entry_max_weight');
		$data['entry_order_status'] = $this->language->get('entry_order_status');
		$data['entry_guest_checkout'] = $this->language->get('entry_guest_checkout');
		$data['entry_autch_checkout'] = $this->language->get('entry_autch_checkout');
		$data['entry_create_customer'] = $this->language->get('entry_create_customer');
		$data['entry_new_customer_login'] = $this->language->get('entry_new_customer_login');
		$data['entry_new_customer_group'] = $this->language->get('entry_new_customer_group');
		$data['entry_new_customer_password'] = $this->language->get('entry_new_customer_password');
		$data['entry_new_customer_random_password'] = $this->language->get('entry_new_customer_random_password');
		$data['entry_subtract'] = $this->language->get('entry_subtract');
		$data['entry_captcha_show_lines'] = $this->language->get('entry_captcha_show_lines');
		$data['entry_captcha_count_lines'] = $this->language->get('entry_captcha_count_lines');
		$data['entry_captcha_color_line'] = $this->language->get('entry_captcha_color_line');
		$data['entry_captcha_text_color'] = $this->language->get('entry_captcha_text_color');
		$data['entry_captcha_count_items'] = $this->language->get('entry_captcha_count_items');
		$data['entry_captcha_alphabet'] = $this->language->get('entry_captcha_alphabet');
		$data['entry_customer_email_show_ip'] = $this->language->get('entry_customer_email_show_ip');
		$data['entry_customer_email_show_date_added'] = $this->language->get('entry_customer_email_show_date_added');
		$data['entry_new_customer_mail'] = $this->language->get('entry_new_customer_mail');
		$data['entry_admin_email_same_customer'] = $this->language->get('entry_admin_email_same_customer');
		$data['entry_alert_admin'] = $this->language->get('entry_alert_admin');
		$data['entry_admin_emails'] = $this->language->get('entry_admin_emails');
		$data['entry_alert_customer'] = $this->language->get('entry_alert_customer');
		$data['entry_admin_email_type'] = $this->language->get('entry_admin_email_type');
		$data['entry_admin_email_send_password'] = $this->language->get('entry_admin_email_send_password');
		
		$data['help_description'] = $this->language->get('help_description');
		$data['help_store'] = $this->language->get('help_store');
		$data['help_customer_group'] = $this->language->get('help_customer_group');
		$data['help_minimum'] = $this->language->get('help_minimum');
		$data['help_guest_checkout'] = $this->language->get('help_guest_checkout');
		$data['help_subtract'] = $this->language->get('help_subtract');
		$data['help_stock_checkout'] = $this->language->get('help_stock_checkout');
		$data['help_button_label'] = $this->language->get('help_button_label');
		$data['help_create_customer'] = $this->language->get('help_create_customer');
		$data['help_zone'] = $this->language->get('help_zone');
		$data['help_method_default'] = $this->language->get('help_method_default');
		$data['help_method_error'] = $this->language->get('help_method_error');
		$data['help_checkout_cart_append'] = $this->language->get('help_checkout_cart_append');
		$data['help_field_save_data'] = $this->language->get('help_field_save_data');
		$data['help_admin_email_same_customer'] = $this->language->get('help_admin_email_same_customer');
		$data['help_new_customer_login'] = $this->language->get('help_new_customer_login');
		$data['help_new_customer_group'] = $this->language->get('help_new_customer_group');
		$data['help_new_customer_password'] = $this->language->get('help_new_customer_password');
		$data['help_new_customer_mail'] = $this->language->get('help_new_customer_mail');
		$data['help_admin_email_send_password'] = $this->language->get('help_admin_email_send_password');
		$data['help_option_required'] = $this->language->get('help_option_required');
		$data['help_show_option'] = $this->language->get('help_show_option');
		$data['help_admin_emails'] = $this->language->get('help_admin_emails');
		$data['help_css_class'] = $this->language->get('help_css_class');
		
		$data['column_field_id'] = $this->language->get('column_field_id');
		$data['column_field_title'] = $this->language->get('column_field_title');
		$data['column_field_type'] = $this->language->get('column_field_type');
		$data['column_required'] = $this->language->get('column_required');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_action'] = $this->language->get('column_action');
		$data['column_token'] = $this->language->get('column_token');
		$data['column_value'] = $this->language->get('column_value');
				
		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_product'] = $this->language->get('tab_product');
		$data['tab_fields'] = $this->language->get('tab_fields');
		$data['tab_setting'] = $this->language->get('tab_setting');
		$data['tab_catcha'] = $this->language->get('tab_catcha');
		$data['tab_notifications'] = $this->language->get('tab_notifications');
				
		$data['button_save'] = $this->language->get('button_save');
		$data['button_apply'] = $this->language->get('button_apply');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_insert'] = $this->language->get('button_insert');
		
		$data['version'] = self::VERSION;
		
		$data['token'] = $this->session->data['token'];
		
		$data['boolean_variables'] = array($this->language->get('text_no'), $this->language->get('text_yes'));
		$data['status_variables'] = array($this->language->get('text_disabled'), $this->language->get('text_enabled'));
		
		$data['email_types'] = array(
			'config' => $this->language->get('text_email_type_config'), 
			'other'	 => $this->language->get('text_email_type_other')
		);
		
		$data['captcha_count_items'] = array(3,4,5,6,7,8);
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} elseif (isset($this->session->data['error'])) {		
			
			$data['error_warning'] = $this->session->data['error'];
			
			unset($this->session->data['error']);
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		$data['error'] = $this->error;
		
		$data['heading_title'] = strip_tags($this->language->get('heading_title'));
		
		if (isset($this->request->get['module_id'])) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		
		if (!empty($module_info)) {
			$data['text_edit'] = $this->language->get('heading_title_edit');
		} else {
			$data['text_edit'] = $this->language->get('heading_title_new');
		}
		
		$this->document->setTitle($data['heading_title']);
		
		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL')
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
   		);
		
   		$data['breadcrumbs'][] = array(
       		'text'      => strip_tags($this->language->get('heading_title')),
			'href'      => '',
   		);
		
		if (isset($this->request->post['module'])) {
			$data['module_info'] = $this->request->post['module'];
		} elseif (!empty($module_info)) {
			$data['module_info'] = $module_info;
		} else {
			$data['module_info'] = array();
		}
		
		if (empty($module_info)) {
			$data['action'] = $this->url->link('module/quick_order_pro', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/quick_order_pro', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (!empty($module_info)) {
			$data['module_id'] = $this->request->get['module_id'];
		} else {
			$data['module_id'] = '';
		}
		
		$data['available_fields'] = array();
		
		foreach ($this->available_fields as $code) {
			$data['available_fields'][$code] = $this->language->get('text_' . $code) . (!in_array($code, $this->available_order_fields) ? ' ***' : '');
		}
		
		$captcha_defaults = array(
			'captcha_show_lines'	=> 1,
			'captcha_line_color'	=> '56,169,237',
			'captcha_color'			=> '56,169,237',
			'captcha_count_items'	=> '6',
			'captcha_alphabet'		=> '1234567890abcdefghijklmnopqrstuvwxyz',
		);
		
		foreach ($captcha_defaults as $key => $value) {
			if (!isset($data['module_info'][$key])) $data['module_info'][$key] = $value;
		}
		
		$data['fields'] = array();
		
		$data['new'] = (empty($module_info));
		
		if ($data['new']) {
			$data['attention'] = $this->language->get('text_new_module_fields');
		} else {
			
			$sort_order = array();
			
			foreach ($module_info['fields'] as $field_id => $field_info) {
				
				$action = array();
				
				$action[] = array(
					'text'		=> $this->language->get('button_edit'),
					'href'		=> $this->url->link('module/quick_order_pro/field', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'] . '&field_id=' . $field_id, 'SSL'),
					'btn_class'	=> 'btn btn-primary',
					'class'		=> 'fa fa-pencil'
				);
				
				if (!in_array($field_info['code'], $this->required_fields)) {
					
					$action[] = array(
						'text'		=> $this->language->get('button_delete'),
						'href'		=> $this->url->link('module/quick_order_pro/field', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'] . '&field_id=' . $field_id . '&delete=1', 'SSL'),
						'btn_class'	=> 'btn btn-danger',
						'class'		=> 'fa fa-trash-o'
					);
					
				}
				
				if ($field_info['code'] != 'custom_field') {
					unset($data['available_fields'][$field_info['code']]);
				}
				
				$data['fields'][$field_id] = array(
					'field_id'	=> $field_id,
					'base'		=> in_array($field_info['code'], array('firstname', 'telephone')),
					'title'		=> $field_info['title'][$this->config->get('config_language_id')] . (!in_array($field_info['code'], $this->available_order_fields) ? ' ***' : ''),
					'type'		=> $field_info['type']['type'],
					'required'	=> $field_info['required'],
					'status'	=> $field_info['status'],
					'weight'	=> $field_info['weight'],
					'action'	=> $action
				);
				
				$sort_order[$field_id] = $field_info['weight'];
			}
			
			array_multisort($sort_order, SORT_ASC, $data['fields']);
			
			$data['base_url'] = html_entity_decode($this->url->link('module/quick_order_pro/field', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')  . '&code=', ENT_QUOTES, 'UTF-8');
		}
		
		foreach (array('minimum', 'use_option', 'option_required', 'show_option', 'show_total', 'redirect') as $item) {
			if (!isset($data['module_info'][$item])) $data['module_info'][$item] = 1;
		}
		
		$data['stores'] = array();
		$data['stores'][] = array(
			'store_id' => 0,
			'name'	   => $this->config->get('config_name')
		);
		
		$this->load->model('setting/store');
		$data['stores'] = array_merge($data['stores'], $this->model_setting_store->getStores());
		
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();

		$this->load->model('sale/customer_group');

		$data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();

		$this->load->model('localisation/order_status');
		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		$this->load->model('localisation/weight_class');
		$weight_class_info = $this->model_localisation_weight_class->getWeightClass((int)$this->config->get('config_weight_class_id'));
		
		if ($weight_class_info) {
			$data['weight_title'] = sprintf($this->language->get('text_default'), $weight_class_info['title']);
		}
		
		$this->load->model('localisation/currency');
		$currency_info = $this->model_localisation_currency->getCurrencyByCode($this->config->get('config_currency'));
		
		if ($currency_info) {
			$data['currency_title'] = sprintf($this->language->get('text_default'), $currency_info['title']);
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/quick_order_pro/index.tpl', $data));
	}
	
	/**
	 * Форма добавления/редактирование поля шаблона
	 */
	public function field() {
		
		$this->load->language('module/quick_order_pro');
		
		if (empty($this->request->get['module_id']) || !$module_info = $this->model_extension_module->getModule($this->request->get['module_id'])) {
				
			$this->session->data['error'] = $this->language->get('error_module_not_found');
			$this->response->redirect($this->url->link('module/quick_order_pro', 'token=' . $this->session->data['token'], 'SSL'));
			
		}
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateFieldForm()) {
			
			$field_info = $this->request->post['field'];
			
			if (!empty($field_info['type']['option']) && array_key_exists($field_info['type']['type'], $field_info['type']['option'])) {
				$type_option = $field_info['type']['option'][$field_info['type']['type']];
			} else {
				$type_option = array();
			}
			
			unset($field_info['type']['option']);
			
			$field_info['type'] += $type_option;
			
			if (!empty($field_info['validate']) && $field_info['validate']['type']) {
				$field_info['validate'] += $field_info['validate']['option'][$field_info['validate']['type']];
				unset($field_info['validate']['option']);
			} else {
				$field_info['validate'] = array();
			}
			
			$module_info['fields'][$field_info['field_id']] = $field_info;
			
			$this->model_extension_module->editModule($this->request->get['module_id'], $module_info);
			
			if (isset($this->request->get['apply'])) {
				$url = $this->url->link('module/quick_order_pro/field', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'] . '&field_id=' . $this->request->post['field']['field_id'], 'SSL');
			} else {
				$url = $this->url->link('module/quick_order_pro', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL') . '#tab=fields';
			}
			
			$this->session->data['success'] = sprintf($this->language->get('text_success_insert_field'), $field_info['title'][$this->config->get('config_language_id')]);
			
			$this->response->redirect($url);
		}
		
		if (isset($this->request->get['delete'])) {
			
			if (isset($this->request->get['field_id']) && array_key_exists($this->request->get['field_id'], $module_info['fields'])) {
				
				$field_info = $module_info['fields'][$this->request->get['field_id']]; 
				
				if (in_array($field_info['code'], $this->required_fields)) {
					
					$this->session->data['attention'] = sprintf($this->language->get('error_remove_required_field'), $field_info['title'][$this->config->get('config_language_id')]);
					
				} else {
					
					$this->session->data['success'] = sprintf($this->language->get('text_success_remove_field'), $field_info['title'][$this->config->get('config_language_id')]);
					
					unset($module_info['fields'][$this->request->get['field_id']]);
					
					$this->model_extension_module->editModule($this->request->get['module_id'], $module_info);
				}
				
				$this->response->redirect($this->url->link('module/quick_order_pro', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL') . '#tab=fields');
			}
			
		}
		
		if (isset($this->request->get['field_id']) && array_key_exists($this->request->get['field_id'], $module_info['fields'])) {
			
			$field_id = $this->request->get['field_id'];
			$field_info = $module_info['fields'][$field_id];
			
		} elseif (isset($this->request->get['code']) && in_array($this->request->get['code'], $this->available_fields)) {
			$field_id = $this->getNewCustomFieldId($this->request->get['code'], $module_info);
		} else {
			
			$this->session->data['error'] = $this->language->get('error_field');
			$this->response->redirect($this->url->link('module/quick_order_pro', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL'));		
			
		}
		
		if (!empty($field_info)) {
			$code = $field_info['code'];
		} else {
			$code = $this->request->get['code'];
		}
		
		$this->document->addScript('view/javascript/jquery/quick_order_pro/quick_order_pro.js');
		$this->document->addScript('view/javascript/jquery/quick_order_pro/jquery.tablednd.0.7.min.js');
		$this->document->addStyle('view/stylesheet/quick_order_pro/quick_order_pro.css');
		
		if (!empty($field_info)) {
			$code = $field_info['code'];
		} else {
			$code = $this->request->get['code'];
		}
		
		$template = '';
		
		switch ($code) {
			case 'captcha':
			case 'country':
			case 'zone':
				$template = '_' . $code;
				break;
		}
		
		$data['text_required'] = $this->language->get('text_required');
		$data['text_drag'] = $this->language->get('text_drag');
		$data['text_edit_sort_value'] = $this->language->get('text_edit_sort_value');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_from'] = $this->language->get('text_from');
		$data['text_to'] = $this->language->get('text_to');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_help_validate'] = $this->language->get('text_help_validate');
		$data['text_help_field_required'] = $this->language->get('text_help_field_required');
		$data['text_tokens'] = $this->language->get('text_tokens');
		$data['text_token_field_name'] = $this->language->get('text_token_field_name');
		$data['text_token_field_min'] = $this->language->get('text_token_field_min');
		$data['text_token_field_max'] = $this->language->get('text_token_field_max');
		$data['text_token_field_value'] = $this->language->get('text_token_field_value');
		$data['text_token_field_domain'] = $this->language->get('text_token_field_domain');
		
		$data['entry_field_use_mask'] = $this->language->get('entry_field_use_mask');
		$data['entry_field_mask'] = $this->language->get('entry_field_mask');
		$data['text_mash_example'] = $this->language->get('text_mash_example');
		$data['entry_field_textarea_rows'] = $this->language->get('entry_field_textarea_rows');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_css_class_field'] = $this->language->get('entry_css_class_field');
		$data['entry_weight'] = $this->language->get('entry_weight');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_zone'] = $this->language->get('entry_zone');
		$data['entry_field_description'] = $this->language->get('entry_field_description');
		$data['entry_required'] = $this->language->get('entry_required');
		$data['entry_field_select_multiple'] = $this->language->get('entry_field_select_multiple');
		$data['entry_field_type'] = $this->language->get('entry_field_type');
		$data['entry_field_placeholder'] = $this->language->get('entry_field_placeholder');
		$data['entry_field_maxlength'] = $this->language->get('entry_field_maxlength');
		$data['entry_field_validate'] = $this->language->get('entry_field_validate');
		$data['entry_pcre_pattern'] = $this->language->get('entry_pcre_pattern');
		$data['entry_field_use_value'] = $this->language->get('entry_field_use_value');
		$data['entry_int_min_value'] = $this->language->get('entry_int_min_value');
		$data['entry_int_max_value'] = $this->language->get('entry_int_max_value');
		$data['entry_error_message'] = $this->language->get('entry_error_message');
		$data['entry_error_message_email_domain'] = $this->language->get('entry_error_message_email_domain');
		$data['entry_blacklist'] = $this->language->get('entry_blacklist');
		$data['entry_specific_value_list'] = $this->language->get('entry_specific_value_list');
		$data['entry_field_email_check_domain'] = $this->language->get('entry_field_email_check_domain');
		
		$data['help_field_description'] = $this->language->get('help_field_description');
		$data['help_required'] = $this->language->get('help_required');
		$data['help_css_class_field'] = $this->language->get('help_css_class_field');
		$data['help_field_maxlength'] = $this->language->get('help_field_maxlength');
		$data['help_field_placeholder'] = $this->language->get('help_field_placeholder');
		$data['help_field_mask'] = $this->language->get('help_field_mask');
		$data['help_field_textarea_rows'] = $this->language->get('help_field_textarea_rows');
		$data['help_pcre_pattern'] = $this->language->get('help_pcre_pattern');
		$data['help_error_message'] = $this->language->get('help_error_message');
		$data['help_int'] = $this->language->get('help_int');
		$data['help_blacklist'] = $this->language->get('help_blacklist');
		$data['help_specific_value_list'] = $this->language->get('help_specific_value_list');
		$data['help_error_message_email_domain'] = $this->language->get('help_error_message_email_domain');
		$data['help_country'] = $this->language->get('help_country');
		
		$data['column_value'] = $this->language->get('column_value');
		$data['column_active_item'] = $this->language->get('column_active_item');
		$data['column_token'] = $this->language->get('column_token');
		
		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_type'] = $this->language->get('tab_type');
		$data['tab_validate'] = $this->language->get('tab_validate');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_apply'] = $this->language->get('button_apply');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add_value'] = $this->language->get('button_add_value');
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		$data['error'] = $this->error;
		
		if (!empty($field_info)) {
			$data['heading_title'] = $this->language->get('heading_title_edit_field_h1');
		} else {
			$data['heading_title'] = $this->language->get('heading_title_new_field');
		}
		
		$this->document->setTitle($data['heading_title']);
		
		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL')
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);
		
		$data['breadcrumbs'][] = array(
       		'text'      => sprintf($this->language->get('text_breadcrumb_module'), $module_info['name']),
			'href'      => $this->url->link('module/quick_order_pro', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
   		);
		
		if (!empty($field_info)) {
			$title = sprintf($this->language->get('heading_title_edit_field'), $field_info['title'][$this->config->get('config_language_id')]);
		} else {
			$title = $data['heading_title'];
		}
		
		$data['text_edit'] = $title;
		
		$data['breadcrumbs'][] = array(
       		'text'      => $title,
			'href'      => ''
   		);
		
		if (in_array($code, $this->available_order_fields)) {
			$data['text_help_field'] = sprintf($this->language->get('text_help_field'), $this->language->get('text_' . $code));
		}
		
		$url = '';
		
		if (empty($field_info)) {
			$data['action'] = $this->url->link('module/quick_order_pro/field', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'] . '&code=' . $code . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('module/quick_order_pro/field', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'] . '&field_id=' . $field_id . $url, 'SSL');
		}
		
		$data['cancel'] = $this->url->link('module/quick_order_pro', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'] . $url, 'SSL') . '#tab=fields';
		
		$data['boolean_variables'] = array($this->language->get('text_no'), $data['text_yes']);
		$data['status_variables'] = array($this->language->get('text_disabled'), $data['text_enabled']);
		
		if (isset($this->request->post['field']['title'])) {
      		$data['title'] = $this->request->post['field']['title'];
    	} elseif (!empty($field_info)) {
			$data['title'] = $field_info['title'];
		} elseif (in_array($code, $this->available_order_fields) || $code == 'captcha') {
			$data['title'] = $this->getMultipleLanguageValue($code);
		} else {
      		$data['title'] = '';
    	}
		
		if (isset($this->request->post['field']['description'])) {
      		$data['description'] = $this->request->post['field']['description'];
    	} elseif (!empty($field_info['description'])) {
			$data['description'] = $field_info['description'];
		} else {
      		$data['description'] = '';
    	}
		
		if (isset($this->request->post['field']['status'])) {
      		$data['status'] = $this->request->post['field']['status'];
    	} elseif (!empty($field_info)) {
			$data['status'] = $field_info['status'];
		} else {
      		$data['status'] = 1;
    	}
		
		if (isset($this->request->post['field']['required'])) {
      		$data['required'] = $this->request->post['field']['required'];
    	} elseif (!empty($field_info)) {
			$data['required'] = $field_info['required'];
		} else {
      		$data['required'] = '';
    	}
		
		if ($code == 'country') {
			
			if (isset($this->request->post['field']['country_id'])) {
				$data['country_id'] = $this->request->post['field']['country_id'];
			} elseif (!empty($field_info['country_id'])) {
				$data['country_id'] = $field_info['country_id'];
			} else {
				$data['country_id'] = 0;
			}
			
			$this->load->model('localisation/country');
			$data['countries'] = $this->model_localisation_country->getCountries();
			
		} elseif ($code == 'zone') {
			
			if (isset($this->request->post['field']['zone_id'])) {
				$data['zone_id'] = $this->request->post['field']['zone_id'];
			} elseif (!empty($field_info['zone_id'])) {
				$data['zone_id'] = $field_info['zone_id'];
			} else {
				$data['zone_id'] = 0;
			}
			
			if (!empty($module_info['fields']['field_country']['country_id'])) {
				$country_id = $module_info['fields']['field_country']['country_id'];
			} else {
				$country_id = $this->config->get('config_country_id');
			}
			
			$this->load->model('localisation/country');
			$country_info = $this->model_localisation_country->getCountry((int)$country_id);
			
			if ($country_info) {
				
				$this->load->model('localisation/zone');
				
				$data['country_info'] = $country_info;
				$data['zones'] = $this->model_localisation_zone->getZonesByCountryId($country_id);
			}
			
		}
		
		if (isset($this->request->post['field']['class'])) {
      		$data['class_name'] = $this->request->post['field']['class'];
    	} elseif (!empty($field_info)) {
			$data['class_name'] = $field_info['class'];
		} else {
      		$data['class_name'] = '';
    	}
		
		if (isset($this->request->post['field']['weight'])) {
      		$data['weight'] = $this->request->post['field']['weight'];
    	} elseif (!empty($field_info)) {
			$data['weight'] = $field_info['weight'];
		} else {
      		$data['weight'] = 0;
    	}
		
		$data['required_field'] = in_array($code, $this->required_fields);
		$data['order_field'] = in_array($code, $this->available_order_fields) && $code != 'comment';
		
		$data['field_types'] = $this->getFieldTypes();
		
		if (in_array($code, array('firstname', 'telephone', 'lastname', 'email', 'postcode', 'city'))) {
			$data['field_types'] = array_intersect_key($data['field_types'], array_flip(array('text')));
		} elseif (in_array($code, array('comment', 'address'))) {
			$data['field_types'] = array_intersect_key($data['field_types'], array_flip(array('text', 'textarea')));
		}
		
		if (isset($this->request->post['field']['type']['type'])) {
      		$data['type'] = $this->request->post['field']['type']['type'];
    	} elseif (!empty($field_info)) {
			$data['type'] = $field_info['type']['type'];
		} else {
      		$data['type'] = 'text';
    	}
		
		if (isset($this->request->post['field']['type']['option'])) {
      		$data['type_option'] = $this->request->post['field']['type']['option'];
    	} elseif (!empty($field_info)) {
			$data['type_option'] = array($field_info['type']['type'] => $field_info['type']);
		} else {
      		$data['type_option'] = array();
    	}
		
		$data['validate_types'] = $this->getValidateTypes();
		
		if ($code == 'firstname') {
			$data['validate_types'] = array_intersect_key($data['validate_types'], array_flip(array('number_of_words', 'words_blacklist', 'plain_text')));
		} elseif ($code == 'telephone') {
			$data['validate_types'] = array_intersect_key($data['validate_types'], array_flip(array('pcre', 'plain_text', 'php_code')));
		}
		
		if (isset($this->request->post['field']['validate']['type'])) {
      		$data['validate'] = $this->request->post['field']['validate']['type'];
    	} elseif (!empty($field_info['validate']['type'])) {
			$data['validate'] = $field_info['validate']['type'];
		} else {
      		$data['validate'] = '';
    	}
		
		if (isset($this->request->post['field']['validate']['option'])) {
      		$data['validate_option'] = $this->request->post['field']['validate']['option'];
    	} elseif (!empty($field_info['validate'])) {
			$data['validate_option'] = array($field_info['validate']['type'] => $field_info['validate']);
		} else {
      		$data['validate_option'] = array();
    	}
		
		$data['field_id'] = $field_id;
		$data['code'] = $code;
		
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
				
		$this->response->setOutput($this->load->view('module/quick_order_pro/field_form' . $template . '.tpl', $data));
	}
	
	/**
	 * Валидация модуля
	 */
	private function validate() {
	
		if (!$this->user->hasPermission('modify', 'module/quick_order_pro')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		$module_info = $this->request->post['module'];
		
		if ((utf8_strlen($module_info['name']) < 3) || (utf8_strlen($module_info['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		
		if (!$module_info['redirect']) {
			
			foreach ($module_info['success_message'] as $language_id => $success_message) {
				
				if (trim($success_message) == '') {
					$this->error['success_message'] = $this->language->get('error_required');
				}
				
			}
			
		}
		
		foreach (array('min_total', 'max_total', 'min_weight', 'max_weight') as $field) {
			
			$module_info[$field] = trim($module_info[$field]);
			
			if ($module_info[$field] && !is_numeric($module_info[$field])) {
				$this->error[$field] = $this->language->get('error_numeric');
			}			
			
		}
		
		if ($module_info['create_customer'] && empty($module_info['new_customer_random_password']) && $module_info['new_customer_password'] != '') {
			
			if (utf8_strlen(trim($module_info['new_customer_password'])) < 6 || utf8_strlen(trim($module_info['new_customer_password'])) > 32) {
				$this->error['new_customer_password'] = $this->language->get('error_password');
			}
			
		}
		
		if ($module_info['captcha_alphabet'] == '') {
			$this->error['captcha_alphabet'] = $this->language->get('error_option');
		}
		
		if ($module_info['alert_admin'] && $module_info['admin_email_type'] == 'other') {
			if ($module_info['alert_email'] == '') {
				$this->error['alert_email'] = $this->language->get('error_required');
			} else {
				
				if (!filter_var($module_info['alert_email'], FILTER_VALIDATE_EMAIL)) {
					$this->error['alert_email'] = $this->language->get('error_email');
				} else {
					
					$valid = true;
					
					$domain = rtrim(substr($module_info['alert_email'], strpos($module_info['alert_email'],'@')+1), '>');
					
					if (function_exists('checkdnsrr')) {
						$valid = checkdnsrr($domain, 'MX');
					} elseif (function_exists('getmxrr')) {
						$valid = getmxrr($domain);
					}
					
					if (!$valid) {
						$this->error['alert_email'] = sprintf($this->language->get('error_domain'), $domain);
					}
				}
				
			}
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
		
		return empty($this->error);
	}
	
	/**
	 * Валидация полей
	 */
	private function validateFieldForm() {
		
		if (!$this->user->hasPermission('modify', 'module/quick_order_pro')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		foreach ($this->request->post['field']['title'] as $language_id => $title) {
			if ((utf8_strlen($title) < 1) || (utf8_strlen($title) > 255)) {
        		$this->error['title'][$language_id] = $this->language->get('error_title');
      		}
		}
		
		$field_info = $this->request->post['field'];
		
		if (trim($field_info['weight']) && !is_numeric($field_info['weight'])) {
			$this->error['weight'] = $this->language->get('error_numeric');
		}
		
		foreach (array('text', 'textarea', 'radio', 'select', 'checkbox') as $type) {
			
			if (in_array($field_info['code'], array('captcha', 'country', 'zone'))) {
				continue;
			}
			
			if ($field_info['type']['type'] == $type) {
				
				if (isset($field_info['type']['option']) && array_key_exists($type, $field_info['type']['option'])) {
					$type_info = $field_info['type']['option'][$type];
				} else {
					$type_info = array();
				}
				
				switch ($type) {
					case 'text':
						
						if ($type_info['use_mask'] && trim($type_info['mask']) == '') {
							$this->error['type'][$type]['mask'] = $this->language->get('error_option');
						}
						
						if (trim($type_info['maxlength']) && !is_numeric($type_info['maxlength'])) {
							$this->error['type'][$type]['maxlength'] = $this->language->get('error_numeric');
						}
					
						break;
					case 'textarea':
					
						if (trim($type_info['rows']) && !is_numeric($type_info['rows'])) {
							$this->error['type'][$type]['rows'] = $this->language->get('error_numeric');
						}
					
						break;
					case 'radio':
					case 'select':
					case 'checkbox':
					
						if (!empty($type_info['option'])) {
							
							foreach ($type_info['option'] as $option_id => $option_info) {
								
								if (utf8_strlen($option_info['value']) < 1) {
									$this->error['type'][$type]['option'][$option_id] = $this->language->get('error_option_value');
								}
								
							}
							
						} else {
							$this->error['type'][$type]['option'] = $this->language->get('error_option');
						}
					
				}
			}
		}
		
		if (!empty($field_info['validate'])) {
			
			foreach ($field_info['validate']['option'] as $validate_id => $validate_info) {
			
				if ($field_info['validate']['type'] == $validate_id) {
					
					switch ($validate_id) {
						case 'pcre':
						
							if (utf8_strlen(trim($validate_info['pattern'])) < 1) {
								$this->error['validate'][$validate_id]['pattern'] = $this->language->get('error_option');
							} else {
								
								function tempErrorHandler($errNo, $errStr, $errFile, $errLine, array $errContext) {
									if (0 === error_reporting()) {
										return false;
									}
									throw new ErrorException($errStr, 0, $errNo, $errFile, $errLine);
								}
								
								set_error_handler('tempErrorHandler');
							
								$test = FALSE;
								
								try {
									ob_start();
									preg_match($validate_info['pattern'], 'test');
									ob_end_clean();
								} catch (ErrorException $e) {
									$this->error['validate'][$validate_id]['pattern'] = sprintf($this->language->get('error_pcre_pattern'), str_replace('preg_match(): ', '', $e->getMessage()));
								}
								
							}
							
							foreach ($validate_info['error_message'] as $language_id => $error_message) {
								
								if (utf8_strlen(trim($error_message)) < 1) {
									$this->error['validate'][$validate_id]['error_message'][$language_id] = $this->language->get('error_error_message');
								} elseif (utf8_strlen(trim($error_message)) > 128) {
									$this->error['validate'][$validate_id]['error_message'][$language_id] = $this->language->get('error_error_message_maxlength');
								}
								
							}
						
							break;
						case 'int':
						case 'numeric':
						case 'length':
						case 'number_of_words':
						
							if ($validate_info['min'] != '' && !is_numeric($validate_info['min'])) {
								$this->error['validate'][$validate_id]['min'] = $this->language->get('error_numeric');
							}
							
							if ($validate_info['max'] != '' && !is_numeric($validate_info['max'])) {
								$this->error['validate'][$validate_id]['max'] = $this->language->get('error_numeric');
							}
							
							if (is_numeric($validate_info['min']) && is_numeric($validate_info['max'])) {
								
								if ($validate_info['min'] > $validate_info['max']) {
									$this->error['validate'][$validate_id]['max'] = $this->language->get('error_length_max');
								}
															
							}
						
							foreach ($validate_info['error_message'] as $language_id => $error_message) {
								
								if (utf8_strlen(trim($error_message)) < 1) {
									$this->error['validate'][$validate_id]['error_message'][$language_id] = $this->language->get('error_error_message');
								} elseif (utf8_strlen(trim($error_message)) > 128) {
									$this->error['validate'][$validate_id]['error_message'][$language_id] = $this->language->get('error_error_message_maxlength');
								}
								
							}
						
							break;
						case 'url':
						case 'captcha':
						case 'plain_text':
						case 'specific_value':
						case 'words_blacklist':
						
							foreach ($validate_info['error_message'] as $language_id => $error_message) {
								
								if (utf8_strlen(trim($error_message)) < 1 || utf8_strlen(trim($error_message)) > 128) {
									$this->error['validate'][$validate_id]['error_message'][$language_id] = $this->language->get('error_error_message');
								}
								
							}
						
							break;
						case 'email':
						
							if ($validate_info['check_domain']) {
								
								foreach ($validate_info['error_message_domain'] as $language_id => $error_message) {
								
									if (utf8_strlen(trim($error_message)) < 1) {
										$this->error['validate'][$validate_id]['error_message_domain'][$language_id] = $this->language->get('error_error_message');
									} elseif (utf8_strlen(trim($error_message)) > 128) {
										$this->error['validate'][$validate_id]['error_message_domain'][$language_id] = $this->language->get('error_error_message_maxlength');
									}
									
								}
								
								
							}
							
							foreach ($validate_info['error_message'] as $language_id => $error_message) {
								
								if (utf8_strlen(trim($error_message)) < 1) {
									$this->error['validate'][$validate_id]['error_message'][$language_id] = $this->language->get('error_error_message');
								} elseif (utf8_strlen(trim($error_message)) > 128) {
									$this->error['validate'][$validate_id]['error_message'][$language_id] = $this->language->get('error_error_message_maxlength');
								}
								
							}
						
							break;
						case 'country':
						case 'zone':
						
							if ($field_info['required']) {
								
								foreach ($validate_info['error_message'] as $language_id => $error_message) {
								
									if (utf8_strlen(trim($error_message)) < 1 || utf8_strlen(trim($error_message)) > 128) {
										$this->error['validate'][$validate_id]['error_message'][$language_id] = $this->language->get('error_error_message');
									}
									
								}
								
							}
						
							break;
							
					}
				}
			}
			
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
		
		return empty($this->error);
	}
	
	private function getFieldTypes() {
		
		static $types = FALSE;
		
		if (!$types) {
		
			$this->load->language('module/quick_order_pro');
		
			$types = array(
				'text' => array(
					'description' => $this->language->get('text_type_text')
				),
				'textarea' => array(
					'description' => $this->language->get('text_type_textarea')
				),
				'select' => array(
					'description' => $this->language->get('text_type_select')
				),
				'checkbox' => array(
					'description' => $this->language->get('text_type_checkbox')
				),
				'radio' => array(
					'description' => $this->language->get('text_type_radio')
				),
				'password' => array(
					'description' => $this->language->get('text_type_password')
				)
			);
			
		}
		
		return $types;
	}
	
	private function getValidateTypes() {
		
		static $types = FALSE;
		
		if (!$types) {
		
			$this->load->language('module/quick_order_pro');
		
			$types = array(
				'pcre' => array(
					'title' => $this->language->get('text_validate_pcre'),
					'description' => $this->language->get('text_validate_pcre_description'),
					'destination' => array('text', 'textarea', 'password')
				),
				'length' => array(
					'title' => $this->language->get('text_validate_length'),
					'description' => '',
					'destination' => array('text', 'textarea', 'password')
				),
				'number_of_words' => array(
					'title' => $this->language->get('text_validate_number_of_words'),
					'description' => '',
					'destination' => array('text', 'textarea', 'password')
				),
				'words_blacklist' => array(
					'title' => $this->language->get('text_validate_words_blacklist'),
					'description' => '',
					'destination' => array('text', 'textarea', 'password')
				),
				'specific_value' => array(
					'title' => $this->language->get('text_validate_specific_value'),
					'description' => $this->language->get('text_validate_specific_value_description'),
					'destination' => array('text', 'textarea', 'password')
				),
				'numeric' => array(
					'title' => $this->language->get('text_validate_numeric'),
					'description' => $this->language->get('text_validate_numeric_description'),
					'destination' => array('text', 'textarea', 'password')
				),
				'int' => array(
					'title' => $this->language->get('text_validate_int'),
					'description' => $this->language->get('text_validate_int_description'),
					'destination' => array('text', 'textarea', 'password')
				),
				'email'	=> array(
					'title' => $this->language->get('text_validate_email'),
					'description' => $this->language->get('text_validate_email_description'),
					'destination' => array('text', 'textarea')
				),
				'url' => array(
					'title' => $this->language->get('text_validate_url'),
					'description' => $this->language->get('text_validate_url_description'),
					'destination' => array('text', 'textarea')
				),
				'plain_text' => array(
					'title' => $this->language->get('text_validate_plain_text'),
					'description' => '',
					'destination' => array('text', 'textarea')
				)
			);
			
		}
		
		return $types;
	}
	
	public function ajax() {
		
		if ($this->isAjax()) {
			
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
			
			if (isset($this->request->get['field_id']) && isset($module_info['fields'][$this->request->get['field_id']])) {
				
				if (!empty($this->request->post['field'])) {
					
					$field_info = $module_info['fields'][$this->request->get['field_id']];
					
					if (isset($this->request->post['field']['show_simple'])) {
						$field_info['show_simple'] = $this->request->post['field']['show_simple'];
					}
					
					$module_info['fields'][$this->request->get['field_id']] = $field_info;
				}
				
			} else {
				
				foreach ($this->request->post['module']['fields'] as $field_id => $field_info) {
					
					if (array_key_exists($field_id, $module_info['fields'])) {
						$module_info['fields'][$field_id]['weight'] = (int)$field_info['weight'];
						$module_info['fields'][$field_id]['status'] = (int)$field_info['status'];
						$module_info['fields'][$field_id]['required'] = (int)$field_info['required'];
					}
					
				}
				
			}
			
			$this->model_extension_module->editModule($this->request->get['module_id'], $module_info);
			
		} else {
			$this->request->get['route'] = 'error/not_found';
			return $this->forward($this->request->get['route']);
		}
		
	}
	
	private function isAjax() {
		return (isset($this->request->server['HTTP_X_REQUESTED_WITH']) && $this->request->server['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest');
	}
	
	private function getNewCustomFieldId($code, $module_info) {
		
		$field_id = 'field_';
		
		if ($code == 'custom_field') {
		
			$fields = array();
			
			foreach ($module_info['fields'] as $field) {
				
				if ($field['code'] == 'custom_field') {
					$fields[] = (int)ltrim($field['field_id'], 'field_');
				}
				
			}
			
			if (!empty($fields)) {
				$field_id .= max($fields) + 1;
			} else {
				$field_id .= 1;
			}
		
		} else {
			$field_id .= $code;
		}
		
		return $field_id;
	}
	
	private function getMultipleLanguageValue($name, $prefix = 'text_', $file = 'module/quick_order_pro') {
		
		$response = array();
		
		foreach ($this->getLanguages($file) as $language_id => $language) {
			$response[$language_id] = $language->get($prefix . $name);
		}
		
		return $response;
	}
	
	private function getLanguages($file = 'module/quick_order_pro') {
		
		$languages = FALSE;
		
		if (!is_array($languages)) {

			if (version_compare(VERSION, '2.1', '<')) {
				$this->load->library('language');
			}

			$this->load->model('localisation/language');
			
			foreach ($this->model_localisation_language->getLanguages() as $language_info) {
				
				$language = new Language($language_info['directory']);
				$language->load($file);
				
				$languages[$language_info['language_id']] = $language;
			}
			
		}
		
		return $languages;
	}
	
	private function getDefaultFields() {
		
		$fields = array();
		
		foreach ($this->required_fields as $weight => $field_name) {
			
			$field_id = 'field_' . $field_name;
			
			$field = array(
				'field_id'		=> $field_id,
				'code'			=> $field_name,
				'title'			=> $this->getMultipleLanguageValue($field_name),
				'description'	=> array(),
				'required'		=> 1,
				'base'			=> 1,
				'type'			=> array(
					'type'			=> 'text',
					'maxlength'		=> '128'
				),
				'validate'		=> array(
					'type'			=> ''
				),
				'status'		=> 1,
				'class'			=> '',
				'weight'		=> $weight
			);
			
			$fields[$field_id] = $field;
		}
		
		return $fields;
	}
	
	private function init() {
		
		$this->required_fields = array('firstname', 'telephone');
		$this->available_fields = array('firstname', 'telephone', 'lastname', 'email', 'comment', 'address', 'country', 'zone', 'city', 'postcode', 'captcha', 'custom_field');
		$this->available_order_fields = array('firstname', 'telephone', 'lastname', 'email', 'address', 'country', 'zone', 'city', 'postcode', 'comment');
		
		$this->document->addStyle('view/stylesheet/quick_order_pro/quick_order_pro.css');
		$this->document->addScript('view/javascript/jquery/quick_order_pro/quick_order_pro.js');
		
		$this->load->model('extension/module');
	}
	
}
?>