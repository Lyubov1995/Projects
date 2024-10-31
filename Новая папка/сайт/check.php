<?
// Скрипт проверки
// Соединямся с БД
include("connect.php");
if (isset($_COOKIE['ID']) and isset($_COOKIE['hash']))
{
    $query = mysqli_query($link, "SELECT *,INET_NTOA(user_ip) AS user_ip FROM users WHERE user_id = '".intval($_COOKIE['ID'])."' LIMIT 1");
    $userdata = mysqli_fetch_assoc($query);
    if(($userdata['user_hash'] !== $_COOKIE['hash']) or ($userdata['ID'] !== $_COOKIE['ID'])
 or (($userdata['user_ip'] !== $_SERVER['REMOTE_ADDR'])  and ($userdata['user_ip'] !== "0")))
    {
        setcookie("ID", "", time() - 3600*24*30*12, "/");
        setcookie("hash", "", time() - 3600*24*30*12, "/", null, null, true); // httponly !!!
        print "Хм, что-то не получилось";
    }
    else
    {
        print "Привет, ".$userdata['tel'].". Всё работает!";
    }
}
else
{
    print "Включите куки";
}
?>