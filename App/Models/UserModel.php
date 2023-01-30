<?php

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
    public $user_id;
    public $user_role;
    public $timestamps;

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
     * verifyEmailOrName(), pour vérifier si il y a un utilisateur dans la bd ayant déjà ce genre d'email ou de nom d'utilisateur
     */
    public function verifyEmailOrName($params) {
        $this->email = $params;
        $this->user_username = $params;

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT * FROM `freek`.users WHERE user_email = ? OR user_username = ?;";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([$this->email, $this->user_username]);
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
     * verifyWordkey(), pour vérifier si il y a un utilisateur dans la bd ayant déjà cet mot clé
     */
    public function verifyWordkey($wordkey) {
        $this->wordkey = $wordkey;

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT * FROM `freek`.users WHERE user_wordkey = ?;";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([$this->wordkey]);
        $result = $stmt->fetchAll();
        return $result;
    }

    /**
     * deleteUsers(), pour supprimer un/des users
     */
    public function deleteUsers($user_id) {
        $this->user_id = $user_id;

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "DELETE FROM `freek`.users WHERE user_id = ?;";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([$this->user_id]);
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
     * verifyUserId(), pour vérifier si il y a un utilisateur dans la bd ayant déjà cet user_id
     */
    public function verifyUserId($user_id) {
        $this->user_id = $user_id;

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT * FROM `freek`.users WHERE user_id = ?;";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->prepare($sql);
        $stmt->execute([$this->user_id]);
        $result = $stmt->fetchAll();
        return $result;
    }

    /**
     * verifyAllUsers(), affiche tous les utilisateurs de la bd
     */
    public function verifyAllUsers() {

        $conn = $this->connect();

        /**
         * $sql, pour les requêtes vers la base de données
         */
        $sql = "SELECT * FROM `freek`.users";

        /**
         * $stmt, pour recupérer la requête préparée
         */
        $stmt = $conn->query($sql);
        $result = $stmt->fetchAll();
        return $result;
    }

    
    /**
     * deleteCommentUser(), pour supprimer de la bdd le commentaire de l'utilisateur
     */
    public function deleteCommentUser($user_id) {
        
      $conn = $this->connect();

      $this->user_id = $user_id;

      /**
       * $sql, pour les requêtes vers la base de données pour supprimer le commentaire ayant cet id
       */
      $sql = "DELETE FROM `comments` WHERE user_id = ?";

      $stmt = $conn->prepare($sql);
      $stmt->execute([$this->user_id]);
  }

    
    /**
     * insertUser(), pour insérer dans la bd des utilisateurs
     */
    public function insertUser($firstname, $lastname, $user_username, $email, $password, $user_image, $wordkey, $user_role, $timestamps) {

      $conn = $this->connect();

      $this->firstname = $firstname;
      $this->lastname = $lastname;
      $this->user_username = $user_username;
      $this->email = $email;
      $this->user_image = $user_image;
      $this->wordkey = $wordkey;
      $this->password = $password;
      $this->user_role = $user_role;
      $this->timestamps = $timestamps;

      /**
       * $sql, pour les requêtes vers la base de données
       */
      $sql = "INSERT INTO `freek`.users VALUES(NULL, :firstname, :lastname, :user_username, :email, :password, :user_image, :wordkey, :user_role, :timesdate)";
      
      /**
       * $stmt, pour recupérer la requête préparée
       */
      $stmt = $conn->prepare($sql);
      $stmt->execute([
         ":firstname" => $this->firstname,
          ":lastname" => $this->lastname,
          ":user_username" => $this->user_username,
          ":email" => $this->email,
          ":user_image" => $this->user_image,
          ":password" => password_hash($this->password, PASSWORD_DEFAULT),
          ":wordkey" => password_hash($this->wordkey, PASSWORD_DEFAULT),
          ":user_role" => $this->user_role,
          ":timesdate" => $this->timestamps
      ]);

  }

  /**
   * updateUser(), pour modifier le profil de l'utilisateur
   */
  public function updateUser($firstname, $lastname, $username, $email, $user_image, $user_id) {
      
    $conn = $this->connect();
    $this->firstname = $firstname;
    $this->lastname = $lastname;
    $this->user_username = $username;
    $this->email = $email;
    $this->user_image = $user_image;
    $this->user_id = $user_id;

    
    /**
      * $sql, pour les requêtes vers la base de données
      */
    $sql = "UPDATE `freek`.users SET user_firstname = :firstname, user_lastname = :lastname, user_username = :username, user_email = :email, user_image = :user_image WHERE user_id = :user_id;";
    
      /**
       * $stmt, pour recupérer la requête préparée
       */
      try {
        $stmt = $conn->prepare($sql);
        $stmt->execute([
          ":firstname" => $this->firstname,
           ":lastname" => $this->lastname,
           ":username" => $this->user_username,
           ":email" => $this->email,
           ":user_image" => $this->user_image,
           ":user_id" => $this->user_id
        ]);
      } catch(PDOException $e) {
        die('Erreur connexion:'.$e->getMessage());
      }
}

  /**
   * updatePasswordUser(), pour modifier le mot de passe de l'utilisateur
   */
  public function updatePasswordUser($password, $user_id) {
      
    $conn = $this->connect();
    $this->password = $password;
    $this->user_id = $user_id;

    
    /**
      * $sql, pour les requêtes vers la base de données
      */
    $sql = "UPDATE `freek`.users SET user_password = :password WHERE user_id = :user_id;";
    
      /**
       * $stmt, pour recupérer la requête préparée
       */
      try {
        $stmt = $conn->prepare($sql);
        $stmt->execute([
           ":password" => password_hash($this->password, PASSWORD_DEFAULT),
           ":user_id" => $this->user_id
        ]);
      } catch(PDOException $e) {
        die('Erreur connexion:'.$e->getMessage());
      }
}
    
}