<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Détails du client</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
        }

        .container {
            width: 80%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .info-card,
        .accounts-card {
            width: 48%;
            display: inline-block;
            vertical-align: top;
            margin-bottom: 20px;
        }

        .card {
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        h2 {
            color: #333;
        }

        .list-group {
            padding: 0;
            list-style: none;
        }

        .list-group-item {
            border: none;
            padding: 10px 0;
        }

        strong {
            color: #555;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Informations du client -->
    <div class="info-card">
        <div class="card">
            <h2>Informations du client</h2>
            <ul class="list-group">
                <li class="list-group-item"><strong>Nom :</strong> ${client.lastName}</li>
                <li class="list-group-item"><strong>Prénom :</strong> ${client.firstName}</li>
                <li class="list-group-item"><strong>Email :</strong> ${client.email}</li>
                <li class="list-group-item"><strong>Téléphone :</strong> ${client.phone}</li>
           <c:if test="${comptes.size() == 0 }">
                 
                        <input type="hidden" name="clientId" value="${client.id}">
                    <a href="${pageContext.request.contextPath}/crudCompte?action=create&clientId=${client.id}">   <button type="submit" name="action" value="associerCompte">Associer Compte</button>
                  </a>   
                </c:if>
            </ul>
        </div>
    </div>

    <!-- Liste des comptes du client -->
<div class="accounts-card">
    <div class="card">
        <h2>Comptes du client</h2>
        <ul class="list-group">
            <c:forEach var="compte" items="${comptes}">
                <li class="list-group-item">
                    <strong>Numéro de compte :</strong> ${compte.numCompte}<br>
                    <strong>Solde :</strong> ${compte.solde}<br>
                    <!-- Ajoutez d'autres informations de compte si nécessaire -->
                    <form action="${pageContext.request.contextPath}/crudCompte" method="post">
                        <input type="hidden" name="compteId" value="${compte.id}">
                        <label for="montant">Montant :</label>
                        <input type="number" min="0" id="montant" name="montant" required>
                        <!-- Bouton d'augmentation -->
                        <button type="submit" name="action" value="augmenter">Augmenter</button>
                        <!-- Bouton de retrait -->
                        <button type="submit" name="action" value="retrait">Retrait</button>
                    </form>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
    
</body>
</html>
