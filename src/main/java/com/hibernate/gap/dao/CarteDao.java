package com.hibernate.gap.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.hibernate.gap.models.Carte;
import com.hibernate.gap.models.Compte;
import com.hibernate.gap.models.User;
import com.hibernate.gap.utils.HibernateUtil;

import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Random;

public class CarteDao implements CrudRepository<Carte> {

	private final SessionFactory sessionFactory;

	public CarteDao() {
		this.sessionFactory = HibernateUtil.getSessionFactory();
	}

	private Session openSession() {
		return sessionFactory.openSession();
	}

	@Override
	public Carte getById(Long id) {
		try (Session session = openSession()) {
			return session.get(Carte.class, id);
		}
	}
public boolean verfiPin(String pin) {
	Carte crt=getCarteByPin(pin);
	if (crt == null) {
		return false;
	}
	else {
		return true;
	}
}
	
	public Carte getCarteByPin(String pin) {
		Carte carte =null;
		try (Session session = sessionFactory.openSession()) {
			// Recherche de la carte par numero
			carte= session.createQuery("FROM Carte c where c.pin = :pin", Carte.class)

					.setParameter("pin", pin).uniqueResult();

			

		}catch(Exception ec) {
			
		} 
			return carte;
		 
	}

	public Compte getCompteByCart(Carte crt) {
		try (Session session = sessionFactory.openSession()) {
			Compte cmpte = session.createQuery("FROM Compte c where c.id = :id", Compte.class)
					.setParameter("id", crt.getId()).uniqueResult();
			return cmpte;
		}catch(Exception w) {
			
		}
		return null;

	}

	public User getUserByCompte(Compte cpt) {
		try (Session session = sessionFactory.openSession()) {

			User u = session.createQuery("FROM User c where c.id = :id", User.class).setParameter("id", cpt.getId())
					.uniqueResult();
			return u;
		}catch(Exception w) {
			
		}
		return null;

	}

	public Carte getCarteByCompteId(Long compteId) {
		try (Session session = sessionFactory.openSession()) {
			// Recherche de la carte associée au compte
			return session.createQuery("FROM Carte WHERE compte.id = :compteId", Carte.class)
					.setParameter("compteId", compteId).uniqueResult();
		}
	}

	public Carte getCarteByNumber(String numeroCarte) {
		try (Session session = sessionFactory.openSession()) {
			// Recherche de la carte par numero
			return session.createQuery("FROM Carte WHERE numeroCarte = :numeroCarte", Carte.class)
					.setParameter("numeroCarte", numeroCarte).uniqueResult();
		}
	}

	@Override
	public void saveOrUpdate(Carte carte) {
		try (Session session = openSession()) {
			session.beginTransaction();
			session.saveOrUpdate(carte);
			session.getTransaction().commit();
		}
	}

	@Override
	public void delete(Carte carte) {
		try (Session session = openSession()) {
			session.beginTransaction();
			session.delete(carte);
			session.getTransaction().commit();
		}
	}

	// Méthode pour générer une nouvelle carte associée à un compte
	public Carte generateCarte(Compte compte) {
		// Créer un numéro de carte avec 16 chiffres
		String numeroCarte = generateRandomNumber(16);

		// Créer un code PIN avec 4 chiffres
		String codePin = generateRandomNumber(4);

		// Calculer la date d'expiration (2 ans à partir de la date actuelle)
		LocalDate localdate = LocalDate.now().plus(2, ChronoUnit.YEARS);
		Date expirationDate = Date.valueOf(localdate);

		// Créer une nouvelle carte
		Carte carte = new Carte(numeroCarte, codePin, expirationDate, compte);

		// Enregistrer la carte dans la base de données
		saveOrUpdate(carte);

		return carte;
	}

	// Méthode utilitaire pour générer un nombre aléatoire avec la longueur
	// spécifiée
	private String generateRandomNumber(int length) {
		Random random = new Random();
		StringBuilder stringBuilder = new StringBuilder(length);
		for (int i = 0; i < length; i++) {
			stringBuilder.append(random.nextInt(10));
		}
		return stringBuilder.toString();
	}

	@Override
	public List<Carte> getAll() {
		// TODO Auto-generated method stub
		return null;
	}
}
