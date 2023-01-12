<?php

/**
 * class CommentModel pour faire toutes les requêtes liées à la table commments de la bd
 */
class CommentModel extends Connexion {

    public $comment;
    public $comment_id;
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

    /**
     * selectAll(), pour selectionner de la bdd tous les commentaires qui ont lien avec un livre donné
     */
    public function selectAll() {
        
        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT `comments`.comment_id, `comments`.comment_comment, `users`.user_username, `users`.user_role, `users`.user_image, `books`.book_id, `comments`.created_at
        FROM comments
        INNER JOIN users ON `comments`.user_id = `users`.user_id
        INNER JOIN books ON `comments`.book_id = `books`.book_id;";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->query($sql);
        $result = $stmt->fetchAll();
        return $result;
    }

    /**
     * deleteComment(), pour supprimer de la bdd le commentaire ayant cet id
     */
    public function deleteComment($comment_id) {
        
        $conn = $this->connect();

        $this->comment_id = $comment_id;

        /**
         * $sql, pour les requêtes vers la base de données pour supprimer le commentaire ayant cet id
         */
        $sql = "DELETE FROM `comments` WHERE comment_id = ?";

        $stmt = $conn->prepare($sql);
        $stmt->execute([$this->comment_id]);
    }

}