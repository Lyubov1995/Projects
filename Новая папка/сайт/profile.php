<!DOCTYPE html> 
<html>
<head>
	<title>Личный кабинет</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/style1.css"></link>
</head>
<body >	
	<div class=main_header>
   <div class="odd">
	<ul><a href=""><img  class=img1 src="images/1200px-LogoNorthCentralAirlines.svg.png"/></a>
		<li><a href="">FlightPool</a></li>
	</ul>
</div></div>
<div class=main_content>
<div class=left_column >
<div class= left_column>
<div class=main_menu>	
МЕНЮ
</div>
<div class=container_menu>
<div class=sidebar>
<ul class=menu>
<a href="index.php"><li>Главная</li></a>
<a href="login.php"><li>Выход из личного кабинета</li></a>
<img class=img src="images/9PuVSKIcgwjkbwTUN8aipk7Mx_UivvuZ4DT3xy5z8ncJt0F6CIJgZH67GG14OgjRQzn4w7mpGqRYbVFJGZYVemSn.jpg"/>
</ul></div></div></div>
</div>
<div class=center_column>
<div class=slideLeft>
<h2 class=main-text2>Личный кабинет</h2>
<div style="font-size:20px ;" class="article j1">Личные данные<hr>
<p>ФИО	
<?php 
session_start();{
//  ini_set('display_errors', 0);
//  error_reporting(E_ERROR | E_WARNING | E_PARSE);
    require_once ("connect.php");
	$result1='SELECT `name`  FROM `users` WHERE `id`=' .$_SESSION['id'];
	$result=$db->query($result1);
	$fields=$result->fetch_all(MYSQLI_ASSOC);
	// print_r($fields);
	echo  '<br>', $fields['0']['name'];
}
?>  
	</p>
<p>Телефон<?php 
	$result1='SELECT * FROM  WHERE `phone`=' .$_SESSION['login'];
	echo '<br>', $_SESSION['login'];
	$result=$db->query($result1);
    ?> </p>
<p>Email 
	<?php
$result1='SELECT `Email`  FROM `users` WHERE `id`=' .$_SESSION['id'];
	$result=$db->query($result1);
	$fields=$result->fetch_all(MYSQLI_ASSOC);
	// print_r($fields);
	echo  '<br>', $fields['0']['Email'];
	?>
</p>
</div>
<div style="font-size:20px ;" class="article j2">Время вылета и прилета<hr> 
<?php 
		$result1='SELECT `departure_time`,`arrival_time` FROM `booking` WHERE `id_user`=' .$_SESSION['id'];
		$result=$db->query($result1);
		$fields=$result->fetch_all(MYSQLI_ASSOC);
	    // print_r($fields);
		echo  '<br>Вылет в ', $fields['0']['departure_time'];
		echo  '<br>Прилет в ', $fields['0']['arrival_time'];
    ?> </div>
<div style="font-size:20px ;" class="article j2">Название аэропорта вылета/назначения<hr>
<?php 
	    mysqli_set_charset($db,"utf8mb4");
		$result1='SELECT `airport_of_departure`,`destination_airport` FROM `booking` WHERE `id_user`=' .$_SESSION['id'];
		$result=$db->query($result1);
		$fields=$result->fetch_all(MYSQLI_ASSOC);
	    // print_r($fields);
		echo  '<br>Аэропорт вылета ', $fields['0']['airport_of_departure'];
		echo  '<br>Аэропорт прилета ', $fields['0']['destination_airport'];
    ?>
</div>
<div style="font-size:20px ;" class="article j3">дата вылета<hr><?php 
		$result1='SELECT `departure_date` FROM `booking` WHERE `id_user`=' .$_SESSION['id'];
		$result=$db->query($result1);
		$fields=$result->fetch_all(MYSQLI_ASSOC);
	    // print_r($fields);
		echo  '<br>', $fields['0']['departure_date'];
    ?> </div>
</div></div>=</div></div></div>
<div class="footer">
	<div class="ff"> 
		 <ul class="conteiner">    
		   <li> <img class="mal"  src="images/icons8-vk-в-круге-48.png"/></li>
   <li ><img class="mal"  src="images/icons8-instagram-48.png"/></li>
   <li><img class="mal"  src="images/icons8-значки-facebook-в-форме-круга-48.png"/></li>
   <li><img class="mal"  src="images/icons8-твиттер-48.png"/></li>
   <li><img class="mal"  src="images/icons8-телеграмма-app-48.png"/></li>
   <li><img class=img2 src="images/cloud_037.png"/>  </li>
   </ul>
   </div> 
   </div>
</div>
</body>
</html>
