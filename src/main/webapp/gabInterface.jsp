<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

        <% { %>
            <h3>Une erreur s'est produite !</h3>
            <p><%= request.getAttribute("errorMessage") %></p>
            <button class="btn btn-primary mt-3" onclick="retourPagePrecedente()">Retour</button>
        <% } %>
  <p>      
  ${balance}
  </p>
</body>
</html>