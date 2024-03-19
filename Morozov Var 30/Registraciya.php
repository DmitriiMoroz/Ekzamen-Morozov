<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Клуб собакаводов</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body class="container">
<?php
$host='localhost';
$db='klyb_sobakovodov';
$user='root';
$password='';


$link=mysqli_connect($host,$user,$password,$db) or die("Ошибка".mysqli_error($link));
    if(isset ($_POST['Familia']) && isset ($_POST['Ima']) && isset($_POST['Otchestvo']) && isset ($_POST['Login']) && isset ($_POST['Parol'])&& isset ($_POST['Telefon'])){
    $Fam=$_POST['Familia'];
    $Ima=$_POST['Ima'];
    $Otchestvo=$_POST['Otchestvo'];
    $Log=$_POST['Login'];
    $password = $_POST['Parol'];
    $tel = $_POST['Telefon'];
    if($Fam && $Ima && $Otchestvo && $Log && $password && $tel){
        $query = "insert into hozyain(Familia,Ima,Otchestvo,Login,Parol,Telefon) values('$Fam', '$Ima', '$Otchestvo','$Log', '$password', '$tel')";
        $result = mysqli_query($link, $query) or die ("Ошибка".mysqli_error($link));
        header("Location: Avtorizaciya.php");
}
        
        }
        
?>
<div class="form-group">
    <div>
        <h1 class=""><span class=""></span></h1>
    </div>
    <h1 class="">Регистрация</h1>
    <div class="">
        <form class="" method="POST">
            <div class="">
            <input type="text" class="" name="Familia" placeholder="Фамилия" pattern="[А-Яа-яЁё\s]+" minlength="3"  maxlength="150" required="">
            </div>
            <div class="">
                <input type="text" class="" name="Ima" placeholder="Имя" pattern="[А-Яа-яЁё\s]+" minlength="3" maxlength="150"  required="">
            </div>
            <div class="">
                <input type="text" class="" name="Otchestvo" placeholder="Отчество" pattern="[А-Яа-яЁё\s]+" minlength="3" maxlength="150" required="">
            </div>
            <div class="">
                <input type="text" class="" name="Login" placeholder="Логин" pattern=".*@gmail.com*." title="Пожалуйста, указывайте @gmail.com в адресе электронной почты" minlength="3" maxlength="50" required="">
            </div>
            <div class="">
                <input type="text" class="" name="Parol" placeholder="Пароль" minlength="6" maxlength="12" required="">
            </div>
            <div class="">
                <input type="text" class="" name="Telefon" placeholder="Телефон" minlength="6" maxlength="12" required="">
            </div>
            <input type="submit" class="input" href="Avtori.php" value="Зарегистрироваться" class="submit">
            </form>
    </div>
</div>
</body>
</html>

