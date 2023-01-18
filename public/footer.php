
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
                <?php foreach($array2 as $key => $values) : ?>
                    <?php if($values["book_status"] == "En ligne") : ?>
                        <li><?= $values["book_name"] ?> <span class="span">New</span></li>
                    <?php endif; ?>
                <?php endforeach; ?>
            </ul>
        </section>
        <section>
            <h3>Les oeuvres les plus suivies</h3>
            <ul class="flex flex-ul">
                <?php foreach($array3 as $key => $values) : ?>
                    <?php if($values["book_status"] == "En ligne" && $values["Nombres"] > 10) : ?>
                        <li><?= $values["book_name"] ?> <span class="follow">Les plus suivies</span></li>
                    <?php endif; ?>
                <?php endforeach; ?>
            </ul>
        </section>
        <section>
            <h3>Inédits</h3>
            <ul class="flex flex-ul">
                <?php foreach($array2 as $key => $values) : ?>
                    <?php if($values["book_status"] == "En attente") : ?>
                        <li><?= $values["book_name"] ?> <span class="inedit">Inédit</span></li>
                    <?php endif; ?>
                <?php endforeach; ?>
            </ul>
        </section>
    </div>
    <p>&copy;Copyright 2023</p>
</footer>
</body>
</html>