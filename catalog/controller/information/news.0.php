<?php
class ControllerInformationNews extends Controller {
	public function index() {
		$this->language->load('information/news');
		
		$this->load->model('extension/news');

		$this->document->setTitle($this->language->get('heading_title'));
	 
		$data['breadcrumbs'] = array();
		
		$data['breadcrumbs'][] = array(
			'text' 		=> $this->language->get('text_home'),
			'href' 		=> $this->url->link('common/home')
		);
		$data['breadcrumbs'][] = array(
			'text' 		=> $this->language->get('heading_title'),
			'href' 		=> $this->url->link('information/news')
		);
		  
		$url = '';
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}	

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}
		
		$filter_data = array(
			'page' 	=> $page,
			'limit' => 10,
			'start' => 10 * ($page - 1),
		);
		
		$total = $this->model_extension_news->getTotalNews();
		
		$pagination = new Pagination();
		$pagination->total = $total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->url = $this->url->link('information/news', 'page={page}');
		
		$data['pagination'] = $pagination->render();
	 
		$data['results'] = sprintf($this->language->get('text_pagination'), ($total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($total - 10)) ? $total : ((($page - 1) * 10) + 10), $total, ceil($total / 10));

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_title'] = $this->language->get('text_title');
		$data['text_description'] = $this->language->get('text_description');
		$data['text_date'] = $this->language->get('text_date');
		$data['text_view'] = $this->language->get('text_view');

		$all_news = $this->model_extension_news->getAllNews($filter_data);
	 
		$data['all_news'] = array();
		
		$this->load->model('tool/image');
	 
		foreach ($all_news as $news) {
			$data['all_news'][] = array (
				'terminate' 	    => html_entity_decode($news['terminate'], ENT_QUOTES),
				'title' 		    => html_entity_decode($news['title'], ENT_QUOTES),
				'image'			    => $this->model_tool_image->resize($news['image'], 237, 209),
				'short_description' => html_entity_decode($news['short_description'], ENT_QUOTES),
				'href' 			    => $this->url->link('information/news/news', 'news_id=' . $news['news_id']),
				'date_end' 	        => date($this->language->get('date_format_short'), strtotime($news['date_end']))
			);
		}
	 
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/news_list.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/news_list.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/information/news_list.tpl', $data));
		}
	}
 
	public function news() {
		$this->language->load('information/news');

		$this->load->model('extension/news');

		if (isset($this->request->get['news_id']) && !empty($this->request->get['news_id'])) {
			$news_id = $this->request->get['news_id'];
		} else {
			$news_id = 0;
		}
 
		$news = $this->model_extension_news->getNews($news_id);

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' 			=> $this->language->get('text_home'),
			'href' 			=> $this->url->link('common/home')
		);
	  
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/news')
		);
 
		if ($news) {
			$data['breadcrumbs'][] = array(
				'text' 		=> $news['title'],
				'href' 		=> $this->url->link('information/news/news', 'news_id=' . $news_id)
			);

			$this->document->setTitle($news['title']);

    		$this->load->model('catalog/product');
			$this->load->model('tool/image');

			$data['image'] = $this->model_tool_image->resize($news['image'], 200, 200);

            $setting = array(
                'width'     => $this->config->get('config_image_product_width'),
                'height'    => $this->config->get('config_image_product_height'),
                'limit'     => 4
            );

			$data['products'] = array();

    		$products = $this->model_extension_news->getNewsRelated($news_id);
    		if ($products) {
    			foreach ($products as $product_id) {
    				$product_info = $this->model_catalog_product->getProduct($product_id);
    				$data['products'][] = $this->getProduct($product_info, $setting);
    			}
    		}
            /*** Alex Lysenko alys2008@gmail.com ***/

			$data['heading_title'] = html_entity_decode($news['title'], ENT_QUOTES);
			$data['description'] = html_entity_decode($news['description'], ENT_QUOTES);
        	$data['getSymbolRight']	= $this->currency->getSymbolRight();

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/news.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/news.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/information/news.tpl', $data));
			}
		} else {
			$data['breadcrumbs'][] = array(
				'text' 		=> $this->language->get('text_error'),
				'href' 		=> $this->url->link('information/news', 'news_id=' . $news_id)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');
			$data['text_error'] = $this->language->get('text_error');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['continue'] = $this->url->link('common/home');
	 
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
			}
		}
	}

    public function getProduct($result, $setting) {
	    $this->load->model('catalog/product');
        $this->load->model('tool/image');

        if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
        	$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
        } else {
        	$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
        }

        if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
        	$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
        } else {
        	$price = false;
        }

        if ((float)$result['special']) {
        	$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
        } else {
        	$special = false;
        }

        if ($this->config->get('config_tax')) {
        	$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
        } else {
        	$tax = false;
        }

        if ($this->config->get('config_review_status')) {
        	$rating = $result['rating'];
        } else {
        	$rating = false;
        }

        $product_info = $this->model_catalog_product->getProduct($result['product_id']);

        $attribute_groups = $this->model_catalog_product->getProductAttributes($result['product_id']);

        $attribute_data = array();
        foreach ($attribute_groups as $attribute_group) {
        	foreach ($attribute_group['attribute'] as $attribute) {
        		$attribute_data[] = array(
                    'name' => $attribute['name'],
        		    'text' => $attribute['text']
                );
        	}
        }

        $data = array(
        	'product_id'  => $result['product_id'],
        	'thumb'       => $image,
        	'name'        => $result['name'],
        	'sku'         => $result['sku'],
        	'model'       => $result['model'],
        	'location'    => $result['location'],
			//'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
        	'price'       => $price,
        	'special'     => $special,
        	'tax'         => $tax,
        	'rating'      => $rating,
        	'reviews'     => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
			'attribute'   => $attribute_data,
        	'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
        );

        return $data;

    }


}