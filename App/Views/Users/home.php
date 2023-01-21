<?php
    require "header.php";
?>

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

                <li><a href="/book-controller/<?= $array[$i]["book_id"] ?>/view-book"><?= $array[$i]["book_name"] ?></a></li>
            
            <?php endfor; ?>
        
        </ul>
    </div>

    <div class="top"><a href="#top"><i class="fa fa-arrow-up"></i></a></div>
</main>

<script src="/ressources/js/source.js"></script>
<?php
    require "footer.php";
?>