
<?php
require "../App/Controllers/Connexion.php";
require "../App/Models/UserModel.php";
require "../App/Models/CommentModel.php";

class CommentController {

    /**
     * $usermodel; on va utiliser cette variable pour instancier la classe UserModel dans le controller
     */
    public $usermodel;

    /**
     * $commentmodel; on va utiliser cette variable pour instancier la classe CommentModel dans le controller
     */
    public $commentmodel;
    public $comment;
    public $comment_id;

    
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
     * insertComment(), pour insérer des commentaires dans la bd
     */
   public function insertComment() {
    
    if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["validate"])) {

        $this->comment = $this->sanitaze($_POST["comments"]);
        $this->comment = nl2br($this->comment);
        
        $book_id = $_POST["book_id"];
        
        $username = $_POST["username"];
        
        $created_at = date("Y-m-d h:i:s");
        
        if(empty($this->comment)){
            header("Location: /book-controller/$book_id/view-book");
            exit();
        } 

        $this->usermodel = new UserModel();
        $array = $this->usermodel->verifyUsername($username);
        $user_id = $array[0]["user_id"];

        $this->commentmodel = new CommentModel();
        $this->commentmodel->insertComment($this->comment, $user_id, $book_id, $created_at);

        header("Location: /book-controller/$book_id/view-book");
        exit();

    }

   }

   /**
    * deleteComment(), pour supprimer un commentaire de la bd
    */
   public function deleteComment() {

    if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["validate"])) {

        $this->comment_id = $_POST["comment_id"];

        $book_id = $_POST["book_id"];

        $this->commentmodel = new CommentModel();
        $this->commentmodel->deleteComment($this->comment_id);

        header("Location:/book-controller/$book_id/view-book");
        exit();

    }

   }

}

