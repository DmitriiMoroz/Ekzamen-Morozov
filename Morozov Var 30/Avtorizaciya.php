<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Клуб собакаводов</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript">
        function validateForm() {
            var login = document.forms["loginForm"]["Login"].value;
            var password = document.forms["loginForm"]["Parol"].value;

            if (login == "" || password == "") {
                alert("Пожалуйста, заполните все поля логина и пароля.");
                return false;
            }
        }
    </script>
</head>
<body class="container">
<?php
$host='localhost';
$db='klyb_sobakovodov';
$user='root';
$password='';
$log1="";
$pass1="";

$link=mysqli_connect($host,$user,$password,$db) or die("Ошибка".mysqli_error($link));
if(isset($_POST['Login']) && isset ($_POST['Parol'])){
    $Log = $_POST['Login'];
    $passwor = $_POST['Parol'];
    if(($Log=="")||($passwor==""))
			{
				
			}
            else{
$query = "select * from hozyain where Login='$Log' and Parol='$passwor'";
$result = mysqli_query($link, $query) or die("Ошибка " . mysqli_error($link)); 
		if($result) 
    while ($row = mysqli_fetch_assoc($result)) {
		
		$log1=$row['Login'];
		$pass1=$row['Parol'];
				
	}
	if(($log1!=$Log)&&($pass1!=$passwor))
	{
        header("Location: Registraciya.php");
	}
    else{
		    header("Location: Glavnaya.php");
		}
		
		}
    }
?>
<div class="">
    <div>
        <h1 class=""><span class=""></span></h1>
    </div>
    <h1 class="">Авторизация</h1>
    <div class="form-group">
        <form method="POST" name="loginForm" onsubmit="return validateForm()">
            <div class="">
                <input type="text" class="" name="Login" placeholder="Login" pattern=".*@gmail.com*." title="Пожалуйста, указывайте @gmail.com в адресе электронной почты" minlength="3" maxlength="50" required="">
            </div>
            <div class="">
                <input type="password" class="" name="Parol" placeholder="Password" minlength="6" maxlength="12" required="">
            </div>
            <button type="submit" class=""><b>Вход</b></button>
            <p class=""><small>У вас есть аккаунт?</small></p>
            <a class="" href="Registraciya.php"><small>Зарегистрироваться</small></a>
        </form>
    </div>
</div>
</body>
</html>