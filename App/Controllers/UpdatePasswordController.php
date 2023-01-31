
<?php
require "../App/Controllers/Connexion.php";
require "../App/Models/UserModel.php";
class UpdatePasswordController {

    /**
     * $usermodel; on va utiliser cette variable pour instancier la classe UserModel dans le controller
     */
    public $usermodel;

    public $email;
    public $wordkey;

    public $password;
    public $confirm_password;

    
    
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
            header("Location:/receive/forget?msg_email_empty&email=$this->email");
            exit();
        } 
        else{
            return false;
        }
    }

    /**
     * verifyWordkey(), pour vérifier les mot clés dans la bd
     */
    public function verifyWordKey() {
        if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["validate"])) {

        $this->email = $this->sanitaze($_POST["email"]);

        $this->emptyInputs();

        $this->usermodel = new UserModel();
        $res = $this->usermodel->verifyAccount($this->email);
        $this->result = $res[0]["user_id"];

        $count = count($res);
         if($count>0) {
                header("Location:/login-controller/$this->result/view-pass");
                exit();
        } 
        else {
            header("Location:/receive/forget?msg_email&email=$this->email");
            exit();
        }
    }
    }
    
    /**
     * verifyNewPassword(), pour modifier les mots de passe de l'utilisateur
     */
    public function verifyNewPassword() {

        if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["validate"])) {
        $this->password = $this->sanitaze($_POST["password"]);
        $this->confirm_password = $this->sanitaze($_POST["confirm_password"]);
        $this->wordkey = $this->sanitaze($_POST["wordkey"]);
        
        $this->user_id = $_POST["user_id"];

        $this->usermodel = new UserModel();
        
        $users = $this->usermodel->verifyUserId($this->user_id);
        $user = $users[0]["user_id"];
        
        $this->emptyInput();
        
        $this->password($this->password);
        $this->password($this->confirm_password);
        
        $this->verifyPass();

        if(count($users)>0) {
            $word = password_verify($this->wordkey, $users[0]["user_wordkey"]);
            if($word === true) {
                $this->usermodel->updatePasswordUser($this->password, $this->user_id);
                header("Location:/receive/login");
                exit();
            } else {
                header("Location:/login-controller/$user/view-pass?wordkey_incorrect");
                exit();
            }
        }else {
            header("Location:/login-controller/$user/view-pass?wordkey_error");
            exit();
        }
        
        }

    }
    
    /**
     * verifyPass(), pour vérifiez si les deux mot de passe que l'utilisateur entre sont corrects
     */
    public function verifyPass() {

        if($this->password !== $this->confirm_password) {
            header("Location:/login-controller/$this->user/view-pass?password_error");
            exit();
        }
        return false;

    }
      
    /**
     * emptyInput(), pour vérifiez si un des champs est vide
     */
    public function emptyInput() {
        
        $empty = $this->usermodel->verifyUserId($this->user_id);
        $this->user = $empty[0]["user_id"];

        if(empty($this->password) || empty($this->confirm_password)){
            header("Location:/login-controller/$this->user/view-pass?password_empty");
            exit();
        } 
        elseif(empty($this->wordkey)) {
            header("Location:/login-controller/$this->user/view-pass?wordkey_empty");
            exit();
        }
            else{
            return false;
        }

    }
    
    /**
     * passWord(), format des mots de passe qu'on accepte
     */
    public function passWord($data) {

        $empty = $this->usermodel->verifyUserId($this->user_id);
        $this->user = $empty[0]["user_id"];

        if(preg_match("/^[a-zA-Z-\@]+/i", $data) && strlen($data) >= 8) {
            return true;
        } 
        
        else {
            header("Location:/login-controller/$this->user/view-pass?not_format");
            exit();
        }

    }

}