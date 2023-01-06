
<?php
    require "header.php";
?>
<main>
        <form class="form flex" action="/login-controller/login" method="post">

            <?php if(isset($_GET["msg_email_empty"])): ?>
                 <h3 class="danger">Mettez votre email !!!</h3>
            <?php endif; ?>

            <?php if(isset($_GET["msg_password_empty"])): ?>
                 <h3 class="danger">Mettez votre mot de passe !!!</h3>
            <?php endif; ?>
            
            <?php if(isset($_GET["msg_not_found_user"])): ?>
                 <h3 class="danger">Cet utilisateur n'existe pas !!!</h3>
            <?php endif; ?>

            <?php if(isset($_GET["msg_password"])): ?>
                 <h3 class="danger">Mot de passe incorrect !!! Veuillez entrez un mot de passe correct et de préférence éviter les espaces inutiles.<br> NB: Ce mot de passe doit commencer par une lettre et pas d'accent. Minimum 8 à 14 caractères !!! Ex: Password@2002B</h3>
            <?php endif; ?>

            <input type="email" placeholder="Addresse électronique" name="email" value ="<?= $_GET["email"] ?? "" ?>">
            <input type="password" placeholder="Password" maxlength="14" name="password">
            <div class="remember">
                <input type="checkbox" name="" id="" checked>Se rappeler de moi
            </div>
            <button class="white" type="submit" name="validate">Valider</button>
            <div class="info flex">
                <a href="/receive/forget">Vous avez oublié votre mot de passe ?</a>
                <p>Vous n'avez pas un compte ? <a href="/receive/register">Inscrivez-vous</a></p>
            </div>
            <div class="style"></div>
        </form>
</main>
