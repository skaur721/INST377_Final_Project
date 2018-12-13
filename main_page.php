<!DOCTYPE html>
<html lang="en">


<?php
require('meekrodb.2.3.class.php');
DB::$host = "127.0.0.1:3306";
DB::$user = "root";
DB::$password = "Irvkid=1";
DB::$dbName = "team_4_movie_db";

$mdb = new MeekroDB($host, $user , $password, $dbName);
DB::$error_handler = 'my_error_handler';

function my_error_handler($params) {
  echo "Error: " . $params['error'] . "<br>\n";
  echo "Query: " . $params['query'] . "<br>\n";
  die; // don't want to keep going if a query broke
};

$movies=$_POST['movies'];
echo $movies . '<br>';


$row = $mdb->query("SELECT  movie_title, movie_length, movie_rating, movie_release_date
from genres as g, movies as m
where g.genre_id = m.genre_id and genre_name = '$movies'");
#var_dump($row);


$iterate_rows = count($row);//$row -> num_rows;

for ($j = 0; $j < $iterate_rows; ++$j )
{
  echo 'TITLE:  '.$row[$j]['movie_title'] .'   MOVIE LENGTH (MIN):  '. $row[$j]['movie_length'] .'    MOVIE RATING(1-10):  '. $row[$j]['movie_rating'] .'    RELEASE DATE:  ' . $row[$j]['movie_release_date'] . '<br>'. '<br>';
  #echo 'Movie: '  . htmlspecialchars($iterate_rows['movie_title'])   . '<br>';
}
#var_dump($row);


#$mysqli = new mysqli($servername, $username, $password, $dbname);
#if (mysqli_connect_errno($mysqli)) die('Unable to connect to DB');

?>

</html>
