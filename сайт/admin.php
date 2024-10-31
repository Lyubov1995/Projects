<!DOCTYPE html> 
<html>
<head>
	<title>Личный кабинет</title>
	<link rel="stylesheet" type="text/css" href="css/style5.css"></link>
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
<img class=img src="images/9PuVSKIcgwjkbwTUN8aipk7Mx_UivvuZ4DT3xy5z8ncJt0F6CIJgZH67GG14OgjRQzn4w7mpGqRYbVFJGZYVemSn.jpg"/>
</ul></div></div></div>
</div>
<div class=center_column>
<div class=slideLeft>
<h2 class=main-text2>Личный кабинет</h2>
<div style="font-size:25px ;" class="article j1">Данные пользователей<hr>
      <?php 
      include("connect.php");
      if (isset($_GET['red_id'])) {
        $sqli = mysqli_query($db, "SELECT `ID`, `name` FROM `users` WHERE `ID`={$_GET['red_id']}");
        $product = mysqli_fetch_array($sqli);
      }
      if (isset($_GET['red_id'])) {
        $sqli0 = mysqli_query($db, "SELECT `ID`, `surname` FROM `users` WHERE `ID`={$_GET['red_id']}");
        $product1 = mysqli_fetch_array($sqli0);
      }
      if (isset($_GET['red_id'])) {
        $sqli11 = mysqli_query($db, "SELECT `ID`, `phone` FROM `users` WHERE `ID`={$_GET['red_id']}");
        $product8 = mysqli_fetch_array($sqli11);
      }
      if (isset($_GET['red_id'])) {
        $sqli2 = mysqli_query($db, "SELECT `ID`, `password` FROM `users` WHERE `ID`={$_GET['red_id']}");
        $product7 = mysqli_fetch_array($sqli2);
      }
      if (isset($_GET['red_id'])) {
        $sqli1 = mysqli_query($db, "SELECT `ID`, `Email` FROM `users` WHERE `ID`={$_GET['red_id']}");
        $product3 = mysqli_fetch_array($sqli1);
      }
      ?>
      <form action="" method="post" style="font-size:15px">
        <h1 style="font-size:15px">Формы для изменения данных пользователя</h1>
    <table>
      <tr>
         <td>Имя</td>
        <td><input type="text" name="name" value="<?= isset($_GET['red_id']) ? $product['name']: ''; ?>"></td>     
        <td>Фамилия</td>
        <td><input type="text" name="surname" value="<?= isset($_GET['red_id']) ? $product1['surname']: ''; ?>"></td>
        <td>Email</td>
        <td><input type="text" name="Email" value="<?= isset($_GET['red_id']) ? $product3['Email']: ''; ?>"></td>
      </tr>
      <tr>
        <td >Телефон</td>
        <td><input type="text" name="phone" value="<?= isset($_GET['red_id']) ? $product8['phone']: ''; ?>"></td>
        <td>Пароль</td>
        <td><input type="text" name="password" value="<?= isset($_GET['red_id']) ? $product7['password']: ''; ?>"></td>
            <td colspan="2"><input type="submit" value="OK"></td>
      </tr>
    </table>
  </form>
   <table border='1' align="center" class="a1">
    <tr>
    <td>Id</td>
    <td>Имя</td>
    <td>Фамилияи </td>
    <td>Телефон</td>
    <td>Email</td>
    <td>Пароль</td>
      <td>Удаление</td>
      <td>Редактирование</td>
      <td>Добавление</td>
    </tr>
  <?php
   $sql = mysqli_query($db, 'SELECT `ID`, `name`, `surname`,`phone`,`password`, `Email`  FROM `users`');
    while ($result = mysqli_fetch_array($sql)) {
      echo "<tr>
      <td>{$result['ID']}</td>
      <td>{$result['name']}</td>
      <td>{$result['surname']} </td>
      <td>{$result['phone']} </td>
      <td>{$result['Email']} </td>
      <td>{$result['password']} </td>
      <td><a href='?del_id={$result['ID']}'>Удалить</a></td>
      <td><a href='?red_id={$result['ID']}'>Изменить</a></td> 
      <td><a href='?dob_id={$result['ID']}'>Добавить</a></td>
      </tr>";
    }
     if (isset($_POST["name"])) {
      if (isset($_GET['red_id'])) {
         $sql = mysqli_query($db, "UPDATE `users` SET `name` = '{$_POST['name']}' WHERE `ID`={$_GET['red_id']}");
     } else {
         $sql = mysqli_query($db, "INSERT INTO `users` (`name`) VALUES ('{$_POST['name']}')");
    }
  }
    if (isset($_POST["password"])) {
      if (isset($_GET['red_id'])) {
         $sql9 = mysqli_query($db, "UPDATE `users` SET `password` = '{$_POST['password']}' WHERE `ID`={$_GET['red_id']}");
     } else {
         $sql9 = mysqli_query($db, "INSERT INTO `users` (`password`) VALUES ('{$_POST['password']}')");
    }
  }
    if (isset($_POST["surname"])) {
      if (isset($_GET['red_id'])) {
         $sql7 = mysqli_query($db, "UPDATE `users` SET `surname` = '{$_POST['surname']}' WHERE `ID`={$_GET['red_id']}");
     } else {
         $sql7 = mysqli_query($db, "INSERT INTO `users` (`surname`) VALUES ('{$_POST['surname']}')");
    }
  }
  if (isset($_GET['del_id'])) { 
    $sql = mysqli_query($db, "DELETE FROM `users` WHERE `ID` = {$_GET['del_id']}");
    $sql1 = mysqli_query($db, "DELETE FROM `booking` WHERE `Id_user` = {$_GET['del_id']}");
  }
    $sql0 = "INSERT INTO users (name, surname, Email) VALUES ('Thom', 'Vial', 'thom.v@some.com')";
  if (isset($_POST["phone"])) {
    if (isset($_GET['red_id'])) {
       $sql88 = mysqli_query($db, "UPDATE `users` SET `phone` = '{$_POST['phone']}' WHERE `ID`={$_GET['red_id']}");
   } else {
       $sq88 = mysqli_query($db, "INSERT INTO `users` (`phone`) VALUES ('{$_POST['phone']}')");
  }
}
if (isset($_POST["Email"])) {
  if (isset($_GET['red_id'])) {
     $sql71 = mysqli_query($db, "UPDATE `users` SET `Email` = '{$_POST['Email']}' WHERE `ID`={$_GET['red_id']}");
 } else {
     $sql71 = mysqli_query($db, "INSERT INTO `users` (`Email`) VALUES ('{$_POST['Email']}')");
}
}
  ?>
  </table>
 <!-- actoin="dob.php"  -->
  <form  method="POST"  style="font-size:15px">
  <h1 style="font-size:15px">Формы для добавления данных пользователя</h1>
  <table style="font-size:15px">
      <tr>
         <td>Имя</td>
        <td><input type="text" name="name1"></td>     
        <td>Фамилия</td>
        <td><input type="text" name="surname1"></td>
        <td>Email</td>
        <td><input type="text" name="Email1"></td>
      </tr>
      <tr>
        <td >Телефон</td>
        <td><input type="text" name="phone1"></td>
        <td>Пароль</td>
        <td><input type="text" name="password1"></td>
            <td><input type="submit" value="Добавить" name="add"></td>
      </tr>
    </table>
             </form>    
</div></div></div></div></div>
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