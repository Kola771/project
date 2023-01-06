

<?php 
    require "header.php"; 
    require "../App/Controllers/LoginController.php";
    $array = new LoginController();
    $tableau = $array->displayInfo($_SESSION["username"]);
?>

<?php if(isset($_SESSION["username"])): ?>

<main>
    <div class="container flex bloc">
        <section class="flex_section1 title">
            <?php if($tableau[0]["user_image"] == ""): ?>
                <img src="/ressources/assets/account.jpg" alt="account">
            <?php else: ?>
                    <img src="/ressources/assets/medias-users/<?= $tableau[0]["user_image"];?>" alt="account">
            <?php endif; ?>
            <h2> <a href="/receive/<?php echo $_SESSION["username"] ?>/update-profil">Modifier votre profil</a></h2>
        </section>
        
        <section class="flex_section chapter">
            <h3>Vos informations personnelles</h3>
            <p>Nom : <strong><?php echo $_SESSION["lastname"];?></strong></p>
            <p>Prénoms : <strong><?php echo $_SESSION["firstname"];?></strong></p>
            <p>Nom d'utilisateur : <strong><?php echo $_SESSION["username"];?></strong></p>
            <p>Email : <strong><?php echo $_SESSION["email"];?></strong></p>
            <p>Date de création du compte : <strong><?php echo $_SESSION["created_at"];?></strong></p>
        </section>
    </div>
    
</main>

<?php require "footer.php"; ?>

<?php else: ?>

<?php header("Location:/receive/home"); ?>

<?php endif; ?>