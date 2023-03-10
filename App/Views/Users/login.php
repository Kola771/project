
<?php
    require "header.php";
?>
<main>
        <form class="form flex" action="/login-controller/login" method="post">

            <?php if(isset($_GET["msg_email_empty"])): ?>
                 <h3 class="danger">Mettez votre email ou votre nom d'utilisateur !!!</h3>
            <?php endif; ?>

            <?php if(isset($_GET["msg_password_empty"])): ?>
                 <h3 class="danger">Mettez votre mot de passe !!!</h3>
            <?php endif; ?>
            
            <?php if(isset($_GET["msg_not_found_user"])): ?>
                 <h3 class="danger">Cet utilisateur n'existe pas !!!</h3>
            <?php endif; ?>

            <?php if(isset($_GET["msg_password"])): ?>
                 <h3 class="danger">Mot de passe incorrect !!!</h3>
            <?php endif; ?>

            <input type="text" placeholder="Addresse électronique ou nom d'utilisateur" name="email" value ="<?= $_GET["email"] ?? "" ?>">
            <input type="password" placeholder="Password" maxlength="14" name="password">
            <div class="remember">
                <input type="checkbox" name="" id="" checked required>Se rappeler de moi
            </div>
            <button class="white" type="submit" name="validate">Valider</button>
            <div class="info flex">
                <a href="/receive/forget">Vous avez oublié votre mot de passe ?</a>
                <p>Vous n'avez pas un compte ? <a href="/receive/register">Inscrivez-vous</a></p>
            </div>
            <div class="style"></div>
        </form>

        
    <div class="top"><a href="#top"><i class="fa fa-arrow-up"></i></a></div>
    <button class="click_button"><i class="fa fa-arrow-left"></i></a></button>
</main>

<script src="/ressources/js/task.js"></script>