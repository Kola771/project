
<?php
require "../App/Models/UserModel.php";
class LoginController {

    /**
     * $usermodel; on va utiliser cette variable pour instancier la classe UserModel dans le controller
     */
    public $usermodel;

    public $email;
    public $password;

    
    /**
     * register(); pour récupérer les données de l'utilisateur et agit en fonction
     */
    public function login() {
        if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["validate"])) {
            session_start();
        $this->email = $this->sanitaze($_POST["email"]);
        $this->password = $this->sanitaze($_POST["password"]);
        $this->emptyInputs();
        $this->verifyEmail();
        $this->verifyAccount();
        }
    }
    
    /**
     * verifyControl(), vérifie s'il existe un utilisateur dans la bd et compte tenu du résultat ajoute ou non dans la bd
     */
    public function verifyAccount() {
        $this->usermodel = new UserModel();
        $res = $this->usermodel->verifyAccount($this->email);
        $count = count($res);
         if($count>0) {
            $password = password_verify($this->password, $res[0]["user_password"]);

            if($password === true) {
                $_SESSION["firstname"] = $res[0]["user_firstname"];
                $_SESSION["lastname"] = $res[0]["user_lastname"];
                $_SESSION["email"] = $res[0]["user_email"];
                $_SESSION["username"] = $res[0]["user_username"];
                $_SESSION["password"] = $res[0]["user_password"];
                $_SESSION["wordkey"] = $res[0]["user_wordkey"];
                $_SESSION["user_role"] = $res[0]["user_role"];
                $_SESSION["created_at"] = $res[0]["created_at"];
                header("Location:/receive/home");
                exit();
             }
             else {
                header("Location:/receive/login?msg_password=password_error&email=$this->email");
                exit();
            }

          } 
          else {
            header("Location:/receive/login?msg_not_found_user=not_found_user&email=$this->email");
            exit();
          }
      }
    
    /**
     * sanitaze(); pour les espacements et les injections de codes
     */
    public function sanitaze($data) {
        $reg = preg_replace("/\s+/", " ", $data);
        $reg = preg_replace("/^\s*/", "", $reg);
        $reg = htmlspecialchars($reg);
        $reg = stripslashes($reg);
        $data = $reg;
        return $data;
    }

    
    /**
     * emptyInputs(), pour vérifiez si un des champs est vide
     */
    public function emptyInputs() {

        if(empty($this->email)){
            header("Location:/receive/login?msg_email_empty=email_error&email=$this->email");
            exit();
        } 

        if(empty($this->password)){
            header("Location:/receive/login?msg_password_empty=email_error&email=$this->email");
            exit();
        } 
            else{
            return false;
        }
    }

    /**
     * verifyEmail(), pour vérifiez si l'email suis les normes pré-requises
     */
    public function verifyEmail() {
        if (!filter_var($this->email, FILTER_VALIDATE_EMAIL)) {
            header("Location:/receive/login?msg=email_error&email=$this->email");
            exit();
        }
        return false;
    }

    public function displayUrlInfo() {
        $url = $_SERVER["QUERY_STRING"];
        
        preg_match("/\/(?<username>\w+\d+)\//i", $url, $matches);
        $username = $matches["username"];
        $this->usermodel = new UserModel();
        $array = $this->usermodel->verifyUsername($username);
        return $array;
    }

    public function displayInfo($username) {
        
        $this->usermodel = new UserModel();
        $array = $this->usermodel->verifyUsername($username);
        return $array;
    }


}