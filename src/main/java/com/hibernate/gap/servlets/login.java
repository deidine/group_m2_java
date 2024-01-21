package com.hibernate.gap.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import com.hibernate.gap.dao.UserDao;
import com.hibernate.gap.models.User;
import com.hibernate.gap.services.UserService;



public class login extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            User user = userDao.loginUser(email, password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                if ("Admin".equals(user.getRole())) {
                    response.sendRedirect(request.getContextPath() + "/adminHome.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/clientHome.jsp");
                }
            } else {
                // Authentification échouée, afficher un message sur la page de connexion
                request.setAttribute("errorMessage", "Email ou mot de passe incorrect");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // Gérer les erreurs d'authentification
            request.setAttribute("errorMessage", "Erreur de type " + e.toString());
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
