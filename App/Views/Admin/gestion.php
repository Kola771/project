

<?php
    require "header.php";
    // require "../App/Controllers/BookController.php";

    // $bookcontroller = new BookController();
    // $array = $bookcontroller->verifyAllBook();
    // echo "<pre>";
    // var_dump($array);
    // echo "</pre>";
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
                        <th>Nombre de chapitres</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach($array as $key => $values) : ?>
                        <tr>
                            <td><?= $values["book_status"] ?></td>
                            <td><?= $values["book_name"] ?></td>
                            <td>5</td>
                            <td>
                                <?php if($values["book_status"] == "En ligne") : ?>

                                <button type="submit" class="danger retirer" value = "<?= $values["book_id"] ?>" >Retirer</button>
                                <button type="submit" class="update"><a href="/book/<?= $values["book_id"] ?>/update-book">Modifier l'oeuvre</a></button>

                                <?php elseif($values["book_status"] == "En attente") : ?>

                                <button type="submit" class="success ligne" value = "<?= $values["book_id"] ?>" >Mettre en ligne</button>
                                <button type="submit" class="update"><a href="/book/<?= $values["book_id"] ?>/update-book">Modifier l'oeuvre</a></button>

                                <?php else : ?>

                                <button type="submit" class="primary mettre" value = "<?= $values["book_id"] ?>" >Remettre</button>
                                <button type="submit" class="update"><a href="/book/<?= $values["book_id"] ?>/update-book">Modifier l'oeuvre</a></button>

                                <?php endif; ?>

                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>   
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

</main>


<script src="/ressources/js/admin_search.js"></script>
<?php
    require "footer.php";
?>