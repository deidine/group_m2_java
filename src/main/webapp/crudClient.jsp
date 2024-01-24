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
<%@ include file="nav.jsp"%>

	<!-- CONTENT -->
	<section id="content">
		<!-- NAVBAR -->

<nav>
	<i class='bx bx-menu'></i>
	<form
		action="${pageContext.request.contextPath}/clientCrud?action=chercher"
		method="post">
		<div class="form-input">
			<input type="searchEmail" placeholder="Search..." name="chercher">
			<button type="submit" class="search-btn">
				<i class='bx bx-search'></i>
			</button>
		</div>
	</form>
	<input type="checkbox" onclick="myFunction()" id="switch-mode" hidden>
	<label for="switch-mode" class="switch-mode"></label> <a href="#"
		class="notification"> <i class='bx bxs-bell'></i> <span
		class="num">8</span>
	</a> <a href="profile.jsp" class="profile"> <img
		src="images/icons/compte.png">
	</a>
</nav>
<main>



	<button type="button">
		<a href="createUser.jsp"> Create User </a>
	</button>
	<div class="table-data">
		<div class="order">
			<div class="head">
				<h3>Liste des Clients</h3>
				<i class='bx bx-filter'></i>
			</div>
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>Prénom</th>
						<th>Nom</th>
						<th>Email</th>
						<th>Téléphone</th>
						<th>Actions</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="client" items="${clients}">

						<tr>
							<td>${client.id}</td>

							<td>${client.firstName}</td>
							<td>${client.lastName}</td>
							<td>${client.email}</td>
							<td>${client.phone}</td>
							<td>
								<!-- Ajoutez ici des liens ou des boutons pour les actions --> <a
								href="${pageContext.request.contextPath}/clientCrud?action=edit&clientId=${client.id}"
								title="Modifier"> <i class='bx bx-edit'
									style='color: #3498db;'></i>
							</a> <a
								href="${pageContext.request.contextPath}/clientCrud?action=delete&clientId=${client.id}"
								title="Suprimer"> <i class='bx bx-trash'
									style='color: #e74c3c;'></i>
							</a> <a
								href="${pageContext.request.contextPath}/clientCrud?action=details&clientId=${client.id}"
								title="Associer compte"> <i class='bx bx-user'
									style='color: #2ecc71;'></i>
							</a>

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
