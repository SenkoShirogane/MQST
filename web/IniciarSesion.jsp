<%-- 
    Document   : IniciarSesion
    Created on : 20/10/2016, 01:22:58 AM
    Author     : Senko
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="BD.MQST"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>MQST - Iniciar Sesión</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/Animaciones.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <style>
            
        </style>
    </head>
    <body>
        <div class="jumbotron text-center">
            <h1>MacQuality Service Tracker</h1> 
        </div>

        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
              <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span> 
                </button>
                <a class="navbar-brand" href="index.jsp">
                    <span class="glyphicon glyphicon-home"></span> Inicio</a>
              </div>
              <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="Contacto.jsp">
                           <span class="glyphicon glyphicon-comment"></span> ¡Contáctanos!</a></li>
                    <li><a href="Manuales.jsp">
                           <span class="glyphicon glyphicon-question-sign"></span> Manuales</a></li>
                    <li><a href="Registro.jsp">
                           <span class="glyphicon glyphicon-user"></span> ¡Regístrate!</a></li>
                </ul>
              </div>
            </div>
        </nav>
        <h1 align="center">Iniciar Sesión</h1><BR>
        <form class="form-horizontal" method='post' action='/MQST/IniciarSesion' onkeypress="return kp(event)">
            <div class="form-group">
                <label class="control-label col-md-4">Usuario:</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" placeholder="Ingresa tu nombre de usuario" name="UsuarioCliente" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-4">Password:</label>
                <div class="col-md-4">
                    <input type="password" class="form-control" placeholder="Ingresa tu Contraseña" name="ContrasenaCliente" required>
                </div>
            </div>
            <p align="center">¿No tienes una cuenta? <a href="Registro.jsp">Regístrate</a><BR>
            <div class="form-group">
                <div class="col-md-offset-4 col-md-4">
                    <input type="submit" class="btn btn-primary" value="Iniciar Sesión" style="width: 100%">
                </div>
            </div>
        </form>
    
        <BR><BR>
        <footer class="container-fluid text-center">
            MacQuality Service Tracker By <a href="QuienesSomos.jsp" title="¿Quiénes Somos?">Sofficcesware</a><BR>
            << <a href="/MQST/Cliente/Condiciones.jsp">Términos y Condiciones</a> >>
        </footer>
    </body>
</html>

