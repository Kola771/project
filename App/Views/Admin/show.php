

<?php
    require "header.php";
    
    require "../App/Controllers/BookController.php";

    $bookcontroller = new BookController();
    $array = $bookcontroller->verifyAllDistinctChapter();
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
                            <form action="/chapter-controller/delete-chapter" method="post">
                                <a href="/book/<?= $values["chapter_number"] ?>/<?= $values["book_id"] ?>/show-chapter">Voir plus</a>
                                <input type="hidden" name="id" value="<?= $values["book_id"] ?>">
                                <button name="delete" value="<?= $values["chapter_title"] ?>"><i class="fa fa-close"></i></button>
                            </form>
                        </li>
                    <?php endforeach; ?>
                </ul>
                <?php else : ?>
                    <h2>Pas de chapitres en cours</h2>
                <?php endif; ?>
            </div>

    </div>


</main>


<script src="/ressources/js/admin_search.js"></script>
<?php
    require "footer.php";
?>

<?php else: ?>

<?php header("Location:/receive/home"); ?>

<?php endif; ?>