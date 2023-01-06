
<?php
    require "header.php";
    require "../App/Controllers/LoginController.php";
    $array = new LoginController();
    $tableau = $array->displayUrlInfo();
?>

<?php if(isset($_SESSION["username"])): ?>

<main>
        <form class="form flex" action="/update-profil-controller/update-user-info" method="post" enctype="multipart/form-data">
            <input type="text" placeholder="Firstname" name="firstname" value ="<?= $tableau[0]["user_firstname"] ?>">
            <input type="text" placeholder="Lastname" name="lastname" value ="<?= $tableau[0]["user_lastname"] ?>">
            <input type="email" placeholder="Email" name="email" value ="<?= $tableau[0]["user_email"] ?>">
            <input type="text" placeholder="Username" name="username" value ="<?= $tableau[0]["user_username"] ?>">
            <input type="file" name="user_image">
            <button class="white" type="submit" name="validate">Modifier votre profil</button>
            <div class="info flex">
                <a href="/receive/profil">Retourner sur votre profil</a>
            </div>
            <div class="style"></div>
        </form>
</main>

<?php require "footer.php"; ?>

<?php else: ?>

<?php header("Location:/receive/home"); ?>

<?php endif; ?>