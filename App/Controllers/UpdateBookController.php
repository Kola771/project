<?php
require "../App/Controllers/Connexion.php";
require "../App/Models/BookModel.php";


class UpdateBookController {


    /**
     * $bookmodel; on va utiliser cette variable pour instancier la classe BookModel dans le controller
     */
    public $bookmodel;

    //déclaration des variables
    public $status;
    public $name_book;
    public $ref_book;
    public $image_book;
    public $image;
    public $desc_book;
    public $update_at;

    
    /**
     * sanitaze(); pour les espacements et les injections de codes
     */
    public function sanitaze($data) {
        $reg = trim($data);
        $reg = htmlspecialchars($reg);
        $reg = stripslashes($reg);
        $data = $reg;
        return $data;
    }

     
    /**
     * emptyInputs(), pour vérifiez si un des champs est vide
     */
    public function emptyInputs() {

        if(empty($this->name_book) || empty($this->ref_book) || empty($this->desc_book)){
            $ref_book0 = $_POST["ref_book0"];
            header("Location:/book/$ref_book0/update-book?msg_empty");
            exit();
        } 
            else{
            return false;
        }
    }
       
    /**
     * ucWords(); pour transformer les premières lettres en majuscule
     */
    public function ucWords($data) {
        $data = ucwords($data, " ");
        return $data;
    }

    /**
     * updateBook(), pour modifier un livre
     */
    public function updateBook() {

        if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["validate"])) {

            $this->status = $_POST["status"];
            $this->name_book = $this->sanitaze($_POST["name_book"]);
            $this->ref_book = $_POST["ref_book"];

            $ref_book0 = $_POST["ref_book0"];
            $this->image = $_POST["image"];

            $this->image_book_name = $_FILES["image_book"]["name"];
            $this->image_book_tmpname = $_FILES["image_book"]["tmp_name"];
            $this->image_book_error = $_FILES["image_book"]["error"];
            $this->image_book_size = $_FILES["image_book"]["size"];

            $this->desc_book = $this->sanitaze($_POST["desc_book"]);
            $this->desc_book = nl2br($this->desc_book);

            $this->emptyInputs();

            $this->formatBook($this->ref_book);
            
            $this->name_book = $this->ucWords($this->name_book);

            //récupération de l'extension de l'image
            $tabExtension = pathinfo($this->image_book_name, PATHINFO_EXTENSION);
            $extension = strtolower($tabExtension);
            $extensions = ['jpg', 'png', 'jpeg', 'gif'];
            $maxSize = 4000000;
            
            if(in_array($extension, $extensions)) {

                if($this->image_book_size <= $maxSize) {
                    
                    if($this->image_book_error == 0) {
    
                        $this->bookmodel = new BookModel();

                        $array = $this->bookmodel->verify($this->ref_book);

                        $array0 = $this->bookmodel->verify($ref_book0);

                        $id = $array0[0]["book_id"];

                        $lenght = count($array);

                        if($lenght>0) {
                            if($id === $array[0]["book_id"]) {

                                    if($array0[0]["book_name"] === $this->name_book) {
                                        
                                        $uniqueName = uniqid('book-image-', true);
                                        // uniqid génère quelque chose comme ca : img-63b85c9a42aac7.70071232

                                        $file = $uniqueName.".".$extension;
                                        move_uploaded_file($this->image_book_tmpname, '../public/ressources/assets/Medias-book/'.$file);

                                        unlink("../public/ressources/assets/Medias-book/$this->image");

                                        $this->bookmodel->updateBook($this->ref_book, $this->name_book, $file, $this->desc_book, $this->status, $id);
                                        header("Location: /admin/receive/gestion");
                                        exit();
                                    }
                                    else {
                                         
                                        $uniqueName = uniqid('book-image-', true);
                                        // uniqid génère quelque chose comme ca : img-63b85c9a42aac7.70071232

                                        $file = $uniqueName.".".$extension;
                                        move_uploaded_file($this->image_book_tmpname, '../public/ressources/assets/Medias-book/'.$file);
                                        
                                        unlink("sources/assets/Medias-book/$this->image");
                                        
                                        $this->bookmodel->updateBook($this->ref_book, $this->name_book, $file, $this->desc_book, $this->status, $id);
                                        header("Location: /admin/receive/gestion");
                                        exit();
                                    }
                            } else {
                                echo "Vous ne pouvez pas faire cette modification";
                                exit();
                            }

                        } else {
                            
                            if($array0[0]["book_name"] === $this->name_book) {
                                 
                                $uniqueName = uniqid('book-image-', true);
                                // uniqid génère quelque chose comme ca : img-63b85c9a42aac7.70071232

                                $file = $uniqueName.".".$extension;
                                move_uploaded_file($this->image_book_tmpname, '../public/ressources/assets/Medias-book/'.$file);

                                unlink("../public/ressources/assets/Medias-book/$this->image");

                                $this->bookmodel->updateBook($this->ref_book, $this->name_book, $file, $this->desc_book, $this->status, $id);
                                header("Location: /admin/receive/gestion");
                                exit();
                            } else {
                                 
                                $uniqueName = uniqid('book-image-', true);
                                // uniqid génère quelque chose comme ca : img-63b85c9a42aac7.70071232

                                $file = $uniqueName.".".$extension;
                                move_uploaded_file($this->image_book_tmpname, '../public/ressources/assets/Medias-book/'.$file);

                                unlink("../public/ressources/assets/Medias-book/$this->image");

                                $this->bookmodel->updateBook($this->ref_book, $this->name_book, $file, $this->desc_book, $this->status, $id);
                                header("Location: /admin/receive/gestion");
                                exit();
                            }
                        
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
                echo "Image non chargée";
                exit();
            }
            }
    }

    
    /**
     * formatBook(), pour les formats de nom de livre que nous acceptons
     */
    public function formatBook($data) {
        $ref_book0 = $_POST["ref_book0"];

        if(preg_match("/^mangas-/i", $data) || preg_match("/^comics-/i", $data) || preg_match("/^books-/i", $data)) {

            if(preg_match("/\d+/i", $data)) {
                
                header("Location:/book/$ref_book0/update-book?format_error");
                exit();
            }

            if(preg_match("/\@/i", $data)) {
                
                header("Location:/book/$ref_book0/update-book?format_error");
                exit();
            }

            $reg = preg_replace("/\s+/", "", $data);
            $data = $reg;
            return $data;
        }
        else {
            
                header("Location:/book/$ref_book0/update-book?format_error");
            exit();
        }

    }


}