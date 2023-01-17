
<?php 
require_once "../App/Controllers/BookController.php";

$controller = new BookController();

$array2 = $controller->verifyAllDesc();

$array3 = $controller->commentCount();
?>
<footer>
    <div class="flex">
        <section>
            <h3>Actualités</h3>
            <ul class="flex flex-ul">
                <?php for($i=0; $i<5; $i++) : ?>
                    <?php if($array2[$i]["book_status"] == "En ligne") : ?>
                        <li><?= $array2[$i]["book_name"] ?> <span class="span">New</span></li>
                    <?php endif; ?>
                <?php endfor; ?>
            </ul>
        </section>
        <section>
            <h3>Les oeuvres les plus suivies</h3>
            <ul class="flex flex-ul">
                <?php for($i=0; $i<3; $i++) : ?>
                    <?php if($array3[$i]["book_status"] == "En ligne" && $array3[$i]["Nombres"] > 1) : ?>
                        <li><?= $array3[$i]["book_name"] ?> <span class="follow">Les plus suivies</span></li>
                    <?php endif; ?>
                <?php endfor; ?>
            </ul>
        </section>
        <section>
            <h3>Inédits</h3>
            <ul class="flex flex-ul">
                <?php for($i=0; $i<5; $i++) : ?>
                    <?php if($array2[$i]["book_status"] == "En attente") : ?>
                        <li><?= $array2[$i]["book_name"] ?> <span class="inedit">Inédit</span></li>
                    <?php endif; ?>
                <?php endfor; ?>
            </ul>
        </section>
    </div>
    <p>&copy;Copyright 2023</p>
</footer>
</body>
</html>