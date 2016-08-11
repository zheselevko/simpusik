<?php
class ControllerModuleFeedback extends Controller{
	private $error = array();

	public function index($setting) {
		$this->load->language('module/feedback');

		$data['button_text'] = $this->language->get('button_text');
		$data['button_send'] = $this->language->get('button_send');
		
		$data['entry_name']  = $this->language->get('entry_name');
		$data['entry_phone'] = $this->language->get('entry_phone');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['enntry_text'] = $this->language->get('enntry_text');

		$data['domain']      = $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'];

        /*
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/feedback.tpl')) {
		    return $this->load->view($this->config->get('config_template') . '/template/module/feedback.tpl', $data);
		} else {
		    return $this->load->view('default/template/module/feedback.tpl', $data);
		}
        */

	}

    public function send() {

	    $this->language->load('module/feedback');	//подключаем языковый пакет
		$json = array(); //создаем масив который будет возвращаться

		//очевидная вещь, пришел ли ТИП запрос ПОСТ
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {

			$feedback_options = array(
				'module_name'   => 'Заказать звонок',
				'module_id'     => 51,
				'page_link'     => $_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'],
			);

            $form_success = $this->language->get('text_succes');
            $form_error   = $this->language->get('text_error');

	    	//проверка не появились ли ошибки, если нет то делаем то что внутри - без комментариев
			if ($this->validate($this->request->post)) {
			    $json = $this->request->post;

                $json['sob_input'][1] = array(
                    'required'  => 'input',
                    'Имя'       => $this->request->post['modal_callback_name'],
                );

                $json['sob_input'][2] = array(
                    'required'  => 'input',
                    'Телефон'   => $this->request->post['modal_callback_phone'],
                );

			    // Запись в бд
				$this->load->model('module/sobfeedback');
				$this->model_module_sobfeedback->addFeedback($json, $feedback_options);
				// Запись в бд

				$domain = $_SERVER['SERVER_NAME'];
				$domain = str_replace( 'http://', '', $domain );			
				$domain = str_replace( 'www.', '', $domain );
					
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->hostname = $this->config->get('config_smtp_host');
				$mail->username = $this->config->get('config_smtp_username');
				$mail->password = $this->config->get('config_smtp_password');
				$mail->port = $this->config->get('config_smtp_port');
				$mail->timeout = $this->config->get('config_smtp_timeout');		
				$mail->setTo($this->config->get('config_email'));

			  	//$mail->setFrom($this->config->get('config_email'));
			  	$mail->setFrom('info@' . $domain);
			  	$mail->setSender($this->config->get('config_name'));
			  	$mail->setSubject(html_entity_decode(sprintf($this->language->get('entry_email'), 'NAMEString', ENT_QUOTES, 'UTF-8')));

                $message  = $this->language->get('text_message') . "\n\n";
                $message .= $this->language->get('entry_name') . ': '. $this->request->post['modal_callback_name'] . "\n";
                $message .= $this->language->get('entry_phone') . ': '. $this->request->post['modal_callback_phone'] . "\n";

			  	$mail->setText(html_entity_decode($message));
		      	$mail->send();

		      	//Send to additional alert emails
				$emails = explode(',', $this->config->get('config_alert_emails'));

				foreach ($emails as $email) {
					if ($email && preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $email)) {
						$mail->setTo($email);
						$mail->send();
					}
				}

				$json['success'] = $form_success;
			} else {
				$json['error']['text'] = $form_error;
				$json['error']['errors'] = $this->error;
            }
		}

