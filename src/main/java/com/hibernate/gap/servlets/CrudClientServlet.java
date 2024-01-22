package com.hibernate.gap.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.hibernate.gap.dao.CompteDao;
import com.hibernate.gap.dao.UserDao;
import com.hibernate.gap.models.Compte;
import com.hibernate.gap.models.User;

public class CrudClientServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final UserDao userDao = new UserDao();
	private final CompteDao compteDao = new CompteDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action == null) {
			action = "list";
		}

		switch (action) {
		case "list":
			listClients(request, response);
			break;
		case "details":
			showClientDetails(request, response);
			break;
		case "edit":
			editClient(request, response);
			break;
		case "delete":
			deleteClient(request, response);
			break;
		default:
			listClients(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		switch (action) {
		case "create":
			createClient(request, response);
			break;
		case "update":
			updateClient(request, response);
			break;
		case "search":
			searchClient(request, response);
			break;
		default:
			listClients(request, response);
		}
	}

	private void listClients(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<User> clients = userDao.getAll();
		request.setAttribute("clients", clients);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/crudClient.jsp");
		dispatcher.forward(request, response);
	}

	@SuppressWarnings("unused")
	private void showCreateForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/createClient.jsp");
		dispatcher.forward(request, response);
	}

	private void createClient(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Récupérer les valeurs du formulaire
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String role = request.getParameter("role");

		try {
			// Vérifier si l'utilisateur avec cet email existe déjà
			if (userDao.getUserByEmail(email) == null) {
				// Créer un nouvel utilisateur
				User newUser = new User(firstName, lastName, email, phone, password, role);
				// Enregistrer l'utilisateur dans la base de données
				userDao.saveOrUpdate(newUser);
				// Rediriger vers la liste des clients après la création
				response.sendRedirect(request.getContextPath() + "/clientCrud?action=list");
			} else {
				// L'utilisateur avec cet email existe déjà, gestion d'erreur
				response.sendRedirect(request.getContextPath() + "/error.jsp");
			}
		} catch (Exception e) {
			// Gestion des erreurs (journalisation, redirection vers une page d'erreur,
			// etc.)
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/error.jsp");
		}

//        // Rediriger vers la liste des clients après la création
//        response.sendRedirect(request.getContextPath() + "/clientCrud?action=list");
	}

	// search bar

	private void searchClient(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("searchEmail");
		User user = userDao.getUserByEmail(email);
		if (user != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/crudClient.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
			dispatcher.forward(request, response);
		}
	}

	// Detail

	private void showClientDetails(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long clientId = Long.parseLong(request.getParameter("clientId"));

		// Récupérer le client avec ses comptes
		User client = userDao.getById(clientId);

		if (client != null) {
			// Accéder aux comptes du client en utilisant le comteDao
			List<Compte> comptes = compteDao.getComptesByUserId(clientId);

			// Ajouter le client et ses comptes à la requête
			request.setAttribute("client", client);
			request.setAttribute("comptes", comptes);

			// Rediriger vers la page de détails client (à créer)
			RequestDispatcher dispatcher = request.getRequestDispatcher("/clientDetails.jsp");
			dispatcher.forward(request, response);
		} else {
			// Gérer le cas où le client n'est pas trouvé
			response.sendRedirect(request.getContextPath() + "/error.jsp");
		}
	}

	private void editClient(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Récupérer l'ID du client à éditer depuis les paramètres de la requête
		long clientId = Long.parseLong(request.getParameter("clientId"));

		// Récupérer le client depuis la base de données
		User client = userDao.getById(clientId);

		// Mettre le client dans les attributs de la requête
		request.setAttribute("client", client);

		// Rediriger vers la page d'édition de client
		RequestDispatcher dispatcher = request.getRequestDispatcher("/editUser.jsp");
		dispatcher.forward(request, response);
	}

	private void updateClient(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Récupérer les données du formulaire
		long clientId = Long.parseLong(request.getParameter("clientId"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String role = request.getParameter("role");

		// Récupérer le client depuis la base de données
		User user = userDao.getById(clientId);

		// Mettre à jour les champs du client
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setEmail(email);
		user.setPassword(password);
		user.setPhone(phone);
		user.setRole(role);

		// Mettre à jour le client dans la base de données
		userDao.saveOrUpdate(user);

		// Rediriger vers la liste des clients après la mise à jour
		response.sendRedirect(request.getContextPath() + "/clientCrud?action=list");
	}

	private void deleteClient(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Récupérer l'ID du client à supprimer depuis les paramètres de la requête
		long clientId = Long.parseLong(request.getParameter("clientId"));
		System.out.println("ID du client à supprimer : " + clientId);

		// Récupérer le client depuis la base de données
		User user = userDao.getById(clientId);

		// Supprimer le client de la base de données
		userDao.delete(user);

		// Rediriger vers la liste des clients après la suppression
		response.sendRedirect(request.getContextPath() + "/clientCrud?action=list");
	}
}
