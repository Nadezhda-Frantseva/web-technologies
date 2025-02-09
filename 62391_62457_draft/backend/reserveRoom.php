<?php
    session_start();
    include "Db.php";
    $date = $_POST["date"];
    $start = $_POST["start_time"];
    $end = $_POST["end_time"];
    $email = $_SESSION["email"];
    $num = $_POST["answer"];
    $database = new DB();
    echo $num;
    $database->insertRoom($date, $start, $end, $email, $num);
?>