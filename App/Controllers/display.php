


<?php
$url = $_SERVER["QUERY_STRING"];

preg_match("/\/(?<id>\d+)\//i", $url, $matches);
$id = $matches["id"];

require "../App/Models/bookmodel.php";
$n = new bookmodel();

$b = $n->shows($id);
?>