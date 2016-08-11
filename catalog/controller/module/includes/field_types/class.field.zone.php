<?php  
class field_zone extends field {
	
	public function index() {
		
		$output = '';
		
		if (!empty($this->field)) {
			
			$this->data += parent::setGeneralData();
			
			$this->data['text_select'] = oc::registry()->language->get('text_select');
			
			$this->data['selected'] = array();
			
			if (!empty($this->field['zone_id'])) {
				$this->data['selected'][] = $this->field['zone_id'];
			}
			
			if (!empty($this->setting['fields']['field_country']['country_id'])) {
				$country_id = $this->setting['fields']['field_country']['country_id'];
			} else {
				$country_id = oc::registry()->config->get('config_country_id');
			}
			
			oc::registry()->load->model('localisation/zone');
			$zones = oc::registry()->model_localisation_zone->getZonesByCountryId($country_id);
			
			if (!empty($zones)) {
				
				$this->data['option'] = array();
				
				foreach ($zones as $zone_info) {
					$this->data['option'][$zone_info['zone_id']] = array('value' => $zone_info['name']);
				}
				
			} else {
				return $output;
			}
			
			
			$output = $this->render();
		}
		
		return $output;
	}
	
	static public function getInstance($data) {
		return new field_zone($data);
	}
}
?>