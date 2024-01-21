<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .user-form-container {
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            padding: 20px;
            text-align: center;
        }

        .user-form-container h1 {
            margin-bottom: 20px;
            font-size: 1.5em;
            color: #333333;
        }

        .user-form-container p {
            color: #777777;
        }

        .user-form-container input,
        .user-form-container select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .user-form-container button {
            width: 100%;
            padding: 10px;
            background-color: #6c7a89;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .user-form-container button:hover {
            background-color: #5e6e7d;
        }
    </style>
</head>
<body>

<form class="user-form-container" action="${pageContext.request.contextPath}/clientCrud?action=create" method="post">
    <h1>Créer un utilisateur</h1>
    <input type="text" placeholder="Prénom" name="firstName" required>
    <input type="text" placeholder="Nom" name="lastName" required>
    <input type="text" placeholder="Email" name="email" required>
    <input type="text" placeholder="Téléphone" name="phone" required>
    <input type="password" placeholder="Mot de passe" name="password" required>
    
    <!-- Utilisation d'un menu déroulant pour le champ "Rôle" -->
    <select name="role" required>
        <option value="Admin">Admin</option>
        <option value="Client">Client</option>
    </select>
    
    <button type="submit">Créer</button>
</form>

</body>
</html>
