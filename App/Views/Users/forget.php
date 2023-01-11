


<?php
    require "header.php";
?>
<main>
        <form class="form flex" action="/update-password-controller/verify-word-key" method="post">

            <?php if(isset($_GET["msg_email_empty"])): ?>
                 <h3 class="danger">Mettez votre email !!!</h3>
            <?php endif; ?>

            <?php if(isset($_GET["msg_wordkey_empty"])): ?>
                 <h3 class="danger">Mettez votre mot clé !!!</h3>
            <?php endif; ?>
            
            <?php if(isset($_GET["msg_word"])): ?>
                 <h3 class="danger">Le mot clé n'est pas exact !!!</h3>
            <?php endif; ?>

            <?php if(isset($_GET["msg_email"])): ?>
                 <h3 class="danger">L'email n'est pas exact !!!</h3>
            <?php endif; ?>

            <input type="email" name="email" placeholder="Addresse électronique" value ="<?= $_GET["email"] ?? "" ?>">
            <input type="text" name="wordkey" placeholder="Entrez votre mot clé" value ="<?= $_GET["wordkey"] ?? "" ?>">
            <button class="white" type="submit" name="validate">Valider</button>
            <div class="info flex">
                <a href="/receive/login">Retour</a>
            </div>
            <div class="style"></div>
        </form>
</main>

<?php
    require "footer.php";
?>