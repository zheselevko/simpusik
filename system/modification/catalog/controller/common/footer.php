<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');

				$data['news'] = $this->url->link('information/news');
				$data['text_news'] = $this->language->get('text_news');
			
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');

		$data['telephone']      = $this->config->get('config_telephone');
		$data['phone1']         = $this->config->get('config_phone1');
		$data['phone2']         = $this->config->get('config_phone2');

        $data['address']        = $this->config->get('config_address');
        $data['address_part']   = explode(PHP_EOL, $data['address']);
		$data['open']           = $this->config->get('config_open');

		$data['name']           = $this->config->get('config_name');
		$data['email']          = $this->config->get('config_email');

		$data['cart'] = $this->url->link('checkout/simplecheckout');
		$data['checkout'] = $this->url->link('checkout/simplecheckout', '', 'SSL');

		$data['getSymbolRight']	= $this->currency->getSymbolRight();



			$data['text_testimonial'] = $this->language->get('text_testimonial');
			
			
		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}



			$data['testimonial'] = $this->url->link('product/testimonial');
			
			
		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', 'SSL');
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', 'SSL');
		$data['affiliate'] = $this->url->link('affiliate/account', '', 'SSL');
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');

		$this->language->load('module/news');
		$data['blog_url'] = $this->url->link('news/ncategory');
		$data['blog_name'] = $this->language->get('text_blogpage');
		
		$data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');

        $data['compare'] = $this->url->link('product/compare');

        /* footer menu */
		$data['about_us'] = $this->url->link('information/about');
		$data['special']  = $this->url->link('information/news');
		$data['delivery'] = $this->url->link('information/delivery');
		$data['payment']  = $this->url->link('information/payment');
		$data['review']   = $this->url->link('product/testimonial');
		$data['blog']     = $this->url->link('news/ncategory');
		$data['contacts'] = $this->url->link('information/contact');
        /* footer menu */


		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

        $data['product'] = array(
        	'product_id'    => '',
        	'thumb'         => '',
        	'name'          => '',
        	'sku'           => '',
        	'model'         => '',
        	'location'      => '',
        	'price'         => 0.0,
        	'special'       => 0.0,
        	'tax'           => 0.0,
        	'rating'        => 0,
        	'reviews'       => 0,
			'attribute'     => array(),
        	'href'          => '',
        );

		$data['site_key'] = $this->config->get('google_captcha_key');

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->whosonline($ip, $this->customer->getId(), $url, $referer);
		}

		$data['search_footer'] = $this->load->controller('common/search_footer');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/footer.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/footer.tpl', $data);
		} else {
			return $this->load->view('default/template/common/footer.tpl', $data);
		}
	}
}