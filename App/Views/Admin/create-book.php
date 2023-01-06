

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
            <div class="flex radio">
                <div>Statuts</div>
                <div class="flex_radio">
                    <div>
                        <input type="radio" id="attente" name="fav_language" value="En attente" checked>
                        <label for="attente">En attente</label>
                    </div>
                    <div>
                        <input type="radio" id="ligne" name="fav_language" value="En ligne">
                        <label for="ligne">En ligne</label>
                    </div>
                    <div>
                        <input type="radio" id="retirer" name="fav_language" value="Retirer">
                        <label for="retirer">Retirer</label>
                    </div>                
                </div>
            </div>
            <div class="label flex">
                <label for="name">Nom de l'oeuvre</label>
                <input type="text" id="name" placeholder="Nom de l'oeuvre">
            </div>
            <div class="label flex">
                <label for="reference">Dimunitif</label>
                <input type="text" id="reference" placeholder="comics/book/mangas-MHA">
            </div>
            <div class="label flex">
                <label for="img">L'image de l'oeuvre</label>
                <input type="file" id="img">
            </div>
            <div class="label flex">
                <label for="description">Résumé de l'oeuvre</label>
                <textarea name="" id="description" cols="30" rows="10" placeholder="Description de l'oeuvre"></textarea>
            </div>
           </form>
        </div>
    </div>

</main>


<?php
    require "footer.php";
?>