<!DOCTYPE html>  
<html>
<head>
	<title>FlightPool/Регистрация</title>
	<link rel="stylesheet" type="text/css" href="css/style2.css">
    <link rel="icon" href="images/icons8-бумажный-самолетик-50.png"  type="image/png">
</head>
<body  background="images/samolety-krasivye-kartinki-49.jpg">
	</head>
    <body>
        <main>  
<div class='box'>
      <div class='box-login-tab'></div>
      <div class='box-login-title'>
        <div class='i i-login'></div><h2>Онлайн-регистрация</h2>
      </div>
      <form  method="POST" action="">
      <div class='box-login'>
        <div class='fieldset-body'>
              <p class='field'>
            <label>Фамилия</label>
            <input class="forma" type='text' name="surname"/>
          </p>
          <p class='field'>
            <label>Имя</label>
            <input class="forma" type='text' name="username" />
          </p>
          <p class='field'>
            <label>Пароль</label>
            <input class="forma" type='password' name="password" />
          </p>
          <p class='field'>
            <label>Телефон</label>
            <input class="forma" type="tel" name="tel"/>
          </p>
          <p class='field'>
            <label>Email</label>
            <input class="forma" name="email"/>
          </p>
           <input  type="submit" value="Зарегистрироваться"/>
        </div>
    </div>
</div>
  </div></form>
  <?php 
  include("connect.php");
  if (!empty($_POST['surname']) && !empty($_POST['username'])&& !empty($_POST['password'])&& !empty($_POST['tel'])&& !empty($_POST['email']))
{
      $surname= $_POST["surname"];
      $username= $_POST["username"];
      $password= $_POST["password"];
      $tel = $_POST["tel"];
      $email = $_POST["email"];
      mysqli_query($db, "INSERT INTO flightpool.users (name, surname, phone, password, Email) VALUES ( '$username','$surname','$tel','$password', '$email')");
}
?>    
<ul> <div class='box'style="margin-top: 270px;">
      <div class='box-login-tab'>
      <form action="login.php">
      <div class='box-login'>
      <input  type="submit" value="Войти"/>
        </div>
    </div></div></div></div>
</form><ul>
	</body>
</html>
