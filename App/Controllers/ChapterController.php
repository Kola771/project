
<?php
require "../App/Controllers/Connexion.php";
require "../App/Models/ChapterModel.php";

class ChapterController {

    /**
     * $chaptermodel; on va utiliser cette variable pour instancier la classe ChapterModel dans le controller
     */
    public $chaptermodel;

    //déclaration des variables
    public $number;
    public $name;
    public $image;
    public $text;
    public $book_id;
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

        if(empty($this->number) || empty($this->name) || empty($this->text)){
            header("Location:/admin/book-controller/create-chapter-admin?msg_empty");
            exit();
        } 
            else{
            return false;
        }
    }

    /**
     * addChapter(), pour ajouter des chapitres de type mangas
     */
    public function addChapter() {
        if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["validate"])) {

        $this->number = $this->sanitaze($_POST["number"]);
        $this->name = $this->sanitaze($_POST["name"]);
        $this->book_id = $this->sanitaze($_POST["name_mangas"]);

        $this->file_name = $_FILES["file"]["name"];
        $this->file_tmpname = $_FILES["file"]["tmp_name"];
        $this->file_error = $_FILES["file"]["error"];
        $this->file_size = $_FILES["file"]["size"];

        $count = count($this->file_name);

        $this->text = $this->sanitaze($_POST["description"]);
        $this->text = nl2br($this->text);
        $this->created_at = date("Y-m-d h:i:s");
        $this->emptyInputs();

        $this->chaptermodel = new ChapterModel();
        $array = $this->chaptermodel->verify($this->name);
        $lenght = count($array);

        if($lenght>0) {
                echo "Un chapître portant ce nom existe déjà !!!";
                exit;
            } 
            else {
                $array = $this->chaptermodel->verifyNum($this->number, $this->book_id);
                
                $lenght = count($array);
                
                if($lenght>0) {
                    echo "Un chapître portant ce numéro existe déjà !!!";
                    exit;
                } 
                else { 
                    try {
                        for($i=0; $i<$count; $i++) {

                            //récupération de l'extension de l'image
                            $tabExtension = pathinfo($this->file_name[$i], PATHINFO_EXTENSION);
                            $extension = strtolower($tabExtension);
                            $extensions = ['jpg', 'png', 'jpeg', 'gif'];
                            $maxSize = 8000000;
                            
                            if(in_array($extension, $extensions)) {
    
                                if($this->file_size[$i] <= $maxSize) {
    
                                    if($this->file_error[$i] == 0) {
                        
                                        $uniqueName = uniqid('mangas-image-', true);
                                        // uniqid génère quelque chose comme ca : mangas-63b85c9a42aac7.70071232
                        
                                        $file = $uniqueName.".".$extension;
                                        move_uploaded_file($this->file_tmpname[$i], '../public/ressources/assets/medias-chapters/medias-mangas/'.$file);
                                        
                                        $this->chaptermodel->insertChapter($this->number, $this->name, $file, $this->text, $this->book_id, $this->created_at);
                                        
                        
                                    } else {
                                        echo "Images non téléchargées \n";
                                        exit();
                                    }
                        
                                } else{
                                    echo "La taille de l'image est très élevée \n";
                                    exit();
                                }
                            } else {
                                echo "Mauvaise extension \n";
                                exit();
                            }
                        }
                    } catch(PDOException $e) {
                        die('Erreur! trop d\'images:'.$e->getMessage());
                    }
                    
                    header("Location: /admin/book-controller/create-chapter-admin?validate");
                    exit();
            }
            }

        }
    }

    
    /**
     * addChapterComics(), pour ajouter des chapitres de type comics
     */
    public function addChapterComics() {
        if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["validate"])) {

        $this->number = $this->sanitaze($_POST["number"]);
        $this->name = $this->sanitaze($_POST["name"]);
        $this->book_id = $this->sanitaze($_POST["name_comics"]);

        $this->file_name = $_FILES["file"]["name"];
        $this->file_tmpname = $_FILES["file"]["tmp_name"];
        $this->file_error = $_FILES["file"]["error"];
        $this->file_size = $_FILES["file"]["size"];

        $count = count($this->file_name);

        $this->text = $this->sanitaze($_POST["description"]);
        $this->text = nl2br($this->text);
        $this->created_at = date("Y-m-d h:i:s");
        $this->emptyInputs();

        $this->chaptermodel = new ChapterModel();
        $array = $this->chaptermodel->verify($this->name);
        $lenght = count($array);

        if($lenght>0) {
                echo "Un chapître portant ce nom existe déjà !!!";
                exit;
            } 
            else {
                $array = $this->chaptermodel->verifyNum($this->number, $this->book_id);
                
                $lenght = count($array);
                
                if($lenght>0) {
                    echo "Un chapître portant ce numéro existe déjà !!!";
                    exit;
                } 
                else { 

                    try {
                    for($i=0; $i<$count; $i++) {

                        //récupération de l'extension de l'image
                        $tabExtension = pathinfo($this->file_name[$i], PATHINFO_EXTENSION);
                        $extension = strtolower($tabExtension);
                        $extensions = ['jpg', 'png', 'jpeg', 'gif'];
                        $maxSize = 8000000;

                        if(in_array($extension, $extensions)) {
                            
                            if($this->file_size[$i] <= $maxSize) {

                                if($this->file_error[$i] == 0) {
                    
                                    $uniqueName = uniqid('comics-image-', true);
                                    // uniqid génère quelque chose comme ca : mangas-63b85c9a42aac7.70071232
                    
                                    $file = $uniqueName.".".$extension;
                                    move_uploaded_file($this->file_tmpname[$i], '../public/ressources/assets/medias-chapters/medias-comics/'.$file);
                                    
                                    $this->chaptermodel->insertChapter($this->number, $this->name, $file, $this->text, $this->book_id, $this->created_at);
                                    
                    
                                } else {
                                    echo "Images non téléchargées \n";
                                    exit();
                                }
                    
                            } else{
                                echo "La taille de l'image est très élevée \n";
                                exit();
                            }
                        } else {
                            echo "Mauvaise extension \n";
                            exit();
                        }
                    }
                } catch(PDOException $e) {
                    die('Erreur! trop d\'images:'.$e->getMessage());
                }
                    header("Location: /admin/book-controller/create-chapter-admin?validate");
                    exit();
            }
            }

        }
    }

    
    /**
     * addChapterBooks(), pour ajouter des chapitres de type books
     */
    public function addChapterBooks() {
        if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["validate"])) {

        $this->number = $this->sanitaze($_POST["number"]);
        $this->name = $this->sanitaze($_POST["name"]);
        $this->book_id = $this->sanitaze($_POST["name_books"]);

        $this->text = $this->sanitaze($_POST["description"]);
        $this->text = nl2br($this->text);
        $this->created_at = date("Y-m-d h:i:s");
        $this->emptyInputs();

        $this->chaptermodel = new ChapterModel();
        $array = $this->chaptermodel->verify($this->name);
        $lenght = count($array);


        
        if($lenght>0) {
                echo "Un chapître portant ce nom existe déjà !!!";
                exit;
            } 
            else {
                $array = $this->chaptermodel->verifyNum($this->number, $this->book_id);
                
                $lenght = count($array);
                
                if($lenght>0) {
                    echo "Un chapître portant ce numéro existe déjà !!!";
                    exit;
                } 
                else { 
                    $this->chaptermodel->insertChapterBooks($this->number, $this->name, $this->text, $this->book_id, $this->created_at);
                    header("Location: /admin/book-controller/create-chapter-admin?validate");
                    exit();
                }
            }

        }
    }

    /**
     * deleteChapter(), pour supprimer un/les chapitres
     */
    public function deleteChapter() {
        if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["delete"])) {
            $id = $_POST["id"];
            $title = htmlspecialchars($_POST["delete"]);

            $this->chaptermodel = new ChapterModel();
            $this->chaptermodel->deleteChapter($title);
            
            header("Location: /book-controller/$id/view-show-admin");
            exit();
        }
    }


}
