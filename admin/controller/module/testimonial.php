<?php
class ControllerModuleTestimonial extends Controller {
	private $error = array(); 
	
	public function index() {  

		$this->load->language('module/testimonial');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('extension/module');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('testimonial', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		$data['heading_title'] = $this->language->get('heading_title');

		$data['entry_text'] = $this->language->get('entry_text');
		$data['entry_bad'] = $this->language->get('entry_bad');
		$data['entry_good'] = $this->language->get('entry_good');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_date_added'] = $this->language->get('entry_date_added');
		$data['entry_name_status'] = $this->language->get('entry_name_status');
		$data['entry_city'] = $this->language->get('entry_city');
		$data['entry_rating'] = $this->language->get('entry_rating');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_status'] = $this->language->get('entry_status');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
		
		if (isset($this->error['limit'])) {
			$data['error_limit'] = $this->error['limit'];
		} else {
			$data['error_limit'] = '';
		}
				
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/testimonial', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/testimonial', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/testimonial', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/testimonial', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		
		if (isset($this->request->post['title'])) {
			$data['title'] = $this->request->post['title'];
		} elseif (!empty($module_info)) {
			$data['title'] = $module_info['title'];
		} else {
			$data['title'] = '';
		}

		if (isset($this->request->post['good'])) {
			$data['good'] = $this->request->post['good'];
		} elseif (!empty($module_info)) {
			$data['good'] = $module_info['good'];
		} else {
			$data['good'] = '';
		}
		
		if (isset($this->request->post['bad'])) {
			$data['bad'] = $this->request->post['bad'];
		} elseif (!empty($module_info)) {
			$data['bad'] = $module_info['bad'];
		} else {
			$data['bad'] = '';
		}
		
		if (isset($this->request->post['text'])) {
			$data['text'] = $this->request->post['text'];
		} elseif (!empty($module_info)) {
			$data['text'] = $module_info['text'];
		} else {
			$data['text'] = '';
		}
		
		if (isset($this->request->post['rating'])) {
			$data['rating'] = $this->request->post['rating'];
		} elseif (!empty($module_info)) {
			$data['rating'] = $module_info['rating'];
		} else {
			$data['rating'] = '';
		}
		
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
		
		if (isset($this->request->post['city'])) {
			$data['city'] = $this->request->post['city'];
		} elseif (!empty($module_info)) {
			$data['city'] = $module_info['city'];
		} else {
			$data['city'] = '';
		}
		
		if (isset($this->request->post['date_added'])) {
			$data['date_added'] = $this->request->post['date_added'];
		} elseif (!empty($module_info)) {
			$data['date_added'] = $module_info['date_added'];
		} else {
			$data['date_added'] = '';
		}
		
		if (isset($this->request->post['name_status'])) {
			$data['name_status'] = $this->request->post['name_status'];
		} elseif (!empty($module_info)) {
			$data['name_status'] = $module_info['name_status'];
		} else {
			$data['name_status'] = '';
		}		
		
		if (isset($this->request->post['limit'])) {
			$data['limit'] = $this->request->post['limit'];
		} elseif (!empty($module_info)) {
			$data['limit'] = $module_info['limit'];
		} else {
			$data['limit'] = 10;
		}
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/testimonial.tpl', $data));
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/testimonial')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		if (!$this->request->post['limit']) {
			$this->error['limit'] = $this->language->get('error_limit');
		}
		return !$this->error;
	}
	
	public function install() {
		$this->load->model('catalog/testimonial');
		$this->model_catalog_testimonial->createDatabaseTables();
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product/testimonial', keyword = 'testimonial'");
	}

	public function uninstall() {
		$this->load->model('catalog/testimonial');
		$this->model_catalog_testimonial->dropDatabaseTables();
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product/testimonial' LIMIT 1");
	}
}
?>