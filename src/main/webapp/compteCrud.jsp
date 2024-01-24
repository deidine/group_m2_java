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
<title>Liste des Comptes</title>
<%@ include file="nav.jsp"%>

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