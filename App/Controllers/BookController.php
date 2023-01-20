
<?php
require "../App/Controllers/Connexion.php";
require "../App/Models/BookModel.php";
require "../App/Models/UserModel.php";
require "../App/Models/ChapterModel.php";
require "../App/Models/CommentModel.php";

class BookController {

    /**
     * $bookmodel; on va utiliser cette variable pour instancier la classe BookModel dans le controller
     */
    public $bookmodel;

    /**
     * $chaptermodel; on va utiliser cette variable pour instancier la classe ChapterModel dans le controller
     */
    public $chaptermodel;

    /**
     * $usermodel; on va utiliser cette variable pour instancier la classe UserModel dans le controller
     */
    public $usermodel;

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
            //récupération de l'extension de l'image
            $tabExtension = pathinfo($this->image_book_name, PATHINFO_EXTENSION);
            $extension = strtolower($tabExtension);
            $extensions = ['jpg', 'png', 'jpeg', 'gif'];
            $maxSize = 4000000;
        
        if(in_array($extension, $extensions)) {

            if($this->image_book_size <= $maxSize) {
                
                if($this->image_book_error == 0) {

                    $uniqueName = uniqid('book-image-', true);
                    // uniqid génère quelque chose comme ca : book-image-63b85c9a42aac7.70071232

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

        if(preg_match("/^mangas-/i", $data) || preg_match("/^comics-/i", $data) || preg_match("/^books-/i", $data)) {

            if(preg_match("/\d+/i", $data)) {
                header("Location: /admin/receive/create-book?format_error_num&name_book=$this->name_book&ref_book=$this->ref_book");
                exit();
            }

            if(preg_match("/\@/i", $data)) {
                header("Location: /admin/receive/create-book?format_error_char&name_book=$this->name_book&ref_book=$this->ref_book");
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
    public function verifyAll() {
        
        $this->bookmodel = new BookModel();
        $array = $this->bookmodel->verifyAll();
        return $array;
    }

    /**
     * verifyAllDesc(), affiche tous les livres de la bd du plus grand au plus petit 
     */
    public function verifyAllDesc() {
        
        $this->bookmodel = new BookModel();
        $array = $this->bookmodel->verifyAllDesc();
        return $array;
    }

    /**
     * verifyAllBook(), pour afficher tous les livres de la bd
     */
    public function verifyAllBook() {
        
        $this->bookmodel = new BookModel();
        $array = $this->bookmodel->verifyAllBook();
        return $array;
    }

    /**
     * verifyAllUsers(), pour afficher tous les utilisateurs de la bd
     */
    public function verifyAllUsers() {
        
        $this->usermodel = new UserModel();
        $array = $this->usermodel->verifyAllUsers();
        return $array;
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
     * verifyAllDistinctChapter(), affiche tous les chapîtres d'un livre grâce aux informations qui se trouvent dans l'url
     */
    public function verifyAllDistinctChapter() {

        $url = $_SERVER["QUERY_STRING"];
        preg_match("/\/(?<book_id>[a-zA-Z-\-]+)\//i", $url, $matches);
        $book_id = $matches["book_id"];
        $this->chaptermodel = new ChapterModel();
        $array = $this->chaptermodel->verifyAllDistinctChapter($book_id);
        if(count($array)>0) {
            return $array;
        } else {
            return $array = [];
        }

    }

    /**
     * verifyAllDistinctChapters(), affiche tous les chapîtres d'un livre 
     */
    public function verifyAllDistinctChapters() {

        $this->chaptermodel = new ChapterModel();
        $array = $this->chaptermodel->verifyAllDistinctChapters();
        if(count($array)>0) {
            return $array;
        } else {
            return $array = [];
        }

    }

    /**
     * temporaire_moins(), pour afficher que les éléments récemments créés
     */
    public function temporaire_moins($array) {
        $tableau = [];
        foreach($array as $key => $values) {

            //je transforme en tableau la date de création du chapitre
            $explode= explode(" ", $values["created_at"]);

            //date de création
            $date1 = $explode[0]; 

            //date aujourd'hui
            $date2 = date("Y-m-d");

            $date1=date_create($date1);
            $date2=date_create($date2);

            //différence entre la date aujourd'hui et la date de création
            $diff=date_diff($date1,$date2);

            //la différence en jour entre la date aujourd'hui et la date de création
            $difference = $diff->format("%a");

            if($difference <= 30) {
                array_push($tableau, $array[$key]);
            }
        }
            return $tableau;
    }

    /**
     * temporaire_more(), pour afficher que les éléments créés datants
     */
    public function temporaire_more($array) {
        $tableau = [];
        foreach($array as $key => $values) {

            //je transforme en tableau la date de création du chapitre
            $explode= explode(" ", $values["created_at"]);

            //date de création
            $date1 = $explode[0]; 

            //date aujourd'hui
            $date2 = date("Y-m-d");

            $date1=date_create($date1);
            $date2=date_create($date2);

            //différence entre la date aujourd'hui et la date de création
            $diff=date_diff($date1,$date2);

            //la différence en jour entre la date aujourd'hui et la date de création
            $difference = $diff->format("%a");

            if($difference > 30) {
                $tableau = $array;
            }
        }
            return $tableau;
    }

    /**
     * verifyAllChapter(), affiche le chapître d'un livre grâce aux informations qui se trouvent dans l'url
     */
    public function verifyAllChapter() {

        $url = $_SERVER["QUERY_STRING"];
        preg_match("/\/(?<number>\d+)\/(?<book_id>[a-zA-Z-\-]+)\//i", $url, $matches);
        $number = $matches["number"];
        $book_id = $matches["book_id"];
        $this->chaptermodel = new ChapterModel();
        $array = $this->chaptermodel->verifyAllChapter($number, $book_id);
        if(count($array)>0) {
            return $array;
        } else {
            header("Location:/receive/home");
            exit();
        }

    }

    /**
     * verifyAllChapters(), affiche le chapître d'un livre 
     */
    public function verifyAllChapters() {

        $this->chaptermodel = new ChapterModel();
        $array = $this->chaptermodel->verifyAllChapters();
        if(count($array)>0) {
            return $array;
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
            $book_id = $_POST["remettre"];
            $this->bookmodel = new BookModel();
            $this->bookmodel->updateStatusInside($book_id);
            
            header("Location:/admin/receive/gestion");
            exit();
        }

        if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["attente"])) {
            $book_id = $_POST["attente"];
            $this->bookmodel = new BookModel();
            $this->bookmodel->updateStatusInside($book_id);
            
            header("Location:/admin/receive/gestion");
            exit();
        }

    }

    /**
     * deleteBook(), pour supprimer une oeuvre
     */
    public function deleteBook() {
        if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["delete"])) {
            $book_id = $_POST["delete"];

            $this->bookmodel = new BookModel();
            $this->commentmodel = new CommentModel();
            $this->chaptermodel = new ChapterModel();

            $array = $this->bookmodel->verify($book_id);

            unlink('../public/ressources/assets/Medias-book/'.$array[0]["book_image"]);

            $array1 = $this->chaptermodel->verifyChapterBook($book_id);

            for($i=0; $i<count($array1); $i++) {

                if(preg_match("/^mangas/i", $array1[$i]["book_id"])) {

                    unlink('../public/ressources/assets/medias-chapters/medias-mangas/'.$array1[$i]["chapter_image"]);

                } 
                elseif(preg_match("/^comics/i", $array1[$i]["book_id"])) {

                    unlink('../public/ressources/assets/medias-chapters/medias-comics/'.$array1[$i]["chapter_image"]);

                } 

            }

            $this->bookmodel->deleteBook($book_id);
            
            $this->commentmodel->deleteCommentBook($book_id);

            $this->chaptermodel->deleteBook($book_id);

            header("Location:/admin/receive/gestion");
            exit();
        }
    }

    /**
     * selectAllComment(), pour afficher tous les commentaires des utilisateurs
     */
    public function selectAllComment() {
        $this->commentmodel = new CommentModel();
        $array = $this->commentmodel->selectAll();
        return $array;
    }

    /**
     * searchBook(), pour recherche une oeuvre à partir de son nom
     */
    public function searchBook() {
        if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["recherche"])) {
            $name_book =  $_POST["search"];
            
            $this->bookmodel = new BookModel();

            $array = $this->bookmodel->verifyName($name_book);
            $count = count($array);
            if($count>0) {
                $book_id = $array[0]["book_id"];
                $book_id;
    
                header("Location:/book/$book_id/show-book");
                exit();
            } else {
                header("Location:/receive/error-search");
                exit();
            }
        }
    }

