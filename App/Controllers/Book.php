

<?php

class Book {

    public function updateBook() {
        require "../App/Views/Admin/update-book.php";
    }

    public function updateChapter() {
        require "../App/Views/Admin/update-chapter.php";
    }

    public function showChapters() {
        require "../App/Views/Admin/show.php";
    }

}

?>