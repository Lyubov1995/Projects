
<!DOCTYPE html>  
<html>
<head>
	<title>FlightPool/Авторизация</title>
  <?php 
 include("connect.php");
?> 
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/style4.css"></link>
    <link rel="icon" href="images/icons8-бумажный-самолетик-50.png"  type="image/png">
</head>
<body  background="images/samolety-krasivye-kartinki-49.jpg">
	</head>
    <body>
     <main>  
     <div class='box'>
      <div class='box-login'>
        <div class='fieldset-body'>
        <div style="font-size:20px ;" class="article j1"><?php
if ( !empty($_REQUEST['password']) and !empty($_REQUEST['login']) ) {
$login = $_REQUEST['login'];
$password = $_REQUEST['password'];
$query = 'SELECT * FROM users WHERE phone="' . $login .'" AND password="'.$password.'"';
$result = mysqli_query($db, $query); 
$user = mysqli_fetch_assoc($result); 
if (!empty($user)) {
session_start();
$_SESSION['auth'] = true;
$_SESSION['id'] = $user['ID'];
$_SESSION['login'] = $user['phone'];
$_SESSION['password'] = $user['password'];
echo '<br>Данные введены верно';
} 
else {
echo '<br>Неверный ввод логина или пароля';
}
}
?></div>
      </div>
      <form  method="post" action="profile.php">
             <input type="submit" value="Перейти в личный кабинет" name="log_in"  />
        </div>
      </div>
    </div></div>
  </div>    
</form> 
</div> 
<ul> <div class='box'style="margin-top: 150px;">
      <form action="login.php">
       <input  type="submit" value="Перейти в раздел Авторизация"/>
        </div>
    </div></div></div></div>
</form><ul>
</body>
</html>