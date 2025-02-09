<?php
include "Db.php";
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $email = $_POST["email"];
    $passwd_1 = $_POST["password_1"];
    $passwd_2 = $_POST["password_2"];
    $type= $_POST["user-type"];
    $database = new DB();
    $database->insertUser($first_name, $last_name, $email, $passwd_1, $type);
?>