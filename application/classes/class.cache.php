<?php
class Cache 
{
	var $sufix = 'kaleboo.';

	function isAvailable() {
		return class_exists('Memcached');
	}

	function get($key) {
		if (!$this->isAvailable()) return null;
		$m = $this->getServer();
		return $m->get($this->sufix . $key);
	}

	function set($key, $data) {
		if (!$this->isAvailable()) return null;
		$m = $this->getServer();
		$m->set($this->sufix . $key, $listings);
	}

	function clean($key) {
		if (!$this->isAvailable()) return null;
		$this->set($this->sufix . $key, null);
	}

	function getServer() {
		$m = new Memcached();
		$m->addServer('localhost', 11211);
		return $m;
	}
}
?>