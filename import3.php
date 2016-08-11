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
echo "версия 3 (исправления описаний)";
?>

<?php
include_once("configimp.php");
if(@$_POST['submit']) {
	echo "submit<br>";
	if(isset($_FILES['import_file'])) {
		echo "import_file<br>";
		$tmp_name = $_FILES["import_file"]["tmp_name"];
		$name = $_FILES["import_file"]["name"];
		move_uploaded_file($tmp_name, "import/$name");
		$f = fopen("import/$name", "rt");
		$data = fgetcsv($f, 1000, ";");
		$i=0;
		while (!feof($f)){
			echo "$f<br>";
			$data = fgetcsv($f, 2000, ";");
			$simp=mb_convert_encoding ($data[0],"UTF-8" , "Windows-1251" );
			$simp=str_replace('"','',$simp);
			$simp=explode(",",$simp);
			if (count($simp)>1) {
				if ($simp[2]!='Не указано') {
					$pprice=$simp[0];
					if (!empty($_POST["procent"])) {
						if ($_POST["procent"]>0) {
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
					$description = preg_replace('/([а-я0-9]+)([А-Я]+)/u', '$1 $2', $simp[9]);
					$description = preg_replace('/<br \/><br \/>/u', '<br>', $description);
					$description = preg_replace('/<br \/>/u', '<br>', $description);
					$description = preg_replace('/<br\/>/u', '<br>', $description);
					
					$query = "SELECT product_id FROM oc_product where model='$model'";
					$thmp = mysql_query($query);
					$Nrowsp=mysql_num_rows($thmp);
					if ($Nrowsp>0){
						$pid=mysql_result($thmp,0,0);
						$query = "UPDATE `oc_product_description` SET `meta_description` = '$description',`description` = '$description' WHERE `oc_product_description`.`product_id` ='$pid'";
						$thmpuu = mysql_query($query);
					}
				}
			}
		}
	}
}
if(@$_POST['submito']){
	if(isset($_FILES['import_fileo'])) {
		$tmp_name = $_FILES["import_fileo"]["tmp_name"];
		$name = $_FILES["import_fileo"]["name"];
		move_uploaded_file($tmp_name, "import/$name");
		$xdatet=date("Y-m-d H:i:s");
		$f = fopen("import/$name", "rt");
		$data = fgetcsv($f, 1000, ";");
		$i=0;
		while (!feof($f)) {
			$data = fgetcsv($f, 2000, ";");
			if ($data[0]!="" and $data[1]!="") {
				$model=$data[0];
				$nalichie=$data[1];
				if ($nalichie=="0") {
					$quantity=0;
					$stock_status_id=6;
				} else {
					$quantity=990;
					$stock_status_id=5;
				}
				$query = "SELECT product_id FROM oc_product where model='$model'";
				$thmp = mysql_query($query);
				$Nrowsp=mysql_num_rows($thmp);
				if ($Nrowsp>0) {
					$pid=mysql_result($thmp,0,0);
					$query = "UPDATE `oc_product` SET `quantity` = '$quantity',`stock_status_id` = '$stock_status_id',`date_modified` = '$xdatet' WHERE `oc_product`.`product_id` ='$pid'";
					$thmpuu = mysql_query($query);
				}
			}
		}
	}
}
?>