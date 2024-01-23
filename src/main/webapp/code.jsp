
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.hibernate.gap.models.User"%>
<%@page import="com.hibernate.gap.models.Carte"%>
<%@page import="com.hibernate.gap.models.Compte"%>
<%@page import=" java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%
String timeStamp = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.getInstance().getTime());

boolean error = false;
//int tryy=0;
if (request.getAttribute("error") != null) {
	error = (boolean) request.getAttribute("error");

	//	tryy=(int) request.getAttribute("try");
}

int count = 0;
if (session.getAttribute("loginAttempts") != null) {
	count = (int) session.getAttribute("loginAttempts");
}
%>
<%
if (count <= 4) {
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<title>Code</title>
<link rel="stylesheet" type="text/css" href="styles/style.css">
</head>

<body onload="load()">

	<script type="text/javascript">
		/**
		 * Created by chuandong on 15/11/27.
		 */

		function load() {

			var btns = document.querySelectorAll('#calculator span');
			var inputScreen = document.querySelector('#screen');
			var inputForm = document.getElementById('input').value;
			var btnValue;
			for (var i = 0; i < btns.length; i++) {

				btns[i].addEventListener('click', function() {

					btnValue = this.innerHTML;

					switch (btnValue) {
					case 'Enter':
						console.log("login")

						break;
					case 'submit':
						break;
					case 'Sup':
						inputScreen.innerHTML = '';
						document.getElementById('input').value = ''
						break;

					default:
						if (/\d/.test(btnValue)) { // Check if it's a digit
							inputForm += btnValue; // Only add to inputForm if digit
						}
						inputScreen.innerHTML += "*";
						document.getElementById('input').value += btnValue
						//alert(btnValue+inputForm)
						break;
					}
				});
			}
		}
	</script>
	<div id="calculator">
		<!-- Screen and clear key -->
		<div class="top">
			<!-- <input id="pin" type="text" placeholder="****" maxlength="4" required > -->
			<%
			if (error) {
			%>
			<script type="text/javascript">
				alert(
						"eroor tu as essyer<<< "
								+
			<%=count%>
				+ " >>>essais  le nombre maximum d'essais de connexion autorisés, qui est de 5 ")
			</script>

			<%
			}
			%>
			<div style="color: white;">Enter your PIN and press ENTER to
				continue</div>
		 
			<br>
			<br>
			<div id="screen"></div>
			<div id="screen2"></div>
			<div class="deidine"></div>

		</div>
		<%
		//attemptCount
		%>


		<form action="cardServelet" method="post" onsubmit="return verify()" >



			<div class="keys">
				<input id="input" type="hidden" name="noCarte"> <input
					id="count" type="hidden" name="count" value="<%=count%>">
				<!-- operators and other keys -->
				<span>7</span> <span>8</span> <span>9</span> <span>4</span> <span>5</span>
				<span>6</span> <span>1</span> <span>2</span> <span>3</span> <b
					onclick="insert()"><input type="submit" name="action"
					style="float: left; position: relative; top: 0; background: rgb(60, 218, 73); color: #fff; line-height: 36px; text-align: center; user-select: none; transition: all 0.2s ease; box-shadow: 0px 4px rgba(0, 0, 0, 0.2); margin: 0 7px 11px 0; cursor: pointer; width: 66px; height: 36px;"
					id="enter" value="Enter"></b></a> <span>0</span> <span id="clear">Sup</span>


			</div>
		</form>
	</div>
	<script type="text/javascript">
		function insert() {
			//alert(document.querySelector('#screen').innerHTML)
			//	document.getElementById('input').value= document.querySelector('#screen').innerHTML;

		}
		function verify() {
			var inp = document.getElementById('input').value
		 
			if (inp == "" ||  inp.length > 4 ||  inp.length < 4  ) {
				alert("le champ doit pas etre vide ou superieur ou inferieur a 4 charactaire")
				 
				event.preventDefault();

			} else {
				isBtnClicked=false 
			}
		}
	</script>
</body>

</html>


<%
} else {
%>
 
<html lang="fr">
<head>
<meta charset="UTF-8">
<title>Accès bloqué</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="card">
			<div class="card-header">Accès bloqué</div>
			<div class="card-body">
				<p>Vous avez dépassé le nombre maximum d'essais de connexion
					autorisés, qui est de 5.</p>
				<p>Pour des raisons de sécurité, votre accès a été
					temporairement bloqué pendant 30 minutes.</p>
				<p>Si vous pensez que ce blocage est une erreur, veuillez
					contacter le support pour obtenir de l'aide.</p>

				<p>
					Courriel du support : <a href="mailto:support@example.com">support@example.com</a>
				</p>
				<p>Téléphone du support : 1-800-555-1212</p>
			</div>
		</div>
	</div>
</body>
</html>


<%
}
%>