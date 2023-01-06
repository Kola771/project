

<?php

class Book {
    public function showBook() {
        require "../App/Views/Users/book.php";
    }

    public function showChapter() {
        require "../App/Views/Users/show.php";
    }

    public function updateBook() {
        require "../App/Views/Admin/update-book.php";
    }

    public function updateChapter() {
        require "../App/Views/Admin/update-chapter.php";
    }
}

?>