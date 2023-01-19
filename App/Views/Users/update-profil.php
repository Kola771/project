
<?php
    require "header.php";
    require "../App/Controllers/LoginController.php";
    $array = new LoginController();
    $tableau = $array->displayUrlInfo();
?>

<?php if(isset($_SESSION["username"]) && $_SESSION["username"] === $tableau[0]["user_username"]): ?>

<main>
        <form class="form flex" action="/update-profil-controller/update-user-info" method="post" enctype="multipart/form-data">

            <?php if(isset($_GET["msg_firstname"]) || isset($_GET["msg_lastname"]) || isset($_GET["msg_email"])): ?>
                 <h3 class="danger">Ne laissez aucun champ vide !!!</h3>
            <?php endif; ?>

            <?php if(isset($_GET["msg_userName"])): ?>
                <h3 class="danger">Ce nom ne respecte pas ce format => username001.<br> NB: Ce mot doit commencer par une lettre et pas d'accent !!! Ex: Float2022 | float123 | f12ftre14</h3>
            <?php endif; ?>

            <input type="text" placeholder="Firstname" name="firstname" value ="<?= $tableau[0]["user_firstname"] ?>">
            <input type="text" placeholder="Lastname" name="lastname" value ="<?= $tableau[0]["user_lastname"] ?>">
            <input type="email" placeholder="Email" name="email" value ="<?= $tableau[0]["user_email"] ?>">
            <input type="text" placeholder="Username" name="username" value ="<?= $tableau[0]["user_username"] ?>">
            <input type="file" name="user_image" required>
            <input type="hidden" name="user_id" value ="<?= $tableau[0]["user_id"] ?>">
            <input type="hidden" name="image" value ="<?= $tableau[0]["user_image"] ?>">
            <button class="white" type="submit" name="validate">Modifier votre profil</button>
            <div class="info flex">
                <a href="/receive/profil">Retourner sur votre profil</a>
            </div>
            <div class="style"></div>
        </form>
</main>

<script src="/ressources/js/task.js"></script>

<?php else: ?>

<?php header("Location:/receive/home"); ?>

<?php endif; ?>