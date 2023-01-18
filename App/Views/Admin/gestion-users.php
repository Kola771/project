

<?php
    require "header.php";
    
    require "../App/Controllers/BookController.php";

    $bookcontroller = new BookController();
    $array = $bookcontroller->verifyAllUsers();
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
                    <input list="browsers" type="text" id="search" placeholder="Recherche le nom d'emprunt">
                </form>
            </div>
            <table id="myTable">
                <thead class="thead-dark">
                    <tr>
                        <th>Nom des utilisateurs</th>
                        <th>Noms d'emprunts</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach($array as $key => $values) : ?>
                        <tr>
                            <td><?= $values["user_lastname"] ?> <?= $values["user_firstname"] ?>

                                <?php if($values["user_role"] == 0) : ?>
                                    <strong>(Administrator)</strong>
                                <?php endif; ?>

                            </td>
                            <td><?= $values["user_username"] ?></td>
                            <td>

                                <button type="submit" class="danger supprimer" value = "<?= $values["user_id"] ?>">Supprimer l'utilisateur</button>
                                <button class="update white watch" value = "<?= $values["user_id"] ?>">Plus de détails</button>

                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>   
        </div>
    </div>

    <div id="recherche0" class="remove modal animate">
                <div>
                    Voulez-vous vraiment supprimer cette oeuvre du site ?
                    <form action="/login-controller/delete-users" method="post" class="flex">
                        <button type="reset" class="danger closes"><i class="fa fa-close"></i> Annuler</button>
                        <button type="submit" class="delete" name="delete">Supprimer l'oeuvre</button>
                    </form>
                </div>
    </div>

    <?php foreach($array as $key => $values) : ?>
        <div class="put modal animate recherche4 <?= $values["user_id"] ?>">
                    <div>
                            <div>
                                <img src="/ressources/assets/medias-users/<?= $values["user_image"] ?>" alt="<?= $values["user_username"] ?>">
                                <div>
                                    <h4>Addresse électronique :</h4>
                                    <p><?= $values["user_email"] ?></p>
                                </div>
                                <div>
                                    <h4>Mot clé :</h4>
                                    <p><?= $values["user_wordkey"] ?></p>
                                </div>
                                <div>
                                    <h4>Status :</h4>
                                    <?php if($values["user_role"] == 0) : ?>

                                        <p>Administrator</p>
                                    
                                    <?php else : ?>
                                        
                                        <p>User</p>

                                    <?php endif; ?>
                                </div>
                                <div>
                                    <h4>User depuis le :</h4>
                                    <p><?= $values["created_at"] ?></p>
                                </div>
                            </div>
                            <button type="reset" class="danger closes"><i class="fa fa-close"></i> Fermer</button>
                    </div>
        </div>
    <?php endforeach; ?>

</main>


<script src="/ressources/js/admin_search.js"></script>
<?php
    require "footer.php";
?>

<?php else: ?>

<?php header("Location:/receive/home"); ?>

<?php endif; ?>