
<?php
    require "header.php";
?>
<main>
        <form class="form flex" action="/register-controller/register" method="post">

            <?php if(isset($_GET["msg_email"])): ?>
                 <h3 class="danger">Cet email existe déjà !!!</h3>
            <?php endif; ?>

            <?php if(isset($_GET["msg_user_username"])): ?>
                 <h3 class="danger">Ce nom d'utilisateur existe déjà !!!</h3>
            <?php endif; ?>
            
            <?php if(isset($_GET["msg_user_wordkey"])): ?>
                 <h3 class="danger">Ce mot clé existe déjà !!!</h3>
            <?php endif; ?>

            <?php if(isset($_GET["msg_wordkey"])): ?>
                 <h3 class="danger">Entrez un mot clé unique qui n'a aucun lien avec votre nom de famille de préférence et ayant 12 caractères.<br> NB: Ce mot doit commencer par une lettre et pas d'accent !!! Ex: Motcle@2001A </h3>
            <?php endif; ?>

            <?php if(isset($_GET["msg_username"])): ?>
                 <h3 class="danger">Ce nom ne respecte pas ce format => username001.<br> NB: Ce mot doit commencer par une lettre et pas d'accent !!! Ex: Float@2022</h3>
            <?php endif; ?>

            <?php if(isset($_GET["msg_password"])): ?>
                 <h3 class="danger">Mot de passe incorrect !!! Veuillez entrez un mot de passe correct et de préférence éviter les espaces inutiles.<br> NB: Ce mot de passe doit commencer par une lettre et pas d'accent. Minimum 8 à 14 caractères !!! Ex: Password@2002B</h3>
            <?php endif; ?>

            <input type="text" placeholder="Firstname" name="firstname" value ="<?= $_GET["firstname"] ?? "" ?>">
            <input type="text" placeholder="Lastname" name="lastname" value ="<?= $_GET["lastname"] ?? "" ?>">
            <input type="email" placeholder="Email" name="email" value ="<?= $_GET["email"] ?? "" ?>">
            <input type="text" placeholder="Username" name="username" value ="<?= $_GET["username"] ?? "" ?>">
            <div class="flex password">
                <input type="password" maxlength="14" placeholder="Password" name="password">
                <input type="password" maxlength="14" placeholder="Confirm password" name="confirm_password">
            </div>
            <input type="text"  maxlength="12" placeholder="Entrez un mot clé" name="word_key" value ="<?= $_GET["word_key"] ?? "" ?>">
            <button class="white" type="submit" name="validate">Valider</button>
            <p>Vous avez pas un compte ? <a href="/receive/login">Connectez-vous</a></p>
            <div class="style"></div>
        </form>
</main>
