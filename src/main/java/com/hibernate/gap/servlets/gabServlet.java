package com.hibernate.gap.servlets;

import jakarta.servlet.RequestDispatcher;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import com.hibernate.gap.dao.CarteDao;
import com.hibernate.gap.dao.CompteDao;
import com.hibernate.gap.models.Carte;
import com.hibernate.gap.models.Compte;

public class gabServlet extends HttpServlet {
    private final CompteDao compteDao = new CompteDao();
    private final CarteDao carteDao = new CarteDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "checkBalance":
                checkBalance(request, response);
                break;
            case "withdraw":
                withdraw(request, response);
                break;
            // Ajoutez d'autres actions si nécessaire
            default:
                response.sendRedirect(request.getContextPath() + "/gabInterface.jsp");
        }
    }

    private void checkBalance(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cardNumber = request.getParameter("cardNumber");
        String pin = request.getParameter("pin");

        // Obtenez la carte associée au numéro de carte
        Carte carte = carteDao.getCarteByNumber(cardNumber);
     
        

        if (carte != null && carte.getPin().equals(pin) && isCardValid(carte)) {
            // La carte existe, le code PIN est correct et la carte est valide

            // Obtenez le compte associé à la carte
            Compte compte = carte.getCompte();

            // Transférez le solde à la page JSP
            request.setAttribute("balance", compte.getSolde());
        } else {
            // Carte introuvable, code PIN incorrect ou carte expirée
            request.setAttribute("errorMessage", "Carte introuvable, code PIN incorrect ou carte expirée");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/gabInterface.jsp");
        dispatcher.forward(request, response);
    }

    private void withdraw(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cardNumber = request.getParameter("cardNumber");
        String pin = request.getParameter("pin");
        double withdrawalAmount = Double.parseDouble(request.getParameter("withdrawalAmount"));

        // Obtenez la carte associée au numéro de carte
        Carte carte = carteDao.getCarteByNumber(cardNumber);

        if (carte != null && carte.getPin().equals(pin) && isCardValid(carte)) {
            // La carte existe, le code PIN est correct et la carte est valide

            // Obtenez le compte associé à la carte
            Compte compte = carte.getCompte();

            // Vérifiez si le solde est suffisant pour le retrait
            if (compte.getSolde() >= withdrawalAmount) {
                // Effectuez le retrait
                compte.setSolde(compte.getSolde() - withdrawalAmount);

                // Mettez à jour le solde dans la base de données
                compteDao.saveOrUpdate(compte);

                // Enregistrez l'historique de la transaction dans la base de données (non implémenté ici)
                // ...

                // Redirigez vers la page appropriée
                response.sendRedirect(request.getContextPath() + "/gabInterface.jsp");
                return;
            } else {
                // Solde insuffisant
                request.setAttribute("errorMessage", "Solde insuffisant");
            }
        } else {
            // Carte introuvable, code PIN incorrect ou carte expirée
            request.setAttribute("errorMessage", "Carte introuvable, code PIN incorrect ou carte expirée");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/gabInterface.jsp");
        dispatcher.forward(request, response);
    }

    private boolean isCardValid(Carte carte) {
        // Vérifiez si la carte est encore valide (date d'expiration non dépassée)
    	Date currentDate = Date.valueOf(LocalDate.now());
    	Date expirationDate = carte.getDateExpiration();

    	return currentDate.before(expirationDate);
    }
}
