<?php
    require "header.php";
?>

<?php if(isset($_SESSION["user_role"])): ?>
    
<?php if($array[0]["book_status"] === "En ligne"): ?>

<main>

    <div class="road">

        <a href="/book-controller/view-home">Home</a> 
        <a href="/book-controller/<?= $array[0]["book_id"] ?>/view-book"><?= $array[0]["book_name"] ?></a> 
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

        <section class="chapter chapter_media z-index">
            <div class="flex">
                <button class="chapter_icon"><i class="fa fa-bars"></i></button>
                <h3>Chapitres</h3>
            </div>
                <ul>
                    <?php for($i=0; $i<count($array1); $i++) : ?>
                        <li><a href="/book-controller/<?= $array1[$i]["chapter_number"] ?>/<?= $array1[$i]["book_id"] ?>/view-chapter"> Chapitre <?= $i+1 ?> </a></li>
                    <?php endfor; ?> 
                </ul>
        </section>

    </div>

    <div class="top z-index"><a href="#top"><i class="fa fa-arrow-up"></i></a></div>
    <button class="click_button z-index"><i class="fa fa-arrow-left"></i></a></button>
</main>

    <?php if($data =="mangas" || $data == "comics"): ?>

        <script src="/ressources/js/show.js"></script>
        
    <?php endif; ?>

    <script src="/ressources/js/chapter.js"></script>


<?php require "footer.php"; ?>

<?php else: ?>

    <main>
        <h2>Cet article n'est pas disponible actuellement !!!</h2>
        <button class="click_button z-index"><i class="fa fa-arrow-left"></i></a></button>
    </main>

    <script src="/ressources/js/task.js"></script>

<?php endif; ?> 

    <?php else: ?>

    <?php header("Location:/book-controller/view-home"); ?>

    <?php endif; ?>