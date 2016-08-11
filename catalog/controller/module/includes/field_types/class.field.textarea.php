<?php  
class field_textarea extends field {
	
	public function index() {
		
		$output = '';
		
		if (!empty($this->field)) {
			
			$this->data += parent::setGeneralData();
			
			if (isset($this->field['type']['rows']) && (int)$this->field['type']['rows']) {
				$this->data['rows'] = (int)$this->field['type']['rows'];
			} else {
				$this->data['rows'] = 2;
			}
			
			$this->data['placeholder'] = $this->field['type']['placeholder'];
			
			$output = $this->render();
		}
		
		return $output;
	}
	
	static public function getInstance($data) {
		return new field_textarea($data);
	}
}
?>