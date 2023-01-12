
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


   public function insertComment() {
    
    if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["validate"])) {

        $this->comment = $_POST["comments"];

        $username = $_POST["username"];
        
        $this->usermodel = new UserModel();
        $array = $this->usermodel->verifyUsername($username);
        $user_id = $array[0]["user_id"];

        $book_id = $_POST["book_id"];

        $created_at = date('Y-d-m h:i:s');

        $this->commentmodel = new CommentModel();
        $this->commentmodel->insertComment($this->comment, $user_id, $book_id, $created_at);

        header("Location: /book/$book_id/show-book");
        exit();

    }

   }

   public function deleteComment() {

    if($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["validate"])) {

        $this->comment_id = $_POST["comment_id"];

        $book_id = $_POST["book_id"];

        $this->commentmodel = new CommentModel();
        $this->commentmodel->deleteComment($this->comment_id);

        header("Location:/book/$book_id/show-book");
        exit();

    }

   }

}