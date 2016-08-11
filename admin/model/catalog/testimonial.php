<?php
class ModelCatalogTestimonial extends Model {

	public function addTestimonial($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "testimonial SET status = '" . (int)$data['status'] . "',rating = '".(int)$data['rating'] . "',date_added = '" . $this->db->escape($data['date_added']) . "', title = '" . $this->db->escape($data['title']) . "', text = '" . $this->db->escape($data['text']) . "', good = '" . $this->db->escape($data['good']) . "', comment = '" . $this->db->escape($data['comment']) . "', bad = '" . $this->db->escape($data['bad']) . "', name = '" . $this->db->escape($data['name']) . "', city = '" . $this->db->escape($data['city']) . "', email='" . $this->db->escape($data['email']) . "'");
	}
	
	public function editTestimonial($testimonial_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "testimonial SET status = '" . (int)$data['status'] . "', date_added = '" . $this->db->escape($data['date_added']) . "', rating = '" . (int)$data['rating'] . "', title = '" . $this->db->escape($data['title']) . "', text = '" . $this->db->escape($data['text']) . "', good = '" . $this->db->escape($data['good']) . "', comment = '" . $this->db->escape($data['comment']) . "', bad = '" . $this->db->escape($data['bad']) . "', name = '" . $this->db->escape($data['name']) . "', city = '" . $this->db->escape($data['city']) . "', email='" . $this->db->escape($data['email']) . "' WHERE testimonial_id = '" . (int)$testimonial_id . "'");
	}
	
	public function deleteTestimonial($testimonial_id) {	
		$this->event->trigger('pre.admin.testimonial.delete', $testimonial_id);
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "testimonial WHERE testimonial_id = '" . (int)$testimonial_id . "'");
		
		$this->cache->delete('testimonial');

		$this->event->trigger('post.admin.testimonial.delete', $testimonial_id);
	}	

	public function getTestimonial($testimonial_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "testimonial WHERE testimonial_id = '" . (int)$testimonial_id . "'");
		
		return $query->row;
	}
		
	public function getTestimonials($data = array()) {
	
		$sql = "SELECT * FROM " . DB_PREFIX . "testimonial";
		
			$sort_data = array(
				'title',
				'rating',
				'name',
				'date_added',
				'status'
			);		
		
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY date_added";	
			}
	
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}
		
			if (isset($data['start']) || isset($data['limit'])) {
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

	public function isTableExists() {

		$query = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "testimonial'");
		if (count($query->rows) == 0)
	      	return false;
		else
	      	return true;
	}
	
	public function getTotalTestimonials() {
		if ($this->isTableExists() == false)
			return -1;

      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "testimonial");
		
		return $query->row['total'];
	}		

	public function createDatabaseTables() {
		$sql  = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "testimonial` ( ";
		$sql .= "`testimonial_id` int(11) NOT NULL AUTO_INCREMENT, "; 
		$sql .= "`email` varchar(96) COLLATE utf8_unicode_ci NOT NULL DEFAULT '', ";
		
		$sql .= "`title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '', ";
		$sql .= "`text` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '', ";
		$sql .= "`good` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '', ";
		$sql .= "`comment` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '', ";
		$sql .= "`bad` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '', ";
		$sql .= "`name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '', ";
		$sql .= "`city` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '', ";
		
		$sql .= "`status` int(1) NOT NULL DEFAULT '0', ";
		$sql .= "`rating` int(1) NOT NULL DEFAULT '0', ";
		$sql .= "`date_added` date NOT NULL DEFAULT '0000-00-00', ";
		$sql .= "PRIMARY KEY (`testimonial_id`) ";
		$sql .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;";
		$this->db->query($sql);
	}
	
	public function dropDatabaseTables() {
		$sql = "DROP TABLE IF EXISTS `" . DB_PREFIX . "testimonial`;";
		$this->db->query($sql);
	}

}
?>