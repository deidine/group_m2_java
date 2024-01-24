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

<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

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


  <header>
    <h1>À propos</h1>
  </header>

  <main>
    <p>
      Ce site web est dédié à la quiche automatique. Nous vous proposons des informations sur les quiches automatiques, les recettes de quiches, et des conseils pour réussir vos quiches.
    </p>

    <p>
      Nous sommes passionnés par la quiche et nous voulons partager notre passion avec vous. Nous espérons que vous trouverez des informations utiles et inspirantes sur notre site web.
    </p>

    <section>
      <h2>Qui sommes-nous ?</h2>

      <p>
        Nous sommes une équipe de passionnés de la quiche. Nous avons tous une expérience dans la cuisine, et nous aimons partager nos recettes et nos connaissances.
      </p>

      <p>
        Nous avons créé ce site web pour que tout le monde puisse apprendre à faire des quiches délicieuses et faciles.
      </p>

      <p>
        Nous sommes toujours à la recherche de nouvelles recettes et de nouveaux conseils, alors n'hésitez pas à nous contacter si vous avez des suggestions.
      </p>
    </section>

    <section>
      <h2>Notre mission</h'>

      <p>
        Notre mission est de rendre la quiche accessible à tous. Nous voulons que tout le monde puisse profiter de ce plat délicieux et réconfortant.
      </p>

      <p>
        Nous pensons que la quiche est un plat qui peut être apprécié par tous, quel que soit son niveau de cuisine. C'est pourquoi nous proposons des recettes simples et faciles à suivre.
      </p>

      <p>
        Nous voulons également partager notre passion pour la quiche. Nous espérons que vous trouverez notre site web informatif et inspirant.
      </p>
    </section>
  </main>

  <footer>
    <p>Copyright &copy; 2024 Quiche automatique</p>
  </footer>

</body>

</html>

