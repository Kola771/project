<?php

class Bookmodel extends Connexion {

    /**
     * $conn, variable pour instancier la classe Connexion et pour faire la connexion à la bd avec la fonction connect()
     * 
     * $conn = $this->connect();
     */
    public $conn;

    public $number;
    public $ref_book;
    public $name_book;
    public $book_image;
    public $desc_book;
    public $status;
    public $created_at;

    /**
     * verify(), pour vérifier si il y a un livre dans la bd ayant déjà ses éléments là
     */
    public function verify($ref_book) {
        $this->ref_book = $ref_book;

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT * FROM `freek`.books WHERE book_id = ?;";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([$this->ref_book]);
        $result = $stmt->fetchAll();
        return $result;
    }

    /**
     * verifyRefOrName(), pour vérifier si il y a un livre dans la bd ayant déjà ce genre de dimunitif ou de nom
     */
    public function verifyRefOrName($ref_book, $name_book) {
        $this->ref_book = $ref_book;
        $this->name_book = $name_book;

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT * FROM `freek`.books WHERE book_id = ? OR book_name = ?;";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([$this->ref_book, $this->name_book]);
        $result = $stmt->fetchAll();
        return $result;
    }

    /**
     * verifyAll(), affiche tous les livres de la bd qui sont lignes
     */
    public function verifyAll() {

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT * FROM `freek`.books WHERE book_status = 'En ligne'";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->query($sql);
        $result = $stmt->fetchAll();
        return $result;
    }

    /**
     * verifyAllBooks(), affiche tous les livres de la bd
     */
    public function verifyAllBook() {

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT * FROM `freek`.books";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->query($sql);
        $result = $stmt->fetchAll();
        return $result;
    }

    /**
     * verifyAllDistinctChapter(), affiche tous les titres, numéros... d'un/des chapîtres d'un livre
     */
    public function verifyAllDistinctChapter($ref_book) {
        $this->ref_book = $ref_book;

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT DISTINCT `chapters`.chapter_title, `chapters`.chapter_number, `books`.book_id, `books`.book_name FROM `books`, `chapters` WHERE `books`.book_id = `chapters`.book_id AND `books`.book_id = ?;";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([$this->ref_book]);
        $result = $stmt->fetchAll();
        return $result;
    }

    /**
     * verifyAllDistinctChapters(), affiche tous les titres d'un/des chapîtres d'un livre
     */
    public function verifyAllDistinctChapters() {

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT DISTINCT `chapters`.chapter_title, `chapters`.created_at FROM `chapters`;";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->query($sql);
        $result = $stmt->fetchAll();
        return $result;
    }

    /**
     * verifyAllChapter(), affiche le chapître d'un livre 
     */
    public function verifyAllChapter($number, $ref_book) {
        $this->number = $number;
        $this->ref_book = $ref_book;

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT `chapters`.chapter_title, `chapters`.chapter_number, `chapters`.chapter_image, `chapters`.chapter_text, `books`.book_id, `books`.book_name, `books`.book_status FROM `books`, `chapters` WHERE `books`.book_id = `chapters`.book_id AND `chapters`.chapter_number = ? AND `books`.book_id = ?;";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([$this->number, $this->ref_book]);
        $result = $stmt->fetchAll();
        return $result;
    }

    
    
    /**
     * insertBook(), pour insérer dans la bd des livres
     */
    public function insertBook($ref_book, $name_book, $book_image, $desc_book, $status, $created_at) {

        $conn = $this->connect();
  
        $this->ref_book = $ref_book;
        $this->name_book = $name_book;
        $this->book_image = $book_image;
        $this->desc_book = $desc_book;
        $this->status = $status;
        $this->created_at = $created_at;
  
        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "INSERT INTO `freek`.books VALUES(:reference, :name, :image, :desc_book, :status, :created_at)";
        
        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([
            ":reference" => $this->ref_book,
            ":name" => $this->name_book,
            ":image" => $this->book_image,
            ":desc_book" => $this->desc_book,
            ":status" => $this->status,
            ":created_at" => $this->created_at
        ]);
  
    }

    /**
     * updateBook(), pour modifier un livre
     */
    public function updateBook($ref_book, $name_book, $book_image, $desc_book, $status, $book_id) {

        $conn = $this->connect();
  
        $this->ref_book = $ref_book;
        $this->name_book = $name_book;
        $this->book_image = $book_image;
        $this->desc_book = $desc_book;
        $this->status = $status;

         /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "UPDATE `books` SET `book_id`=:reference,`book_name`=:name,`book_image`=:image,`book_description`=:desc_book,`book_status`=:status WHERE `book_id`=:id;";
        
        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([
            ":reference" => $this->ref_book,
            ":name" => $this->name_book,
            ":image" => $this->book_image,
            ":desc_book" => $this->desc_book,
            ":status" => $this->status,
            ":id" => $book_id
        ]);
  
    }

    /**
     * updateStatusRemove(), pour modifier le status du livre en retirer
     */
    public function updateStatusRemove($book_id) {

        $conn = $this->connect();
  
        $this->ref_book = $book_id;
        $this->status = "Retirer";

         /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "UPDATE `freek`.books SET  book_status = :status WHERE book_id = :reference";
        
        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([
            ":reference" => $this->ref_book,
            ":status" => $this->status
        ]);
  
    }

    /**
     * updateStatusInside(), pour modifier le status du livre en en ligne
     */
    public function updateStatusInside($book_id) {

        $conn = $this->connect();
  
        $this->ref_book = $book_id;
        $this->status = "En ligne";

         /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "UPDATE `freek`.books SET  book_status = :status WHERE book_id = :reference";
        
        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([
            ":reference" => $this->ref_book,
            ":status" => $this->status
        ]);
  
    }

    /**
     * deleteBook(), pour supprimer un livre
     */
    public function deleteBook($book_id) {

        $conn = $this->connect();
  
        $this->ref_book = $book_id;

         /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "DELETE FROM `books` WHERE `books`.book_id = :reference;";
        
        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([
            ":reference" => $this->ref_book
        ]);
  
    }

}

?>