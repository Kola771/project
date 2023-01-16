<?php
    require "header.php";
    // require "../App/Controllers/BookController.php";

    // instanciation de la classe BookController()
    // $controller = new BookController();
    // tableau pour afficher tous les livres 
    // $array = $controller->verifyAll();

?>

<main>
    <nav class="topnav flex">
        <ul class="topul flex list" id="topul2">
            <li> <a href="#">Livres</a> </li>
            <li> <a href="#">Mangas</a> </li>
            <li> <a href="#">Bandes dessinées</a> </li>
            <li class="icon0 white">Icon</li>
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

    <section class="section flex">
        <h2 class="text opacity">Welcome to Freek !!!</h2>
    </section>
    
    <div class="container">
        <form action="#" method="post">
            <input type="text" id="search" placeholder="Recherche le nom..">
        </form>
        
        <ul class="list pad0" id="search_ul">
            <?php for($i=0, $max=count($array); $i<$max;$i++): ?>
                <li><a href="/book/<?= $array[$i]["book_id"] ?>/show-book"><?= $array[$i]["book_name"] ?></a></li>
            <?php endfor; ?>
        </ul>
    </div>
</main>

<script src="/ressources/js/source.js"></script>
<?php
    require "footer.php";
?>