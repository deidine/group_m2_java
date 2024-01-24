package com.hibernate.gap.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.hibernate.gap.models.Carte;
import com.hibernate.gap.models.Compte;
import com.hibernate.gap.models.Transaction;
import com.hibernate.gap.models.User;
import com.hibernate.gap.utils.HibernateUtil;

import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Random;

public class TransactionDao implements CrudRepository<Transaction> {

	private final SessionFactory sessionFactory;

	public TransactionDao() {
		this.sessionFactory = HibernateUtil.getSessionFactory();
	}

	private Session openSession() {
		return sessionFactory.openSession();
	}

	@Override
	public Transaction getById(Long id) {
		try (Session session = openSession()) {
			return session.get(Transaction.class, id);
		}
	}

	 

	public User getUserByTransaction(Transaction cpt) {
		try (Session session = sessionFactory.openSession()) {

			User u = session.createQuery("FROM User c where c.id = :id", User.class).setParameter("id", cpt.getId())
					.uniqueResult();
			return u;
		} catch (Exception w) {

		}
		return null;

	}
 	@Override
	public List<Transaction> getAll() {
 		 try (Session session = openSession()) {
             return session.createQuery("FROM Transaction", Transaction.class).list();
         }
	}



	@Override
	public void saveOrUpdate(Transaction entity) {
		try (Session session = openSession()) {
			session.beginTransaction();
			session.saveOrUpdate(entity);
			session.getTransaction().commit();
		}	}

	@Override
	public void delete(Transaction entity) {
		// TODO Auto-generated method stub
		try (Session session = openSession()) {
			session.beginTransaction();
			session.delete(entity);
			session.getTransaction().commit();
		}
	}
}
