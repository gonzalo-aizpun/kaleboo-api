<?php
set_time_limit(0);
include '../init.php';
include 'names.php';

echo '<pre>';

$Kaleboo = new Kaleboo();
$Database = new Database();
$Database->query('TRUNCATE TABLE items');

$states = $Kaleboo->getLocationTree();

$types = $Kaleboo->getTypes(); 
$types = count($types);

$identities = $Kaleboo->getIdentities(); 
$identities = count($identities);

$furnished = $Kaleboo->getFurnished();
$furnished = count($furnished);

$maxRooms = 5;
$colombiaCurrency = 2507;


foreach ($states as $state) 
{
	echo "> {$state['description']}\n";
	foreach ($state['cities'] as $city) 
	{
		echo "> {$state['description']}.{$city['description']}\n";
		foreach ($city['neighborhoods'] as $neighborhood) 
		{
			$qty = rand(30, 300);
			for($i=0; $i<$qty; $i++) 
			{
				$areaPerRoom = rand(9, 18);
				$basePrice = rand(100, 200);	// usd
				$ixFirstName = rand(0, count($names)-1);
				$ixLastName = rand(0, count($names)-1);

				$item['id_state'] = $state['id'];
				$item['id_city'] = $city['id'];
				$item['id_neighborhood'] = $neighborhood['id'];
				$item['id_type'] = rand(1, $types);
				$item['id_identity'] = rand(1, $identities);
				$item['id_furnished'] = rand(1, $furnished);
				$item['rooms'] = rand(1, $maxRooms);
				$item['surface'] = $areaPerRoom * $item['rooms'];
				$item['price'] = round($basePrice * $item['rooms'] * $colombiaCurrency, -3);
				$item['email'] = strtolower($names[$ixFirstName].'.'.$names[$ixLastName].'@gmail.com');

				$Database->query_insert('items', $item);
			}
			echo "> {$state['description']}.{$city['description']}.{$neighborhood['description']} > $qty items created\n";
		}
	}
}
?>