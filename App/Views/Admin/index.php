

<?php
    require "header.php";
?>

<main>

    <div class="bloc-div flex">
            <nav class="bloc-task">
                <ul>
                    <li><a href="/admin/receive/dashbord">Acceuil</a></li>
                    <li><a href="/admin/receive/gestion">Gestion des oeuvres</a></li>
                    <li><a href="/admin/receive/create-book">Publier une oeuvre</a></li>
                    <li><a href="/admin/receive/create-chapter">Publier un chapitre</a></li>
                </ul>
            </nav>

        <div class="data">
            <section class="history flex">
                <h2>Historiques de ce mois</h2>
                <article class="article-book flex">
                    <img src="/ressources/assets/Medias-book/gojo.jpg" alt="Image de l'oeuvre">
                    <h3>Nombre d'utilisateur inscrit ce mois-ci</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima odio veritatis ratione exercitationem inventore sunt nisi dicta non facilis nulla.</p>
                    <a href="#">30</a>
                </article>
                <article class="article-book flex">
                    <img src="/ressources/assets/Medias-book/gojo.jpg" alt="Image de l'oeuvre">
                    <h3>Nombre d'oeuvres publiées dans ce mois</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima odio veritatis ratione exercitationem inventore sunt nisi dicta non facilis nulla.</p>
                    <a href="#">30</a>
                </article>
                <article class="article-book flex">
                    <img src="/ressources/assets/Medias-book/gojo.jpg" alt="Image de l'oeuvre">
                    <h3>Nombre de chapitres publiés dans ce mois</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima odio veritatis ratione exercitationem inventore sunt nisi dicta non facilis nulla.</p>
                    <a href="#">30</a>
                </article>
            </section>
            <section class="history flex">
                <h2>Historiques du mois passé</h2>
                <article class="article-book flex">
                    <img src="/ressources/assets/Medias-book/gojo.jpg" alt="Image de l'oeuvre">
                    <h3>Nombre d'utilisateur inscrit le mois passé</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima odio veritatis ratione exercitationem inventore sunt nisi dicta non facilis nulla.</p>
                    <a href="#">30</a>
                </article>
                <article class="article-book flex">
                    <img src="/ressources/assets/Medias-book/gojo.jpg" alt="Image de l'oeuvre">
                    <h3>Nombre d'oeuvres publiées dans le mois passé</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima odio veritatis ratione exercitationem inventore sunt nisi dicta non facilis nulla.</p>
                    <a href="#">30</a>
                </article>
            <article class="article-book flex">
                <img src="/ressources/assets/Medias-book/gojo.jpg" alt="Image de l'oeuvre">
                <h3>Nombre de chapitres publiés dans le mois passé</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima odio veritatis ratione exercitationem inventore sunt nisi dicta non facilis nulla.</p>
                <a href="#">30</a>
            </article>
            </section>
           
            
        </div>
    </div>

</main>


<?php
    require "footer.php";
?>