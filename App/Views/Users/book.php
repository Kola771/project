

<?php

require "header.php";

?>

<?php if($array[0]["book_status"] === "En ligne"): ?>

<main>
        <nav class="topnav flex">

            <ul class="topul flex list" id="topul2">

                <li> <a href="/book-controller/books/view-show-element">Livres</a> </li>
                <li> <a href="/book-controller/mangas/view-show-element">Mangas</a> </li>
                <li> <a href="/book-controller/comics/view-show-element">Bandes dessinées</a> </li>
                <li class="icon0 white"><i class="fa fa-bars"></i></li>
                <a href="#" class="fermer white"><i class="fa fa-search"></i></a>

            </ul>

            <form id="form" class="none" action="/book-controller/search-book" method="post">
                <input list="browsers" type="text" id="input" name="search">
                <datalist id="browsers">
                    <?php foreach($array5 as $key => $values) : ?>
                    <option value="<?= $values["book_name"] ?>"></option>
                    <?php endforeach; ?>
                </datalist>
                <button type="reset" id="close"><i class="fa fa-close"></i></button>
                <button type="submit" name="recherche"><i class="fa fa-search"></i></button>
            </form>
        </nav>
    
    <section class="section-background flex">
        <h2 class="text opacity">Profitez bien de cette oeuvre !!!</h2>
    </section>

    <?php foreach($array as $key => $values): ?>
        <div class="road flex">
            <a href="/book-controller/view-home">Home</a> 
            <a href="#"><?= $values["book_name"] ?></a>
        </div>
    <?php endforeach; ?>

    <div class="container flex bloc media_tab">
        <section class="flex section-book">

            <?php foreach($array as $key => $values): ?>

                <div class ="order2">
                    <h2><?= $values["book_name"] ?></h2>
                    <p><?= $values["book_description"] ?></p>
                </div>
                <div class="order1">
                    <img src="/ressources/assets/medias-book/<?= $values["book_image"] ?>" alt="<?= $values["book_name"] ?>">
                    <div class="like">
                        <form id="like_form">
                            <input type="hidden" name="book_id" value="<?= $values["book_id"] ?>">
                            <input type="hidden" name="user_id" value="<?= $_SESSION["user_id"] ??  "" ?>">
                            <div class="like_div">
                                <?php if(isset($_SESSION["username"])) : ?>
                                <button type="submit" name="submit" class="red">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="white" viewBox="0 0 24 24" stroke-width="1.5" stroke="white" class="w-6 h-6">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z" />
                                    </svg>
                                </button>

                                <?php else : ?>
                                <button class="white_bgc" disabled>
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="" viewBox="0 0 24 24" stroke-width="1.5" stroke="black" class="w-6 h-6">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z" />
                                    </svg>
                                </button>
                                <?php endif; ?>
                                <p>+<span id="response"><?=$count[0][0]?></span></p>
                            </div>
                            
                        </form>
                    </div>
                </div>
                    

            <?php endforeach; ?>

            <div class="comments">
                <h2 class="click">Voir les commentaires <button class="button_comment"><i class="fas fa-comment-dots"></i></button></h2>
                
                <div class="container_article">
                    <?php foreach($array0 as $key => $values): ?>
                        <?php if($values["book_id"] == $array[0]["book_id"]): ?>

                        <article class="flex article">

                            <!-- Affichage de tout les commentaires portant sur cet article -->

                            <img src="/ressources/assets/medias-users/<?= $values["user_image"] ?>" alt="Account"> 

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

                                    <?php if((isset($_SESSION['user_role'])) && $_SESSION['user_role'] == 0) : ?>

                                        <?php if((isset($_SESSION['username'])) && $_SESSION['username'] != $values["user_username"]) : ?>

                                            <form action="/comment-controller/delete-comment" method="post">

                                                <input type="hidden" name="comment_id" value="<?= $values["comment_id"] ?>">

                                                <input type="hidden" name="book_id" value="<?= $array[0]["book_id"] ?>">

                                                <button type="submit" class="danger" name="validate">Supprimer le commentaire de cet utilisateur</button>

                                            </form>

                                        <?php endif; ?>

                                    <?php endif; ?>
                            </div>

                        </article>

                        <?php endif; ?>

                    <?php endforeach; ?>
                </div>

                <?php if(isset($_SESSION["username"])): ?>

                        <h3>Laisser un commentaire</h3>

                        <form action="/comment-controller/insert-comment" method="post">

                            <input type="hidden" name="username" value="<?= isset($_SESSION['username']) ? $_SESSION['username'] : '' ?>">
                            
                            <input type="hidden" name="book_id" value="<?= $array[0]["book_id"] ?>">

                            <textarea name="comments" id="comments" cols="30" rows="10" placeholder="Laisser un commentaire" required></textarea>

                            <button type="submit" name="validate">Envoyer le commentaire</button>

                        </form>

                <?php endif; ?>

            </div>
        </section>

        <section class="chapter chapter_media">

            <?php if(isset($_SESSION["user_role"]) && $_SESSION["user_role"] == 0): ?>

            <p><a href="/book-controller/<?= $array[0]["book_id"] ?>/view-update-book">Modifier le livre</a></p>

            <?php endif; ?>

            <div class="flex">
                <button class="chapter_icon"><i class="fa fa-bars"></i></button>
               
                <h3>Chapitres</h3>
            </div>

            <?php if(isset($_SESSION["user_role"])): ?>

                <?php if($array1 !== []) : ?>

                    <ul>

                        <?php for($i=0; $i<count($array1); $i++) : ?>

                            <li><a href="/book-controller/<?= $array1[$i]["chapter_number"] ?>/<?= $array1[$i]["book_id"] ?>/view-chapter"> Chapitre <?= $i+1 ?> </a></li>

                        <?php endfor; ?> 
                        
                    </ul>

                <?php else : ?>

                        <ul>
                            <li>Pas de chapitres en cours</li>
                        </ul>

                <?php endif; ?>

                <?php else: ?>

                    <ul>

                        <li>Vous n'êtes pas connecté!!</li>

                    </ul>

                <?php endif; ?>
        </section>
    </div>

    <div class="top"><a href="#top"><i class="fa fa-arrow-up"></i></a></div>
    <button class="click_button"><i class="fa fa-arrow-left"></i></a></button>
</main>

<script src="/ressources/js/comments.js"></script>

<?php require "footer.php"; ?>

<?php else: ?>

<?php header("Location:/book-controller/view-home"); ?>

<?php endif; ?> 
