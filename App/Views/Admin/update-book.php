

<?php
    require "header.php";
    require "../App/Controllers/BookController.php";
    
    $controller = new BookController();
    
    $array = $controller->verifyUrlAll();
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
        <form action="/update-book-controller/update-book" method="post" enctype="multipart/form-data">
            <div class="flex button">
                <button type="reset">Annuler la modification</button>
                <button type="submit" name="validate">Modifier l'oeuvre</button>
            </div>
            <div class="flex radio">
                <div>Statuts</div>
                <div class="flex_radio">
                    <div>
                        <input type="radio" id="attente" name="status" value="En attente" checked>
                        <label for="attente">En attente</label>
                    </div>
                    <div>
                        <input type="radio" id="ligne" name="status" value="En ligne">
                        <label for="ligne">En ligne</label>
                    </div>
                    <div>
                        <input type="radio" id="retirer" name="status" value="Retirer">
                        <label for="retirer">Retirer</label>
                    </div>                
                </div>
            </div>
            <div class="label flex">
                <label for="name">Nom de l'oeuvre</label>
                <input type="text" id="name" name="name_book" placeholder="Nom de l'oeuvre" value ="<?= $array[0]["book_name"] ?>">
            </div>
            <div class="label flex">
                <label for="reference">Dimunitif</label>
                <input type="text" id="reference" name="ref_book" placeholder="comics/book/mangas-MHA" value ="<?= $array[0]["book_id"] ?>">
                <input type="hidden" id="reference" name="ref_book0" placeholder="comics/book/mangas-MHA" value ="<?= $array[0]["book_id"] ?>">
            </div>
            <div class="label flex">
                <label for="img">L'image de l'oeuvre</label>
                <input type="file" id="img" name="image_book" required>
            </div>
            <div class="label flex">
                <label for="description">Résumé de l'oeuvre</label>
                <textarea name="desc_book" id="description" cols="30" rows="10" placeholder="Description de l'oeuvre"><?= $array[0]["book_description"] ?></textarea>
            </div>
           </form>
        </div>
    </div>

</main>


<?php
    require "footer.php";
?>