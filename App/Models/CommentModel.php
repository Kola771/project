<?php

/**
 * class CommentModel pour faire toutes les requêtes liées à la table commments de la bd
 */
class CommentModel extends Connexion {

    public $comment;
    public $user_id;
    public $book_id;
    public $created_at;

    public function insertComment($comment, $user_id, $book_id, $created_at) {
        
      $conn = $this->connect();

      $this->comment = $comment;
      $this->user_id = $user_id;
      $this->book_id = $book_id;
      $this->created_at = $created_at;

      /**
       * $sql, pour les requêtes vers la base de données
       */
      $sql = "INSERT INTO `freek`.comments VALUES(NULL, :comment, :user_id, :book_id, :created_at, NULL)";
      
      /**
       * $stmt, pour recupérer la requête préparée
       */
      $stmt = $conn->prepare($sql);
      $stmt->execute([
          ":comment" => $this->comment,
          ":user_id" => $this->user_id,
          ":book_id" => $this->book_id,
          ":created_at" => $this->created_at
      ]);
    }

    public function selectAll() {
        
        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT `comments`.comment_comment, `users`.user_username, `users`.user_image, `comments`.created_at
        FROM comments
        INNER JOIN users ON `comments`.user_id = `users`.user_id;";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->query($sql);
        $result = $stmt->fetchAll();
        return $result;
    }

}