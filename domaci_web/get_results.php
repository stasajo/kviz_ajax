<?php
include 'connection.php';


//upit za ispisavanje rezultata  i njihovo skaliranje u tabeli
$query = "SELECT username, score, DATE_FORMAT(date, '%H:%i %d.%m.%Y') as date FROM results ORDER BY score DESC, date ASC";
$result = $conn->query($query);

//inicijalizacija
$leaderboard = [];

//prolazak kroz svaki red i dodavanje u listu
while ($row = $result->fetch_assoc()) {
    $leaderboard[] = $row;
}

//postavljanje zaglavlja da odgovor bude u JSON formatu
//slanje JSON formata nazad klijentu
header('Content-Type: application/json');
echo json_encode($leaderboard);



