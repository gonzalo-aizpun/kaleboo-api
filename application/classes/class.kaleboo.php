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
		return $states;
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