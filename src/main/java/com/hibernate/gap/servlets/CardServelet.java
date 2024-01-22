package com.hibernate.gap.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.hibernate.gap.dao.CarteDao;
import com.hibernate.gap.models.Carte;
import com.hibernate.gap.models.Compte;
import com.hibernate.gap.models.User;

/**
 * Servlet implementation class CardServelet
 */
public class CardServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getOutputStream().println("Hello World");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pin = request.getParameter("noCarte");
		CarteDao crt = new CarteDao();
		System.out.println("dwidin" + pin);
		try {
			Carte carte = crt.getCarteByPin(pin);

			System.out.println("dwidin" + pin);
			if (!carte.equals(null)) {
				Compte cmp = crt.getCompteByCart(carte);
				User user = crt.getUserByCompte(cmp);

				request.setAttribute("carte", carte);
				request.setAttribute("client", user);
				request.setAttribute("compte", cmp);
				System.out.println(cmp.getNumCompte() + "hihi" + user.getEmail());
				request.getRequestDispatcher("/index.jsp").forward(request, response);
//				response.sendRedirect(request.getContextPath() + "/index.jsp");
			} else {
				response.sendRedirect(request.getContextPath() + "/carte.jsp");
			}
		} catch (RuntimeException e) {
			// Gérer les erreurs d'authentification
			response.sendRedirect(request.getContextPath() + "/error.jsp");
			throw new RuntimeException(e.toString());
		}

		// TODO Auto-generated method stub
//		response.sendRedirect(request.getContextPath() + "/carte.jsp");
	}

}
