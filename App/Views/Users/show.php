

<?php
    require "header.php";
    require "../App/Controllers/BookController.php";
    
    $controller = new BookController();
    
    //tableau pour l'affichage des chapitres
    $array = $controller->verifyAllChapter();
    $array1 = $controller->verifyAllDistinctChapter();

    $data = $array[0]["book_id"];
    if(preg_match("/^mangas/i", $data, $match) || preg_match("/^comics/i", $data, $match) || preg_match("/^books/i", $data, $match)) {
        $data = $match[0];
    }
?>

<?php if(isset($_SESSION["user_role"])): ?>
    
<?php if($array[0]["book_status"] === "En ligne"): ?>

<main>

    <div class="road">

        <a href="/receive/home">Home</a> 
        <a href="/book/<?= $array[0]["book_id"] ?>/show-book"><?= $array[0]["book_name"] ?></a> 
        <a href="#">Chapitre <?= $array[0]["chapter_number"] ?></a>

    </div>

    <div class="container flex bloc media_tab">
        <?php if($data =="mangas"): ?>

            <section class="section-book title">
                <h2>Chapitre <?= $array[0]["chapter_number"] ?>: <?= $array[0]["chapter_title"] ?></h2>
                    <h4>Petit résumé : </h4>
                    <p><?= $array[0]["chapter_text"] ?></p>
                    <div class="relative">
                        <?php foreach($array as $key => $values) : ?>
                        <div class="absolute">
                            <img src="/ressources/assets/medias-chapters/medias-mangas/<?= $values["chapter_image"] ?>" alt="<?= $values["chapter_title"] ?>">
                        </div>
                        <?php endforeach; ?>
                        <a class="solute left flex"><i class="fa fa-chevron-left"></i></a>
                        <a class="solute right flex"><i class="fa fa-chevron-right"></i></a>
                    </div>
                </section>


        <?php elseif($data =="comics"): ?>

            <section class="section-book title">
                <h2>Chapitre <?= $array[0]["chapter_number"] ?>: <?= $array[0]["chapter_title"] ?></h2>
                    <h4>Petit résumé : </h4>
                    <p><?= $array[0]["chapter_text"] ?></p>
                    <div class="relative">
                        <?php foreach($array as $key => $values) : ?>
                        <div class="absolute">
                            <img src="/ressources/assets/medias-chapters/medias-comics/<?= $values["chapter_image"] ?>" alt="<?= $values["chapter_title"] ?>">
                        </div>
                        <?php endforeach; ?>
                        <a class="solute left flex"><i class="fa fa-chevron-left"></i></a>
                        <a class="solute right flex"><i class="fa fa-chevron-right"></i></a>
                    </div>
                </section>

        <?php else : ?>

        <section class="section-book title">
                <h2>Chapitre <?= $array[0]["chapter_number"] ?>: <?= $array[0]["chapter_title"] ?></h2>
                    <div class="book">
                        <?= $array[0]["chapter_text"] ?>
                    </div>
        </section>

        <?php endif; ?>

        <section class="chapter chapter_media">
            <div class="flex">
                <button class="chapter_icon"><i class="fa fa-bars"></i></button>
                <h3>Chapitres</h3>
            </div>
                <ul>
                    <?php for($i=0; $i<count($array1); $i++) : ?>
                        <li><a href="/book/<?= $array1[$i]["chapter_number"] ?>/<?= $array1[$i]["book_id"] ?>/show-chapter"> Chapitre <?= $i+1 ?> </a></li>
                    <?php endfor; ?> 
                </ul>
        </section>

    </div>

    <div class="top"><a href="#top"><i class="fa fa-arrow-up"></i></a></div>
</main>

    <script src="/ressources/js/show.js"></script>
    <script src="/ressources/js/chapter.js"></script>


<?php
    require "footer.php";
?>
<?php else: ?>

<h2>Cet article n'est pas disponible actuellement !!!</h2>

<?php endif; ?> 
<?php else: ?>

<?php header("Location:/receive/home"); ?>

<?php endif; ?>