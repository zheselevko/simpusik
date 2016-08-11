<?php

  $dblocation = "localhost";
  $dbname = "a72415_simsilk";
  $dbuser = "a72415_simsilk";
  $dbpasswd = "68Gf%#jd(nf";
  $dbcnx = @mysql_connect($dblocation,$dbuser,$dbpasswd);
  
  if (!$dbcnx)
  {
    echo( "<P>Â íàñòîÿùèé ìîìåíò ñåðâåð áàçû äàííûõ íå äîñòóïåí, ïîýòîìó êîððåêòíîå îòîáðàæåíèå ñòðàíèöû íåâîçìîæíî.</P>" );
    exit();
  }
  if (! @mysql_select_db($dbname,$dbcnx) )
  {
    echo( "<P>Â íàñòîÿùèé ìîìåíò áàçà äàííûõ íå äîñòóïíà, ïîýòîìó êîððåêòíîå îòîáðàæåíèå ñòðàíèöû íåâîçìîæíî.</P>" );
    exit();
  }
        mysql_query('set character set utf8');
mysql_query('set names utf8');



?>