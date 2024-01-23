<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.*, jakarta.servlet.http.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.hibernate.gap.models.User"%>
<%
User user = (User) session.getAttribute("user");
if (user == null || !"Admin".equals(user.getRole())) {
	request.setAttribute("errorMessage", "You're not admin, so fuck off !");
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>

<head>
<title>Liste des Clients</title>
<link rel="stylesheet" type="text/css" href="styles/adminHome.css">
<script src="js/main.js"></script>
 <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- Ajoutez ici vos liens vers les fichiers CSS ou tout autre élément de style -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<!-- or -->
<link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<style type="text/css">
.popup {
	display: none;
	position: fixed;
	top: 50%;
	/* Ajustez cette valeur en fonction de votre mise en page spécifique */
	left: 50%;
	/* Ajustez cette valeur en fonction de votre mise en page spécifique */
	transform: translate(-50%, -50%);
	background-color: #ffffff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	text-align: center;
	z-index: 1000;
	/* Assurez-vous que le popup est au-dessus du contenu */
}

.dark-mode {
  background-color: black;
  color: white;
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

.user-form-container input, .user-form-container select {
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
	margin-letf: 20px;
	transition: background-color 0.3s ease;
}

.user-form-container button:hover {
	background-color: #5e6e7d;
}

body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	display: flex;
}

.aw {
	border: none;
	color: black;
	padding: 5px 10px;
	border-radius: 5px;
	border: 1px solid;
	color: var(- -blue);
	text-align: center;
	text-decoration: none;
	/* Remove link underline */
	display: inline-block;
	font-size: 16px;
	margin-left: 800px;
}

button {
	background-color: var(- -blue);
	/* Green */
	color: var(- -blue);
	color: black;
	padding: 5px 10px;
	text-align: center;
	text-decoration: none;
	/* Remove link underline */
	display: inline-block;
	font-size: 16px;
	margin-left: 50px;
}

a {
	color: white;
	
	text-decoration: none;
}

.content-container {
	flex-grow: 1;
	/* Occupe l'espace restant */
	...
}

/* Barre de navigation */
.navbar {
	height: 100vh;
	width: 180px;
	/* Réduction de la largeur */
	background-color: #181D50;
	/* Couleur principale */
	padding-top: 20px;
	display: flex;
	flex-direction: column;
	box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
	/* Ombre sur le côté */
}

.user-info {
	color: white;
	margin-bottom: 40px;
	text-align: center;
}

.nav-links {
	display: flex;
	flex-direction: column;
	gap: -10px;
}

.nav-links a {
	color: white;
	text-decoration: none;
	padding: 40px;
	text-align: center;
	transition: background-color 0.3s ease;
	/* Effet de transition */
}

.nav-links a:hover {
	background-color: #1746A2;
	border-radius: 10px;
}

/* Conteneur rectangulaire pour le contenu */
.content-container {
	flex: 1;
	padding: 20px;
}

nav {
	background-color: #ffffff;
	padding: 10px;
	width: 100%;
	height: 50px;
	margin-top:
}

nav input[type="text"] {
	background-color: #ffffff;
	color: #000000;
	margin-right: 600px;
}

nav button[type="submit"] {
	background-color: b;
	color: #ffffff;
	border-radius: 7px;
}
</style>
</head>

<body>


	<section id="sidebar">
		<a href="#" class="brand"> <i class='bx bxs-smile'></i> <span
			class="text">Welcome, Admin</span>
		</a>
		<ul class="side-menu top">
			<li><a
				href="${pageContext.request.contextPath}/clientCrud?action=list">
					<i class='bx bxs-user-circle'></i> <span class="text">Client</span>
			</a></li>
			<li class="active"><a
				href="${pageContext.request.contextPath}/crudCompte?action=list">
					<i class='bx bxs-user'></i> <span class="text">Compte</span>
			</a></li>
			<li><a href="#"> <i class='bx bx-info-circle'></i> <span
					class="text">À Propos</span>
			</a></li>

		</ul>
		<ul class="side-menu">
			<li  ><a href="setting.jsp"> <i class='bx bxs-cog'></i> <span
					class="text">Settings</span>
			</a></li>
			<li><a href="${pageContext.request.contextPath}/logout"
				class="logout"> <i class='bx bxs-log-out-circle'></i> <span
					class="text">Logout</span>
			</a></li>
		</ul>
	</section>
	<!-- SIDEBAR -->

	<!-- CONTENT -->
	<section id="content">
		<!-- NAVBAR -->

		<nav>
			<i class='bx bx-menu'></i>
			<form action="${pageContext.request.contextPath}/crudCompte?action=chercher" method="post">
				<div class="form-input">
					<input type="search"  placeholder="serch Numéro du Compte" name="numCompte">
					<button type="submit" class="search-btn">
						<i class='bx bx-search'></i>
					</button>
				</div>
			</form>
			<input type="checkbox"  onclick="myFunction()" id="switch-mode" hidden> <label
				for="switch-mode" class="switch-mode"></label> <a href="#"
				class="notification"> <i class='bx bxs-bell'></i> <span
				class="num">8</span>
			</a> <a href="profile.jsp" class="profile"> <img src="images/icons/compte.png">
			</a>
		</nav>
		<main>

<script>
function myFunction() {
   var element = document.body;
   element.classList.toggle("dark-mode");
}
</script>


			
			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>Liste des Clients</h3>
						<i class='bx bx-filter'></i>
					</div>
					<table>
						<thead>
							<tr>
								<th>numero compte</th>
								<th>type compte</th>
								<th>solde</th>

								<th>Actions</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="compte" items="${comptes}">

								<tr>
									<td>${compte.numCompte}</td>
									<td>${compte.type_compte}</td>

									<td>${compte.solde}</td>

									<td>
										<!-- Ajoutez ici des liens ou des boutons pour les actions -->
										<a
										href="${pageContext.request.contextPath}/crudCompte?action=edit&compteId=${compte.id}"
										title="Modifier"> <i class='bx bx-edit'
											style='color: #3498db;'></i>
									</a> <a
										href="${pageContext.request.contextPath}/crudCompte?action=delete&compteId=${compte.id}"
										title="Suprimer"> <i class='bx bx-trash'
											style='color: #e74c3c;'></i>
									</a> <a
										href="${pageContext.request.contextPath}/crudCompte?action=generateCard&compteId=${compte.id}">Générer
											Carte <i class='credit-card'
											style='color: #e74c3c;'></i><box-icon name='credit-card'></box-icon></a>


									</td>
								</tr>
							</c:forEach>



						</tbody>
					</table>
				</div>
			</div>

		</main>
	</section>

	<script src="js/script.js"></script>
</body>

</html>