
<?php
require "../App/Controllers/Connexion.php";
require "../App/Models/UserModel.php";
class UpdateProfilController {

    /**
     * $usermodel; on va utiliser cette variable pour instancier la classe UserModel dans le controller
     */
    public $usermodel;

    public $firstname;
    public $lastname;
    public $email;
    public $user_username;
    public $user_image;
    public $image;
    public $user_id;
    public $user;

    
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

        $this->user_id = $_POST["user_id"];
        $this->usermodel = new UserModel();
        
        $empty = $this->usermodel->verifyUserId($this->user_id);
        $this->user = $empty[0]["user_username"];

        if(preg_match("/^[a-zA-Z-^\@]+[\d]+\$/i", $data)) {
            if(preg_match("/[\@]/i", $data)) {
                header("location:/receive/$this->user/update-profil?msg_userName=error username");
                exit();
            }
            return true;
        }
        
        else {
            header("location:/receive/$this->user/update-profil?msg_userName=error username");
            exit();
        }

    }

    /**
     * emptyInputs(), pour vérifiez si un des champs est vide
     */
    public function emptyInputs() {

        $this->user_id = $_POST["user_id"];
        $this->usermodel = new UserModel();
        
        $empty = $this->usermodel->verifyUserId($this->user_id);
        $this->user = $empty[0]["user_username"];

        if(empty($this->firstname)) {
            header("location:/receive/$this->user/update-profil?msg_firstname=error firstname");
            exit();
        } 

        if(empty($this->lastname)) {
            header("location:/receive/$this->user/update-profil?msg_lastname=error lastname");
            exit();
        } 

        if(empty($this->email)) {
            header("location:/receive/$this->user/update-profil?msg_email=error email");
            exit();
        } 
        else {
            return false;
        }
        
    }


    
    public function updateUserInfo() {

        if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["validate"])) {
            

        $this->firstname = $this->sanitaze($_POST["firstname"]);
        $this->lastname = $this->sanitaze($_POST["lastname"]);
        $this->email = $this->sanitaze($_POST["email"]);
        $this->user_username = $this->sanitaze($_POST["username"]);
        
        $this->user_id = $_POST["user_id"];
        $this->image = $_POST["image"];

        //Eléments de l'image
        $this->picture_name = $_FILES["user_image"]["name"];
        $this->picture_tmpname = $_FILES["user_image"]["tmp_name"];
        $this->picture_size = $_FILES["user_image"]["size"];
        $this->picture_error = $_FILES["user_image"]["error"];

        $this->usermodel = new UserModel();

        $this->firstname = $this->ucWords($this->firstname);
        $this->lastname = $this->capitalLetter($this->lastname);

        $this->emptyInputs();

        $this->userName($this->user_username);
        
        session_start();
        $_SESSION["firstname"] = $this->firstname;
        $_SESSION["lastname"] = $this->lastname;
        $_SESSION["email"] = $this->email;
        $_SESSION["username"] = $this->user_username;
        
        $tabExtension = pathinfo($this->picture_name, PATHINFO_EXTENSION);
        $extension = strtolower($tabExtension);
        $extensions = ['jpg', 'png', 'jpeg', 'gif'];
        $maxSize = 4000000;
        
        if(in_array($extension, $extensions)) {

            if($this->picture_size <= $maxSize) {
                
                if($this->picture_error == 0) {

                    $uniqueName = uniqid('img-', true);
                    // uniqid génère quelque chose comme ca : img-63b85c9a42aac7.70071232

                    $file = $uniqueName.".".$extension;
                    // $file = img-63b85c9a42aac7.70071232.jpg
                    $this->user_id = $_POST["user_id"];
                    $this->usermodel = new UserModel();
                    
                    $array = $this->usermodel->verifyUserId($this->user_id);
                    $array1 = $this->usermodel->verifyAccount($this->email);
                    $array2 = $this->usermodel->verifyUsername($this->user_username);

                    $lenght = count($array1);
                    $lenght1 = count($array2);
                    
                    if($lenght>0) {
                        if($array[0]["user_email"] === $array1[0]["user_email"]) {
                            if($lenght1>0) {
                                if($array[0]["user_username"] === $array2[0]["user_username"]) {
                                    move_uploaded_file($this->picture_tmpname, '../public/ressources/assets/medias-users/'.$file);

                                    unlink("../public/ressources/assets/medias-users/$this->image");

                                    $_SESSION["image"] = $file;

                                    $this->usermodel->updateUser($this->firstname, $this->lastname, $this->user_username, $this->email, $file, $this->user_id);
                                    
                                    // echo "Image prise en charge";
                                    header("Location:/receive/profil");
                                    exit();
                                 } else {
                                    echo "Vous ne pouvez pas faire cette modification car il existe déjà quelqu'un ayant déjà ce nom d'utilisateur que vous venez d'entrer !!!";
                                    exit();
                                 }
                            } else {
                                move_uploaded_file($this->picture_tmpname, '../public/ressources/assets/medias-users/'.$file);
                                $_SESSION["image"] = $file;

                                $this->usermodel->updateUser($this->firstname, $this->lastname, $this->user_username, $this->email, $file, $this->user_id);
                                
                                // echo "Image prise en charge";
                                header("Location:/receive/profil");
                                exit();
                             }
                        } else {
                            echo "Email existant !!!";
                            exit();
                        }
                    } 
                    
                    elseif($lenght1>0) {
                        if($array[0]["user_email"] === $array2[0]["user_email"]) {
                            if($array[0]["user_username"] === $array2[0]["user_username"]) {
                                move_uploaded_file($this->picture_tmpname, '../public/ressources/assets/medias-users/'.$file);

                                unlink("../public/ressources/assets/medias-users/$this->image");

                                $_SESSION["image"] = $file;

                                $this->usermodel->updateUser($this->firstname, $this->lastname, $this->user_username, $this->email, $file, $this->user_id);
                                
                                // echo "Image prise en charge";
                                header("Location:/receive/profil");
                                exit();
                             } else {
                                echo "Vous ne pouvez pas faire cette modification car il existe déjà quelqu'un ayant déjà ce nom d'utilisateur que vous venez d'entrer !!!";
                                exit();
                             }
                        } else {
                            echo "Vous ne pouvez pas faire cette modification car il existe déjà quelqu'un ayant déjà ces informations !!!";
                            exit();
                        }
                    } 
                    else {
                        move_uploaded_file($this->picture_tmpname, '../public/ressources/assets/medias-users/'.$file);
                        
                        unlink("../public/ressources/assets/medias-users/$this->image");
                        
                        $_SESSION["image"] = $file;

                        $this->usermodel->updateUser($this->firstname, $this->lastname, $this->user_username, $this->email, $file, $this->user_id);
                        
                        // echo "Image prise en charge";
                        header("Location:/receive/profil");
                        exit();
                    }

                } else {
                    echo "Image non prise en charge";
                    exit();
                }
            } else {
                echo "Taille élevée";
                exit();
            }
        } else {
            echo "Ce n'est pas la bonne extension";
            exit();
        }

    }

    }
    

}