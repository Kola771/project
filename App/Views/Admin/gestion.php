

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
                    <li class="active"><a href="/admin/book-controller/redirection">Gestion des oeuvres</a></li>
                    <li><a href="/admin/book-controller/view-gestion-users">Gestion des users</a></li>
                    <li><a href="/admin/book-controller/create-book-admin">Publier une oeuvre</a></li>
                    <li><a href="/admin/book-controller/create-chapter-admin">Publier un chapitre</a></li>
                </ul>
            </nav>

        <div class="data">
            <div class="form-search flex">
                <form action="#" method="post">
                    <input list="browsers" type="text" id="search" placeholder="Recherche le nom..">
                </form>

                <a href="/admin/book-controller/create-book-admin">Publier une oeuvre</a>
            </div>
            <div class="overflow_table">
            <table id="myTable">
                <thead class="thead-dark">
                    <tr>
                        <th>Statuts</th>
                        <th>Noms des Oeuvres</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach($array as $key => $values) : ?>
                        <tr>
                            <td><?= $values["book_status"] ?></td>
                            <td><?= $values["book_name"] ?></td>
                            <td>
                                <?php if($values["book_status"] == "En ligne") : ?>

                                <button type="submit" class="danger retirer" value = "<?= $values["book_id"] ?>" >Retirer</button>

                                <?php elseif($values["book_status"] == "En attente") : ?>

                                <button type="submit" class="success ligne" value = "<?= $values["book_id"] ?>" ><i class="fas fa-share-alt"></i> Publier</button>

                                <?php else : ?>

                                <button type="submit" class="primary mettre" value = "<?= $values["book_id"] ?>" >Remettre</button>
                                
                                <?php endif; ?>
                                <button type="submit" class="danger supprimer" value = "<?= $values["book_id"] ?>"><i class="fa fa-trash"></i> Supprimer l'oeuvre</button>
                                <button class="blue white watch" value = "<?= $values["book_id"] ?>">Plus de détails</button>
                                <a class="update" href="/book-controller/<?= $values["book_id"] ?>/view-update-book"><i class="fa fa-pencil"></i> Modifier l'oeuvre</a>
                                <a class="blue" href="/book-controller/<?= $values["book_id"] ?>/view-show-admin">Voir les chapîtres</a>

                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
            </div> 
            <form action="/book-controller/redirection" class="form-next" method="post">
                <?php for($i=0; $i<$int; $i++) : ?>
                    <button class="next" value="<?= $i ?>" name="next"><?= $i+1 ?></button> 
                <?php endfor; ?>
            </form>
        </div>
    </div>

    <div id="recherche0" class="remove modal animate">
                <div>
                    Voulez-vous vraiment supprimer cette oeuvre du site ?
                    <form action="/book-controller/delete-book" method="post" class="flex">
                        <button type="reset" class="danger closes"><i class="fa fa-close"></i> Annuler</button>
                        <button type="submit" class="delete" name="delete">Supprimer l'oeuvre</button>
                    </form>
                </div>
    </div>

    <div id="recherche1" class="remove modal animate">
                <div>
                    Voulez-vous vraiment retirer cette oeuvre du site ?
                    <form action="/book-controller/update-book-status" method="post" class="flex">
                        <button type="reset" class="danger closes"><i class="fa fa-close"></i> Annuler</button>
                        <button type="submit" class="retire" name="retire">Retirer l'oeuvre du site</button>
                    </form>
                </div>
    </div>

    <div id="recherche2" class="inside modal animate">
                <div>
                    Voulez-vous vraiment remettre cette oeuvre en ligne ?
                    <form action="/book-controller/update-book-status" method="post" class="flex">
                        <button type="reset" class="danger closes"><i class="fa fa-close"></i> Annuler</button>
                        <button type="submit" class="remettre" name="remettre">Remettre l'oeuvre en ligne</button>
                    </form>
                </div>
    </div>

    <div id="recherche3" class="put modal animate">
                <div>
                    Voulez-vous vraiment publier cette oeuvre ?
                    <form action="/book-controller/update-book-status" method="post" class="flex">
                        <button type="reset" class="danger closes"><i class="fa fa-close"></i> Annuler</button>
                        <button type="submit" class="attente" name="attente">Publier cette oeuvre</button>
                    </form>
                </div>
    </div>

    <?php foreach($array as $key => $values) : ?>
        <div class="put modal animate recherche4 <?= $values["book_id"] ?>">
                    <div>
                            <div>
                                <img src="/ressources/assets/medias-book/<?= $values["book_image"] ?>" alt="<?= $values["book_name"] ?>">
                                <div>
                                    <h4>Nom de l'oeuvre :</h4>
                                    <p><?= $values["book_name"] ?></p>
                                </div>
                                <div>
                                    <h4>Description de l'oeuvre :</h4>
                                    <p><?= $values["book_description"] ?></p>
                                </div>
                                <div>
                                    <h4>Status :</h4>
                                    <p><?= $values["book_status"] ?></p>
                                </div>
                                <div>
                                    <h4>Publiée le :</h4>
                                    <p><?= $values["created_at"] ?></p>
                                </div>
                            </div>
                            <button type="reset" class="danger closes"><i class="fa fa-close"></i> Fermer</button>
                    </div>
        </div>
    <?php endforeach; ?>

    <div class="top"><a href="#top"><i class="fa fa-arrow-up"></i></a></div>
    <button class="click_button"><i class="fa fa-arrow-left"></i></a></button>
</main>


<script src="/ressources/js/admin_search.js"></script>
<?php
    require "footer.php";
?>

<?php else: ?>

<?php header("Location:/receive/page-error"); ?>

<?php endif; ?>