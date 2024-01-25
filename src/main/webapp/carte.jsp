
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.hibernate.gap.models.User"%>
<%@page import="com.hibernate.gap.models.Carte"%>
<%@page import="com.hibernate.gap.models.Compte"%>
<%@page import=" java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%

String timeStamp = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.getInstance().getTime());

User usr = null;
if (request.getAttribute("client") != null) {
	usr = (User) request.getAttribute("client");
}
Compte cmpt = null;
if (request.getAttribute("compte") != null) {
	cmpt = (Compte) request.getAttribute("compte");
}

Carte crt = null;
if (request.getAttribute("carte") != null) {
	crt = (Carte) request.getAttribute("carte");
}


%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Index Page</title>

    <!-- External CSS -->
    <link rel="stylesheet" href="style.css" />
  </head>

  <!-- Internal CSS -->
  <style>
    .card {
      position: relative;
      background: linear-gradient(
        30deg,
        rgb(237, 120, 3) 0%,
        rgb(183, 60, 3) 100%
      );
      width: 600px;
      height: 300px;
      margin-top: 100px;
      border-radius: 15px;
      box-shadow: rgb(38, 57, 77) 0px 20px 30px -10px;
      color: white;
    }

    .card .numberarea {
        position: absolute;
        top:100px;
        right:100px; 
        font-size: 20px;
        font-family: 'Courier New', Courier, monospace;
        word-spacing: 1px;
    }

    .card .namearea {
        position:absolute;
        font-size: 15px;
        font-family: 'Courier New', Courier, monospace;
        left: 80px;
        top:100px
    }

    .card .expirydatearea {
        font-family: 'Courier New', Courier, monospace;
        position: absolute;
        top:130px;
        left:260px

    }

    .card .validthru {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    
        top:235px;
        right:420px;
        font-size: 27px;
        color:white;
    }

    .card .banklogo {
        position: absolute;
        top:10px;
        left:20px;
    }

    .logodesign {
        width: 100px;
    }

    .card .simslot {
        position: absolute;
        top:20px;
        right:50px;
    }
  </style>

  <!-- Inline CSS -->
  <body onload="imprimer(); " style="background-color: rgb(249, 249, 249)">

    <center>
    
					 
      <div class="card">

        <div class="numberarea">
           CN: <%=crt.getNumeroCarte()%>
        </div>

        <div class="namearea">
         Nom: <%=usr.getFirstName() + "/ <br>" + usr.getLastName()%>
             
        </div>
        <div class="expirydatearea">
        
             <%="<br><br>DE: "+crt.getDateExpiration()+"<br><br><br> Pin:"+ crt.getPin() %>
        </div>

        <div class="validthru">
          <p> 
          Banque</p>
        </div>


        

					 
      </div>
    </center>
    <script>
    function imprimer(){
    	 window.print(); 
    	    window.onafterprint = function(event) {
    			 
    			 document.location.href='adminHome.jsp' 	 
    		 };
    	    	    	
    	 }

    
    </script>
  </body>
</html>