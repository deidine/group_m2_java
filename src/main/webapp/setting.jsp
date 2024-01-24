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
<%@ include file="nav.jsp"%>
<!-- CONTENT -->
<section id="content">
	<!-- NAVBAR -->

	<nav>
		<i class='bx bx-menu'></i>
		<form
			action="${pageContext.request.contextPath}/crudCompte?action=chercher"
			method="post">
			<div class="form-input">
				<input type="search" placeholder="serch Numéro du Compte"
					name="numCompte">
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



		<form class="compte-form-container"
			action="${pageContext.request.contextPath}/crudCompte?action=deblockerSystem"
			method="post">
			<h3>Debloquer Le system apres dépassé le nombre maximum d'essais
				de connexion autorisés, qui est de 5.</h3>
			<box-icon type='solid' name='badge-check'></box-icon>
			<input type="submit" value="deblockerSystem" name="action">
		</form>
	</main>
</section>

<script src="js/script.js"></script>
</body>

</html>