    /**
     * verifyLikesBook(), pour vérifier si il y a un livre dans la bd ayant déjà ses éléments là
     */
    public function verifyLikesBook() {
        
        $url = $_SERVER["QUERY_STRING"];
        preg_match("/\/(?<likes>[a-zA-Z-\-]+)\//i", $url, $matches);
        $likes = $matches["likes"];
        
        $this->bookmodel = new BookModel();

        $array = $this->bookmodel->verifyLikesBook($likes);
        $count = count($array);
        if($count>0) {
            return $array;
        } 
    }

    /**
     * commentCount(), pour afficher le nombre de commentaires a une oeuvre
     */
    public function commentCount() {
        
        $this->commentmodel = new CommentModel();
        
        $array = $this->commentmodel->commentCount();

        return $array;
    }

    public function viewBook() {
        $array = $this->verifyUrlAll();
        $array0 = $this->selectAllComment();
        $array1 = $this->verifyAllDistinctChapter();
        $array2 = $this->verifyAll();

        require_once("../App/Views/Users/book.php");
    }
    
    public function viewHome() {
        $array = $this->verifyAll();

        require_once("../App/Views/Users/home.php");
    }

    public function viewChapter() {
        
        $array = $this->verifyAllChapter();
        $array1 = $this->verifyAllDistinctChapter();
    
        $data = $array[0]["book_id"];
        if(preg_match("/^mangas/i", $data, $match) || preg_match("/^comics/i", $data, $match) || preg_match("/^books/i", $data, $match)) {
            $data = $match[0];
        }

        require_once("../App/Views/Users/show.php");
    }
    
    public function viewProfil() {

        $array0 = $this->selectAllComment();
        
        require_once("../App/Views/Users/profil.php");
    }

    public function viewShowElement() {

    $array = $this->verifyLikesBook();

    require_once('../App/Views/Users/show-element.php');
    }

}