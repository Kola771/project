

<?php
    require "header.php";
    // $text = "mangas-okk";
    // if(preg_match("/comics/i", $text) || preg_match("/mangas/i", $text)) {
    //     echo "super";
    // } else {
    //     echo "book";
    // }
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

        <div class="data flex">
           <form action="#" method="post">
            <div class="flex button">
                <button type="reset">Annuler la publication</button>
                <button type="submit">Valider la publication</button>
            </div>
            <div class="label flex">
                <label for="name">Numéro du chapitre</label>
                <input type="number" id="name" placeholder="1">
            </div>
            <div class="label flex">
                <label for="name">Nom du chapitre</label>
                <input type="text" id="name" placeholder="Nom du chapitre">
            </div>
            <div class="label flex">
                <label for="reference">Dimunitif</label>
                <input type="text" list="liste" id="reference" placeholder="comics/book/mangas-MHA">
                <datalist id="liste">
                    <option value="book-Rose"></option>
                    <option value="mangas-Nar"></option>
                    <option value="comics-Dal"></option>
                </datalist>
            </div>
            <div class="label flex">
                <label for="title">Titre du chapitre</label>
                <input type="text" id="title" placeholder="Titre du chapitre">
            </div>
            <div class="label flex">
                <label for="img">Les images composant le chapitre</label>
                <input type="file" id="img">
            </div>
            <div class="label flex">
                <label for="description">Description du chapitre</label>
                <textarea name="" id="description" cols="30" rows="10" placeholder="Description du chapitre"></textarea>
            </div>
           </form>
        </div>
    </div>

</main>


<?php
    require "footer.php";
?>