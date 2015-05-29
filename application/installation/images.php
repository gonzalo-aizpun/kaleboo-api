<?php
set_time_limit(0);
include '../init.php';
include 'candidates.php';

echo '<pre>';

$Database = new Database('replica-olx-comments.office-ar-buenosaires-minones.olx.com','dev','+v8xDh4a7#', 'DBOLX_IMAGES');

$myfile = fopen("/Users/dev/Source/kaleboo-api/application/installation/images.sql", "w");

for($i=1; $i<count($imgCandidates); $i++)
{
	$id = $imgCandidates[$i];
	$urls = $Database->fetch_all_array("select concat('http://images01.olx-st.com/',image_url) as 'url' from olx_items_images where item_id=$id");
	foreach ($urls as $item) {
		$url = $item['url'];
		$txt = "INSERT INTO images VALUES ($i, '$url');\n";
		fwrite($myfile, $txt);
	}
	if ($i % 100 == 0) echo "$i\n";
}

fclose($myfile);

?>