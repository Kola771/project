
<?php
require "../App/Controllers/Connexion.php";
require "../App/Models/UserModel.php";
class RegisterController {

    /**
     * $usermodel; on va utiliser cette variable pour instancier la classe UserModel dans le controller
     */
    public $usermodel;

    public $firstname;
    public $lastname;
    public $email;
    public $user_username;
    public $user_image;
    public $password;
    public $confirm_password;
    public $wordkey;
    public $user_role;
    public $created_at;

    
    /**
     * register(); pour récupérer les données de l'utilisateur et agit en fonction
     */
    public function register() {
        if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["validate"])) {
        session_start();

        $this->firstname = $this->sanitaze($_POST["firstname"]);
        $this->lastname = $this->sanitaze($_POST["lastname"]);
        $this->email = $this->sanitaze($_POST["email"]);
        $this->user_username = $this->sanitaze($_POST["username"]);
        $this->password = $this->sanitaze($_POST["password"]);
        $this->confirm_password = $this->sanitaze($_POST["confirm_password"]);
        $this->wordkey = $this->sanitaze($_POST["word_key"]);
        $this->user_role = 1;
        $this->created_at = date('Y-d-m h:i:s');

        $this->firstname = $this->ucWords($this->firstname);
        $this->lastname = $this->capitalLetter($this->lastname);
        $this->user_username = $this->ucWords($this->user_username);

        $this->emptyInputs();
        
        $this->userName($this->user_username);

        $this->passWord($this->password);
        $this->passWord($this->confirm_password);

        $this->verifyPassword();
        
        $this->wordKey($this->wordkey);

        $this->verifyEmail();

        $this->verifyControl();
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
     * ucWords(); pour transformer les premières lettres en majuscule
     */
    public function ucWords($data) {
        $data = ucwords($data, " ");
        return $data;
    }
    
    /**
     * capitalLetter(); pour transformer toutes les lettres en majuscule
     */
    public function capitalLetter($data) {
        $data = strtoupper($data);
        return $data;
    }

    /**
     * userName(), format des noms d'utilisateur qu'on accepte
     */
    public function userName($data) {

        if(preg_match("/^[a-zA-Z-\@]+[\d]+/i", $data)) {
            return true;
        }
        
        else {
            header("Location:/receive/register?msg_username=username_error&firstname=$this->firstname&lastname=$this->lastname&email=$this->email&username=$this->user_username&word_key=$this->wordkey");
            exit();
        }

    }

    /**
     * wordKey(), format des mots clés qu'on accepte
     */
    public function wordKey($data) {

        if(preg_match("/^[a-zA-Z-\@]+/i", $data) && strlen($data) == 12) {
            return true;
        } 
        
        else {
            header("Location:/receive/register?msg_wordkey=username_error&firstname=$this->firstname&lastname=$this->lastname&email=$this->email&username=$this->user_username&word_key=$this->wordkey");
            exit();
        }

    }

    /**
     * passWord(), format des mots de passe qu'on accepte
     */
    public function passWord($data) {

        if(preg_match("/^[a-zA-Z-\@]+/i", $data) && strlen($data) >= 8) {
            return true;
        } 
        
        else {
            header("Location:/receive/register?msg_password=password_error&firstname=$this->firstname&lastname=$this->lastname&email=$this->email&username=$this->user_username&word_key=$this->wordkey");
            exit();
        }

    }

    /**
     * verifyControl(), vérifie s'il existe un utilisateur dans la bd et compte tenu du résultat ajoute ou non dans la bd
     */
    public function verifyControl() {

      //Instanciation de la classe UserModel
      $this->usermodel = new UserModel();
      $res = $this->usermodel->verify($this->email, $this->user_username, $this->wordkey);
      $count = count($res);

       if($count>0) {

        if($this->email == $res[0]["user_email"]) {
            header("Location:/receive/register?msg_email=email_exist&firstname=$this->firstname&lastname=$this->lastname&email=$this->email&username=$this->user_username&word_key=$this->wordkey");
            exit();
        }

        elseif($this->user_username == $res[0]["user_username"]) {
            header("Location:/receive/register?msg_user_username=username_exist&firstname=$this->firstname&lastname=$this->lastname&email=$this->email&username=$this->user_username&word_key=$this->wordkey");
            exit();
        }

        else {
            header("Location:/receive/register?msg_user_wordkey=user_wordkey_exist&firstname=$this->firstname&lastname=$this->lastname&email=$this->email&username=$this->user_username&word_key=$this->wordkey");
            exit();
        }

        } 

        else {
            $insert = $this->usermodel->insertUser($this->firstname, $this->lastname, $this->user_username, $this->email, $this->password, $this->wordkey, $this->user_role, $this->created_at);
            $_SESSION["firstname"] = $this->firstname;
            $_SESSION["lastname"] = $this->lastname;
            $_SESSION["email"] = $this->email;
            $_SESSION["username"] = $this->user_username;
            $_SESSION["password"] = $this->password;
            $_SESSION["wordkey"] = $this->wordkey;
            $_SESSION["user_role"] = $this->user_role;
            $_SESSION["created_at"] = $this->created_at;
            header("Location:/receive/home");
            exit();
        }

    }

    
    /**
     * emptyInputs(), pour vérifiez si un des champs est vide
     */
    public function emptyInputs() {

        if(empty($this->firstname) || empty($this->lastname) || empty($this->email) || empty($this->user_username) || empty($this->password) || empty($this->confirm_password) || empty($this->wordkey)){
            header("Location:/receive/register?msg_empty=emptyinput&firstname=$this->firstname&lastname=$this->lastname&email=$this->email&username=$this->user_username&word_key=$this->wordkey");
            exit();
        } 
            else{
            return false;
        }
    }

    /**
     * verifyPassword(), pour vérifiez si les deux mot de passe que l'utilisateur entre sont corrects
     */
    public function verifyPassword() {

        if ($this->password !== $this->confirm_password) {
            header("Location:/receive/register?msg_password_error=password_error&firstname=$this->firstname&lastname=$this->lastname&email=$this->email&username=$this->user_username&word_key=$this->wordkey");
            exit();
       } 
       return false;

    }

    /**
     * verifyEmail(), pour vérifiez si l'email suis les normes pré-requises
     */
    public function verifyEmail() {
        if (!filter_var($this->email, FILTER_VALIDATE_EMAIL)) {
            header("Location:/receive/register?msg=email_error&firstname=$this->firstname&lastname=$this->lastname&email=$this->email&username=$this->user_username&word_key=$this->wordkey");
            exit();
        }
        return false;
        
    }

}