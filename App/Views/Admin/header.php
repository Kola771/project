<?php
    @session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="freek, mangas, books, comics">
    <link rel="icon" href="/ressources/assets/Medias-book/oeuvre.jpg" type="image/x-icon">
    <script src="https://kit.fontawesome.com/b48549a02e.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/ressources/css/styles.css">
    <title>Freek</title>
</head>
<body>
    <header>
        <div class="header flex white">
            <h1 class="margin0"><a href="/">Fre<span class="orange">ek</span>/Admin😎</a></h1>
            <a href="#" class="hidden"><i class="fa fa-bars"></i></a>
            <nav class="topnav0">
                <ul class="topul flex list" id="topul">
                    <li><a href="/book-controller/view-home"><i class="fa fa-home"></i> Acceuil</a></li>

                    <?php if(isset($_SESSION["user_role"]) && $_SESSION["user_role"] == 0): ?>
                        <li><a href="/admin/book-controller/view-dashbord">Dashbord</a></li>
                        <li><a href="/book-controller/view-profil"><i class="fa fa-user"></i> Profil</a></li>
                        <li><a href="/receive/logout">Deconnexion<i class="fas fa-arrow-alt-circle-right"></i></a></li>

                    <?php elseif(isset($_SESSION["user_role"]) && $_SESSION["user_role"] == 1): ?>
                        <li><a href="/book-controller/view-profil"><i class="fa fa-user"></i> Profil</a></li>
                        <li><a href="/receive/logout">Deconnexion<i class="fas fa-arrow-alt-circle-right"></i></a></li>
                        
                    <?php else: ?>
                        <li><a href="/receive/login">Connexion</a></li>
                    <?php endif; ?>
                    
                </ul>
            </nav>
        </div>
    </header>