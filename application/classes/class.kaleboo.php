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

	function getItems($filters) 
	{
		$key = md5(print_r($filters, true));
		$items = $this->cache->get('items.' . $key);
		if (!empty($items)) {
			return $items;
		}

		$query = $this->buildQuery($filters);
		$items = $this->database->fetch_all_array($query);

		foreach ($items as &$item) 
		{
			$item['state'] = $this->getState($item['id_state']);
			$item['city'] = $this->getCity($item['id_city']);
			$item['neighborhood'] = $this->getNeighborhood($item['id_neighborhood']);
			$item['type'] = $this->getType($item['id_type']);
			$item['identity'] = $this->getIdentity($item['id_identity']);
			$item['furnished'] = $this->getFurnish($item['id_furnished']);

			unset($item['id_state']);
			unset($item['id_city']);
			unset($item['id_neighborhood']);
			unset($item['id_type']);
			unset($item['id_identity']);
			unset($item['id_furnished']);
			unset($item['state']['url']);
			unset($item['city']['url']);
			unset($item['city']['id_state']);
			unset($item['neighborhood']['url']);
			unset($item['neighborhood']['id_city']);
		}

		$this->utf8_encode_deep($items);
		return $items;
	}

	function buildQuery($filters)
	{
		if (empty($filters)) {
			return 'SELECT * FROM items LIMIT 100';
		}

		$query = 'SELECT * FROM items WHERE ';

		// direct filters
		$allowed = array('id_state', 'id_city', 'id_neighborhood', 'id_type', 'id_identity', 'id_furnished');
		foreach ($filters as $key => $value) 
		{
			if (in_array($key, $allowed)) {
				$query .= " $key = $value AND ";
			}
		}

		// range filters
		$allowed = array('min_price', 'min_rooms', 'min_expenses', 'min_surface','max_price', 'max_rooms', 'max_expenses', 'max_surface');
		foreach ($filters as $key => $value) 
		{
			if (in_array($key, $allowed)) 
			{
				$symbol = strpos($key, 'min_') !== false ? '>=' : '<=';
				$key = str_replace('min_', '', $key);
				$key = str_replace('max_', '', $key);
				$query .= " $key $symbol $value AND ";
			}
		}

		$query .= " 1 LIMIT 100";
		return $query;
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

		$data[6]['id'] = 'expenses';
		$data[6]['type'] = 'int';
		
		return $data;
	}

	function getState($id) {
		return $this->_getTableValuesById('states', $id);
	}

	function getCity($id) {
		return $this->_getTableValuesById('cities', $id);
	}

	function getNeighborhood($id) {
		return $this->_getTableValuesById('neighborhoods', $id);
	}

	function getType($id) {
		return $this->_getTableValuesById('types', $id);
	}

	function getFurnish($id) {
		return $this->_getTableValuesById('furnished', $id);
	}

	function getIdentity($id) {
		return $this->_getTableValuesById('identities', $id);
	}

	function getIdentities() {
		return $this->_getTableValues('identities');
	}

	function getTypes() {
		return $this->_getTableValues('types');
	}

	function getFurnished()  {
		return $this->_getTableValues('furnished');
	}

	private function _getTableValuesById($tableName, $id) 
	{
		$data = $this->cache->get($tableName.$id);
		if (!empty($data)) {
			return $data;
		}
		$data = $this->database->query_first('SELECT * FROM ' . $tableName . ' WHERE id=' . $id);
		$this->utf8_encode_deep($data);
		$this->cache->set($tableName.$id, $data);
		return $data;
	}

	private function _getTableValues($tableName) 
	{
		$data = $this->cache->get($tableName);
		if (!empty($data)) {
			return $data;
		}
		$data = $this->database->fetch_all_array('SELECT * FROM ' . $tableName);
		$this->utf8_encode_deep($data);
		$this->cache->set($tableName, $data);
		return $data;
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