	    //превращам наш масив с "ошибками" или "успехом" в понятный для jsona формат - json_encode
		$this->response->setOutput(json_encode($json));
	}

    public function send2() {

	    $this->language->load('module/feedback');	//подключаем языковый пакет
		$json = array(); //создаем масив который будет возвращаться

		//очевидная вещь, пришел ли ТИП запрос ПОСТ
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {

			$feedback_options = array(
				'module_name'   => 'Сообщение',
				'module_id'     => 52,
				'page_link'     => $_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'],
			);

            $form_success = $this->language->get('text_succes');
            $form_error   = $this->language->get('text_error');

	    	//проверка не появились ли ошибки, если нет то делаем то что внутри - без комментариев
			if ($this->validate2($this->request->post)) {
			    $json = $this->request->post;

                $json['sob_input'][1] = array(
                    'required'  => 'input',
                    'Имя'       => $this->request->post['contacts_leave_message_name'],
                );

                $json['sob_input'][2] = array(
                    'required'  => 'input',
                    'Телефон'   => $this->request->post['contacts_leave_message_tel'],
                );

                $json['sob_input'][3] = array(
                    'required'  => 'input',
                    'E-mail'    => $this->request->post['contacts_leave_message_email'],
                );

                $json['sob_input'][4] = array(
                    'Текст сообщения'   => $this->request->post['contacts_leave_message_text'],
                );

			    // Запись в бд
				$this->load->model('module/sobfeedback');
				$this->model_module_sobfeedback->addFeedback($json, $feedback_options);
				// Запись в бд

				$domain = $_SERVER['SERVER_NAME'];
				$domain = str_replace( 'http://', '', $domain );
				$domain = str_replace( 'www.', '', $domain );

				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->hostname = $this->config->get('config_smtp_host');
				$mail->username = $this->config->get('config_smtp_username');
				$mail->password = $this->config->get('config_smtp_password');
				$mail->port = $this->config->get('config_smtp_port');
				$mail->timeout = $this->config->get('config_smtp_timeout');
				$mail->setTo($this->config->get('config_email'));

			  	//$mail->setFrom($this->config->get('config_email'));
			  	$mail->setFrom('info@' . $domain);
			  	$mail->setSender($this->config->get('config_name'));
			  	$mail->setSubject(html_entity_decode(sprintf($this->language->get('entry_email'), 'NAMEString', ENT_QUOTES, 'UTF-8')));

                $message  = $this->language->get('text_message') . "\n\n";
                $message .= $this->language->get('entry_name') . ': '. $this->request->post['contacts_leave_message_name'] . "\n";
                $message .= $this->language->get('entry_phone') . ': '. $this->request->post['contacts_leave_message_tel'] . "\n";
                $message .= $this->language->get('entry_email') . ': '. $this->request->post['contacts_leave_message_email'] . "\n";
                $message .= "\n";
                $message .= $this->request->post['contacts_leave_message_text'] . "\n";

			  	$mail->setText(html_entity_decode($message));
		      	$mail->send();

		      	//Send to additional alert emails
				$emails = explode(',', $this->config->get('config_alert_emails'));

				foreach ($emails as $email) {
					if ($email && preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $email)) {
						$mail->setTo($email);
						$mail->send();
					}
				}

				$json['success'] = $form_success;
			} else {
				$json['error']['text'] = $form_error;
				$json['error']['errors'] = $this->error;
            }
		}

	    //превращам наш масив с "ошибками" или "успехом" в понятный для jsona формат - json_encode
		$this->response->setOutput(json_encode($json));
	}

    public function validate($results){
		if ((utf8_strlen($results['modal_callback_name']) < 3) || (utf8_strlen($results['modal_callback_name']) > 32)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (!preg_match('/^[-+0-9()\s]+$/', $results['modal_callback_phone'])) {
			$this->error['phone'] = $this->language->get('error_phone');
		}

        return !$this->error;
	}

    public function validate2($results){
		if ((utf8_strlen($results['contacts_leave_message_name']) < 3) || (utf8_strlen($results['contacts_leave_message_name']) > 32)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (!preg_match('/^[-+0-9()\s]+$/', $results['contacts_leave_message_tel'])) {
			$this->error['phone'] = $this->language->get('error_phone');
		}

		if (!preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $results['contacts_leave_message_email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}



        return !$this->error;
	}

}
