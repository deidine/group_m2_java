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
public class MachineServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final CompteDao compteDao = new CompteDao();
	private final CarteDao carteDao = new CarteDao();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		MachineDao trdo= new MachineDao(); 
		 List<Machine> mach= trdo.getAll();
	        request.setAttribute("logs", mach);

	        RequestDispatcher dispatcher = request.getRequestDispatcher("/logCrud.jsp");
	        dispatcher.forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String timeStamp = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.getInstance().getTime());

		jakarta.servlet.http.HttpSession session = request.getSession();
		User usr=(User) request.getAttribute("client");

		String pin = request.getParameter("noCarte");
		CarteDao crt = new CarteDao();
		MachineDao mchdoa=new MachineDao();
		Machine mch=new Machine(); 
		mch.setLogg("le user "+usr.getFirstName()+"/"+usr.getLastName()+"entrer dans le system dans le temps "+timeStamp);
		mchdoa.saveOrUpdate(mch);


		// TODO Auto-generated method stub
//		response.sendRedirect(request.getContextPath() + "/carte.jsp");
	}

 
	}


