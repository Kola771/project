<?php

class Bookmodel extends Connexion {

    /**
     * $conn, variable pour instancier la classe Connexion et pour faire la connexion à la bd avec la fonction connect()
     * 
     * $conn = $this->connect();
     */
    public $conn;

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
     * verifyLikesBook(), pour vérifier si il y a un livre dans la bd ayant déjà ses éléments là
     */
    public function verifyLikesBook($ref_book) {
        $this->ref_book = $ref_book;

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT * FROM `books` WHERE book_id like '$this->ref_book%'";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->query($sql);
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
     * verifyName(), pour vérifier si il y a un livre dans la bd ayant déjà ce genre de nom
     */
    public function verifyName($name_book) {
        $this->name_book = $name_book;

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT * FROM `freek`.books WHERE book_name = ?;";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([$this->name_book]);
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
     * verifyAllDesc(), affiche tous les livres de la bd du plus grand au plus petit 
     */
    public function verifyAllDesc() {

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT * FROM `freek`.books ORDER BY created_at DESC LIMIT 5";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->query($sql);
        $result = $stmt->fetchAll();
        return $result;
    }

    /**
     * verifyAllBook(), affiche tous les livres de la bd
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
     * verifyLimitOffsetBook(), affiche 8 oeuvres de la bd suivant un ordre donné
     */
    public function verifyLimitOffsetBook($number) {

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT * FROM `books` LIMIT 5 OFFSET $number";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->query($sql);
        $result = $stmt->fetchAll();
        return $result;
    }

    /**
     * division()
     */
    public function division() {
        
        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT * FROM `books`";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->query($sql);
        $result = $stmt->fetchAll();
        $result = count($result)/5;
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