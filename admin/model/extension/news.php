<?php
class ModelExtensionNews extends Model {
	public function addNews($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "news SET image = '" . $this->db->escape($data['image']) . "', date_end = '" . $this->db->escape($data['date_end']) . "', status = '" . (int)$data['status'] . "'");

		$news_id = $this->db->getLastId();
		
		foreach ($data['news'] as $key => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX ."news_description SET news_id = '" . (int)$news_id . "',
                language_id = '" . (int)$key . "',
                terminate = '" . $this->db->escape($value['terminate']) . "',
                title = '" . $this->db->escape($value['title']) . "',
                description = '" . $this->db->escape($value['description']) . "',
                short_description = '" . $this->db->escape($value['short_description']) . "'");
		}

		if (isset($data['news_related'])) {
			foreach ($data['news_related'] as $related_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_related SET news_id = '" . (int)$news_id . "', product_id = '" . (int)$related_id . "'");
			}
		}

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_id=" . (int)$news_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
	}
	
	public function editNews($news_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "news SET image = '" . $this->db->escape($data['image']) . "', date_end = '" . $this->db->escape($data['date_end']) . "', status = '" . (int)$data['status'] . "' WHERE news_id = '" . (int)$news_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id. "'");
		
		foreach ($data['news'] as $key => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX ."news_description SET news_id = '" . (int)$news_id . "',
                language_id = '" . (int)$key . "',
                terminate = '" . $this->db->escape($value['terminate']) . "',
                title = '" . $this->db->escape($value['title']) . "',
                description = '" . $this->db->escape($value['description']) . "',
                short_description = '" . $this->db->escape($value['short_description']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "news_related WHERE news_id = '" . (int)$news_id . "'");

		if (isset($data['news_related'])) {
			foreach ($data['news_related'] as $related_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_related SET news_id = '" . (int)$news_id . "', product_id = '" . (int)$related_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'news_id=" . (int)$news_id. "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_id=" . (int)$news_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
	}
	
	public function getNews($news_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'news_id=" . (int)$news_id . "') AS keyword FROM " . DB_PREFIX . "news WHERE news_id = '" . (int)$news_id . "'"); 
 
		if ($query->num_rows) {
			return $query->row;
		} else {
			return false;
		}
	}
   
	public function getNewsDescription($news_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "'"); 
		
		foreach ($query->rows as $result) {
			$news_description[$result['language_id']] = array(
				'terminate'       		=> $result['terminate'],
				'title'       			=> $result['title'],
				'short_description'		=> $result['short_description'],
				'description' 			=> $result['description']
			);
		}
		
		return $news_description;
	}
 
	public function getAllNews($data) {
		$sql = "SELECT * FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nd ON n.news_id = nd.news_id WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY date_end DESC";

		if (isset($data['start']) && isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}
			
			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
		
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}	
		
		$query = $this->db->query($sql);
 
		return $query->rows;
	}
   
	public function deleteNews($news_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "news WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_related WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'news_id=" . (int)$news_id. "'");
	}
   
	public function getTotalNews() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news");
	
		return $query->row['total'];
	}

	public function getNewsRelated($news_id) {
		$news_related_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_related WHERE news_id = '" . (int)$news_id . "'");

		foreach ($query->rows as $result) {
			$news_related_data[] = $result['product_id'];
		}

		return $news_related_data;
	}

}