<?php

//konekcija sa bazom podataka
$conn = new mysqli("localhost", "root", "", "kviz_domaci", "3308");

if ($conn->connect_error) {
    echo "Konekcija losa: " . $conn->connect_error;
}