<?php
class Kaleboo 
{
	var $database;
	var $cache;

	function __construct() 
	{
		$this->database = new Database();
		$this->cache = new Cache();
	}

	function getListing($filters) 
	{

	}

	function getLocationTree() 
	{
		$states = $this->cache->get('location');
		if (!empty($states)) {
			return $states;
		}
		$states = $this->database->fetch_all_array('select id, description from states');
		for ($i=0; $i < count($states); $i++) { 
			$states[$i]['cities'] = $this->database->fetch_all_array('select id, description from cities WHERE id_state=' . $states[$i]['id']);
			for($x=0; $x<count($states[$i]['cities']); $x++) {
				$states[$i]['cities'][$x]['neighborhoods'] = $this->database->fetch_all_array('select id, description from neighborhoods WHERE id_city=' . $states[$i]['cities'][$x]['id']);
			}
		}
		$this->utf8_encode_deep($states);
		$this->cache->set('location', $states);
		return $states;
	}

	function getFilters() 
	{
		$data[0]['id'] = 'id_identity';
		$data[0]['type'] = 'combo';
		$data[0]['values'] = $this->getIdentities();

		$data[1]['id'] = 'id_type';
		$data[1]['type'] = 'combo';
		$data[1]['values'] = $this->getTypes();

		$data[2]['id'] = 'id_furnished';
		$data[2]['type'] = 'combo';
		$data[2]['values'] = $this->getFurnished();

		$data[3]['id'] = 'price';
		$data[3]['type'] = 'int';
		
		$data[4]['id'] = 'rooms';
		$data[4]['type'] = 'int';
		
		$data[5]['id'] = 'surface';
		$data[5]['type'] = 'int';
		
		return $data;
	}

	function getIdentities() 
	{
		$identities = $this->cache->get('identities');
		if (!empty($identities)) {
			return $identities;
		}
		$identities = $this->database->fetch_all_array('select * from identities');
		$this->utf8_encode_deep($identities);
		$this->cache->set('identities', $identities);
		return $identities;
	}

	function getTypes() 
	{
		$types = $this->cache->get('types');
		if (!empty($types)) {
			return $types;
		}
		$types = $this->database->fetch_all_array('select * from types');
		$this->utf8_encode_deep($types);
		$this->cache->set('types', $types);
		return $types;
	}

	function getFurnished() 
	{
		$furnished = $this->cache->get('furnished');
		if (!empty($furnished)) {
			return $furnished;
		}
		$furnished = $this->database->fetch_all_array('select * from furnished');
		$this->utf8_encode_deep($furnished);
		$this->cache->set('furnished', $furnished);
		return $furnished;
	}

	function utf8_encode_deep(&$input) 
	{
		if (is_string($input)) {
			$input = utf8_encode($input);
		} else if (is_array($input)) {
			foreach ($input as &$value) {
				$this->utf8_encode_deep($value);
			}
			
			unset($value);
		} else if (is_object($input)) {
			$vars = array_keys(get_object_vars($input));
			
			foreach ($vars as $var) {
				$this->utf8_encode_deep($input->$var);
			}
		}
	}
}
?>