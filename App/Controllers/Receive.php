

<?php

class Receive {

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

    public function createBook() {
        require "../App/Views/Admin/create-book.php";
    }
    
    public function updatePassword() {
        require "../App/Views/Users/update-password.php";
    }
    
    public function errorSearch() {
        require "../App/Views/SearchError.php";
    }
    
    public function pageError() {
        require "../App/Views/PageError.php";
    }
    
}

?>