

<?php
    require "header.php";
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

        <div class="data flex">
           
        </div>
    </div>

</main>


<script src="/ressources/js/navigation.js"></script>
<script src="/ressources/js/task.js"></script>
<?php
    require "footer.php";
?>

<?php else: ?>

<?php header("Location:/receive/home"); ?>

<?php endif; ?>