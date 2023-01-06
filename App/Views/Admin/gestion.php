

<?php
    require "header.php";
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
                    <datalist id="browsers">
                        <option value="White Dragon Duke: Pendragon"></option>
                        <option value="Return of the Broken Constellation"></option>
                        <option value="Les petits diables"></option>
                    </datalist>
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
                    <tr>
                        <td>En ligne</td>
                        <td>White Dragon Duke: Pendragon</td>
                        <td>5</td>
                        <td>
                            <button type="submit" class="danger" id="remove">Retirer</button>
                            <button type="submit" class="update"><a href="/book/name/update-book">Modifier l'oeuvre</a></button>
                        </td>
                    </tr>
                    <tr>
                        <td>En attente</td>
                        <td>Return of the Broken Constellation</td>
                        <td>5</td>
                        <td>
                            <button type="submit" class="success" id="inside">Mettre en ligne</button>
                            <button type="submit" class="update"><a href="/book/name/update-book">Modifier l'oeuvre</a></button>
                        </td>
                    </tr>
                    <tr>
                        <td>Retirer</td>
                        <td>Les petits diables</td>
                        <td>5</td>
                        <td>
                            <button type="submit" class="primary" id="put">Remettre</button>
                            <button type="submit" class="update"><a href="/book/name/update-book">Modifier l'oeuvre</a></button>
                        </td>
                    </tr>
                </tbody>
            </table>   
        </div>
    </div>

    <div id="recherche1" class="remove modal animate">
                <div>
                    Voulez-vous vraiment retirer cette oeuvre du site ?
                    <form action="#" method="post" class="flex">
                        <button type="reset" class="danger closes"><i class="fa fa-close"></i> Annuler</button>
                        <button type="submit">Retirer l'oeuvre du site</button>
                    </form>
                </div>
    </div>

    <div id="recherche2" class="inside modal animate">
                <div>
                    Voulez-vous vraiment remettre cette oeuvre en ligne ?
                    <form action="#" method="post" class="flex">
                        <button type="reset" class="danger closes"><i class="fa fa-close"></i> Annuler</button>
                        <button type="submit">Remettre l'oeuvre en ligne</button>
                    </form>
                </div>
    </div>

    <div id="recherche3" class="put modal animate">
                <div>
                    Voulez-vous vraiment mettre en ligne cette oeuvre ?
                    <form action="#" method="post" class="flex">
                        <button type="reset" class="danger closes"><i class="fa fa-close"></i> Annuler</button>
                        <button type="submit">Mettre en ligne cette oeuvre</button>
                    </form>
                </div>
    </div>

</main>


<script src="/ressources/js/admin_search.js"></script>
<?php
    require "footer.php";
?>