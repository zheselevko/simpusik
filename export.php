<!DOCTYPE html><head>
<meta charset="UTF-8" />
</head>

<?php
include_once("configimp.php");

function getGroup($category_id) {
	
	#62 	Детские товары 229264874
	#60 	Одеяла и подушки 229264881
	#63 	Текстиль для ванной 229264890
	#64 	Текстиль для кухни 229264901
	#65 	Сопутствующие товары 229264910
	#66 	Постельное сатин 229264925
	#67 	Постельное белье дети 229264933
	#68 	Постельное  белье   Элит 229264942
	#71 	Простыни 229264949
	#61 	Пледы 229264956
	#78 	Тапочки 229264962
	#79 	Товары для ванной 229264974
	#80 	Фартуки 229264986
	#81 	Упаковка 229264993
	#82 	Акции и скидки 229264998
	#83 	Средства ухода за бельем 229265010
	#84 	Архив
	#85 	Hello Kitty 229265027
	#86 	Товары для кухни 229265033
	#89 	Подушки 229265040
	#69 	Покрывала 229265067
	#72 	Подушки 229265040
	#59 	Постельное белье 229265366
	#77 	Скатерти 229265082
	#75 	Халаты 229265090
	
	switch ($category_id) :
		case  62: return '229264874';
		case  60: return '229264881';
		case  63: return '229264890';
		case  64: return '229264901';
		case  65: return '229264910';
		case  66: return '111';
		case  67: return '111';
		case  68: return '111';
		case  71: return '229264949';
		case  61: return '229264956';
		case  78: return '229264962';
		case  79: return '229264974';
		case  80: return '229264986';
		case  81: return '229264993';
		case  82: return '229264998';
		case  83: return '229265010';
		case  84: return '';
		case  85: return '229265027';
		case  86: return '229265033';
		case  89: return '229265040';
		case  69: return '229265067';
		case  72: return '229265040';
		case  59: return '111';
		case  77: return '229265082';
		case  75: return '229265090';
	endswitch;
}
function getGroupSize($item_size) {
	switch (true) :
		case  preg_match("/Семейный/ui", $item_size): return '229302479';
		case  preg_match("/Евро/ui", $item_size): return '229302512';
		case  preg_match("/1.5/ui", $item_size): return '229302541';
		case  preg_match("/2.0/ui", $item_size): return '229302528';
		case  preg_match("/Не указано/ui", $item_size): return '229302528';
		default: echo "$item_size <br>";
	endswitch;
	
	#семейное 229302479
	#Постельное бельё "Евро" 229302512
	#Постельное бельё "2-х спальное" 229302528
	#Постельное бельё "1,5 спальное" 229302541
}

$query = "SELECT * FROM oc_product";
$result = mysql_query($query);
if (!$result) {
    $message  = 'Неверный запрос: ' . mysql_error() . "\n";
    $message .= 'Запрос целиком: ' . $query;
    die($message);
}

$fp = fopen('to_vk.csv', 'w');

while ($row = mysql_fetch_assoc($result)) {
    $pid = $row['product_id'];
	
	#$query = "SELECT * FROM oc_product_attribute WHERE `oc_product_attribute`.`product_id` ='$pid'";
    #$desc = mysql_query($query);
    #$array = mysql_fetch_assoc($desc);
    #foreach ($array as $key => $value) {
	#	echo $key . "<br>";
	#	echo $value . "<br>";
	#};
    
    $query = "SELECT * FROM oc_product_description WHERE `oc_product_description`.`product_id` ='$pid'";
    $desc = mysql_query($query);
    
    if ($desc) {
		$array = mysql_fetch_assoc($desc);
		
		#foreach ($array as $key => $value) {
		#	echo $key . "<br>";
		#	echo $value . "<br>";
		#};
		
		#$query_sostav = "SELECT * FROM oc_product_attribute WHERE `oc_product_attribute`.`product_id` ='$pid', `oc_product_attribute`.`attribute_id` = 13";
		$query_sostav =  "SELECT * FROM `oc_product_attribute` WHERE `oc_product_attribute`.`product_id`='$pid' and `oc_product_attribute`.`attribute_id`='13'";
		$sostav = mysql_query($query_sostav);
		if ($sostav) {
			$sostav_item = mysql_fetch_assoc($sostav)['text'];
		} else {
			$sostav_item = "";
		}
		
		#$query_size = "SELECT * FROM oc_product_attribute WHERE `oc_product_attribute`.`product_id` ='$pid', `oc_product_attribute`.`attribute_id` = 12";
		$query_size = "SELECT * FROM `oc_product_attribute` WHERE `oc_product_attribute`.`product_id`='$pid' and `oc_product_attribute`.`attribute_id`='12'";
		$size123 = mysql_query($query_size);
		if ($size123) {
			$size_item = mysql_fetch_assoc($size123)['text'];
		} else {
			$size_item = "";
		}
		#echo "$sostav_item<br>";
		#echo "$size_item";
		#break;
		
		$product_id = "product_id=" . $pid;
		$query = "SELECT keyword FROM oc_url_alias WHERE `oc_url_alias`.`query` ='$product_id'";
		$href = mysql_query($query);
		if ($href) {
			$href_page = "http://simsilk.ru/" . mysql_fetch_assoc($href)['keyword'];
		} else {
			continue;
		}

		$query_cat = "SELECT * FROM oc_product_to_category WHERE `oc_product_to_category`.`product_id` ='$pid'";
		$category = mysql_query($query_cat);
		if ($category) {
			$category_id = mysql_fetch_assoc($category)['category_id'];
		} else {
			continue;
		}
		
		if ($row['quantity']) {
			$quantity = "Есть в наличии";
		} else {
			$quantity = "Нет в наличии";
		};
		
		$description = preg_replace('/<br>/u', "\n", $array['description']);
		
		$caption = sprintf("Цена %d руб.\n%s\n%s\nРазмер: %s\nТкань: %s\n%s", $row['price'], $href_page, $description, $size_item, $sostav_item, $quantity);
		
		#if ($sostav_item=="Не указано") {
		#	$caption = sprintf("Цена %d руб.\n%s\n%s\n%s", $row['price'], $href_page, $description, $quantity);
		#} else {
		#	$caption = sprintf("Цена %d руб.\n%s\n%s\nСостав: %s\n%s", $row['price'], $href_page, $description, $sostav_item, $quantity);
		#}
		
		$group = getGroup($category_id);
		if ($group == '111') {
			$group = getGroupSize($size_item);
		}
		#http://simsilk.ru/image/catalog/od001.jpg
		
		$line = array('116733412', $group, $row['model'], $caption, "http://simsilk.ru/image/".$row['image']);
		fputcsv($fp, $line, $delimiter = ';', $enclosure = '"');
		#break;
	}
}
echo '<a href="to_vk.csv">файл для обновления ВК</a>'
?>