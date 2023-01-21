<?php
    require "header.php";
?>

<?php if(isset($_SESSION["user_role"]) && $_SESSION["user_role"] == 0): ?>

<main>

    <div class="bloc-div flex">
        <button class="task"><i class="fa fa-bars"></i></button>
            <nav class="bloc-task">
                <ul>
                    <li><a href="/admin/book-controller/view-dashbord">Acceuil</a></li>
                    <li><a href="/admin/book-controller/redirection">Gestion des oeuvres</a></li>
                    <li><a href="/admin/book-controller/view-gestion-users">Gestion des users</a></li>
                    <li><a href="/admin/receive/create-book">Publier une oeuvre</a></li>
                    <li><a href="/admin/book-controller/create-chapter-admin">Publier un chapitre</a></li>
                </ul>
            </nav>

        <div class="data">

            <section class="history flex">
                <h2>Historiques de ce mois</h2>

                <article class="article-book flex">
                    <img src="/ressources/assets/medias-users/account.jpg" alt="Utilisateurs">
                    <h3>Nombre d'utilisateur inscrit ce mois-ci</h3>
                    <span><?= $count_five ?></span>
                </article>

                <article class="article-book flex">
                    <img src="/ressources/assets/Medias-book/livre.jpg" alt="Image de l'oeuvre">
                    <h3>Nombre d'oeuvres publiées dans ce mois</h3>
                    <span><?= $count_three ?></span>
                </article>

                <article class="article-book flex">
                    <img src="/ressources/assets/Medias-book/chapter.jpg" alt="Image de l'oeuvre">
                    <h3>Nombre de chapitres publiés dans ce mois</h3>
                    <span><?= $count_one ?></span>
                </article>

            </section>

            <section class="history flex">
                <h2>Historiques passées</h2>

                <article class="article-book flex">
                    <img src="/ressources/assets/medias-users/account.jpg" alt="Utilisateurs">
                    <h3>Nombre d'utilisateur inscrit entre-temps</h3>
                    <span><?= $count_six ?></span>
                </article>

                <article class="article-book flex">
                    <img src="/ressources/assets/Medias-book/livre.jpg" alt="Image de l'oeuvre">
                    <h3>Nombre d'oeuvres publiées qu'il y avait</h3>
                    <span><?= $count_four ?></span>
                </article>

            <article class="article-book flex">
                <img src="/ressources/assets/Medias-book/chapter.jpg"" alt="Image de l'oeuvre">
                <h3>Nombre de chapitres publiés qu'il y avait</h3>
                <span><?= $count_two ?></span>
            </article>

            </section>
            
        </div>
    </div>

    <div class="top"><a href="#top"><i class="fa fa-arrow-up"></i></a></div>
</main>

<script src="/ressources/js/admin.js"></script>
<?php
    require "footer.php";
?>

<?php else: ?>

<?php header("Location:/receive/page-error"); ?>

<?php endif; ?>