package com.hibernate.gap.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.hibernate.gap.models.Carte;
import com.hibernate.gap.models.Compte;
import com.hibernate.gap.models.Machine;
import com.hibernate.gap.models.Transaction;
import com.hibernate.gap.models.User;
import com.hibernate.gap.utils.HibernateUtil;

import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Random;

public class MachineDao implements CrudRepository<Machine> {

	private final SessionFactory sessionFactory;

	public MachineDao() {
		this.sessionFactory = HibernateUtil.getSessionFactory();
	}

	private Session openSession() {
		return sessionFactory.openSession();
	}

	@Override
	public Machine getById(Long id) {
		try (Session session = openSession()) {
			return session.get(Machine.class, id);
		}
	}

	 

	public User getUserByMachine(Machine cpt) {
		try (Session session = sessionFactory.openSession()) {

			User u = session.createQuery("FROM User c where c.id = :id", User.class).setParameter("id", cpt.getId())
					.uniqueResult();
			return u;
		} catch (Exception w) {

		}
		return null;

	}
 	@Override
	public List<Machine> getAll() {
 		 try (Session session = openSession()) {
             return session.createQuery("FROM Machine", Machine.class).list();
         }
	}



	@Override
	public void saveOrUpdate(Machine entity) {
		try (Session session = openSession()) {
			session.beginTransaction();
			session.saveOrUpdate(entity);
			session.getTransaction().commit();
		}	}

	@Override
	public void delete(Machine entity) {
		// TODO Auto-generated method stub
		try (Session session = openSession()) {
			session.beginTransaction();
			session.delete(entity);
			session.getTransaction().commit();
		}
	}
}
