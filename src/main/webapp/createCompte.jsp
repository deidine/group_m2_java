<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Créer un Compte</title>
    <!-- Ajoutez ici vos liens vers les fichiers CSS ou tout autre élément de style -->
    <style>
        body {
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .compte-form-container {
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            padding: 20px;
            text-align: center;
        }

        .compte-form-container h1 {
            margin-bottom: 20px;
            font-size: 1.5em;
            color: #333333;
        }

        .compte-form-container p {
            color: #777777;
        }

        .compte-form-container input,
        .compte-form-container select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .compte-form-container button {
            width: 100%;
            padding: 10px;
            background-color: #6c7a89;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .compte-form-container button:hover {
            background-color: #5e6e7d;
        }
    </style>
</head>
<body>

<form class="compte-form-container" action="${pageContext.request.contextPath}/crudCompte?action=create" method="post">
    <h1>Créer un Compte</h1>
    <label for="typeCompte">Type de Compte:</label>
    <select name="typeCompte" required>
        <option value="Epargne">Compte d'Épargne</option>
        <option value="Courant">Compte Courant</option>
    </select>
    <input type="text" name="userId" value="${param.clientId}">
    <input type="text" placeholder="Numéro du Compte" name="numCompte" required>
    <input type="text" placeholder="Solde initial" name="solde" required>
    <button type="submit">Créer</button>
</form>

</body>
</html>
