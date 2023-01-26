<?php

/**
 * class CommentModel pour faire toutes les requêtes liées à la table commments de la bd
 */
class LikesModel extends Connexion {

    public $user_id;
    public $book_id;

    /**
     * insertLikes(), pour l'insertion des likes dans la base de données d'un utilisateur vis-à-vis d'une oeuvre
     */
    public function insertLikes($book_id, $user_id) {
          
      $conn = $this->connect();

      $this->user_id = $user_id;
      $this->book_id = $book_id;

      /**
       * $sql, pour les requêtes vers la base de données
       */
      $sql = "INSERT INTO `freek`.likes VALUES(NULL, :book_id, :user_id)";
      
      /**
       * $stmt, pour recupérer la requête préparée
       */
      $stmt = $conn->prepare($sql);
      $stmt->execute([
          ":user_id" => $this->user_id,
          ":book_id" => $this->book_id
      ]);
    }

    /**
     * verifySelect(), pour vérifier si utilisateur a déjà aimé cette oeuvre
     */
    public function verifySelect($book_id, $user_id) {
    
      $conn = $this->connect();

      $this->user_id = $user_id;
      $this->book_id = $book_id;

      /**
       * $sql, pour les requêtes vers la base de données
       */
      $sql = "SELECT * FROM `freek`.likes WHERE book_id = ? AND user_id = ?";
      
      /**
       * $stmt, pour recupérer la requête préparée
       */
      $stmt = $conn->prepare($sql);
      $stmt->execute([$this->book_id, $this->user_id]);
      $result = $stmt->fetchAll();
      return $result;
    }

    /**
     * selectCount(), pour compter le nombre de personnes ayant aimé une oeuvre
     */
    public function selectCount($book_id) {
        $conn = $this->connect();

        $this->book_id = $book_id;

     /**
     * $sql, pour les requêtes vers la base de données
     */
      $sql = "SELECT COUNT(book_id) FROM `freek`.likes WHERE book_id = ?";
      
      /**
       * $stmt, pour recupérer la requête préparée
       */
      $stmt = $conn->prepare($sql);
      $stmt->execute([$this->book_id]);
      $result = $stmt->fetchAll();
      return $result;
    }

    /**
     * deleteLikes(), pour supprimer le like qu'un utilisateur a mis pour une oeuvre
     */
    public function deleteLikes($book_id, $user_id) {
        $conn = $this->connect();

        $this->book_id = $book_id;
        $this->user_id = $user_id;

     /**
     * $sql, pour les requêtes vers la base de données
     */
      $sql = "DELETE FROM `likes` WHERE book_id = ? AND user_id = ?";
      
      /**
       * $stmt, pour recupérer la requête préparée
       */
      
       $stmt = $conn->prepare($sql);
       $stmt->execute([$this->book_id, $this->user_id]);
    }

    /**
     * deleteLikesBook(), pour supprimer une oeuvre ayant un like
     */
    public function deleteLikesBook($book_id) {
      $conn = $this->connect();

      $this->book_id = $book_id;
    
    /**
     * $sql, pour les requêtes vers la base de données
     */
    $sql = "DELETE FROM `likes` WHERE book_id = ?";
      
    /**
     * $stmt, pour recupérer la requête préparée
     */
    
     $stmt = $conn->prepare($sql);
     $stmt->execute([$this->book_id]);
    }

}