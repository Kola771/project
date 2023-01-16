

<?php

class Receive {
    public function home() {
        header("Location: /book-controller/home");
    }
    
    public function dashbord() {
        require "../App/Views/Admin/index.php";
    }

    public function profil() {
       require "../App/Views/Users/profil.php";
    }
    
    public function register() {
        require "../App/Views/Users/register.php";
    }
    
    public function logout() {
        session_start();
        session_unset();
        session_destroy();
        header("location: /receive/login");
    }
    
    public function login() {
        require "../App/Views/Users/login.php";
    }

    public function forget() {
        require "../App/Views/Users/forget.php";
    }

    public function gestion() {
        require "../App/Views/Admin/gestion.php";
    }

    public function createBook() {
        require "../App/Views/Admin/create-book.php";
    }
    
    public function createChapter() {
        require "../App/Views/Admin/create-chapter.php";
    }
    
    public function updateProfil() {
        require "../App/Views/Users/update-profil.php";
    }
    
    public function updatePassword() {
        require "../App/Views/Users/update-password.php";
    }
    
}

?>