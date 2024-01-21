package com.hibernate.gap.services;
import com.hibernate.gap.dao.UserDao;
import com.hibernate.gap.models.User;

import jakarta.inject.Inject;
import jakarta.inject.Named;

import java.util.List;
@Named

public class UserService {

    private final UserDao userDao;
    @Inject
    public UserService(UserDao userDao) {
        this.userDao = userDao;
    }

    // Méthode d'enregistrement d'un utilisateur avec spécification du rôle
    public void registerUser(String firstName, String lastName, String email, String phone, String password, String role) {
        if (userDao.getUserByEmail(email) == null) {
            User newUser = new User(firstName, lastName, email, phone, password, role);
            userDao.saveOrUpdate(newUser);
        } else {
            throw new RuntimeException("Un utilisateur avec cet email existe déjà.");
        }
    }

    // Méthode de connexion d'un utilisateur
    public User loginUser(String email, String password) {
       try {
        User user = userDao.getUserByEmailAndPassword(email, password);
        if (user != null) {
            return user;
        } 
        } catch (RuntimeException e)  {
            throw new RuntimeException("Identifiants invalides. Veuillez réessayer.");
        }
	return null;
    }

    // Méthode pour obtenir tous les utilisateurs (exemple)
    public List<User> getAllUsers() {
        return userDao.getAll();
    }

    // Méthode pour obtenir un utilisateur par son identifiant
    public User getUserById(Long userId) {
        return userDao.getById(userId);
    }

    // Méthode pour mettre à jour un utilisateur
    public void updateUser(User user) {
        userDao.saveOrUpdate(user);
    }

    // Méthode pour supprimer un utilisateur par son identifiant
    public void deleteUser(Long userId) {
        User user = userDao.getById(userId);
        if (user != null) {
            userDao.delete(user);
        } else {
            throw new RuntimeException("Utilisateur introuvable.");
        }
    }

    // ... autres méthodes

}
