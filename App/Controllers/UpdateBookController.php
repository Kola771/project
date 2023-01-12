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
    public $desc_book;
    public $update_at;

    
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


    public function updateBook() {
        if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["validate"])) {
            $this->status = $_POST["status"];
            $this->name_book = $this->sanitaze($_POST["name_book"]);
            $this->ref_book = $_POST["ref_book"];
            $ref_book0 = $_POST["ref_book0"];
            $this->image_book_name = $_FILES["image_book"]["name"];
            $this->image_book_tmpname = $_FILES["image_book"]["tmp_name"];
            $this->image_book_error = $_FILES["image_book"]["error"];
            $this->image_book_size = $_FILES["image_book"]["size"];
            $this->desc_book = $this->sanitaze($_POST["desc_book"]);
            $this->update_at = date('Y-d-m h:i:s');
            
        
            $tabExtension = pathinfo($this->image_book_name, PATHINFO_EXTENSION);
            $extension = strtolower($tabExtension);
            $extensions = ['jpg', 'png', 'jpeg', 'gif'];
            $maxSize = 4000000;
            
            if(in_array($extension, $extensions)) {

                if($this->image_book_size <= $maxSize) {
                    
                    if($this->image_book_error == 0) {
    
                        $this->bookmodel = new BookModel();

                        $array = $this->bookmodel->verifyRefOrName($this->ref_book, $this->name_book);

                        $array0 = $this->bookmodel->verify($ref_book0);

                        $lenght = count($array);
                        $lenght0 = count($array0);

                        if($lenght0>0) {
                            if($array0[0]["book_id"] === $array[0]["book_id"]) {
                                if($lenght>0) {
                                    if($array0[0]["book_name"] === $array[0]["book_name"]) {

                                    }
                                }
                            }

                        } else {
                            echo "bad";
                            exit();
                        }


            echo "<pre>";
            var_dump($array);
            echo "</pre>";

            echo "<pre>";
            var_dump($array0);
            echo "</pre>";
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


}