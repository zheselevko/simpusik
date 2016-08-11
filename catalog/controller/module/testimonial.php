<?php
class ControllerModuletestimonial extends Controller {
	public function index($setting) {
		$this->language->load('module/testimonial');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['show_all_url']   = $this->url->link('product/testimonial', '', 'SSL');
		$data['show_all']       = $this->language->get('show_all');
		$data['entry_text']     = $this->language->get('entry_text');
		$data['entry_bad']      = $this->language->get('entry_bad');
		$data['entry_good']     = $this->language->get('entry_good');

		$data['title']          = $setting['title'];
		$data['rating']         = $setting['rating'];
		$data['name_status']    = $setting['name_status'];
		$data['city']           = $setting['city'];
		$data['date_added']     = $setting['date_added'];
		$data['text']           = $setting['text'];
		$data['bad']            = $setting['bad'];
		$data['good']           = $setting['good'];

		$this->load->model('catalog/testimonial');
		
		$data['testimonials'] = array();
		
		$filter_data = array(
			'start' => 0,
			'limit' => $setting['limit']
		);
		
		$data['total'] = $this->model_catalog_testimonial->getTotalTestimonials();
		$results = $this->model_catalog_testimonial->getTestimonials($filter_data);

		foreach ($results as $result) {

			if (mb_strlen($result['good'],'UTF-8') > 200){
				$good = mb_substr($result['good'], 0, 197, 'UTF-8') . '...';
			} else {
				$good = $result['good'];
			}
			
			if (mb_strlen($result['bad'],'UTF-8') > 200){
				$bad = mb_substr($result['bad'], 0, 197, 'UTF-8') . '...';
			} else{
				$bad = $result['bad'];
			}
			
			if (mb_strlen($result['text'],'UTF-8') > 200){
				$text = mb_substr($result['text'], 0, 197, 'UTF-8') . '...';
			} else{
				$text = $result['text'];
			}

			$data['testimonials'][] = array(
				'testimonial_id' => $result['testimonial_id'],
				'name'			 => $result['name'],
				'title'			 => $result['title'],
				'text'			 => $text,
				'good'			 => $good,
				'bad'			 => $bad,
				'rating'		 => $result['rating'],
				'date_added'	 => $result['date_added'],
				'city'			 => $result['city']
			);
		}

		if(VERSION < '2.2.0.0'){
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/testimonial.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/testimonial.tpl', $data);
			} else {
				return $this->load->view('default/template/module/testimonial.tpl', $data);
			}
		}
		else{
			return $this->load->view('module/testimonial', $data);
		}
	}
}
?>