<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hibernate.gap.models.User" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null) {
        response.sendRedirect("login.jsp");
    }
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>

    <!-- Custom Css -->
    <link rel="stylesheet" href="styles/profile.css">

    <!-- FontAwesome 5 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
</head>
<body>
    <!-- Navbar top -->
    <div class="navbar-top">
        <div class="title">
            <h1>Profile</h1>
        </div>

        <!-- Navbar -->
        <ul>
            <li>
                <a href="#message">
                    <span class="icon-count">29</span>
                    <i class="fa fa-envelope fa-2x"></i>
                </a>
            </li>
            <li>
                <a href="#notification">
                    <span class="icon-count">59</span>
                    <i class="fa fa-bell fa-2x"></i>
                </a>
            </li>
            <li>
                <a href="#sign-out">
                    <i class="fa fa-sign-out-alt fa-2x"></i>
                </a>
            </li>
        </ul>
        <!-- End -->
    </div>
    <!-- End -->

    <!-- Sidenav -->
    <div class="sidenav">
           <h1>Mon profile</h1>
    </div>
    <!-- End -->

    <!-- Main -->
    <div class="main">
        <h2>IDENTITY</h2>
        <div class="card">
            <div class="card-body">
                <a href="">
                      <i class="fa fa-pen fa-xs edit" style="color: blue;"></i>
                 </a>
                
                <table>
                    <tbody>
                        <tr>
                            <td>Nom</td>
                            <td>:</td>
                            <td><%= user.getFirstName() %></td>
                        </tr>
                        <tr>
                                                <tr>
                            <td>prenom</td>
                            <td>:</td>
                            <td><%= user.getLastName() %></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>:</td>
                            <td><%= user.getEmail() %></td>
                        </tr>

                        <tr>
                            <td>Phone</td>
                            <td>:</td>
                            <td><%= user.getPhone() %></td>
                        </tr>

                        <tr>
                            <td>Role</td>
                            <td>:</td>
                             <td><%= user.getRole() %></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
    <!-- End -->
</body>
</html>