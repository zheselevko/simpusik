<?php
class ModelCatalogTestimonial extends Model {
	public function getTestimonials($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "testimonial WHERE status = '1' ORDER BY date_added DESC";
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . ", " . (int)$data['limit'];
		} 
		$query = $this->db->query($sql);

		return $query->rows;
	}
	
	public function getTotalTestimonials() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "testimonial WHERE status = '1'");
			
		return $query->row['total'];
	}
	
	public function addTestimonial($data, $status) {

		if($this->config->get('config_testimonial_title') == 0){
			$data['title'] = '';
		}
		
		if($this->config->get('config_testimonial_city') == 0){
			$data['city'] = '';
		}
		
		//if($this->config->get('config_testimonial_email') == 0){
		//	$data['email'] = '';
		//}

		//if($this->config->get('config_testimonial_name') == 0){
		//	$data['name'] = '';
		//}

		//if($this->config->get('config_testimonial_text') == 0){
		//	$data['text'] = '';
		//}

		if($this->config->get('config_testimonial_good') == 0){
			$data['good'] = '';
		}

		if($this->config->get('config_testimonial_bad') == 0){
			$data['bad'] = '';
		}

		//if($this->config->get('config_testimonial_rating') == 0){
		//	$data['rating'] = '';
		//}
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "testimonial SET status = '" . $status . "', rating = '" . $this->db->escape($data['rating']) . "', name='" .$this->db->escape($data['name']) . "', city = '" . $this->db->escape($data['city']) . "', email='" . $this->db->escape($data['email']) . "', title = '" . $this->db->escape($data['title']) . "', text = '" . $this->db->escape($data['text']) . "', good = '" . $this->db->escape($data['good']) . "', bad = '" . $this->db->escape($data['bad']) . "', date_added = NOW()");

		if ($this->config->get('config_testimonial_mail')) {
			$this->load->language('mail/testimonial');

			$subject = html_entity_decode($this->language->get('text_subject'), ENT_QUOTES, 'UTF-8');
			
			$message = '';
			
			if($data['title']){
				$message .= html_entity_decode($this->language->get('text_title') . $data['title'], ENT_QUOTES, 'UTF-8') . "\n";
			}
			
			if($data['city']){
				$message .= html_entity_decode($this->language->get('text_city') . $data['city'], ENT_QUOTES, 'UTF-8') . "\n";
			}
			
			if($data['email']){
				$message .= html_entity_decode($this->language->get('text_email') . $data['email'], ENT_QUOTES, 'UTF-8') . "\n";
			}
			
			if($data['name']){
				$message .= html_entity_decode($this->language->get('text_name') . $data['name'], ENT_QUOTES, 'UTF-8') . "\n";
			}
			
			if($data['good']){
				$message .= html_entity_decode($this->language->get('text_good') . $data['good'], ENT_QUOTES, 'UTF-8') . "\n";
			}
			
			if($data['bad']){
				$message .= html_entity_decode($this->language->get('text_bad') . $data['bad'], ENT_QUOTES, 'UTF-8') . "\n";
			}
			
			if($data['text']){
				$message .= html_entity_decode($this->language->get('text_text'). $data['text'], ENT_QUOTES, 'UTF-8') . "\n";
			}
			
			if($data['rating']){
				$message .= html_entity_decode($this->language->get('text_rating') . 
				(int)$data['rating'], ENT_QUOTES, 'UTF-8');
			}

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject($subject);
			$mail->setText($message);
			$mail->send();

			// Send to additional alert emails
			$emails = explode(',', $this->config->get('config_mail_alert'));

			foreach ($emails as $email) {
				if ($email && preg_match($this->config->get('config_mail_regexp'), $email)) {
					$mail->setTo($email);
					$mail->send();
				}
			}
		}	
	}
}
?>