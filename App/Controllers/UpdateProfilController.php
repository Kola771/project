
<?php
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
    public $updated_at;

    
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

    
    public function updateUserInfo() {

        $this->firstname = $this->sanitaze($_POST["firstname"]);
        $this->lastname = $this->sanitaze($_POST["lastname"]);
        $this->email = $this->sanitaze($_POST["email"]);
        $this->user_username = $this->sanitaze($_POST["username"]);
        
        //Eléments de l'image
        $this->picture_name = $_FILES["user_image"]["name"];
        $this->picture_tmpname = $_FILES["user_image"]["tmp_name"];
        $this->picture_size = $_FILES["user_image"]["size"];
        $this->picture_error = $_FILES["user_image"]["error"];

        //Heure de la modification
        $this->updated_at = date('Y-d-m h:i:s');
        $this->usermodel = new UserModel();
        
        session_start();
        $_SESSION["firstname"] = $this->firstname;
        $_SESSION["lastname"] = $this->lastname;
        $_SESSION["email"] = $this->email;
        $_SESSION["username"] = $this->user_username;
        $_SESSION["user_image"] = $file;
        
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

                    move_uploaded_file($this->picture_tmpname, '../public/ressources/assets/medias-users/'.$file);

                    $this->usermodel->updateUser($this->firstname, $this->lastname, $this->user_username, $this->email, $file, $this->updated_at);
                    
                    // echo "Image prise en charge";
                    header("Location:/receive/profil");
                    exit();

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