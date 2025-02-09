<?php 
    class Db
    {
        private $connection;
        public function __construct()
        {
            $dbhost = "localhost";
            $dbName = "project";
            $userName = "root";
            $userPassword = "";
            $this->connection = new PDO("mysql:host=$dbhost;dbname=$dbName", $userName, $userPassword,
        [
        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,

        ]);
        }
        public function getConnection()
        {
            return $this->connection;
        }

        public function insertUser($first_name, $last_name, $email, $passwd_1, $type) {
            $conn = $this->getConnection();
            $hash_password = password_hash($passwd_1, PASSWORD_DEFAULT);
            $sql = "INSERT INTO users (firstName, lastName, email, password, type) VALUES (?, ?, ?, ?, ?)"; 
            $query = $conn->prepare($sql)->execute([$first_name, $last_name, $email, $hash_password, $type]); 
            if ($query === TRUE) {
                echo "You register successfully !";
                header("Location: ../frontend/html/login_form.html");
                exit();
            } else {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
        }
        public function insertRoom($date, $start, $end, $lectorEmail, $num) {
            $conn = $this->getConnection();
            $sql = "INSERT INTO rooms (date, start, end, lectorEmail, roomNum) VALUES (?, ?, ?, ?, ?)"; 
            echo $num;
            $query = $conn->prepare($sql)->execute([$date, $start, $end, $lectorEmail, $num]); 
            if ($query === TRUE) {
                echo "success";
            } else {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
        }
        public function checkUser($email, $passwd) {
            $conn = $this->getConnection();
            $sql = "SELECT password FROM users WHERE email = ?"; 
            $query = $conn->prepare($sql);
            $query->execute([$email]); 
            //print_r("fffg");
            $password_hash = $query->fetch(PDO::FETCH_ASSOC)['password'];
            $are_password_match = password_verify($passwd, $password_hash);
            return $are_password_match;
        }

        public function checkUserType($email) {
            $conn = $this->getConnection();
            $sql = "SELECT type FROM users WHERE email = ?"; 
            $query = $conn->prepare($sql);
            $query->execute([$email]); 
            $type = $query->fetch(PDO::FETCH_ASSOC)['type'];
            return $type;
        }
    }
?>
<!--"..." . password_hash($passwd_1) . ")"-->