
<link rel="stylesheet" type="text/css" href="styles/adminHome.css">
<script src="js/main.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- Ajoutez ici vos liens vers les fichiers CSS ou tout autre �l�ment de style -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<!-- or -->
<link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
	
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
	
<style type="text/css">
.popup {
	display: none;
	position: fixed;
	top: 50%;
	/* Ajustez cette valeur en fonction de votre mise en page sp�cifique */
	left: 50%;
	/* Ajustez cette valeur en fonction de votre mise en page sp�cifique */
	transform: translate(-50%, -50%);
	background-color: #ffffff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	text-align: center;
	z-index: 1000; /* Assurez-vous que le popup est au-dessus du contenu */
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
	text-decoration: none; /* Remove link underline */
	display: inline-block;
	font-size: 16px;
	margin-left: 800px;
}

button {
	background-color: var(- -blue); /* Green */
	color: var(- -blue);
	color: black;
	padding: 5px 10px;
	text-align: center;
	text-decoration: none; /* Remove link underline */
	display: inline-block;
	font-size: 16px;
	margin-left: 50px;
}

a {
	text-decoration: none;
	color: white;
}

.content-container {
	flex-grow: 1; /* Occupe l'espace restant */
	...
}
/* Barre de navigation */
.navbar {
	height: 100vh;
	width: 180px; /* R�duction de la largeur */
	background-color: #181D50; /* Couleur principale */
	padding-top: 20px;
	display: flex;
	flex-direction: column;
	box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1); /* Ombre sur le c�t� */
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
	transition: background-color 0.3s ease; /* Effet de transition */
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
		<ul   class="side-menu top">
			<li ><a
				href="${pageContext.request.contextPath}/clientCrud?action=list">
			<box-icon type='solid' name='user-circle'></box-icon>	 <span class="text">Client</span>
			</a></li>
			<li><a
				href="${pageContext.request.contextPath}/crudCompte?action=list">
	<box-icon type='solid' name='chalkboard'></box-icon>Compte</span>
					
			</a></li>
	<li><a
				href="${pageContext.request.contextPath}/transactionServelet?action=list">
				<box-icon type='solid' name='user-detail'></box-icon> <span class="text">client transaction</span>
			</a></li>
<li><a
				href="${pageContext.request.contextPath}/machineServelet?action=list">
			 <box-icon name='money-withdraw'></box-icon><span class="text">machine logs </span>
			</a></li>
		</ul>
		<ul class="side-menu">
			<li><a href="setting.jsp"> <i class='bx bxs-cog'></i> <span
					class="text">Settings</span>
			</a></li>	
				<li><a href="about.jsp"> <i class='bx bx-info-circle'></i> <span
					class="text">� Propos</span>
			</a></li>
			<li><a href="${pageContext.request.contextPath}/logout"> <i class='bx bxs-log-out-circle'></i> <span
					class="text">Logout</span>
			</a></li>
		</ul>
	</section>
	<!-- SIDEBAR -->


		<script>
		const element = document.body;
		const isDarkModeEnabled = localStorage.getItem('darkModeEnabled') === 'true';
		
			function myFunction() {
				
				element.classList.toggle("dark-mode");
				 localStorage.setItem('darkModeEnabled', element.classList.contains('dark-mode'));
				 if ( !element.classList.contains('dark-mode')) {
					 localStorage.setItem('darkModeEnabled', false);
					}
			}
			
			 
			// Check for stored preference on page load
			if (isDarkModeEnabled) {
			  element.classList.add('dark-mode');
			}
			
			const listItems = document.querySelectorAll('ul li');

			function handleListItemClick(index) {
			  localStorage.setItem('activeListItemIndex', index); // Store index in local storage
			}

			function applyActiveClassFromStorage() {
			  const activeIndex = localStorage.getItem('activeListItemIndex');
			  if (activeIndex !== null) {
			    listItems[activeIndex].classList.add('active');
			  }
			}

			listItems.forEach((item, index) => {
			  item.addEventListener('click', () => {
			    handleListItemClick(index);
			  });
			});

			applyActiveClassFromStorage(); // Apply active class on page load
		</script>