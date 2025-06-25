<?php
include 'connection.php';


//nasumicno biranje 5 pitanja, njihova priprema, izvrsavanje upita i dobijanje rezultata
$question = "SELECT * FROM questions ORDER BY RAND() LIMIT 5";
$question_st = $conn->prepare($question);
$question_st->execute();
$question_res = $question_st->get_result();

//niz koji ce sadzati pitanja i odgovore
$questions = [];


//prolazak kroz svako pitanje i cuvanje njegovog id-a
while ($q = $question_res->fetch_assoc()) {
    $question_id = $q['question_id'];

    //upit za dobijanje odgovora za odgovarajuce pitanje
    $answer = "SELECT answer_id, answer_text FROM answers WHERE question_id = {$q['question_id']}";
    $answer_st = $conn->prepare($answer);
    $answer_st->execute();
    $answer_res = $answer_st->get_result();

    //inicijalizacija niza za odgovoer i prolazak kroz sve odgovore
    $answers = [];
    while ($a = $answer_res->fetch_assoc()) {
        $answers[] = [
            "id" => $a['answer_id'],
            "text" => $a['answer_text']
        ];
    }

    //dodavanje u glavni niz pitanja
    $questions[] = [
        "id" => $q['question_id'],
        "question" => $q['test_question'],
        "answers" => $answers
    ];

    $answer_st->close();
}
$question_st->close();

//postavljanje zaglavlja da odgovor bude u JSON formatu
//slanje JSON formata nazad klijentu
header('Content-Type: application/json');
echo json_encode($questions);
?>
