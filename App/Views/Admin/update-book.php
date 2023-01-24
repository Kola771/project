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
                    <li><a href="/admin/book-controller/create-chapter-admin">Publier un chapitre</a></li>
                </ul>
            </nav>

        <div class="data flex">
            
            <form class="basis" action="/update-book-controller/update-book" method="post" enctype="multipart/form-data">

            <?php if(isset($_GET["book_exist"])): ?>
                    <h3 class="danger">Une oeuvre a déjà ces attributs !!!</h3>
            <?php endif; ?>

            <?php if(isset($_GET["msg_empty"])): ?>
                    <h3 class="danger">Remplissez tout les champs !!!</h3>
            <?php endif; ?>
            
            <?php if(isset($_GET["format_error"])): ?>
                    <h3 class="danger">Le format pré-requis pour le dimunitif n'est pas respecté !!! Les genres de format que nous acceptons sont : mangas-dimunitif ou book-dimunitif ou comics-dimunitif.</h3>
            <?php endif; ?>

            <div class="flex button">

                <a href="/book-controller/redirection">Annuler la modification</a>
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
                <input type="text" name="ref_book" placeholder="comics/book/mangas-MHA" value ="<?= $array[0]["book_id"] ?>">
                <input type="hidden" name="ref_book0" value ="<?= $array[0]["book_id"] ?>">
                <input type="hidden" name="image" value ="<?= $array[0]["book_image"] ?>">
            </div>
            <div class="label flex">
                <label for="img">L'image de l'oeuvre</label>
                <input type="file" id="img" name="image_book" required>
            </div>
            <div class="label flex">
                <label for="description">Résumé de l'oeuvre</label>
                <textarea name="desc_book" id="description" cols="30" rows="10" placeholder="Description de l'oeuvre"><?= $text ?></textarea>
            </div>
           </form>
        </div>
    </div>

    <div class="top"><a href="#top"><i class="fa fa-arrow-up"></i></a></div>
    <button class="click_button"><i class="fa fa-arrow-left"></i></a></button>
</main>


<script src="/ressources/js/admin.js"></script>
<?php
    require "footer.php";
?>

<?php else: ?>

<?php header("Location:/receive/page-error"); ?>

<?php endif; ?>