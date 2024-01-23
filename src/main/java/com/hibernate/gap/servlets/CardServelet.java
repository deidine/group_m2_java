package com.hibernate.gap.servlets;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
 

import com.hibernate.gap.dao.CarteDao;
import com.hibernate.gap.dao.CompteDao;
import com.hibernate.gap.models.Carte;
import com.hibernate.gap.models.Compte;
import com.hibernate.gap.models.User;

/**
 * Servlet implementation class CardServelet
 */
public class CardServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private final CompteDao compteDao = new CompteDao();
    private final CarteDao carteDao = new CarteDao();

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
		 String action = request.getParameter("action");
		 System.out.println("acyi"+action);
	        switch (action) {
	        
	            case "Enter":
	            	System.out.println("validete");
	            	validatePin(request, response);
	                break;
	            case "retraitFromCln":
	            	System.out.println("retrait");
	            	effectuerRetraitFromCln(request, response);
	                break;
	           }

		
		// TODO Auto-generated method stub
//		response.sendRedirect(request.getContextPath() + "/carte.jsp");
	}


	
	 	
	
	   private void validatePin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   jakarta.servlet.http.HttpSession session = request.getSession();
		   String pin = request.getParameter("noCarte");
			CarteDao crt = new CarteDao();
			System.out.println("dwidin" + pin);
		 
				
				System.out.println("dwidin" + pin);
				if (crt.verfiPin(pin)) {
					Carte carte = crt.getCarteByPin(pin);

					Compte cmp = crt.getCompteByCart(carte);
					User user = crt.getUserByCompte(cmp);

					request.setAttribute("carte", carte);
					request.setAttribute("client", user);
					request.setAttribute("compte", cmp);
					 session.setAttribute("loginAttempts", 0);
						
					System.out.println(cmp.getNumCompte() + "hihi" + user.getEmail());
					request.getRequestDispatcher("/index.jsp").forward(request, response);

		             
//					response.sendRedirect(request.getContextPath() + "/index.jsp");
				} else {
					int i=0;
					 int attemptCount=0;

					   String count = request.getParameter("count"); 
					
					request.setAttribute("error", true);
					 
			              session.setAttribute("loginAttempts", Integer.parseInt(count)+1);
				

					request.setAttribute("try", i+=1);
					request.getRequestDispatcher("code.jsp").forward(request, response);
				}
			 
	}


private void effectuerRetraitFromCln(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Récupérer les paramètres du formulaire
    String compteId = request.getParameter("compteId");
    double montant = Double.parseDouble(request.getParameter("montant"));

    // Récupérer le compte depuis la base de données
    Compte compte = compteDao.getById(Long.parseLong(compteId));

	request.setAttribute("montant", request.getParameter("montant"));
    // Vérifier si le compte existe
    if (compte != null) {
        // Vérifier si le solde est suffisant pour effectuer le retrait
        if (compte.getSolde() >= montant) {
            // Effectuer le retrait
            compte.setSolde(compte.getSolde() - montant);
//String sldleft=String.p
        	request.setAttribute("solde",compte.getSolde());
            // Mettre à jour le compte dans la base de données
            compteDao.saveOrUpdate(compte);
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
    				request.getRequestDispatcher("/carte.jsp").forward(request, response);
    				
    			}
    			
    		} catch (RuntimeException e) {
    			// Gérer les erreurs d'authentification
    			response.sendRedirect(request.getContextPath() + "/error.jsp");
    			throw new RuntimeException(e.toString());
    		}
        } else {
            // Gérer le cas où le solde est insuffisant
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    } else {
        // Gérer le cas où le compte n'est pas trouvé
        response.sendRedirect(request.getContextPath() + "/error.jsp");
    }
}


}
