

<?php 
    require "header.php"; 
    require "../App/Controllers/BookController.php";
    
    $controller = new BookController();
    
    // tableau pour l'affichage des commentaires 
    $array0 = $controller->selectAllComment();
    
?>

<?php if(isset($_SESSION["username"])): ?>

<main>
    <div class="container flex bloc">
        <section class="flex_section1 title">
            <img src="/ressources/assets/medias-users/<?php echo $_SESSION["image"] ?>" alt="account">
            <h2> <a href="/receive/<?php echo $_SESSION["username"] ?>/update-profil">Modifier votre profil</a></h2>
        </section>
        
        <section class="flex_section chapter">
            <h3>Vos informations personnelles</h3>
            <p>Nom : <strong><?php echo $_SESSION["lastname"];?></strong></p>
            <p>Prénoms : <strong><?php echo $_SESSION["firstname"];?></strong></p>
            <p>Nom d'utilisateur : <strong><?php echo $_SESSION["username"];?></strong></p>
            <p>Email : <strong><?php echo $_SESSION["email"];?></strong></p>
            <p>Date de création du compte : <strong><?php echo $_SESSION["created_at"];?></strong></p>

            <article class="article">
                <h4 class="border">Tout vos commentaires</h4>
            <?php foreach($array0 as $key => $values) : ?>
                <?php if($values["book_status"] == "En ligne"): ?>
                    <?php if($values["user_username"] == $_SESSION["username"]) : ?>
                    <div class="padding">
                        <p><?= $values["comment_comment"] ?></p>
                        <p>Publié le <?= $values["created_at"] ?></p>
                        <a href="/book/<?= $values["book_id"] ?>/show-book" class="primary">Voir article</a>
                    </div>
                    <?php endif; ?>
                <?php endif; ?>
            <?php endforeach; ?>
            </article>
        </section>
    </div>
    
</main>

<?php require "footer.php"; ?>

<?php else: ?>

<?php header("Location:/receive/home"); ?>

<?php endif; ?> 
<!-- khjgtjhgkjhvk -->