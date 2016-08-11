<?php  
class field_text extends field {
	
	public function index() {
		
		$output = '';
		
		if (!empty($this->field)) {
			
			$this->data += parent::setGeneralData();
			
			if (isset($this->field['type']['maxlength']) && $this->field['type']['maxlength']) {
				$this->data['maxlength'] = $this->field['type']['maxlength'];
			} else {
				$this->data['maxlength'] = 32;
			}
			
			if ($this->field['code'] == 'captcha') {
				
				$this->data['maxlength'] = $this->setting['captcha_count_items'];
				$this->data['text_captcha_reload'] = oc::registry()->language->get('text_captcha_reload');
			}
			
			$this->data['mask'] = $this->data['placeholder'] = '';
			
			if (!empty($this->field['type']['use_mask']) && $this->field['type']['use_mask'] && !empty($this->field['type']['mask'])) {
				$this->data['mask'] = $this->field['type']['mask'];
				oc::registry()->document->addScript('catalog/view/javascript/quick_order_pro/jquery.maskedinput.min.js');
			}
			
			if (!empty($this->field['type']['placeholder'])) {
				$this->data['placeholder'] = $this->field['type']['placeholder'];
			}
			
			$output = $this->render();
		}
		
		return $output;
	}
	
	static public function getInstance($data) {
		return new field_text($data);
	}
}
?>