<?php
class ControllerCatalogTestimonial extends Controller { 
	
	private $error = array();
	
	public function index() {
		$this->load->language('catalog/testimonial');

		$this->document->setTitle($this->language->get('heading_title'));
		 
		$this->load->model('catalog/testimonial');

		$this->getList();

	}

	public function add() {
		$this->load->language('catalog/testimonial');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/testimonial');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_testimonial->addTestimonial($this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$this->response->redirect($this->url->link('catalog/testimonial', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('catalog/testimonial');

		$this->document->setTitle( $this->language->get('heading_title') );
		
		$this->load->model('catalog/testimonial');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_testimonial->editTestimonial($this->request->get['testimonial_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$this->response->redirect($this->url->link('catalog/testimonial', 'token=' . $this->session->data['token'] . $url, 'SSL'));

		}
		$this->getForm();
	}
 
	public function delete() {
		$this->load->language('catalog/testimonial');

		$this->document->setTitle( $this->language->get('heading_title'));
		
		$this->load->model('catalog/testimonial');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $testimonial_id) {
				$this->model_catalog_testimonial->deleteTestimonial($testimonial_id);
		}
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$this->response->redirect($this->url->link('catalog/testimonial', 'token=' . $this->session->data['token'] . $url, 'SSL'));

		}

