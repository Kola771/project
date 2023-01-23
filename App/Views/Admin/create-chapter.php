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
                    <li><a href="/admin/book-controller/create-book-admin">Publier une oeuvre</a></li>
                    <li class="active"><a href="/admin/book-controller/create-chapter-admin">Publier un chapitre</a></li>
                </ul>
            </nav>

        <div class="data flex">

            <form action="#" method="post" id="select">
                <h3>Veuillez bien choisir le type du livre sur lequel vous voulez publier un chapitre</h3>
                <select id="choose">
                    <option disabled>Selectionnre le type du livre</option>
                    <option value="mangas">Mangas</option>
                    <option value="comics">Comics</option>
                    <option value="books">Books</option>
                </select>
                <button class="soumettre">Soumettre</button>
            </form>
           <form action="#" method="post" class="add-mc" enctype="multipart/form-data">
            <h4 class="nota_biem">NB: Vous ne pouvez insérez pas plus de 20 images par chapître !!!</h4>
            <div class="flex button">
                <button type="reset">Annuler la publication</button>
                <button type="submit" name="validate">Valider la publication</button>
            </div>
            <div class="label flex">
                <label for="number">Numéro du chapitre</label>
                <input type="number" id="number" name="number" placeholder="1">
            </div>
            <div class="label flex">
                <label for="name">Nom du chapitre</label>
                <input type="text" name="name" id="name" placeholder="Nom du chapitre">
            </div>
            <div class="label flex">
                <label for="reference">Nom du livre</label>

                    <select name="name_mangas" class="mangas" id="reference" required>
                        <option disabled>Sélectionner le livre</option>
                        <?php foreach($array as $key => $values) : ?>
                            <?php if(preg_match_all("/^mangas-/i", $values["book_id"])) : ?>
                                <option value="<?= $values["book_id"] ?>"><?= $values["book_name"] ?></option>
                            <?php endif; ?>
                        <?php endforeach; ?>
                    </select>

                    <select name="name_comics" class="comics" id="reference" required>
                        <option disabled>Sélectionner le livre</option>
                        <?php foreach($array as $key => $values) : ?>
                            <?php if(preg_match_all("/^comics-/i", $values["book_id"])) : ?>
                                <option value="<?= $values["book_id"] ?>"><?= $values["book_name"] ?></option>
                            <?php endif; ?>
                        <?php endforeach; ?>
                    </select>

                    <select name="name_books"  class="books" id="reference" required>
                        <option disabled>Sélectionner le livre</option>
                        <?php foreach($array as $key => $values) : ?>
                            <?php if(preg_match_all("/^books-/i", $values["book_id"])) : ?>
                                <option value="<?= $values["book_id"] ?>"><?= $values["book_name"] ?></option>
                            <?php endif; ?>
                        <?php endforeach; ?>
                        </select>

            </div>
            <div class="label img flex">
                <label for="image">Les images composant le chapitre</label>
            </div>
            <div class="label flex">
                <label for="description">Description du chapitre</label>
                <textarea name="description" id="description" cols="30" rows="10" placeholder="Description du chapitre"></textarea>
            </div>
           </form>
        </div>
    </div>

    <div class="top"><a href="#top"><i class="fa fa-arrow-up"></i></a></div>
    <button class="click_button"><i class="fa fa-arrow-left"></i></a></button>
</main>

<script src="/ressources/js/create_chapter.js"></script>
<?php
    require "footer.php";
?>

<?php else: ?>

<?php header("Location:/receive/page-error"); ?>

<?php endif; ?>