<?php  
abstract class field {
	
	static private $spl_is_loadded = FALSE;
	
	protected $field;
	protected $form_id;
	protected $setting;
	protected $form_info;
	protected $data = array();
	
	public function __construct($field) {
		
		$this->field = $field;
		$this->form_id = oc::registry()->message->data['form_id'];
		$this->form_info = id::decode($this->form_id);
		
		oc::registry()->load->model('extension/module');
		
		$this->setting = oc::registry()->model_extension_module->getModule($this->form_info['module_id']);
		
	}
	
	protected function render() {
		
		$tpl = '';
		
		if (!empty($this->data['template'])) {
			$tpl = tpl::find($this->data['template'], $this->form_info);
		}
		
		if (!$tpl) {
			$tpl = tpl::find(field::prepareFieldId($this->field['field_id']), $this->form_info);
		}
			
		if (!$tpl) {
			$tpl = tpl::find('field-' . $this->field['type']['type'], $this->form_info);
		}
		
		return tpl::getInstance($tpl, $this->data)->render();
	}
	
	protected function setGeneralData() {
		
		oc::registry()->language->load('module/quick_order_pro');
		
		$data = array();
		
		$data['text_required'] = oc::registry()->language->get('text_required');
		
		$language_id = oc::registry()->config->get('config_language_id');
		
		$language_id = oc::registry()->config->get('config_language_id');
			
		$data += array(
			'title'			=> $this->field['title'][$language_id],
			'required'		=> $this->field['required'],
			'field_id'		=> $this->field['field_id'],
			'class'			=> trim($this->field['class']),
			'item_id'		=> $this->form_info['item_id'],
			'position'		=> $this->form_info['position'],
			'form_id'		=> $this->form_id
		);
		
		if (!empty($this->field['description'][$language_id])) {
			$data['description'] = $this->field['description'][$language_id];
		} else {
			$data['description'] = '';
		}
		
		$post_data = $this->getPOST($this->form_id);
		
		if ($this->isPOST()) {
			if (isset($post_data[$this->field['field_id']])) {
				$value = $post_data[$this->field['field_id']];
			} else {
				$value = '';
			}
		} else {
			$value = $this->getDefaultValue($this->field['code']);
		}
		
		$data['value'] = $value;
		
		if (!empty(oc::registry()->message->data['error']['fields'][$this->field['field_id']])) {
			$data['error'] = message::renderItem(oc::registry()->message->data['error']['fields'][$this->field['field_id']], $this->form_id, 'error');
		}
		
		if (!empty($data['error'])) {
			$data['class'] .= ($data['class'] ? ' ' : '') . 'error-item';
		}
		
		return $data;
	}
	
	protected function isPOST() {
		return oc::registry()->request->server['REQUEST_METHOD'] == 'POST';
	}
	
	protected function getPOST($form_id) {
		
		$data = array();
		
		if (array_key_exists('form_id', oc::registry()->request->post) && oc::registry()->request->post['form_id'] == $form_id && !empty(oc::registry()->request->post['fields'])) {
			$data = oc::registry()->request->post['fields'];
		}
		
		return $data;
	}
	
	protected function getDefaultValue($field) {
		
		switch ($field) {
			case 'firstname':
				$value = oc::registry()->customer->getFirstName();
				break;
			case 'lastname':
				$value = oc::registry()->customer->getLastName();
				break;
			case 'telephone':
				$value = oc::registry()->customer->getTelephone();
				break;
			case 'email':
				$value = oc::registry()->customer->getEmail();
				break;
			default:
				$value = '';
		}
		
		return $value;
		
	}
	
	protected function getTemplate($template_id) {
		return oc::registry()->config->get('quick_order_pro_template_' . $template_id);
	}
	
	static public function renderField($field, $method = 'index') {
		
		if (!self::$spl_is_loadded) {
			self::$spl_is_loadded = spl_autoload_register(array('field', 'autoloader_field'), FALSE, TRUE);
		}
		
		if (!$field['status']) return FALSE;
		
		foreach (array($field['code'], $field['type']['type']) as $type) {
			
			$action = self::getAction($type);
			
			if (!empty($action['class'])) {
				$class_name = call_user_func(array($action['class'], 'getInstance'), $field);
				return method_exists($class_name, $method) ? call_user_func(array($class_name, $method)) : FALSE;
			}
			
		}
		
	}
	
	static public function renderFields($fields) {
		
		$data = $options = $data['fields'] = $sort_order = array();
		
		foreach ($fields as $key => $value) {
			$sort_order[$key] = $value['weight'];
		}
		
		array_multisort($sort_order, SORT_ASC, $fields);
		
		foreach ($fields as $field_id => $field_info) {
			
			if ($field = self::renderField($field_info)) {
				$data['fields'][] = $field;
			}
			
		}
		
		$last_form_id = oc::registry()->config->get('quick_order_pro_last_form_id');
		
		if (!empty($last_form_id)) {
			
			$options = id::decode($last_form_id);
			
			$data += $options;
		}
		
		return tpl::getInstance(tpl::find('fields', $options), $data)->render();
	}
	
	static private function getAction($type) {
		
		$data = array();
		
		if (self::checkField($type)) {
			
			$data = array(
				'class'	=> 'field_' . $type
			);
			
		}
		
		return $data;
	}
	
	static private function checkField($type) {
		
		$validate = TRUE;
		
		$file = dirname(__FILE__) . DIRECTORY_SEPARATOR . 'field_types' . DIRECTORY_SEPARATOR . 'class.field.' . $type . '.php';
		
		if (!file_exists($file) || !is_file($file)) {
			$validate = FALSE;
		}
		
		return $validate;
	}
	
	static public function prepareFieldId($field_id) {
		return str_replace('_', '-', $field_id);
	}
	
	static public function autoloader_field($name) {
		
		if (class_exists($name)) return;
		
		$file_name = dirname(__FILE__) . DIRECTORY_SEPARATOR . 'field_types' . DIRECTORY_SEPARATOR . 'class.' . str_replace('_', '.', strtolower($name)) . '.php';
		
		if (file_exists($file_name)) {
			require_once($file_name);
		}
	}
	
}
?>