		$this->getList();
	}

	private function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'date_added';
		}
		
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/testimonial', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$data['add'] = $this->url->link('catalog/testimonial/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('catalog/testimonial/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');


		$data['testimonials'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);
		
		$testimonial_total = $this->model_catalog_testimonial->getTotalTestimonials();
		$data['testimonial_total'] = $testimonial_total;
		
		$results = $this->model_catalog_testimonial->getTestimonials($filter_data);


    	foreach ($results as $result) {		
	
			$data['testimonials'][] = array(
				'testimonial_id' => $result['testimonial_id'],
				'name'			 => $result['name'],
				'text'			 => strip_tags(html_entity_decode($result['text'])),
				'good'			 => strip_tags(html_entity_decode($result['good'])),
				'bad'			 => strip_tags(html_entity_decode($result['bad'])),
				'city'			 => $result['city'],
				'title'          => $result['title'],
				'date_added' 	 => $result['date_added'],
				'rating' 	     => $result['rating'],
				'status' 		 => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'edit'     	     => $this->url->link('catalog/testimonial/edit', 'token=' . $this->session->data['token'] . '&testimonial_id=' . $result['testimonial_id'] . $url, 'SSL')
			);
		}	
	
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_title'] = $this->language->get('column_title');
		$data['column_rating'] = $this->language->get('column_rating');
		$data['column_text'] = $this->language->get('column_text');
		$data['column_good'] = $this->language->get('column_good');
		$data['column_bad'] = $this->language->get('column_bad');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_action'] = $this->language->get('column_action');		
		$data['column_name'] = $this->language->get('column_name');		
		$data['column_city'] = $this->language->get('column_city');
		
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

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

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$data['sort_title'] = $this->url->link('catalog/testimonial', 'token=' . $this->session->data['token'] . '&sort=title' . $url, 'SSL');
		$data['sort_rating'] = $this->url->link('catalog/testimonial', 'token=' . $this->session->data['token'] . '&sort=rating' . $url, 'SSL');
		$data['sort_date_added'] = $this->url->link('catalog/testimonial', 'token=' . $this->session->data['token'] . '&sort=date_added' . $url, 'SSL');
		$data['sort_status'] = $this->url->link('catalog/testimonial', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');		
		$data['sort_name'] = $this->url->link('catalog/testimonial', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');		
		$data['sort_text'] = $this->url->link('catalog/testimonial', 'token=' . $this->session->data['token'] . '&sort=text' . $url, 'SSL');
		$data['sort_good'] = $this->url->link('catalog/testimonial', 'token=' . $this->session->data['token'] . '&sort=good' . $url, 'SSL');
		$data['sort_bad'] = $this->url->link('catalog/testimonial', 'token=' . $this->session->data['token'] . '&sort=bad' . $url, 'SSL');		
		
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $testimonial_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/testimonial', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
		
		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($testimonial_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($testimonial_total - $this->config->get('config_limit_admin'))) ? $testimonial_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $testimonial_total, ceil($testimonial_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/testimonial_list.tpl', $data));
	}

	private function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_form'] = !isset($this->request->get['testimonial_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_text'] = $this->language->get('entry_text');
		$data['entry_bad'] = $this->language->get('entry_bad');
		$data['entry_good'] = $this->language->get('entry_good');
		$data['entry_date_added'] = $this->language->get('entry_date_added');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_city'] = $this->language->get('entry_city');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_rating'] = $this->language->get('entry_rating');
		$data['entry_comment'] = $this->language->get('entry_comment');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['text'])) {
			$data['error_text'] = $this->error['text'];
		} else {
			$data['error_text'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		$url = '';
			
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/testimonial', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		if (!isset($this->request->get['testimonial_id'])) {
			$data['action'] = $this->url->link('catalog/testimonial/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('catalog/testimonial/edit', 'token=' . $this->session->data['token'] . '&testimonial_id=' . $this->request->get['testimonial_id'] . $url, 'SSL');
		}

		$data['cancel'] = $this->url->link('catalog/testimonial', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		if (isset($this->request->get['testimonial_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$testimonial_info = $this->model_catalog_testimonial->getTestimonial($this->request->get['testimonial_id']);
		}

		//$this->load->model('localisation/language');

		//$data['languages'] = $this->model_localisation_language->getLanguages();

		//$data['lang'] = $this->language->get('lang');
		
		if (isset($this->request->post['text'])) {
			$data['text'] = $this->request->post['text'];
		} elseif (isset($testimonial_info)) {
			$data['text'] = $testimonial_info['text'];
		} else {
			$data['text'] = '';
		}
		
		if (isset($this->request->post['good'])) {
			$data['good'] = $this->request->post['good'];
		} elseif (isset($testimonial_info)) {
			$data['good'] = $testimonial_info['good'];
		} else {
			$data['good'] = '';
		}
		
		if (isset($this->request->post['bad'])) {
			$data['bad'] = $this->request->post['bad'];
		} elseif (isset($testimonial_info)) {
			$data['bad'] = $testimonial_info['bad'];
		} else {
			$data['bad'] = '';
		}
		
		if (isset($this->request->post['comment'])) {
			$data['comment'] = $this->request->post['comment'];
		} elseif (isset($testimonial_info)) {
			$data['comment'] = $testimonial_info['comment'];
		} else {
			$data['comment'] = '';
		}

		if (isset($this->request->post['title'])) {
			$data['title'] = $this->request->post['title'];
		} elseif (isset($testimonial_info)) {
			$data['title'] = $testimonial_info['title'];
		} else {
			$data['title'] = '';
		}
		
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (isset($testimonial_info)) {
			$data['name'] = $testimonial_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['city'])) {
			$data['city'] = $this->request->post['city'];
		} elseif (isset($testimonial_info)) {
			$data['city'] = $testimonial_info['city'];
		} else {
			$data['city'] = '';
		}		

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (isset($testimonial_info)) {
			$data['status'] = $testimonial_info['status'];
		} else {
			$data['status'] = 1;
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} elseif (isset($testimonial_info)) {
			$data['email'] = $testimonial_info['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['date_added'])) {
			$data['date_added'] = $this->request->post['date_added'];
		} elseif (isset($testimonial_info)) {
			$data['date_added'] = $testimonial_info['date_added'];
		} else {
			$data['date_added'] = date("Y-m-d");
		}

		if (isset($this->request->post['rating'])) {
			$data['rating'] = $this->request->post['rating'];
		} elseif (isset($testimonial_info)) {
			$data['rating'] = $testimonial_info['rating'];
		} else {
			$data['rating'] = '5';
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/testimonial_form.tpl', $data));
	}

	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/testimonial')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if (utf8_strlen($this->request->post['text']) < 3) {
			$this->error['text'] = $this->language->get('error_text');
		}
		if (utf8_strlen($this->request->post['name']) < 2) {
			$this->error['name'] = $this->language->get('error_name');
		}
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/information')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}
?>