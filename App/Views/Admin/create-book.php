

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
                    <li><a href="/admin/receive/create-book">Publier une oeuvre</a></li>
                    <li><a href="/admin/book-controller/create-chapter-admin">Publier un chapitre</a></li>
                </ul>
            </nav>

        <div class="data flex">

           <form class="basis" action="/book-controller/validate-form" method="post" enctype="multipart/form-data">

            <?php if(isset($_GET["msg_empty"])): ?>
                 <h3 class="danger">Remplissez tout les champs !!!</h3>
            <?php endif; ?>

            <?php if(isset($_GET["msg_format_error"])): ?>
                 <h3 class="danger">Le format pré-requis pour le dimunitif n'est pas respecté !!! Les genres de format que nous acceptons sont : mangas-dimunitif ou book-dimunitif ou comics-dimunitif. Ne mettez pas des caractères accentués ou spéciaux !!!</h3>
            <?php endif; ?>
            
            <?php if(isset($_GET["format_error_num"])): ?>
                 <h3 class="danger">Ne mettez pas des chiffres dans le dimunitif que vous donnez à votre oeuvre !!!</h3>
            <?php endif; ?>
            
            <?php if(isset($_GET["format_error_char"])): ?>
                 <h3 class="danger">Ne mettez pas des caractères accentués ou spéciaux dans le dimunitif que vous donnez à votre oeuvre !!!</h3>
            <?php endif; ?>

            <?php if(isset($_GET["msg_book_name_exist"])): ?>
                 <h3 class="danger">Un livre portant ce nom existe déjà !!!</h3>
            <?php endif; ?>

            <?php if(isset($_GET["msg_book_ref_exist"])): ?>
                 <h3 class="danger">Un livre portant ce dimunitif existe déjà !!!</h3>
            <?php endif; ?>
            
            <div class="flex button">
                <button><a href="/admin/book-controller/view-gestion">Annuler la modification</a></button>
                <button type="submit" name="validate">Valider la publication</button>
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
                <input type="text" id="name" name="name_book" placeholder="Nom de l'oeuvre" value ="<?= $_GET["name_book"] ?? "" ?>">
            </div>
            <div class="label flex">
                <label for="reference">Dimunitif</label>
                <input type="text" id="reference" name="ref_book" placeholder="comics/book/mangas-MHA" value ="<?= $_GET["ref_book"] ?? "" ?>">
            </div>
            <div class="label flex">
                <label for="img">L'image de l'oeuvre</label>
                <input type="file" id="img" name="image_book" required>
            </div>
            <div class="label flex">
                <label for="description">Résumé de l'oeuvre</label>
                <textarea name="desc_book" id="description" cols="30" rows="10" placeholder="Description de l'oeuvre"></textarea>
            </div>
           </form>
        </div>
    </div>

    <div class="top"><a href="#top"><i class="fa fa-arrow-up"></i></a></div>
</main>


<script src="/ressources/js/admin.js"></script>
<?php
    require "footer.php";
?>

<?php else: ?>

<?php header("Location:/receive/page-error"); ?>

<?php endif; ?>