package com.hibernate.gap.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import com.hibernate.gap.utils.HibernateUtil;
import com.hibernate.gap.models.User;

import java.util.List;

public class UserDao implements CrudRepository<User> {

    private final SessionFactory sessionFactory;

    public UserDao() {
        this.sessionFactory = HibernateUtil.getSessionFactory();
    }

    private Session openSession() {
        return sessionFactory.openSession();
    }

    @Override
    public User getById(Long id) {
        try (Session session = openSession()) {
            return session.get(User.class, id);
        }
    }

    @Override
    public List<User> getAll() {
        try (Session session = openSession()) {
            return session.createQuery("FROM User", User.class).list();
        }
    }

    @Override
    public void saveOrUpdate(User user) {
        try (Session session = openSession()) {
            session.beginTransaction();
            session.saveOrUpdate(user);
            session.getTransaction().commit();
        }
    }

    @Override
    public void delete(User user) {
        try (Session session = openSession()) {
            session.beginTransaction();
            session.delete(user);
            session.getTransaction().commit();
        }
    }

    public User getUserByEmail(String email) {
        try (Session session = openSession()) {
            Query<User> query = session.createQuery("FROM User WHERE email = :email", User.class);
            query.setParameter("email", email);
            return query.uniqueResult();
        }
    }

    public User getUserByEmailAndPassword(String email, String password) {
        try (Session session = openSession()) {
            Query<User> query = session.createQuery("FROM User WHERE email = :email AND password = :password", User.class);
            query.setParameter("email", email);
            query.setParameter("password", password);
            return query.uniqueResult();
        } catch (RuntimeException e) {
            // Vous pouvez imprimer l'exception ou effectuer d'autres opérations de journalisation ici
            e.printStackTrace();
            throw new RuntimeException("Une erreur s'est produite lors de la recherche de l'utilisateur par e-mail et mot de passe.", e);
        }
    }


    // Ajoutez d'autres méthodes spécifiques liées à l'utilisateur selon vos besoins

    // Méthode d'enregistrement d'un utilisateur avec spécification du rôle
    public void registerUser(String firstName, String lastName, String email, String phone, String password, String role) {
        if (getUserByEmail(email) == null) {
            User newUser = new User(firstName, lastName, email, phone, password, role);
            saveOrUpdate(newUser);
        } else {
            throw new RuntimeException("Un utilisateur avec cet email existe déjà.");
        }
    }

    // Méthode de connexion d'un utilisateur
    public User loginUser(String email, String password) {
        try {
            User user = getUserByEmailAndPassword(email, password);
            if (user != null) {
                return user;
            }
        } catch (RuntimeException e) {
        	  e.printStackTrace();
//            throw new RuntimeException("Identifiants invalides. Veuillez réessayer.");
        }
        return null;
    }

    // ... autres méthodes de UserService
}
