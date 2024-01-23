package com.hibernate.gap.servlets;

import jakarta.servlet.RequestDispatcher;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.hibernate.gap.dao.CarteDao;
import com.hibernate.gap.dao.CompteDao;
import com.hibernate.gap.models.Carte;
import com.hibernate.gap.models.Compte;
import com.hibernate.gap.models.User;

public class crudCompteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final CompteDao compteDao = new CompteDao();
    private final CarteDao carteDao = new CarteDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
        case "deblockerSystem":
            debloquer(request, response);
            break;
            
            case "list":
                listComptes(request, response);
                break;
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                editCompte(request, response);
                break;
            case "delete":
                deleteCompte(request, response);
                break;
            case "generateCard":
            	generateCard(request, response);
            	break;
            default:
                listComptes(request, response);
        }
    }

    private void debloquer(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub

		   jakarta.servlet.http.HttpSession session = request.getSession();
			 session.setAttribute("loginAttempts", 0);
		     response.sendRedirect(request.getContextPath() + "/crudCompte?action=list");
		     	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
        case "deblockerSystem":
            debloquer(request, response);
            break;
            
            case "create":
                createCompte(request, response);
                break;
            case "update":
                updateCompte(request, response);
            case "delete":
                deleteCompte(request, response);
                break;
            case "augmenter":
                augmenterCompte(request, response);
                break;
            case "retrait":
                effectuerRetrait(request, response);
                break;
            case "chercher":
            	chercher(request, response);
            	break;
            default:
                listComptes(request, response);
        }
    }

    private void chercher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

        String numCompte = request.getParameter("numCompte");
    	 List<Compte> comptes = compteDao.chercher(numCompte);
         request.setAttribute("comptes", comptes);

         RequestDispatcher dispatcher = request.getRequestDispatcher("/compteCrud.jsp");
         dispatcher.forward(request, response);
	}

	private void listComptes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Compte> comptes = compteDao.getAll();
        request.setAttribute("comptes", comptes);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/compteCrud.jsp");
        dispatcher.forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/createCompte.jsp");
        dispatcher.forward(request, response);
    }

    private void createCompte(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer les valeurs du formulaire
        String numCompte = request.getParameter("numCompte");
        String type_compte = request.getParameter("type_compte");
        double solde = Double.parseDouble(request.getParameter("solde"));
        Long userId = Long.parseLong(request.getParameter("userId"));
        System.out.println(solde);
        // Récupérer l'utilisateur associé au compte
        User user = new User();
        user.setId(userId);

        // Créer un nouveau compte
        Compte newCompte = new Compte(numCompte,type_compte, solde, user);

        // Enregistrer le compte dans la base de données
        compteDao.saveOrUpdate(newCompte);

        // Rediriger vers la liste des comptes après la création
        response.sendRedirect(request.getContextPath() + "/crudCompte?action=list");
    }

    private void editCompte(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer l'ID du compte à éditer depuis les paramètres de la requête
        long compteId = Long.parseLong(request.getParameter("compteId"));

        // Récupérer le compte depuis la base de données
        Compte compte = compteDao.getById(compteId);

        // Mettre le compte dans les attributs de la requête
        request.setAttribute("compte", compte);

        // Rediriger vers la page d'édition de compte
        RequestDispatcher dispatcher = request.getRequestDispatcher("/editCompte.jsp");
        dispatcher.forward(request, response);
    }

    private void updateCompte(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer les données du formulaire
        long compteId = Long.parseLong(request.getParameter("compteId"));
        String numCompte = request.getParameter("numCompte");
        String type_compte = request.getParameter("type_compte");
        double solde = Double.parseDouble(request.getParameter("solde"));
        Long userId = Long.parseLong(request.getParameter("userId"));

        // Récupérer l'utilisateur associé au compte
        User user = new User();
        user.setId(userId);

        // Récupérer le compte depuis la base de données
        Compte compte = compteDao.getById(compteId);

        // Mettre à jour les champs du compte
        
        compte.setNumCompte(numCompte);
        compte.setType_compte(type_compte);
        compte.setSolde(solde);
        compte.setUser(user);

        // Mettre à jour le compte dans la base de données
        compteDao.saveOrUpdate(compte);

        // Rediriger vers la liste des comptes après la mise à jour
        response.sendRedirect(request.getContextPath() + "/crudCompte?action=list");
    }

    private void deleteCompte(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer l'ID du compte à supprimer depuis les paramètres de la requête
        long compteId = Long.parseLong(request.getParameter("compteId"));

        // Récupérer le compte depuis la base de données
        Compte compte = compteDao.getById(compteId);

        // Supprimer le compte de la base de données
        compteDao.delete(compte);

        // Rediriger vers la liste des comptes après la suppression
        response.sendRedirect(request.getContextPath() + "/crudCompte?action=list");
    }
    
    //AUGMENTER LE SOLDE OU EFFECTUER UN RETRAIT
    
    private void augmenterCompte(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer les paramètres du formulaire
        Long compteId = Long.parseLong(request.getParameter("compteId"));
        double montant = Double.parseDouble(request.getParameter("montant"));

        // Récupérer le compte depuis la base de données
        Compte compte = compteDao.getById(compteId);

        // Vérifier si le compte existe
        if (compte != null) {
            // Augmenter le solde du compte
            compte.setSolde(compte.getSolde() + montant);

            // Mettre à jour le compte dans la base de données
            compteDao.saveOrUpdate(compte);

            // Rediriger vers la page de détails client
            response.sendRedirect(request.getContextPath() + "/clientCrud?action=details&clientId=" + compte.getUser().getId());
        } else {
            // Gérer le cas où le compte n'est pas trouvé
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    private void effectuerRetrait(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer les paramètres du formulaire
        String compteId = request.getParameter("compteId");
        double montant = Double.parseDouble(request.getParameter("montant"));

        // Récupérer le compte depuis la base de données
        Compte compte = compteDao.getById(Long.parseLong(compteId));

        // Vérifier si le compte existe
        if (compte != null) {
            // Vérifier si le solde est suffisant pour effectuer le retrait
            if (compte.getSolde() >= montant) {
                // Effectuer le retrait
                compte.setSolde(compte.getSolde() - montant);

                // Mettre à jour le compte dans la base de données
                compteDao.saveOrUpdate(compte);

                // Rediriger vers la page de détails client
                response.sendRedirect(request.getContextPath() + "/clientCrud?action=details&clientId=" + compte.getUser().getId());
            } else {
                // Gérer le cas où le solde est insuffisant
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }
        } else {
            // Gérer le cas où le compte n'est pas trouvé
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }


private void generateCard(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    long compteId = Long.parseLong(request.getParameter("compteId"));
    
    Carte existe = carteDao.getCarteByCompteId(compteId);
    
    if (existe == null) {
        // Récupérer le compte depuis la base de données
        Compte compte = compteDao.getById(compteId);

        // Générer la carte associée au compte
        Carte carte = carteDao.generateCarte(compte);

        

        // Rediriger vers la liste des comptes après la génération de la carte
        response.sendRedirect(request.getContextPath() + "/crudCompte?action=list");
    	
    }else {
    	System.out.println("Ce compte a deja une carte associee !" + existe.getId());
    	request.setAttribute("erreurMessage", "Ce compte a deja une carte associee !");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
        dispatcher.forward(request, response);
    	
    }
    
}
}