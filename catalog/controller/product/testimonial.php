<?php
class ControllerProducttestimonial extends Controller {
	
	public function index() {
    	$this->language->load('product/testimonial');
    	$this->document->setRobots('index,follow');
		$this->load->model('catalog/testimonial');
		
		$this->document->setTitle ($this->language->get('heading_title'));

		$this->document->addScript('https://www.google.com/recaptcha/api.js');

		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', '', 'SSL'),
      		'separator' => false
   		);
		
		$data['breadcrumbs'][] = array(
	        'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('product/testimonial', '', 'SSL')
	   	);
		
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_write'] = $this->language->get('text_write');
		$data['text_note'] = $this->language->get('text_note');
		$data['text_loading'] = $this->language->get('text_loading');
		$data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
			
      	$data['entry_title'] = $this->language->get('entry_title');
      	$data['entry_city'] = $this->language->get('entry_city');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_text'] = $this->language->get('entry_text');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_captcha'] = $this->language->get('entry_captcha');
		$data['entry_rating'] = $this->language->get('entry_rating');
		$data['entry_good'] = $this->language->get('entry_good');
		$data['entry_bad'] = $this->language->get('entry_bad');
		$data['entry_good_rating'] = $this->language->get('entry_good_rating');
		$data['entry_bad_rating'] = $this->language->get('entry_bad_rating');
		
		$data['button_continue'] = $this->language->get('button_continue');	
			
		$data['continue'] = $this->url->link('common/home', '', 'SSL');
		
		$data['review_status'] = $this->config->get('config_review_status');

		if ($this->config->get('config_testimonial_guest') || $this->customer->isLogged()) {
			$data['guest'] = true;
		} else {
			$data['guest'] = false;
		}
		
		if ($this->config->get('config_testimonial_title')) {
			$data['title'] = $this->config->get('config_testimonial_title');
		} else {
			$data['title'] = 0;
		}
		
		if ($this->config->get('config_testimonial_city')) {
			$data['city'] = $this->config->get('config_testimonial_city');
		} else {
			$data['city'] = 0;
		}
		
		if ($this->config->get('config_testimonial_email')) {
			$data['email'] = $this->config->get('config_testimonial_email');
		} else {
			$data['email'] = 0;
		}
		
		if ($this->config->get('config_testimonial_name')) {
			$data['name'] = $this->config->get('config_testimonial_name');
		} else {
			$data['name'] = 0;
		}
		
		if ($this->config->get('config_testimonial_text')) {
			$data['text'] = $this->config->get('config_testimonial_text');
		} else {
			$data['text'] = 0;
		}
		
		if ($this->config->get('config_testimonial_good')) {
			$data['good'] = $this->config->get('config_testimonial_good');
		} else {
			$data['good'] = 0;
		}
		
		if ($this->config->get('config_testimonial_bad')) {
			$data['bad'] = $this->config->get('config_testimonial_bad');
		} else {
			$data['bad'] = 0;
		}
		
		if ($this->config->get('config_testimonial_rating')) {
			$data['rating'] = $this->config->get('config_testimonial_rating');
		} else {
			$data['rating'] = 0;
		}
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');		
			
		if(VERSION < '2.2.0.0'){
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/testimonial.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/testimonial.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/product/testimonial.tpl', $data));
			}
		}
		else{
			$this->response->setOutput($this->load->view('product/testimonial', $data));
		}
		
  	}

	public function testimonial() {
		$this->load->language('product/testimonial');

		$this->load->model('catalog/testimonial');

		$data['text_no_testimonials'] = $this->language->get('text_no_testimonials');
		$data['entry_text'] = $this->language->get('entry_text');
		$data['entry_good'] = $this->language->get('entry_good');
		$data['entry_bad'] = $this->language->get('entry_bad');
		$data['entry_comment'] = $this->language->get('entry_comment');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_testimonial_limit');
		}
		
		$data['testimonials'] = array();
		
		$this->page_limit = $this->config->get('limit');
		
		$filter_data = array(
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
		);
		
		$testimonial_total = $this->model_catalog_testimonial->getTotalTestimonials();
			
		$results = $this->model_catalog_testimonial->getTestimonials($filter_data);	
		
		foreach ($results as $result) {
				
			$data['testimonials'][] = array(
				'testimonial_id' => $result['testimonial_id'],
				'name'			 => $result['name'],
				'title'    		 => $result['title'],
				'rating'		 => $result['rating'],
				'text'			 => $result['text'],
				'comment'		 => $result['comment'],
				'good'			 => $result['good'],
				'bad'			 => $result['bad'],
				'city'			 => $result['city'],
				'date_added'	 => date("d-m-Y", strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $testimonial_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('product/testimonial/testimonial', '&page={page}');

		$data['pagination'] = $pagination->render();

		if(VERSION < '2.2.0.0'){
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/testimonial_list.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/testimonial_list.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/product/testimonial_list.tpl', $data));
			}
		}
		else{
			$this->response->setOutput($this->load->view('product/testimonial_list', $data));
		}
	}
	
	public function write() {
		$this->load->language('product/testimonial');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {

            $this->request->post['name']        = $this->request->post['leave_review_name'];
            $this->request->post['email']       = $this->request->post['leave_review_email'];
            $this->request->post['text']        = $this->request->post['leave_review_text'];
            $this->request->post['rating']      = 4;
            $this->request->post['comment']     = '';
            $this->request->post['good']        = '';
            $this->request->post['bad']         = '';
            $this->request->post['city']        = '';
            $this->request->post['title']       = '';

			//if (($this->config->get('config_testimonial_title') == 2) && (utf8_strlen($this->request->post['title']) < 2)) {
			//	$json['error'] = $this->language->get('error_title');
			//}

			//if (($this->config->get('config_testimonial_city') == 2) && (utf8_strlen($this->request->post['city']) < 2)) {
			//	$json['error'] = $this->language->get('error_city');
			//}

			if($this->config->get('config_testimonial_email') == 2){
				if (utf8_strlen($this->request->post['email']) > 96 || !filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
					$json['error'] = $this->language->get('error_email');
				}
			}

			if (($this->config->get('config_testimonial_name') == 2) && (utf8_strlen($this->request->post['name']) < 2)) {
				$json['error'] = $this->language->get('error_name');
			}

			if($this->config->get('config_testimonial_text') == 2){
				if (utf8_strlen($this->request->post['text']) < 5 || utf8_strlen($this->request->post['text']) > 1000) {
					$json['error'] = $this->language->get('error_text');
				}
			}

			//if($this->config->get('config_testimonial_good') == 2){
			//	if (utf8_strlen($this->request->post['good']) < 25 || utf8_strlen($this->request->post['good']) > 1000) {
			//		$json['error'] = $this->language->get('error_good');
			//	}
			//}

			//if($this->config->get('config_testimonial_bad') == 2){
			//	if (utf8_strlen($this->request->post['bad']) < 25 || utf8_strlen($this->request->post['bad']) > 1000) {
			//		$json['error'] = $this->language->get('error_bad');
			//	}
			//}

            $recaptcha = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret=' . urlencode($this->config->get('google_captcha_secret')) . '&response=' . $this->request->post['g-recaptcha-response'] . '&remoteip=' . $this->request->server['REMOTE_ADDR']);
            $recaptcha = json_decode($recaptcha, true);
            if (!$recaptcha['success']) {
			    $json['error'] = $this->language->get('error_captcha');
            }

            /*
            // ваш секретный ключ
            $secret     = "6LcePAATAAAAABjXaTsy7gwcbnbaF5XgJKwjSNwT";
            $response   = null;

            // проверка секретного ключа
            $reCaptcha = new ReCaptcha($secret);

            $response = $reCaptcha->verifyResponse($_SERVER["REMOTE_ADDR"], $this->request->post["g-recaptcha-response"]);
            if($response != null && $response->success) {
            } else {
			    $json['error'] = $this->language->get('error_captcha');
            }
            */

			if (!isset($json['error'])) {
				$this->load->model('catalog/testimonial');

                /*
    			if ($this->config->get('config_testimonial_status') == 1) {
    				$status = 0;
    				$status_message = $this->language->get('text_success_status');
    			} else {
    				$status = 1;
    				$status_message = '';
    			}
                */

    			$status = 0;
    			$status_message = $this->language->get('text_success_status');

                $json['post'] = $this->request->post;

				$this->model_catalog_testimonial->addTestimonial($this->request->post, $status);

				$json['success'] = $this->language->get('text_success') . ' ' . $status_message;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
?>