<?php  
class field_checkbox extends field {
	
	protected $field;
	protected $form_id;
	protected $form_info;

	public function index() {
		
		$output = '';
		
		if (!empty($this->field)) {
			
			$this->data += parent::setGeneralData();
			
			$this->data['checked'] = array();
			
			if ($this->isPOST()) {
				if ($this->data['value']) {
					$this->data['checked'] = $this->data['value'];
				}
			} elseif (!empty($this->field['type']['checked'])) {
				$this->data['checked'] = $this->field['type']['checked'];
			}
			
			if (!empty($this->field['type']['option']) && $this->field['type']['option']) {
				$this->data['option'] = $this->field['type']['option'];
			} else {
				return $output;
			}
			
			
			$output = $this->render();
		}
		
		return $output;
	}
	
	static public function getInstance($data) {
		return new field_checkbox($data);
	}
}
?>