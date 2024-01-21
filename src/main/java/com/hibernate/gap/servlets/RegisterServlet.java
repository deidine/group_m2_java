package com.hibernate.gap.servlets;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.hibernate.gap.dao.UserDao;
import com.hibernate.gap.models.User;


public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final UserDao userDao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Afficher la page de création d'utilisateur (si nécessaire)
        // Vous pouvez rediriger vers la page JSP correspondante.
        // response.sendRedirect("/path/to/register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
                // Rediriger vers la page de connexion, ou une autre page si nécessaire
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            } else {
                // L'utilisateur avec cet email existe déjà, gestion d'erreur
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }
        } catch (Exception e) {
            // Gestion des erreurs (journalisation, redirection vers une page d'erreur, etc.)
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}
