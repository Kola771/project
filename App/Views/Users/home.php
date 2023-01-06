<?php
    require "header.php";
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

    <section class="section flex">
        <h2 class="text opacity">Welcome to Freek !!!</h2>
    </section>
    
    <div class="container">
        <form action="#" method="post">
            <input type="text" id="search" placeholder="Recherche le nom..">
        </form>
        
        <ul class="list pad0" id="search_ul">
          <li><a href="/book/name/show-book">White Dragon Duke: Pendragon</a></li>
          <li><a href="#">Existence</a></li>
          <li><a href="/book/name/show-book">Player from today onward</a></li>
          <li><a href="#">Return of the Broken Constellation</a></li>
          <li><a href="#">Les daltons</a></li>
          <li><a href="#">Les petits diables</a></li>
          <li><a href="#">Your Talent is Mine | I Copy Talents</a></li>
          <li><a href="#">Ranker who lives a Second lives ranker</a></li>
          <li><a href="#">Swordmaster's Youngest Son</a></li>
          <li><a href="#">The Creator is on Hiatus</a></li>
          <li><a href="#">I'm Not That Kind of Talent</a></li>
        </ul>
    </div>
</main>

<script src="/ressources/js/source.js"></script>
<?php
    require "footer.php";
?>