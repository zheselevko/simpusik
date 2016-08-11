<!DOCTYPE html><head>
<meta charset="UTF-8" />

<table border="0" width="100%" cellspacing="0" cellpadding="0" height="110">
	<tr>
		<td></td>
		<td>
		<p align="center"><font size="4">Импорт товаров из 
		textilgroup.ru</font></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style="border: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"><form action="" method="post" enctype="multipart/form-data" name="">Файл импорта CSV(<a href="http://www.textilgroup.ru/upload/yml_csv/export.csv">textilgroup.ru/upload/yml_csv/export.csv</a>):&nbsp;&nbsp;
        
        <input type="file" name="import_file" /><br><br>Увеличение цены: <input type="text" name="procent" value="<? if (!empty($_POST["procent"])) echo $_POST["procent"];?>">%

        </td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;        </td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>        
		<p align="center"><input type="submit" name="submit" value="Выполнить импорт"><input type="hidden" value="1" name="impopr"></form></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;        </td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>        
		<p align="center" style="font-size:16px; color:#090"><font size="4"><? if (!empty($_POST["impopr"])) echo "Импорт выполнен!";?></font></td>
		<td>&nbsp;</td>
	</tr>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="0" height="110">
	<tr>
		<td></td>
		<td>
		<p align="center"><font size="4">Обновление остатков из 
		textilgroup.ru</font></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style="border: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"><form action="" method="post" enctype="multipart/form-data" name="">Файл остатков CSV(<a href="http://www.textilgroup.ru/upload/yml_csv/myCSV.csv">textilgroup.ru/upload/yml_csv/myCSV.csv</a>):&nbsp;&nbsp;
        
        <input type="file" name="import_fileo" /><br>

        </td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;        </td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>        
		<p align="center"><input type="submit" name="submito" value="Обновить остатки"><input type="hidden" value="1" name="impopro"></form></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;        </td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>        
		<p align="center" style="font-size:16px; color:#090"><font size="4"><? if (!empty($_POST["impopro"])) echo "Остатки обновлены!";?></font></td>
		<td>&nbsp;</td>
	</tr>
</table>

<?php
include_once("configimp.php");
	if(@$_POST['submit']){
		if(isset($_FILES['import_file'])){
			$tmp_name = $_FILES["import_file"]["tmp_name"];
			$name = $_FILES["import_file"]["name"];
move_uploaded_file($tmp_name, "import/$name");

$f = fopen("import/$name", "rt");
$data = fgetcsv($f, 1000, ";");
$i=0;
while (!feof($f)){
$data = fgetcsv($f, 2000, ";");
$simp=mb_convert_encoding ($data[0],"UTF-8" , "Windows-1251" );
$simp=str_replace('"','',$simp);
$simp=explode(",",$simp);
if (count($simp)>1){
if ($simp[2]!='Не указано'){
$pprice=$simp[0];
if (!empty($_POST["procent"])){
if ($_POST["procent"]>0){
$procent=$_POST["procent"];
$pprice=round($pprice+(($pprice/100)*$procent));
	}	
	}
$categoryId=$simp[2];
$picture=$simp[4];
$model=$simp[5];
$nalichie=$simp[6];
$size=$simp[7];
$material=$simp[8];
$description=$simp[9];

if ($nalichie=="0"){
$quantity=0;
$stock_status_id=6;
	}else{
$quantity=990;
$stock_status_id=5;		
		}
$xdate=date("Y-m-d");
$xdatet=date("Y-m-d H:i:s");

$query = "SELECT category_id,name FROM oc_category_description where impid='$categoryId'";
$thmc = mysql_query($query);
$Nrowsc=mysql_num_rows($thmc);
if ($Nrowsc>0){

$query = "SELECT product_id FROM oc_product where model='$model'";
$thmp = mysql_query($query);
$Nrowsp=mysql_num_rows($thmp);
if ($Nrowsp>0){
$pid=mysql_result($thmp,0,0);	
$query = "UPDATE `oc_product` SET `quantity` = '$quantity',`stock_status_id` = '$stock_status_id',`price` = '$pprice',`date_modified` = '$xdatet' WHERE `oc_product`.`product_id` ='$pid'";
$thmpuu = mysql_query($query);


}else{
	
$category_id=mysql_result($thmc,0,0);	
$cname=mysql_result($thmc,0,1);
$pname=$cname." ".$model;
//********************************************
if ($picture!=""){
$path_parts = pathinfo($picture);
$newfile = 'image/catalog/'.$path_parts['basename'];
copy($picture,$newfile);
$picture="catalog/".$path_parts['basename'];
}
//********************************************

$query = "INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(NULL, '$model', '', '', '', '', '', '', '', '$quantity', '$stock_status_id', '$picture', '0', '1', '$pprice', '0', '0', '$xdate', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '0', '1', '1', '$xdatet', '$xdatet');";
$thmpi = mysql_query($query);
$iof=mysql_insert_id();

$query = "INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
('$iof', '2', '$pname', '$description', '', '$pname', '$description', '$pname');";
$thmpid = mysql_query($query);

$query = "INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('$iof', '$category_id');";
$thmt = mysql_query($query);

$query = "INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES ('$iof', '12', '2', '$size');";
$thmt = mysql_query($query);

$query = "INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES ('$iof', '13', '2', '$material');";
$thmt = mysql_query($query);

$query = "INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('$iof', '0', '0');";
$thmt = mysql_query($query);

$query = "INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('$iof', '0');";
$thmt = mysql_query($query);

	}}}}}
	}}
	
	if(@$_POST['submito']){
		if(isset($_FILES['import_fileo'])){
			$tmp_name = $_FILES["import_fileo"]["tmp_name"];
			$name = $_FILES["import_fileo"]["name"];
move_uploaded_file($tmp_name, "import/$name");
$xdatet=date("Y-m-d H:i:s");

$f = fopen("import/$name", "rt");
$data = fgetcsv($f, 1000, ";");
$i=0;
while (!feof($f)){
$data = fgetcsv($f, 2000, ";");
if ($data[0]!="" and $data[1]!=""){

$model=$data[0];
$nalichie=$data[1];

if ($nalichie=="0"){
$quantity=0;
$stock_status_id=6;
	}else{
$quantity=990;
$stock_status_id=5;		
		}
$query = "SELECT product_id FROM oc_product where model='$model'";
$thmp = mysql_query($query);
$Nrowsp=mysql_num_rows($thmp);
if ($Nrowsp>0){
$pid=mysql_result($thmp,0,0);	
$query = "UPDATE `oc_product` SET `quantity` = '$quantity',`stock_status_id` = '$stock_status_id',`date_modified` = '$xdatet' WHERE `oc_product`.`product_id` ='$pid'";
$thmpuu = mysql_query($query);
	
}}}}}
?>