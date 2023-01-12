

<?php

require "header.php";
require "../App/Controllers/BookController.php";

$controller = new BookController();

// tableau pour l'affichage du livre
$array = $controller->verifyUrlAll();

// tableau pour l'affichage des commentaires 
$array0 = $controller->selectAllComment();

?>

<main>
        <nav class="topnav flex">
            <ul class="topul flex list">
                <li> <a href="#">Livres</a> </li>
                <li> <a href="#">Mangas</a> </li>
                <li> <a href="#">Bandes dessinées</a> </li>
            </ul>
            <form id="form" action="#" method="post">
                <input list="browsers" type="text" id="input" name="search">
                <datalist id="browsers">
                    <option value="White Dragon Duke: Pendragon"></option>
                    <option value="Existence"></option>
                    <option value="Player from today onward"></option>
                </datalist>
                <button id="close"><i class="fa fa-close"></i></button>
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </nav>
    
    <section class="section-background flex">
        <h2 class="text opacity">Profitez bien de cette oeuvre !!!</h2>
    </section>

    <div class="container flex bloc">
        <?php foreach($array as $key => $values): ?>
            <div class="road">
                <a href="/receive/home">Home</a> ->
                <a href="#"><?= $values["book_name"] ?></a>
            </div>
        <?php endforeach; ?>
        <section class="flex section-book">

            <?php foreach($array as $key => $values): ?>

                <div class ="order2">
                    <h2><?= $values["book_name"] ?></h2>
                    <p><?= $values["book_description"] ?></p>
                </div>
                <img class="order1" src="/ressources/assets/Medias-book/<?= $values["book_image"] ?>" alt="White Dragon Duke: Pendragon">

            <?php endforeach; ?>

            <div class="comments">
                <h3>Laisser un commentaire</h3>

                <?php foreach($array0 as $key => $values): ?>

                    <?php if($values["book_id"] == $array[0]["book_id"]): ?>

                    <article class="flex article">

                        <!-- Affichage de tout les commentaires portant sur cet article -->
                        <?php if($values["user_image"] == "") : ?>

                            <img src="/ressources/assets/account.jpg ?>" alt="Account"> 

                        <?php else : ?>

                                <img src="/ressources/assets/medias-users/<?= $values["user_image"] ?>" alt="Account"> 

                        <?php endif; ?>

                        <div>

                            <?php if($values["user_role"] == 0) : ?>

                                <h4 class="flex">Administrator</h4>

                            <?php else : ?>

                                <h4 class="flex"><?= $values["user_username"] ?></h4>

                            <?php endif; ?>

                            <p><?= $values["comment_comment"] ?></p>
                            <p>Publié le <?= $values["created_at"] ?></p>
    
                            <!-- Ce code permet à l'utilisateur connecté de supprimer son commentaire -->
                            <?php if((isset($_SESSION['username'])) && $_SESSION['username'] == $values["user_username"]) : ?>

                                <form action="/comment-controller/delete-comment" method="post">
                                    <input type="hidden" name="comment_id" value="<?= $values["comment_id"] ?>">
                                    <input type="hidden" name="book_id" value="<?= $array[0]["book_id"] ?>">
                                    <button type="submit" class="danger" name="validate">Supprimer le commentaire</button>
                                </form>

                            <?php endif; ?>
                        </div>

                    </article>

                    <?php endif; ?>

                <?php endforeach; ?>

                <form action="/comment-controller/insert-comment" method="post">
                    <input type="hidden" name="username" value="<?= isset($_SESSION['username']) ? $_SESSION['username'] : '' ?>">
                    <input type="hidden" name="book_id" value="<?= $array[0]["book_id"] ?>">
                    <textarea name="comments" id="comments" cols="30" rows="10" placeholder="Laisser un commentaire" required></textarea>
                    <?php if(isset($_SESSION["username"])): ?>
                        <button type="submit" name="validate">Envoyer le commentaire</button>
                    <?php else: ?>
                            <button disabled>Envoyer le commentaire</button>
                    <?php endif; ?>
                </form>

            </div>
        </section>

        <section class="chapter">
            <?php if(isset($_SESSION["user_role"]) && $_SESSION["user_role"] == 0): ?>
            <p><a href="/book/<?= $array[0]["book_id"] ?>/update-book">Modifier le livre</a></p>
            <?php endif; ?>
            <h3>Chapitres</h3>
            <ul>
                <li><a href="/book/1/books/show-chapter">Chapitre1</a></li>
                <li><a href="#">Chapitre2</a></li>
                <li><a href="#">Chapitre3</a></li>
                <li><a href="#">Chapitre4</a></li>
                <li><a href="#">Chapitre5</a></li>
            </ul>
        </section>
    </div>

</main>

<script src="/ressources/js/search.js"></script>

<?php
    require "footer.php";
?>