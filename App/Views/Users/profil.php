

<?php 
    require "header.php"; 
?>

<?php if(isset($_SESSION["username"])): ?>

<main>
    <div class="container flex bloc">
        <section class="flex_section1 title">
            <img src="/ressources/assets/medias-users/<?php echo $_SESSION["image"] ?>" alt="account">
            <h2> <a href="/login-controller/<?php echo $_SESSION["user_id"] ?>/update-profil">Modifier votre profil</a></h2>
        </section>
        
        <section class="flex_section chapter paragraph">

            <h3>Vos informations personnelles</h3>

            <p>Nom : <strong><?php echo $_SESSION["lastname"];?></strong></p>

            <p>Prénoms : <strong><?php echo $_SESSION["firstname"];?></strong></p>

            <p>Nom d'utilisateur : <strong><?php echo $_SESSION["username"];?></strong></p>

            <p>Email : <strong><?php echo $_SESSION["email"];?></strong></p>

            <p>Date de création du compte : <strong><?php echo $_SESSION["created_at"];?></strong></p>

            <div class="recap flex">
                <h2 class="border click">Tout vos commentaires <i class="fas fa-comment-dots"></i></h2>
                <h3 class="notification">Notifications <i class="fas fa-bell"></i></h3>
            </div>
            
            <div class="container_article">

                <article class="article article_one">

                <?php foreach($array0 as $key => $values) : ?>

                    <?php if($values["book_status"] == "En ligne"): ?>

                        <?php if($values["user_username"] == $_SESSION["username"]) : ?>

                        <div class="padding <?= $values["book_id"] ?>">
                            <h4><?= $values["book_name"] ?></h4>

                            <p><?= $values["comment_comment"] ?></p>

                            <p>Fait le <?= $values["created_at"] ?></p>

                        </div>

                        <?php endif; ?>

                    <?php endif; ?>

                <?php endforeach; ?>

                </article>
            
            </div>
            <div class="container_article notif">
                <article class="article article_two">
                    <?php for($i=0; $i<count($tableau); $i++) : ?>
                    <div class="padding_notif <?= $tableau[$i]["book_id"] ?>">
                            <h4>Notification sur l'oeuvre <?= $tableau[$i]["book_name"] ?></h4>
                            <?php if($tableau[$i]["user_role"] == 0) : ?>
                                <p>
                                    <img src="/ressources/assets/medias-users/<?= $tableau[$i]["user_image"] ?>" alt="<?= $tableau[$i]["user_username"] ?>">L'Administrator vous a mentionné dans son commentaire.
                                </p>
                            <?php else : ?>
                                <p>
                                    <img src="/ressources/assets/medias-users/<?= $tableau[$i]["user_image"] ?>" alt="<?= $tableau[$i]["user_username"] ?>">L'utilisateur <?= $tableau[$i]["user_username"] ?> vous a mentionné dans son commentaire.
                                </p>
                            <?php endif; ?>
                            <p>Le <?= $tableau[$i]["created_at"] ?></p>
                        </div>
                        <?php endfor; ?>
                </article>
            </div>
        </section>
        
    </div>
    
    <div class="top"><a href="#top"><i class="fa fa-arrow-up"></i></a></div>
    <button class="click_button"><i class="fa fa-arrow-left"></i></button>
</main>

<script src="/ressources/js/profil.js"></script>
<?php require "footer.php"; ?>

<?php else: ?>

<?php header("Location:/book-controller/view-home"); ?>

<?php endif; ?> 