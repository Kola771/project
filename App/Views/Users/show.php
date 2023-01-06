

<?php
    require "header.php";
    $type = "mangas";
?>

<main>
    <div class="container flex bloc">
        <div class="road">
            <a href="/receive/home">Home</a> ->
            <a href="/book/1/show-book">Nom du livre</a> ->
            <a href="#">Chapitre 1</a>
        </div>
        <?php if($type =="mangas" || $type =="comics"): ?>
        <section class="section-book title">
            <h2>Chapitre 1: Nom du chapitre</h2>
            <div class="relative">
                <div class="absolute">
                    <img src="/ressources/assets/Medias-book/bleach.jpg" alt="bleach">
                </div>
                <div class="absolute">
                    <img src="/ressources/assets/Medias-book/gojo.jpg" alt="boruto">
                </div>
                <div class="absolute">
                    <img src="/ressources/assets/Medias-book/la_rosée_de_la_nuit - Copie.jpg" alt="la rosée de la nuit">
                </div>
                <div class="absolute">
                    <img src="/ressources/assets/Medias-book/le_solitaire - Copie.jpg" alt="le solitaire">
                </div>
                <a class="solute left flex"><i class="fa fa-chevron-left"></i></a>
                <a class="solute right flex"><i class="fa fa-chevron-right"></i></a>
            </div>
        </section>

        <?php elseif($type =="book"): ?>
        <section class="section-book title">
            <h2>Chapitre 1: Nom du chapitre</h2>
            <div class="book">
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quaerat voluptatem, quam eaque totam vero modi maiores nam tempore sint veritatis. Voluptatem eius iste molestias maiores? Reprehenderit, qui autem. Qui ipsum ipsa quo veritatis doloribus molestias enim vero molestiae culpa iusto explicabo mollitia veniam est, obcaecati ut minima temporibus voluptatum dicta odio, saepe aspernatur eius facilis. Eligendi, voluptate neque? Est eligendi, aliquid fugiat quam quisquam numquam unde aut iusto deserunt asperiores cumque illo recusandae! Ex corporis, sequi similique aut dolor animi, a perspiciatis repudiandae ipsum non debitis optio tempore eligendi autem vero. Ipsam sapiente distinctio recusandae eius facilis sequi! Doloribus consequatur placeat dignissimos asperiores iste quis facere ducimus totam pariatur cupiditate porro veritatis dolor maxime quia necessitatibus et sapiente at ratione veniam vitae, possimus eveniet unde, voluptatem consectetur? Est ipsum repellendus dignissimos amet sunt voluptatibus, officiis exercitationem. Voluptas non numquam sequi quas voluptates cum voluptatum voluptatibus nisi omnis pariatur quia, animi amet molestiae in, ut odio repudiandae aperiam alias porro fuga eveniet hic. Quia quisquam excepturi debitis dolores, illum natus sequi a minima voluptate odit quae vero blanditiis? Accusantium dicta sunt voluptates odit ut necessitatibus animi perferendis, illo consequuntur libero natus ab, exercitationem reprehenderit velit dolorum nihil, neque facilis adipisci non quo totam incidunt asperiores. Veritatis delectus natus, sunt possimus accusantium adipisci laborum consectetur. Suscipit porro obcaecati consequuntur dignissimos ratione atque explicabo nam unde exercitationem perspiciatis error facere qui voluptas et labore distinctio similique corrupti, expedita alias est quisquam officia earum sapiente pariatur! Beatae ab harum perspiciatis, impedit commodi aspernatur ducimus officiis unde repellat, voluptatibus voluptate odio quod provident magni delectus quam natus excepturi? Nostrum accusantium, vitae nesciunt architecto qui beatae? Quisquam dolorum, ea sint quia temporibus, fuga qui consequatur totam deserunt quas cumque. Animi magnam vero voluptatum consectetur placeat dolor eaque, quasi commodi beatae asperiores porro repellat reiciendis velit natus at. Asperiores, voluptatibus? Veniam placeat quis nisi. Necessitatibus laborum sint pariatur sunt voluptates, molestias dolor amet aliquid magnam corrupti saepe culpa in autem modi velit omnis officiis, perspiciatis praesentium quos quo corporis ullam cumque iusto officia? Numquam dicta dolore repudiandae ipsum, eaque eveniet saepe quas voluptatibus quidem error. Corporis necessitatibus nesciunt, alias esse nulla voluptatibus enim, nobis eum veniam aut laudantium natus vitae? Quae assumenda culpa perspiciatis praesentium eos natus ipsum odio sint ex esse numquam, quo eum minima quam corporis, veritatis sapiente aspernatur autem tempore. Aperiam reprehenderit quaerat natus, voluptas ea labore alias aliquam dolor dolores, rem corrupti minima aut quibusdam, facere illum non? Quasi repellat veritatis esse doloremque alias. Sunt dolor, necessitatibus illum iusto obcaecati repellat perspiciatis ullam illo earum, assumenda deleniti, ipsum similique. Veritatis temporibus culpa obcaecati pariatur nesciunt voluptatem beatae, voluptatum ad impedit quibusdam! Nemo obcaecati blanditiis necessitatibus sit quisquam. Dolorum animi magnam necessitatibus ea minima hic odio, dolor eveniet, quidem porro sunt adipisci rerum omnis quia sequi dolorem explicabo maxime qui error. Illo, numquam cupiditate. Quas, nesciunt eum qui alias hic sint maiores sapiente aliquam vitae harum quae est tempore ab placeat neque id quidem, in ducimus sequi. Aspernatur temporibus quaerat ipsam repudiandae beatae quo?
            </div>
        </section>
        <?php endif; ?>

        <section class="chapter">
            <?php if(isset($_SESSION["role"]) && $_SESSION["role"] === "admin"): ?>
            <p><a href="/book/1/books/update-chapter">Modifier le chapitre</a></p>
            <?php endif; ?>
            <h3>Chapitres</h3>
            <ul>
                <li><a href="/book/1/books/show-chapter">Chapitre1</a></li>
                <li><a href="#">Chapitre2</a></li>
                <li><a href="#">Chapitre3</a></li>
                <li><a href="#">Chapitre4</a></li>
                <li><a href="#">Chapitre5</a></li>
            </ul>
        </section>
    </div>

</main>

    <script src="/ressources/js/show.js"></script>

<?php
    require "footer.php";
?>