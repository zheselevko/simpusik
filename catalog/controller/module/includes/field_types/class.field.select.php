<?php  
class field_select extends field {
	
	public function index() {
		
		$output = '';
		
		if (!empty($this->field)) {
			
			$this->data += parent::setGeneralData();
			
			$this->data['text_select'] = oc::registry()->language->get('text_select');
			
			$this->data['multiple'] = $this->field['type']['multiple'];
			
			if ($this->data['multiple']) {
				$this->data['class'] .= ($this->data['class'] ? ' ' : '') . 'multiple';
			}
			
			$this->data['selected'] = array();
			
			if ($this->data['value']) {
				
				if (is_array($this->data['value'])) {
					$this->data['selected'] = $this->data['value'];
				} else {
					$this->data['selected'][] = $this->data['value'];
				}
				
			} elseif (!empty($this->field['type']['selected'])) {
				$this->data['selected'][] = $this->field['type']['selected'];
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
		return new field_select($data);
	}
}
?>