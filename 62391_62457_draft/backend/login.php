<?php
session_start();
    include "Db.php";
    $email = $_POST["email"];
    $_SESSION["email"] = $email;
    //session_register('email');
    //$_SESSION['email']=$_POST["email"];
    $passwd = $_POST["password"];
    $database = new DB();
    if($database->checkUser($email, $passwd)) {
        echo "You are logged in.";
        $SESSION_["email"] = $email;
        $type = $database->checkUserType($email);
        if($type == 'lector') {
            header("Location: ../frontend/html/mainPage.html");
            exit();
        }
        else if($type == 'student')  {
            header("Location: ../frontend/html/schedule.html");
            exit();
        }
    }
    else {
        echo "First you have to register !";
    }
?>