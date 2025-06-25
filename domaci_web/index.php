<!DOCTYPE html>
<html>
<head>

    <title>Kviz</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style><link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
         body {
             font-family: 'Roboto', sans-serif;
             background-color: #f5f7fa;
             margin: 0;
             padding: 0;
         }

        #container {
            max-width: 600px;
            margin: 40px auto;
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1, h3 {
            text-align: center;
            color: #333;
        }

        input[type="text"] {
            width: 96%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-bottom: 10px;
        }

        button {
            background-color: #007bff;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        .question {
            margin-bottom: 20px;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            cursor: pointer;
        }

        #result_container {
            margin-top: 20px;
            text-align: center;
            font-size: 20px;
            color: #28a745;
        }

        #board {
            margin-top: 30px;
        }

        ol {
            padding-left: 20px;
        }

        li {
            margin-bottom: 5px;
        }

        @media (max-width: 600px) {
            #container {
                margin: 20px;
                padding: 20px;
            }

            button {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
<div id="container">
    <h1>Kviz</h1>

    <div id="user_form">
        <input type="text" id="username" placeholder="Unesite ime">
        <button onclick="pocniKviz()">Pocni kviz</button>
    </div>

    <div id="quiz_container" ></div>
    <div id="result_container"></div>
    <div id="board"></div>
</div>

<script src="script.js"></script>
</body>
</html>

