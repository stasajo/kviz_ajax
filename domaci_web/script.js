
//globalne promjenjljive za cuvanje ucitanih pitanja i korisnickih imena
let questions = [];
let username = "";

function pocniKviz() {
    //uzimanje imena iz imput polja
    username = $('#username').val().trim();
    if (!username) {
        alert("Morate unijeti ime!");
        return;
    }

    //ajax za ucitavanje pitanja sa servera
    $.ajax({
        url: "get_questions.php",
        method: "GET",
        dataType: "json",

        //cuva ucitane podatke i prikazuje pitanja
        success: function (data) {
            questions = data;
            prikaziPitanja();
        },
        error: function () {
            alert("Greska pri ucitavanju pitanja.");
        }
    });
}

function prikaziPitanja() {
    //poziva div u koji ce upisati podatke, i brise prethodni sadrzaj ako postoji
    const container = $('#quiz_container');
    container.empty();

    //prolazak kroz sva pitanja
    questions.forEach((q, index) => {
        //kreiranje diva za svako pitanje i njihov prikaz
        const questionDiv = $('<div class="question"></div>');
        questionDiv.append(`<p><strong>${index + 1}. ${q.question}</strong></p>`);

        //prikaz svih odgovora za svako pitanje
        q.answers.forEach(ans => {
            const answer = `
                <label>
                    <input type="radio" name="q${q.id}" value="${ans.id}"> ${ans.text}
                </label><br>
            `;
            questionDiv.append(answer);
        });

        container.append(questionDiv);
    });
    //dugme za kraj kviza i event za to dugme
    container.append(`<button id="finish_btn">Zavrsi kviz</button>`);

    $('#finish_btn').on('click', predajKviz);
}

function predajKviz() {
    let data = {
        username: username,
        answers: []
    };

    //prolazak kroz svako pitanje i uzima oizabrani odgovor
    questions.forEach(q => {
        //uzima se vrijednost selektovanog odgovora i dodaje u niz ako je izabran
        const selected = $(`input[name="q${q.id}"]:checked`).val();
        if (selected) data.answers.push(selected);
    });

    //provjera da li unijet bar jedan odgovor
    if (data.answers.length === 0) {
        alert("Odgovorite na barem jedno pitanje!");
        return;
    }

    //slanje odgovora serveru POST metodom
    $.ajax({
        url: "submit_answers.php",
        method: "POST",
        data: data,
        success: function (response) {
            //prikaz osvojenih rezultata i poziv funkcije za rang listu
            $('#result_container').html(`<h3>Osvojili ste ${response.score} poena</h3>`);
            prikaziRangListu();
        }

    });

}

function prikaziRangListu() {
    $.ajax({
        url: "get_results.php",
        method: "GET",
        dataType: "json",
        // vracanje liste
        success: function (data) {
            let html = `<h3>Rang lista:</h3><ol>`;
            //prolazak kroz svaki rezultat i vracanje liste
            data.forEach(row => {
                html += `<li>${row.username.toUpperCase()} poeni: ${row.score} (${row.date})</li>`;
            });
            html += `</ol>`;
            //prikaz u odgovarajucem div-u
            $('#board').html(html);
        },
        error: function () {
            alert("Greska pri ucitavanju rang liste.");
        }
    });
}
