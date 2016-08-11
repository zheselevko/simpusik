<?php
class ControllerProductSearch extends Controller {
	public function index() {
		$this->load->language('product/search');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');
$this->document->setRobots('noindex, follow');
		if (isset($this->request->get['search'])) {
			$search = $this->request->get['search'];
		} else {
			$search = '';
		}

		if (isset($this->request->get['tag'])) {
			$tag = $this->request->get['tag'];
		} elseif (isset($this->request->get['search'])) {
			$tag = $this->request->get['search'];
		} else {
			$tag = '';
		}

		if (isset($this->request->get['description'])) {
			$description = $this->request->get['description'];
		} else {
			$description = '';
		}

		if (isset($this->request->get['category_id'])) {
			$category_id = $this->request->get['category_id'];
		} else {
			$category_id = 0;
		}

		if (isset($this->request->get['sub_category'])) {
			$sub_category = $this->request->get['sub_category'];
		} else {
			$sub_category = '';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.price';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_product_limit');
		}

		if (isset($this->request->get['search'])) {
			$this->document->setTitle($this->language->get('heading_title') .  ' - ' . $this->request->get['search']);
		} elseif (isset($this->request->get['tag'])) {
			$this->document->setTitle($this->language->get('heading_title') .  ' - ' . $this->language->get('heading_tag') . $this->request->get['tag']);
		} else {
			$this->document->setTitle($this->language->get('heading_title'));
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$url = '';

		if (isset($this->request->get['search'])) {
			$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['tag'])) {
			$url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['description'])) {
			$url .= '&description=' . $this->request->get['description'];
		}

		if (isset($this->request->get['category_id'])) {
			$url .= '&category_id=' . $this->request->get['category_id'];
		}

		if (isset($this->request->get['sub_category'])) {
			$url .= '&sub_category=' . $this->request->get['sub_category'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('product/search', $url)
		);

		if (isset($this->request->get['search'])) {
			$data['heading_title'] = $this->language->get('heading_title') .  ' - ' . $this->request->get['search'];
		} else {
			$data['heading_title'] = $this->language->get('heading_title');
		}

		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_search'] = $this->language->get('text_search');
		$data['text_keyword'] = $this->language->get('text_keyword');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_sub_category'] = $this->language->get('text_sub_category');
		$data['text_quantity'] = $this->language->get('text_quantity');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_model'] = $this->language->get('text_model');
		$data['text_price'] = $this->language->get('text_price');
		$data['text_tax'] = $this->language->get('text_tax');
		$data['text_points'] = $this->language->get('text_points');
		$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		$data['text_sort'] = $this->language->get('text_sort');
		$data['text_limit'] = $this->language->get('text_limit');

		$data['entry_search'] = $this->language->get('entry_search');
		$data['entry_description'] = $this->language->get('entry_description');

		$data['button_search'] = $this->language->get('button_search');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['button_list'] = $this->language->get('button_list');
		$data['button_grid'] = $this->language->get('button_grid');

    	$data['getSymbolRight']	= $this->currency->getSymbolRight();
		$data['compare'] = $this->url->link('product/compare');

		$this->load->model('catalog/category');

		// 3 Level Category Search
		$data['categories'] = array();

		$categories_1 = $this->model_catalog_category->getCategories(0);

		foreach ($categories_1 as $category_1) {
			$level_2_data = array();

			$categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);

			foreach ($categories_2 as $category_2) {
				$level_3_data = array();

				$categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);

				foreach ($categories_3 as $category_3) {
					$level_3_data[] = array(
						'category_id' => $category_3['category_id'],
						'name'        => $category_3['name'],
					);
				}

				$level_2_data[] = array(
					'category_id' => $category_2['category_id'],
					'name'        => $category_2['name'],
					'children'    => $level_3_data
				);
			}

			$data['categories'][] = array(
				'category_id' => $category_1['category_id'],
				'name'        => $category_1['name'],
				'children'    => $level_2_data
			);
		}

        $setting = array(
            'width'     => $this->config->get('config_image_product_width'),
            'height'    => $this->config->get('config_image_product_height'),
        );

		$data['products'] = array();

		
                    /* Brainy Filter (brainyfilter.xml) - Start ->*/
                    /* Show product list in any case */
					if (true) {
                    /* Brainy Filter (brainyfilter.xml) - End ->*/
                
			$filter_data = array(
				'filter_name'         => $search,
				'filter_tag'          => $tag,
				'filter_description'  => $description,
				'filter_category_id'  => $category_id,
				'filter_sub_category' => $sub_category,
				'sort'                => $sort,
				'order'               => $order,
				'start'               => ($page - 1) * $limit,
				'limit'               => $limit
			);

            $filter_data['filter_bfilter'] = true;
			$product_total = $this->model_catalog_product->getTotalProducts($filter_data);

            $filter_data['filter_bfilter'] = true;
			$results = $this->model_catalog_product->getProducts($filter_data);

    		if ($results) {
    			foreach ($results as $result) {
    				$data['products'][] = $this->getProduct($result, $setting);
    			}
    		}

			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();

            if ($sort == 'rating') {
                if ($order == 'ASC') {
    				$data['sorts'][] = array(
    					'text'  => $this->language->get('text_rating'),
                        'order' => '&uarr;',
    					'href'  => $this->url->link('product/search', $url . '&sort=rating&order=DESC' . $url)
    				);
                } else {
    				$data['sorts'][] = array(
    					'text'  => $this->language->get('text_rating'),
                        'order' => '&darr;',
    					'href'  => $this->url->link('product/search', $url . '&sort=rating&order=ASC' . $url)
    				);
                }

        		$data['sorts'][] = array(
		    	    'text'  => $this->language->get('text_price'),
                    'order' => '',
        			'href'  => $this->url->link('product/search', $url . '&sort=p.price&order=ASC' . $url)
		        );

                $data['sorts'][] = array(
        		    'text'  => $this->language->get('text_name'),
                    'order' => '',
    		    	'href'  => $this->url->link('product/search', $url . '&sort=pd.name&order=ASC' . $url)
    			);
            }

            if ($sort == 'p.price') {
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating'),
                    'order' => '',
					'href'  => $this->url->link('product/search', $url . '&sort=rating&order=ASC' . $url)
				);

                if ($order == 'ASC') {
        			$data['sorts'][] = array(
		    		    'text'  => $this->language->get('text_price'),
                        'order' => '&uarr;',
        				'href'  => $this->url->link('product/search', $url . '&sort=p.price&order=DESC' . $url)
		        	);
                } else {
        			$data['sorts'][] = array(
		    		    'text'  => $this->language->get('text_price'),
                        'order' => '&darr;',
        				'href'  => $this->url->link('product/search', $url . '&sort=p.price&order=ASC' . $url)
		        	);
                }

                $data['sorts'][] = array(
        		    'text'  => $this->language->get('text_name'),
                    'order' => '',
    		    	'href'  => $this->url->link('product/search', $url . '&sort=pd.name&order=ASC' . $url)
    			);
            }

            if ($sort == 'pd.name') {
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating'),
                    'order' => '',
					'href'  => $this->url->link('product/search', $url . '&sort=rating&order=ASC' . $url)
				);

        		$data['sorts'][] = array(
		    	    'text'  => $this->language->get('text_price'),
                    'order' => '',
        			'href'  => $this->url->link('product/search', $url . '&sort=p.price&order=ASC' . $url)
		        );

                if ($order == 'ASC') {
        			$data['sorts'][] = array(
		    		    'text'  => $this->language->get('text_name'),
                        'order' => '&uarr;',
        		    	'href'  => $this->url->link('product/search', $url . '&sort=pd.name&order=DESC' . $url)
		        	);
                } else {
        			$data['sorts'][] = array(
		    		    'text'  => $this->language->get('text_name'),
                        'order' => '&darr;',
        		    	'href'  => $this->url->link('product/search', $url . '&sort=pd.name&order=ASC' . $url)
		        	);
                }

            }

			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$data['limits'] = array();

			$limits = array_unique(array($this->config->get('config_product_limit'), 30, 60, 90));

			sort($limits);

			foreach($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('product/search', $url . '&limit=' . $value)
				);
			}

			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('product/search', $url . '&page={page}');

			$data['pagination'] = $pagination->render();

			$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));
		}

		$data['search'] = $search;
		$data['description'] = $description;
		$data['category_id'] = $category_id;
		$data['sub_category'] = $sub_category;

		$data['sort'] = $sort;
		$data['order'] = $order;
		$data['limit'] = $limit;

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/search.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/search.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/product/search.tpl', $data));
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