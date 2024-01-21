<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
<style>
body {
    background-color: #f1f1f1;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
    margin: 0;
    font-family: 'Roboto', sans-serif;
}

.login-container {
    background-color: #ffffff;
    width: 400px;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.2);
}

.login-container h1 {
    text-align: center;
    color: #4a4a4a;
    margin-bottom: 20px;
}

.login-container input[type="text"],
.login-container input[type="password"] {
    width: 100%;
    padding: 15px;
    margin-bottom: 10px;
    border: 1px solid #ddd;
    outline: none;
    border-radius: 3px;
}

.login-container button[type="submit"] {
    width: 100%;
    padding: 15px;
    border: none;
    background-color: #007bff;
    color: #ffffff;
    cursor: pointer;
    font-size: 16px;
    border-radius: 3px;
}

.login-container button[type="submit"]:hover {
    background-color: #0056b3;
}

.logo-container {
    margin-top: 40px;
    text-align: center;
}

.logo-container img {
    width: 200px;
    height: auto;
}

p {
    text-align: center;
    color: #777;
    margin-top: 20px;
}
</style>
</head>
<body>
<div class="logo-container">
    <img src="images/img-01.png" alt="Logo de la banque">
</div>
<form class="login-container" action="login" method="post">
    <h1>Login</h1>
        <%-- Afficher le message d'erreur --%>
    <c:if test="${not empty errorMessage}">
        <p style="color: red;">${errorMessage}</p>
    </c:if>
    <input type="text" placeholder="Email" name="email" required>
    <input type="password" placeholder="Password" name="password" required>
    <button type="submit">Login</button>
</form>




</body>
</html>