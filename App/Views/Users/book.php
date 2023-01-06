

<?php


require "header.php";
// require "../App/Controllers/Control.php";

// $_SESSION["role"] = "admin";
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
        <div class="road">
            <a href="/receive/home">Home</a> ->
            <a href="#">Nom du livre</a>
        </div>
        <section class="flex section-book">
            <div class ="order2">
                <h2>White Dragon Duke: Pendragon</h2>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nam quaerat dolorem doloribus adipisci perspiciatis non. Laborum, cum vero commodi corporis et nulla consectetur magni, ratione, dolore quod perspiciatis nihil. Maiores!</p>
            </div>
            <img class="order1" src="/ressources/assets/Medias-book/gojo.jpg" alt="White Dragon Duke: Pendragon">
            <div class="comments">
                <h3>Laisser un commentaire</h3>
                <article class="article">
                    <h4 class="flex"> <img src="/ressources/assets/Medias-book/gojo.jpg" alt="Account"> Nom de l'utilisateur</h4>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolores, quis!</p>
                    <p>Il y a 3 jours..</p>
                </article>
                <form action="#" method="post">
                    <textarea name="comments" id="comments" cols="30" rows="10" placeholder="Laisser un commentaire" required></textarea>
                    <button type="submit">Envoyer le commentaire</button>
                </form>
            </div>
        </section>

        <section class="chapter">
            <?php if(isset($_SESSION["role"]) && $_SESSION["role"] === "admin"): ?>
            <p><a href="/book/name/update-book">Modifier le livre</a></p>
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