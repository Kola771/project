

<?php
    require "header.php";
    
    require "../App/Controllers/BookController.php";

    $bookcontroller = new BookController();
    $array = $bookcontroller->verifyAllDistinctChapters();

    foreach($array as $kay => $values) {
        $explode= explode(" ", $values["created_at"]);
        $date1 = $explode[0]; 
        $date2 = date("Y-m-d");
        $date1=date_create($date1);
        $date2=date_create($date2);
        $diff=date_diff($date1,$date2);
        $t = $diff->format("%a");
        if($t > 30) {
            echo "ok";
        } else {
            echo "bad";
        }
    }
?>

<?php if(isset($_SESSION["user_role"]) && $_SESSION["user_role"] == 0): ?>

<main>

    <div class="bloc-div flex">
        <button class="task">Icon</button>
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

<script src="/ressources/js/navigation.js"></script>
<script src="/ressources/js/task.js"></script>
<?php
    require "footer.php";
?>

<?php else: ?>

<?php header("Location:/receive/home"); ?>

<?php endif; ?>