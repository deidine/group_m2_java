package com.hibernate.gap.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import com.hibernate.gap.utils.HibernateUtil;
import com.hibernate.gap.models.Compte;

import java.util.List;

public class CompteDao implements CrudRepository<Compte> {

    private final SessionFactory sessionFactory;

    public CompteDao() {
        this.sessionFactory = HibernateUtil.getSessionFactory();
    }

    private Session openSession() {
        return sessionFactory.openSession();
    }

    @Override
    public Compte getById(Long id) {
        try (Session session = openSession()) {
            return session.get(Compte.class, id);
        }
    }
public List<Compte> chercher(String num){ 
	 try (Session session = openSession()) {
         return session.createQuery("FROM Compte where numCompte like '%"+num+"%'", Compte.class).list();
     }
}
    @Override
    public List<Compte> getAll() {
        try (Session session = openSession()) {
            return session.createQuery("FROM Compte", Compte.class).list();
        }
    }

    @Override
    public void saveOrUpdate(Compte compte) {
        try (Session session = openSession()) {
            session.beginTransaction();
            session.saveOrUpdate(compte);
            session.getTransaction().commit();
        }
    }

    @Override
    public void delete(Compte compte) {
        try (Session session = openSession()) {
            session.beginTransaction();
            session.delete(compte);
            session.getTransaction().commit();
        }
    }

    // Ajoutez d'autres méthodes spécifiques aux comptes selon vos besoins

    // Méthode pour récupérer tous les comptes d'un utilisateur donné
    public List<Compte> getComptesByUserId(Long userId) {
        try (Session session = openSession()) {
            Query<Compte> query = session.createQuery("FROM Compte WHERE user.id = :userId", Compte.class);
            query.setParameter("userId", userId);
            return query.list();
        }
    }

    // ... autres méthodes de CompteDao
}
