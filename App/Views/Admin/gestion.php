

<?php
    require "header.php";
    
    require "../App/Controllers/BookController.php";

    $bookcontroller = new BookController();
    $array = $bookcontroller->verifyAllBook();
?>

<?php if(isset($_SESSION["user_role"]) && $_SESSION["user_role"] == 0): ?>

<main>

    <div class="bloc-div flex">
        <button class="task"><i class="fa fa-bars"></i></button>
            <nav class="bloc-task">
                <ul>
                    <li><a href="/admin/receive/dashbord">Acceuil</a></li>
                    <li><a href="/admin/receive/gestion">Gestion des oeuvres</a></li>
                    <li><a href="/admin/receive/gestion-users">Gestion des users</a></li>
                    <li><a href="/admin/receive/create-book">Publier une oeuvre</a></li>
                    <li><a href="/admin/receive/create-chapter">Publier un chapitre</a></li>
                </ul>
            </nav>

        <div class="data">
            <div class="form-search flex">
                <form action="#" method="post">
                    <input list="browsers" type="text" id="search" placeholder="Recherche le nom..">
                </form>

                <button type="submit"><a href="/admin/receive/create-book">Publier une oeuvre</a></button>
            </div>
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

                                <button type="submit" class="success ligne" value = "<?= $values["book_id"] ?>" >Mettre en ligne</button>

                                <?php else : ?>

                                <button type="submit" class="primary mettre" value = "<?= $values["book_id"] ?>" >Remettre</button>
                                
                                <?php endif; ?>
                                <button type="submit" class="danger supprimer" value = "<?= $values["book_id"] ?>">Supprimer l'oeuvre</button>
                                <button class="update white watch" value = "<?= $values["book_id"] ?>">Plus de détails</button>
                                <a class="update" href="/book/<?= $values["book_id"] ?>/update-book">Modifier l'oeuvre</a>
                                <a class="update" href="/book/<?= $values["book_id"] ?>/show-chapters">Voir les chapîtres</a>

                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>  
            
    <button class="previous">Previous</button> 
    <button class="next">Next</button> 
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
                    Voulez-vous vraiment mettre en ligne cette oeuvre ?
                    <form action="/book-controller/update-book-status" method="post" class="flex">
                        <button type="reset" class="danger closes"><i class="fa fa-close"></i> Annuler</button>
                        <button type="submit" class="attente" name="attente">Mettre en ligne cette oeuvre</button>
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
</main>


<script src="/ressources/js/admin_search.js"></script>
<script src="/ressources/js/text.js"></script>
<?php
    require "footer.php";
?>

<?php else: ?>

<?php header("Location:/receive/home"); ?>

<?php endif; ?>