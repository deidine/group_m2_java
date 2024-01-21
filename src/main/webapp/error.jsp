<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Erreur</title>
    <!-- Ajout de Bootstrap pour le style -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <% { %>
            <h3>Une erreur s'est produite !</h3>
            <p><%= request.getAttribute("erreurMessage") %></p>
            <button class="btn btn-primary mt-3" onclick="retourPagePrecedente()">Retour</button>
        <% } %>
    </div>

    <!-- Ajout de Bootstrap pour le style -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <!-- Script pour retourner à la page précédente -->
    <script>
        function retourPagePrecedente() {
            window.history.back();
        }
    </script>
</body>
</html>
