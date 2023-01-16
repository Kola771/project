<?php

/**
 * class CommentModel pour faire toutes les requêtes liées à la table commments de la bd
 */
class ChapterModel extends Connexion {

    public $number;
    public $name;
    public $image;
    public $text;
    public $book_id;
    public $created_at;

    
    /**
     * verify(), pour vérifier si il y a un chapitre portant ce nom
     */
    public function verify($name) {
        $this->name = $name;

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT * FROM `freek`.chapters WHERE chapter_title = ?;";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([$this->name]);
        $result = $stmt->fetchAll();
        return $result;
    }

    
    /**
     * verifyNum(), pour vérifier si un livre a déjà un chapître portant ce numéro
     */
    public function verifyNum($number, $book_id) {
        $this->number = $number;
        $this->book_id = $book_id;

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT * FROM `freek`.chapters WHERE chapter_number = :num AND book_id = :book_id;";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([
            ":num" => $this->number,
            ":book_id" => $this->book_id
        ]);
        $result = $stmt->fetchAll();
        return $result;
    }

    public function insertChapter($number, $name, $image, $text, $book_id, $created_at) {
        
        $conn = $this->connect();
  
        $this->number = $number;
        $this->name = $name;
        $this->image = $image;
        $this->text = $text;
        $this->book_id = $book_id;
        $this->created_at = $created_at;
  
        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "INSERT INTO `freek`.chapters VALUES(NULL, :number, :name, :image, :text, :book_id, :created_at)";
        
        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([
            ":number" => $this->number,
            ":name" => $this->name,
            ":image" => $this->image,
            ":text" => $this->text,
            ":book_id" => $this->book_id,
            ":created_at" => $this->created_at
        ]);
      }

    public function insertChapterBooks($number, $name, $text, $book_id, $created_at) {
        
        $conn = $this->connect();
  
        $this->number = $number;
        $this->name = $name;
        $this->text = $text;
        $this->book_id = $book_id;
        $this->created_at = $created_at;
  
        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "INSERT INTO `freek`.chapters VALUES(NULL, :number, :name, NULL, :text, :book_id, :created_at)";
        
        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([
            ":number" => $this->number,
            ":name" => $this->name,
            ":text" => $this->text,
            ":book_id" => $this->book_id,
            ":created_at" => $this->created_at
        ]);
      }
    
      /**
       * deleteBook(), pour supprimer de la bd les chapitres ayant pour clé étrangère cet id
       */
      public function deleteBook($id) {
        
        $conn = $this->connect();

        $this->book_id = $id;
        
        /**
         * $sql, pour les requêtes vers la base de données pour supprimer le chapitre ayant cet id
         */
        $sql = "DELETE FROM `chapters` WHERE book_id = ?";

        $stmt = $conn->prepare($sql);
        $stmt->execute([$this->book_id]);
      }
    
      /**
       * deleteChapter(), pour supprimer de la bd les chapitres à partir du titre
       */
      public function deleteChapter($name) {
        
        $conn = $this->connect();

        $this->name = $name;
        
        /**
         * $sql, pour les requêtes vers la base de données pour supprimer le chapitre ayant ce titre
         */
        $sql = "DELETE FROM `chapters` WHERE chapter_title = ?";

        $stmt = $conn->prepare($sql);
        $stmt->execute([$this->name]);
      }

}