
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.hibernate.gap.models.User"%>
<%@page import="com.hibernate.gap.models.Carte"%>
<%@page import="com.hibernate.gap.models.Compte"%>
<%
User usr = null;
if (request.getAttribute("client") != null) {
	usr = (User) request.getAttribute("client");
}
Compte cmpt = null;
if (request.getAttribute("compte") != null) {
	cmpt = (Compte) request.getAttribute("compte");
}

Carte crt = null;
if (request.getAttribute("carte") != null) {
	crt = (Carte) request.getAttribute("carte");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="js/ATM1.js"></script>
<!-- <link rel="stylesheet" href="/ATM1.css"> -->
<style>
.clsstable {
	margin: 20vh auto;
	background-image: linear-gradient(45deg, #e8e8e8 50%, rgba(179, 79, 79, 0)
		25%, rgba(239, 239, 239, 0) 0%, #efefef 100%, #0c4bd5),
		linear-gradient(45deg, #0c4bd5 100%, rgba(239, 239, 239, 0) 25%,
		rgba(239, 239, 239, 0) 75%, #efefef 100%, #0c4bd5);
	border: thick solid rgb(233, 8, 8);
	text-align: center;
	font-size: x-large;
}

.clssbutton {
	width: 15vh;
	cursor: pointer;
	height: 10vh;
	font-size: 0.8em;
	font-weight: bolder;
	background-color: rgb(233, 8, 8);
}

.clssinput {
	width: 50vh;
	height: 10vh;
	font-weight: bolder;
	font-size: 2em;
	text-align: center;
	border: thick solid rgb(233, 8, 8);
}

#bal {
	border: blue 30px groove;
}

#end a {
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>

	<input type="hidden" id="solde" value="<%=cmpt.getSolde()%>">
	<table class="clsstable" border="2px" width="800px" height="500px">
		<tbody>
			<tr>
				<td><button class="clssbutton" onclick="withDrawMoney()">Retirer</button></td>
				<td colspan="2" rowspan="2" id="bal">
					<div>
						<p id="userBalance">
							Balance:<%=cmpt.getSolde()%></p>
						<p id="userDetails">Details:</p>
					</div>
				</td>

				<td><button class="clssbutton" onclick="turnOn()">V�rifier le solde</button></td>
			</tr>
			<tr>

				<!-- Button trigger modal -->

				<td><button class="clssbutton" type="button"
						data-toggle="modal" data-target="#exampleModal">Afficher Detaill</button></td>
				<td><button class="clssbutton" onclick="cancel()">Anuller</button></td>
			</tr>
			<tr>
				<form action="${pageContext.request.contextPath}/crudCompte"
					onsubmit="return verify()" method="post">
				<td></td>
				<td colspan="2" rowspan="2">= <input class="clssinput"
					placeholder="00,000:00" type="textarea" name="montant"
					id="userInput">
				</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="hidden" name="noCarte"
					value="<%=crt.getPin()%>"> <input type="hidden"
					name="compteId" value="<%=cmpt.getId()%>">
					<button class="clssbutton" name="action" value="retraitFromCln"
						type="submit">Enter</button>
					</form></td>
				<td>
					<button class="clssbutton" id="end">
						<a href="${pageContext.request.contextPath}/code.jsp">End</a>
					</button>
				</td>
			</tr>
		</tbody>
	</table>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Votre
						Information</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<b>Nom Prenom: <%=usr.getFirstName() + "/" + usr.getLastName()%></b><br>
					<b>numero Telephone : <%=usr.getPhone()%></b><br> <b>Email
						: <%=usr.getEmail()%></b> <br> <b>le pin du votre carte : <%=crt.getPin()%></b>
					<br> <b>Type du compte : <%=cmpt.getType_compte()%></b><br>

					<b>Date d'expiration du votre carte :<%=crt.getDateExpiration()%>
					</b><br> <b>Numreo du votre carte :<%=crt.getNumeroCarte()%></b><br>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	var isBtnClicked=false;
		var solde = document.getElementById('solde')
		var disp = "Bienvenue, cliquez sur n'importe\n quel boutton pour commencer"
		userInput = document.getElementById('userInput')

		function turnOn() {
			userBalance.innerText = solde.value
			userDetails.innerText = disp
			isBtnClicked=false 

		}
		function depositMoney() {
			userDetails.innerText = "kindly enter amount to deposit"
		}

		function makeTransaction() {
			if (userDetails.innerText == "kindly enter amount to deposit") {
				solde.value = Number(userInput.value) + solde.value
				userBalance.innerText = "your balance is" + solde.value
				alert("Transaction Successful")
				userDetails.innerText = disp
			} else if (userDetails.innerText == "SVP, entrez le montant\n que vous souhaitez retirer.") {
				solde.value = solde.value - Number(userInput.value)
				userBalance.innerText = "Votre Solde Est: " + solde.value
				alert("Transaction est un succès")
				userDetails.innerText = disp
			} else if (userDetails.innerText = "Enter Amount to Transfer") {
				solde.value = solde.value - Number(userInput.value)
				userBalance.innerText = "Votre Solde Est: " + solde.value
				alert("Transaction est un succès")
			} else if (userDetails.innerText = "Enter Amount ") {
				solde.value = solde.value - Number(userInput.value)
				userBalance.innerText = "Votre Solde Est: " + solde.value
				alert("Transaction est un succès")
			}

			else {
				alert("Select the right option")
			}

		}

		function withDrawMoney() {
			userDetails.innerText = "SVP, entrez le montant\n que vous souhaitez retirer."
				isBtnClicked=true

		}
		function cancel() {
			userInput.value = ""
				isBtnClicked=false
		}
		function trans() {
			// userDetails.innerText="Enter Amount to Transfer"

		}
		function air() {
			userDetails.innerText = "Enter Amount  "
		}
		function verify() {
			var inp = document.getElementById('userInput').value
			var solde = document.getElementById('solde').value
		 alert(isBtnClicked)
			if (inp == "" || inp > solde || inp ==0 ) {
				alert("entrer le montent correct ou le montent peux pas etre vide ")
				 cancel()
				event.preventDefault();

			} else {
				isBtnClicked=false 
			}
		}
	</script>

</body>
</html>