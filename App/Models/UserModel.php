<?php
require "../App/Controllers/Connexion.php";

/**
 * class UserModel pour faire toutes les requêtes liées à la table users de la bd
 */
class UserModel extends Connexion {

    /**
     * $conn, variable pour instancier la classe Connexion et pour faire la connexion à la bd avec la fonction connect()
     * 
     * $conn = $this->connect();
     */
    public $conn;

    public $firstname;
    public $lastname;
    public $email;
    public $user_username;
    public $user_image;
    public $password;
    public $wordkey;
    public $updated_at;

    /**
     * verify(), pour vérifier si il y a un utilisateur dans la bd ayant déjà ses éléments là
     */
    public function verify($email, $user_username, $user_wordkey) {
        $this->email = $email;
        $this->user_username = $user_username;
        $this->user_wordkey = $user_wordkey;

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT * FROM `freek`.users WHERE user_email = ? OR user_username = ? OR user_wordkey = ?;";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([$this->email, $this->user_username, $this->user_wordkey]);
        $result = $stmt->fetchAll();
        return $result;
    }

    /**
     * verifyAccount(), pour vérifier si il y a un utilisateur dans la bd ayant déjà cet email
     */
    public function verifyAccount($email) {
        $this->email = $email;

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT * FROM `freek`.users WHERE user_email = ?;";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([$this->email]);
        $result = $stmt->fetchAll();
        return $result;
    }

    /**
     * verifyUsername(), pour vérifier si il y a un utilisateur dans la bd ayant déjà cet username
     */
    public function verifyUsername($user_username) {
        $this->user_username = $user_username;

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT * FROM `freek`.users WHERE user_username = ?;";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([$this->user_username]);
        $result = $stmt->fetchAll();
        return $result;
    }

    
    /**
     * insertUser(), pour insérer dans la bd des utilisateurs
     */
    public function insertUser($firstname, $lastname, $user_username, $email, $password, $wordkey, $user_role, $created_at) {

      $conn = $this->connect();

      $this->firstname = $firstname;
      $this->lastname = $lastname;
      $this->user_username = $user_username;
      $this->email = $email;
      $this->wordkey = $wordkey;
      $this->password = $password;
      $this->user_role = $user_role;
      $this->created_at = $created_at;

      /**
       * $sql, pour les requêtes vers la base de données
       */
      $sql = "INSERT INTO `freek`.users VALUES(NULL, :firstname, :lastname, :user_username, :email, :password, NULL, :wordkey, :user_role, :created_at, NULL)";
      
      /**
       * $stmt, pour recupérer la requête préparée
       */
      $stmt = $conn->prepare($sql);
      $stmt->execute([
         ":firstname" => $this->firstname,
          ":lastname" => $this->lastname,
          ":user_username" => $this->user_username,
          ":email" => $this->email,
          ":password" => password_hash($this->password, PASSWORD_DEFAULT),
          ":wordkey" => $this->wordkey,
          ":user_role" => $this->user_role,
          ":created_at" => $this->created_at
      ]);

  }

  
  public function updateUser($firstname, $lastname, $user_username, $email, $user_image, $updated_at) {
      
    $conn = $this->connect();
    $this->firstname = $firstname;
    $this->lastname = $lastname;
    $this->user_username = $user_username;
    $this->email = $email;
    $this->user_image = $user_image;
    $this->updated_at = $updated_at;

    
    /**
      * $sql, pour les requêtes vers la base de données
      */
    $sql = "UPDATE `freek`.users SET user_firstname = :firstname, user_lastname = :lastname, user_username = :user_username, user_email = :email, user_image = :user_image, updated_at = :updated_at WHERE user_username = :user_username;";
    
      /**
       * $stmt, pour recupérer la requête préparée
       */
      try {
        $stmt = $conn->prepare($sql);
        $stmt->execute([
          ":firstname" => $this->firstname,
           ":lastname" => $this->lastname,
           ":user_username" => $this->user_username,
           ":email" => $this->email,
           ":user_image" => $this->user_image,
           ":updated_at" => $this->updated_at
        ]);
      } catch(PDOException $e) {
        die('Erreur connexion:'.$e->getMessage());
      }
}
    
}