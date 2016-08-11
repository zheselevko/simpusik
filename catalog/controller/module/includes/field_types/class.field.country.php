<?php  
class field_country extends field {
	
	public function index() {
		
		$output = '';
		
		if (!empty($this->field)) {
			
			$this->data += parent::setGeneralData();
			
			$this->data['text_select'] = oc::registry()->language->get('text_select');
			
			$this->data['selected'] = array();
			
			if (!empty($this->field['country_id'])) {
				$this->data['selected'][] = $this->field['country_id'];
			}
			
			oc::registry()->load->model('localisation/country');
			$countries = oc::registry()->model_localisation_country->getCountries();
			
			if ($countries) {
				
				$this->data['option'] = array();
				
				foreach ($countries as $country_info) {
					$this->data['option'][$country_info['country_id']] = array('value' => $country_info['name']);
				}
				
			} else {
				return $output;
			}
			
			$output = $this->render();
		}
		
		return $output;
	}
	
	static public function getInstance($data) {
		return new field_country($data);
	}
}
?>