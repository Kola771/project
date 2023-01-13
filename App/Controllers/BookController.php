
<?php
require "../App/Controllers/Connexion.php";
require "../App/Models/BookModel.php";
require "../App/Models/CommentModel.php";

class BookController {

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
    public $created_at;

    
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
            header("Location:/admin/receive/create-book?msg_empty=emptyinput&name_book=$this->name_book&ref_book=$this->ref_book");
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
     * validateForm(), pour la validation et l'insertion dans la bd des books
     */
    public function validateForm() {
        
        if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["validate"])) {
        $this->status = $_POST["status"];
        $this->name_book = $this->sanitaze($_POST["name_book"]);
        $this->ref_book = $_POST["ref_book"];

        $this->image_book_name = $_FILES["image_book"]["name"];
        $this->image_book_tmpname = $_FILES["image_book"]["tmp_name"];
        $this->image_book_error = $_FILES["image_book"]["error"];
        $this->image_book_size = $_FILES["image_book"]["size"];

        $this->desc_book = $this->sanitaze($_POST["desc_book"]);
        $this->desc_book = nl2br($this->desc_book);
        $this->created_at = date("Y-m-d h:i:s");
        
        $this->emptyInputs();
        
        $this->name_book = $this->ucWords($this->name_book);
        
        $this->formatBook($this->ref_book);
        
        $this->bookmodel = new BookModel();

        $array = $this->bookmodel->verifyRefOrName($this->ref_book, $this->name_book);

        $count = count($array);

        
        if($count>0) {
            
            $name = $array[0]["book_name"];
            $reference = $array[0]["book_id"];
            if(preg_match("/$name/i", $this->name_book)) {
                header("Location:/admin/receive/create-book?msg_book_name_exist& name_book=$this->name_book&ref_book=$this->ref_book");
                exit();
            }

            if(preg_match("/$reference/i", $this->ref_book)) {
                header("Location:/admin/receive/create-book?msg_book_ref_exist& name_book=$this->name_book&ref_book=$this->ref_book");
                exit();
            }

        } 
        else {

            $tabExtension = pathinfo($this->image_book_name, PATHINFO_EXTENSION);
            $extension = strtolower($tabExtension);
            $extensions = ['jpg', 'png', 'jpeg', 'gif'];
            $maxSize = 4000000;
        
        if(in_array($extension, $extensions)) {

            if($this->image_book_size <= $maxSize) {
                
                if($this->image_book_error == 0) {

                    $uniqueName = uniqid('book-image-', true);
                    // uniqid génère quelque chose comme ca : img-63b85c9a42aac7.70071232

                    $file = $uniqueName.".".$extension;
                    move_uploaded_file($this->image_book_tmpname, '../public/ressources/assets/Medias-book/'.$file);

                    $this->bookmodel->insertBook($this->ref_book, $this->name_book, $file, $this->desc_book, $this->status, $this->created_at);

                    header("Location:/admin/receive/gestion");
                    exit();
                   
                } 
                else {
                    echo "Image non prise en charge";
                    exit();
                }
            } 
            else {
                echo "La taille de l'image est élevée !!!";
                exit();
            }
        } 
        else {
            echo "Ce n'est pas la bonne extension. Veuillez choisir une très bonne image !!!";
            exit();
        }

    }
        }
        
    } 

    /**
     * formatBook(), pour les formats de nom de livre que nous acceptons
     */
    public function formatBook($data) {

        if(preg_match("/^mangas-/i", $data) || preg_match("/^comics-/i", $data) || preg_match("/^book-/i", $data)) {

            if(preg_match("/\d+/i", $data)) {
                header("Location: /admin/receive/create-book?format_error_num&name_book=$this->name_book&ref_book=$this->ref_book");
                exit();
            }

            if(preg_match("/\@/i", $data)) {
                header("Location: /admin/receive/create-book?format_error&name_book=$this->name_book&ref_book=$this->ref_book");
                exit();
            }

            $reg = preg_replace("/\s+/", "", $data);
            $data = $reg;
            return $data;
        }
        else {
            header("Location:/admin/receive/create-book?msg_format_error& name_book=$this->name_book&ref_book=$this->ref_book");
            exit();
        }

    }

    /**
     * verifyAll(), pour afficher tous les livres de la bd ayant pour status : En ligne
     */
    public function home() {
        
        $this->bookmodel = new BookModel();
        $array = $this->bookmodel->verifyAll();
        // return $array;

        require "../App/Views/Users/home.php";
    }

    /**
     * verifyAll(), pour afficher tous les livres de la bd
     */
    public function verifyAllBook() {
        
        $this->bookmodel = new BookModel();
        $array = $this->bookmodel->verifyAllBook();
        // return $array;
        require "../App/Views/Admin/gestion.php";
    }

    /**
     * verifyUulAll(), pour récupérer de la bd des données grâce aux informations qui se trouvent dans l'url
     */
    public function verifyUrlAll() {

        $url = $_SERVER["QUERY_STRING"];
        preg_match("/\/(?<bookname>[a-zA-Z-\-]+)\//i", $url, $matches);
        $bookname = $matches["bookname"];
        $this->bookmodel = new BookModel();
        $array = $this->bookmodel->verify($bookname);
        if(count($array)>0) {
            return $array;
        } else {
            header("Location: /receive/error404");
            exit();
        }

    }

    /**
     * updateBookStatus(), pour modifier le status du livre
     */
    public function updateBookStatus() {

        if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["retire"])) {
            $book_id = $_POST["retire"];
            $this->bookmodel = new BookModel();
            $this->bookmodel->updateStatusRemove($book_id);
            
            header("Location:/admin/receive/gestion");
            exit();
        }

        if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["remettre"])) {
            echo $book_id = $_POST["remettre"];
            $this->bookmodel = new BookModel();
            $this->bookmodel->updateStatusInside($book_id);
            
            header("Location:/admin/receive/gestion");
            exit();
        }

        if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["attente"])) {
            echo $book_id = $_POST["attente"];
            $this->bookmodel = new BookModel();
            $this->bookmodel->updateStatusInside($book_id);
            
            header("Location:/admin/receive/gestion");
            exit();
        }

    }

    
    public function selectAllComment() {
        $this->commentmodel = new CommentModel();
        $array = $this->commentmodel->selectAll();
        return $array;
    }


}