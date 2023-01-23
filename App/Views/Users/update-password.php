<?php
    require "header.php";
?>
<main>
        <form class="form flex" action="/update-password-controller/verify-new-password" method="post">
            
            <?php if(isset($_GET["password_error"])): ?>
                 <h3 class="danger">Mettez le même mot de passe dans les champs !!!</h3>
            <?php endif; ?>
            
            <?php if(isset($_GET["not_format"])): ?>
                 <h3 class="danger">Mot de passe incorrect !!! Veuillez entrez un mot de passe correct et de préférence éviter les espaces inutiles.<br> NB: Ce mot de passe doit commencer par une lettre et pas d'accent. Minimum 8 à 14 caractères !!! Ex: Password@2002B | Password@amgmt | passwordmotcle</h3>
            <?php endif; ?>
            
            <?php if(isset($_GET["password_empty"])): ?>
                 <h3 class="danger">Remplissez tous les champs !!!</h3>
            <?php endif; ?>
            
            <?php if(isset($_GET["wordkey_error"])): ?>
                 <h3 class="danger">Le mot clé n'est pas correct !!!</h3>
            <?php endif; ?>

            <?php if(isset($_GET["wordkey_empty"])): ?>
                 <h3 class="danger">Veuillez entrer votre mot clé !!!</h3>
            <?php endif; ?>

            <input type="password" name="password" placeholder="Entrez votre nouveau password">

            <input type="password" name="confirm_password" placeholder="Confirm password">

            <input type="text" name="wordkey" placeholder="Mettez votre mot clé">

            <input type="hidden" name="user_id" value ="<?= $tableau[0]["user_id"] ?>">

            <button class="white" type="submit" name="validate">Valider</button>
            
            <div class="info flex">
                <a href="/receive/login">Retour</a>
            </div>
            <div class="style"></div>
        </form>
        
    <button class="click_button"><i class="fa fa-arrow-left"></i></a></button>
</main>

<script src="/ressources/js/task.js"></script>