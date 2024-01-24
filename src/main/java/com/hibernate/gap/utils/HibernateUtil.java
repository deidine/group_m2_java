package com.hibernate.gap.utils;

import org.hibernate.SessionFactory;

import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import com.hibernate.gap.models.Carte;
import com.hibernate.gap.models.Compte;
import com.hibernate.gap.models.Machine;
import com.hibernate.gap.models.Transaction;
import com.hibernate.gap.models.User;



public class HibernateUtil {
    private static final SessionFactory sessionFactory;

    static {
        try {
            Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
            configuration.addAnnotatedClass(User.class);
            configuration.addAnnotatedClass(Compte.class);
            configuration.addAnnotatedClass(Carte.class);
            configuration.addAnnotatedClass(Transaction.class);
            configuration.addAnnotatedClass(Machine.class);
            
            StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder()
                    .applySettings(configuration.getProperties());
            sessionFactory = configuration.buildSessionFactory(builder.build());
        } catch (Exception ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
