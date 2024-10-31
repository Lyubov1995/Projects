<!DOCTYPE html>  
<html>
<head>
	<title>FlightPool/Авторизация</title>
</head>
	<link rel="stylesheet" type="text/css" href="css/style2.css"></link>
    <link rel="icon" href="images/icons8-бумажный-самолетик-50.png"  type="image/png">
	</head>  <?php 
 include("connect.php");
?> 
  
<body  background="images/samolety-krasivye-kartinki-49.jpg">
  <body>
        <main>  
<div class='box'>
      <div class='box-login-tab'></div>
      <div class='box-login-title'>
<h2>Авторизация</h2>
      </div>
      <form  method="post" action="">
      <div class='box-login'>
        <div class='fieldset-body'>
            <p class='field'>
            <label>Телефон</label>
            <input class="forma" type='tel'  name="login" required="required" />
          </p>
          <p class='field'>
            <label>Пароль</label>
            <input class="forma" type='password' name="password"   required="required"/>
          </p>
             <input type="submit" value="Войти" name="log_in"  />
        </div>
      </div>
    </div></div>
  </div>
</form>
<?php
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
if ($user['ID']==1){
header('Location: http://localhost/сайт/admin.php');
} 
else {
// echo '<br>Пользователь неверно ввел логин или пароль';
}
}
}
?>
</body>
</html>