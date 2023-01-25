
<?php
require "../App/Controllers/Connexion.php";
require "../App/Models/LikesModel.php";

class LikeController {

    public $likesmodel;

    public $book_id;
    public $user_id;

    public function insertLikes() {
        if(isset($_POST["book_id"])) {
            $this->book_id = $_POST["book_id"];
            $this->user_id = $_POST["user_id"];

            $this->likesmodel = new LikesModel();
            $array = $this->likesmodel->verifySelect($this->book_id, $this->user_id);
            $count = count($array);

            if($count>0) {
                $this->likesmodel->deleteLikes($this->book_id, $this->user_id);
                $result = $this->likesmodel->selectCount($this->book_id);
                $result = trim($result[0][0]);
                echo $result;
                exit;
            } else {
                $this->likesmodel->insertLikes($this->book_id, $this->user_id);
                $result = $this->likesmodel->selectCount($this->book_id);
                $result = trim($result[0][0]);
                echo $result;
                exit;
            }
        }
    }

}

