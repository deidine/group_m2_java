package com.hibernate.gap.servlets;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import com.hibernate.gap.dao.CarteDao;
import com.hibernate.gap.dao.CompteDao;
import com.hibernate.gap.dao.MachineDao;
import com.hibernate.gap.dao.TransactionDao;
import com.hibernate.gap.models.Carte;
import com.hibernate.gap.models.Compte;
import com.hibernate.gap.models.Machine;
import com.hibernate.gap.models.Transaction;
import com.hibernate.gap.models.User;

/**
 * Servlet implementation class CardServelet
 */
public class TransactionServelet extends HttpServlet {
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
		// TODO Auto-generated method stub\
		String action = request.getParameter("action");

		if (action == null) {
			action = "list";
		}

		switch (action) {
		case "list":
			listComptes(request, response);
			break;
		default:
			listComptes(request, response);
		}

	}

	private void listComptes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		TransactionDao trdo= new TransactionDao(); 
		 List<Transaction> trans = trdo.getAll();
	        request.setAttribute("transss", trans);

	        RequestDispatcher dispatcher = request.getRequestDispatcher("/transactionCrud.jsp");
	        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TODO Auto-generated method stub
//		response.sendRedirect(request.getContextPath() + "/carte.jsp");

		Date currentDate = new Date(0);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String formattedDate = formatter.format(currentDate);
		User usr = (User) request.getAttribute("client");
		Compte cmp = (Compte) request.getAttribute("compte");
		System.out.println("deidine 5a9 mn hount");
		TransactionDao trdoa = new TransactionDao();
		Transaction tr = new Transaction();
		tr.setUser(usr);
		tr.setInformation(
				"transction compte num " + cmp.getNumCompte() + " montant " + request.getAttribute("montant"));
		tr.setTemps(currentDate);

		trdoa.saveOrUpdate(tr);

	}
}
