
<?php
include 'connection.php';

//postavljanje zahtjeva da se odgovor salje kao JSON
header('Content-Type: application/json');

// provjera da li poslati post podaci i ukoloko jesu njihovu cuvanje
if (isset($_POST['username']) && isset($_POST['answers'])) {
    $username = $_POST['username'];
    $answers = $_POST['answers'];
    // filtrira sve odgovora u numericke vrijednosti
    $filtered = array_filter($answers, function ($id) {
        return is_numeric($id);
    });
    //pretvaraje niza id-jeva u string razdvojen zarezima
    $placeholders = implode(',', $filtered);

    // brojanje tacnih odgovora
    $query = "SELECT COUNT(*) as score FROM answers WHERE answer_id IN ($placeholders) AND correct = 1";
    $res = $conn->query($query);
    $row = $res->fetch_assoc();
    $score = $row['score'];

    // upisivanje u tabelu rezultata
    $stmt = $conn->prepare("INSERT INTO results (username, score) VALUES (?, ?)");
    $stmt->bind_param("si", $username, $score);
    $stmt->execute();

    //vracanje rezultata kao json odgovor
    echo json_encode(["score" => $score]);
} else {
    echo json_encode(["error" => "Neispravni podaci"]);
}
