package com.hibernate.gap.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class LogoutServlet
 */

public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Récupérer la session
        HttpSession session = request.getSession(false);

        if (session != null) {
            // Supprimer l'attribut utilisateur de la session
            session.removeAttribute("user");

            // Terminer la session
            session.invalidate();
        }

        // Rediriger vers la page de connexion (ou une autre page après la déconnexion)
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
}
