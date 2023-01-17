

<?php
    require "header.php";
    
    require "../App/Controllers/BookController.php";

    $bookcontroller = new BookController();
    $array = $bookcontroller->verifyAllDistinctChapter();

    $array0 = $bookcontroller->verifyAllChapters();
?>

<?php if(isset($_SESSION["user_role"]) && $_SESSION["user_role"] == 0): ?>

<main>

    <div class="bloc-div flex">
            <button class="task">Icon</button>
            <nav class="bloc-task">
                <ul>
                    <li><a href="/admin/receive/dashbord">Acceuil</a></li>
                    <li><a href="/admin/receive/gestion">Gestion des oeuvres</a></li>
                    <li><a href="/admin/receive/create-book">Publier une oeuvre</a></li>
                    <li><a href="/admin/receive/create-chapter">Publier un chapitre</a></li>
                </ul>
            </nav>

            <div class="data">
                <?php if($array !== []) : ?>
                <h2 class="all">All chapters of <span><?= $array[0]["book_name"] ?></span></h2>
                <ul>
                    <?php foreach($array as $key => $values) : ?>
                        <li><?= $values["chapter_title"] ?>
                            <div class="flex div">
                                <button class="update white watch" value = "<?= $values["chapter_number"] ?>">Voir l'intégralité du chapitre</button>
                                <form action="/chapter-controller/delete-chapter" method="post">
                                        <input type="hidden" name="id" value="<?= $values["book_id"] ?>">
                                        <button name="delete" value="<?= $values["chapter_title"] ?>"><i class="fa fa-close"></i></button>
                                </form>
                            </div>
                        </li>
                    <?php endforeach; ?>
                </ul>
                <?php else : ?>
                    <h2>Pas de chapitres en cours</h2>
                <?php endif; ?>
            </div>

            <?php foreach($array as $key => $values) : ?>
                <div class="put modal animate recherche4 <?= $values["chapter_number"] ?>">
                            <div>
                                        <div>

                                            <div class="flex-image flex">
                                                <?php foreach($array0 as $key => $value) : ?>

                                                        <?php if($value["chapter_title"] == $values["chapter_title"]) : ?>

                                                            <?php if(preg_match("/^mangas/i", $value["book_id"])) : ?>
                                                                <img src="/ressources/assets/medias-chapters/medias-mangas/<?= $value["chapter_image"] ?>">

                                                            <?php elseif(preg_match("/^comics/i", $value["book_id"])) : ?>
                                                                <img src="/ressources/assets/medias-chapters/medias-comics/<?= $value["chapter_image"] ?>">
                                                            
                                                            <?php else : ?>
                                                                <div class="justify"><?= $value["chapter_text"] ?></div>
                                                            
                                                            <?php endif; ?>

                                                        <?php endif; ?>

                                                <?php endforeach; ?>
                                            </div>

                                        </div>
                                        <button type="reset" class="danger closes"><i class="fa fa-close"></i> Annuler</button>
                            </div>
                </div>
            <?php endforeach; ?>

    </div>


</main>


<script src="/ressources/js/modal.js"></script>
<?php
    require "footer.php";
?>

<?php else: ?>

<?php header("Location:/receive/home"); ?>

<?php endif; ?>