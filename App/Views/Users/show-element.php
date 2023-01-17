<?php
    require "header.php";
    require "../App/Controllers/BookController.php";

    //instanciation de la classe BookController()
    $controller = new BookController();

    //tableau pour afficher tous les livres 
    $array = $controller->verifyLikesBook();

?>

<main>
    <nav class="topnav flex">
        <ul class="topul flex list" id="topul2">
            <li> <a href="/book/books/show-type">Livres</a> </li>
            <li> <a href="/book/mangas/show-type">Mangas</a> </li>
            <li> <a href="/book/comics/show-type">Bandes dessinées</a> </li>
            <li class="icon0 white">Icon</li>
        </ul>
        <form id="form" action="/book-controller/search-book" method="post">
            <input list="browsers" type="text" id="input" name="search">
            <datalist id="browsers">
                <?php foreach($array as $key => $values) : ?>
                <option value="<?= $values["book_name"] ?>"></option>
                <?php endforeach; ?>
            </datalist>
            <button type="reset" id="close"><i class="fa fa-close"></i></button>
            <button type="submit" name="recherche"><i class="fa fa-search"></i></button>
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
                <?php if($array[$i]["book_status"] == "En ligne") : ?>
                    <li><a href="/book/<?= $array[$i]["book_id"] ?>/show-book"><?= $array[$i]["book_name"] ?></a></li>
                <?php endif; ?>
            <?php endfor; ?>
        </ul>
    </div>
</main>

<script src="/ressources/js/source.js"></script>
<?php
    require "footer.php";
?>