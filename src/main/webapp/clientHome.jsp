<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GAB - Accueil</title>
    <!-- Ajoutez vos liens vers les stylesheets, scripts, etc., selon vos besoins -->
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
            margin: 0;
        }

        .gab-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .gab-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .gab-input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .gab-buttons {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
        }

        .gab-button {
            background-color: #6c7a89;
            color: #ffffff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .gab-button:hover {
            background-color: #5e6e7d;
        }

        .gab-options {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .gab-option {
            background-color: #6c7a89;
            color: #ffffff;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .gab-option:hover {
            background-color: #5e6e7d;
        }
    </style>
</head>
<body>

<div class="gab-container">
    <h1 class="gab-header">Bienvenue, [Nom du client]!</h1>

    <form action="${pageContext.request.contextPath}/gabServlet?action=checkBalance" method = "post">
        <input type="text" class="gab-input" id="cardNumber" name="cardNumber" placeholder="Numéro de carte">
        <input type="text" class="gab-input" id="pin" name="pin" placeholder="Code PIN">
        <button type="submit">Valider</button>
    </form>
        <div class="gab-buttons">
            <button type="button" class="gab-button" onclick="appendNumber(1)">1</button>
            <button type="button" class="gab-button" onclick="appendNumber(2)">2</button>
            <button type="button" class="gab-button" onclick="appendNumber(3)">3</button>
            <button type="button" class="gab-button" onclick="appendNumber(4)">4</button>
            <button type="button" class="gab-button" onclick="appendNumber(5)">5</button>
            <button type="button" class="gab-button" onclick="appendNumber(6)">6</button>
            <button type="button" class="gab-button" onclick="appendNumber(7)">7</button>
            <button type="button" class="gab-button" onclick="appendNumber(8)">8</button>
            <button type="button" class="gab-button" onclick="appendNumber(9)">9</button>
            <button type="button" class="gab-button" onclick="appendNumber(0)">0</button>
        </div>

        <div class="gab-options">
            <div class="gab-option">
                <a href="#">Consulter le solde</a>
            </div>
            <div class="gab-option">
                <a href="#">Retirer de l'argent</a>
            </div>
            <div class="gab-option">
                <a href="#">Voir l'historique des transactions</a>
            </div>
            <div class="gab-option">
                <a href="#">Déconnexion</a>
            </div>
        </div>
    

    <script>
        function appendNumber(number) {
            var cardNumberInput = document.getElementById("cardNumber");
            var pinInput = document.getElementById("pin");

            // Ajouter le numéro au champ approprié
            if (cardNumberInput === document.activeElement) {
                cardNumberInput.value += number;
            } else if (pinInput === document.activeElement) {
                pinInput.value += number;
            }
        }
    </script>
</div>

</body>
</html>
