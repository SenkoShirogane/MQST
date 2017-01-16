<%-- 
    Document   : Chat
    Created on : 15/01/2017, 04:30:10 PM
    Author     : danku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
   HttpSession sesion = request.getSession();
   String usuario;

   if(sesion.getAttribute("Admin")!=null){
       usuario = session.getAttribute("Admin").toString();
   } else {
       out.println("<script> location.replace('/MQST/index.jsp'); </script>");
   }
   BD.MQST bd = new BD.MQST();
    try{
        bd.conectar();
        //ResultSet resultados = bd.consulta("");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>MQST - Mi Perfil</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="../js/Animaciones.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <style>
            .A {border: 3px solid #292C5C; height: 500px} .B {border: 3px solid #292C5C;}
        </style>
    </head>
    <body id="Inicio">
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
                <a class="navbar-brand" href="/MQST/index.jsp">
                    <span class="glyphicon glyphicon-home"></span> Inicio</a>
              </div>
              <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a>
                        <span class="glyphicon glyphicon-comment"></span> Chat </a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
                            <span class="glyphicon glyphicon-th-list"></span> Catálogo
                        <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="../Productos/ConsultarCatalogo.jsp">
                                   <span class="glyphicon glyphicon-phone"></span> Productos</a></li>
                            <li><a href="../Productos/ConsultarInventario.jsp">
                                   <span class="glyphicon glyphicon-tag"></span> Inventario</a></li>
                            <li><a href="../Proveedor/ConsultarProveedores.jsp">
                                   <span class="glyphicon glyphicon-list-alt"></span> Proveedores</a></li>
                            <li><a href="../Cliente/ConsultarClientes.jsp">
                                   <span class="glyphicon glyphicon-user"></span> Clientes</a></li>
                            <li><a href="../Ordenes/ConsultarOrdenes.jsp">
                                   <span class="glyphicon glyphicon-edit"></span> Órdenes</a></li>
                            <li><a href="../Administrador/ConsultarAdministradores.jsp">
                                   <span class="glyphicon glyphicon-user"></span> Administradores</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
                            <span class="glyphicon glyphicon-cog"></span> Gestión 
                        <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="../Productos/GestionProductos.jsp">
                                    <span class="glyphicon glyphicon-phone"></span> Productos</a></li>
                            <li><a href="../Administrador/InicioAdmin.jsp">
                                    <span class="glyphicon glyphicon-tag"></span> Inventario</a></li>
                            <li><a href="../Proveedor/GestionarProveedores.jsp">
                                    <span class="glyphicon glyphicon-list-alt"></span> Proveedores</a></li>
                            <li><a href="../Cliente/GestionarClientes.jsp">
                                    <span class="glyphicon glyphicon-user"></span> Clientes</a></li>
                            <li><a href="../Ordenes/Ordenes.jsp">
                                    <span class="glyphicon glyphicon-edit"></span> Órdenes</a></li>
                            <li><a href="../Administrador/GestionarAdministradores.jsp">
                                    <span class="glyphicon glyphicon-trash"></span> Eliminar Administradores</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
                            <span class="glyphicon glyphicon-user"></span> ${sessionScope.Admin} 
                        <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/MQST/Administrador/Perfil.jsp">
                                   <span class="glyphicon glyphicon-arrow-right"></span> Mi Perfil</a></li>
                            <li class="active"><a >
                                   <span class="glyphicon glyphicon-arrow-right"></span> Chat</a></li>
                            <li><a href="/MQST/CerrarSesion"> 
                                   <span class="glyphicon glyphicon-arrow-right"></span> Cerrar Sesión</a></li>
                        </ul>
                    </li>
                </ul>
              </div>
            </div>
        </nav>
        <h1 align="center">Bienvenid@ al Chat, ${sessionScope.Admin}. </h1>
        <h3 align="center">Aquí puedes ver todas las conversaciones hasta la fecha con los clientes.</h3>
        <div class="container-fluid" >
            <div class="col-xs-offset-1 col-xs-4 A" id="Opciones" style="padding-top: 20px">
                <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a data-toggle="pill" href="#Cliente1">Touko</a></li>
                    <li><a data-toggle="pill" href="#Cliente2">Otro xD</a></li>
                </ul>
            </div>
            
            <div class="col-xs-6 B" id="chat2">
                <div class="tab-content">
                    <!-- Cliente 1 -->
                    <div id="Cliente1" class="tab-pane fade in active">
                        <div id="header-chat">
                            Usuario: Touko
                        </div>
                        <div>
                            <div id="mensajes2">
                                <div class="mensaje-autor">
                                  <!--<div class="flecha-izquierda"></div>-->
                                    <div class="contenido">
                                            Buenas tardes, ¿en qué puedo ayudarle?
                                    </div>
                                </div>
                            </div>
                            <div id="caja-mensaje2">
                                <input type="text" placeholder="Escribir mensaje..." id="textbox" minlength="1" autofocus>
                                <button id="send"><span class="glyphicon glyphicon-arrow-right"></span></button>
                            </div>
                        </div>
                    </div>
                    <!-- Cliente 2 -->
                    <div id="Cliente2" class="tab-pane fade">
                        <div id="header-chat">
                            Usuario: Sakura
                        </div>
                        <div>
                            <div id="mensajes2">
                                <div class="mensaje-autor">
                                  <!--<div class="flecha-izquierda"></div>-->
                                    <div class="contenido">
                                            Buenas tardes, ¿en qué puedo ayudarle?
                                    </div>
                                </div>
                            </div>
                            <div id="caja-mensaje2">
                                <input type="text" placeholder="Escribir mensaje..." id="textbox" minlength="1" autofocus>
                                <button id="send"><span class="glyphicon glyphicon-arrow-right"></span></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div><BR>
        
        <%  bd.cierraConexion();
           } catch(Exception xxxD){}
        %>
        <footer class="container-fluid text-center">
            <a href="#Inicio" title="Volver al Inicio">
                <span class="glyphicon glyphicon-chevron-up" style="font-size:20px;"></span>
            </a>
            <p>MacQuality Service Tracker By <a href="/MQST/QuienesSomos.jsp" title="¿Quienes Somos?">Sofficcesware</a></p>
            << <a href="/MQST/Cliente/Condiciones.jsp">Terminos y Condiciones</a> >>
        </footer>
    </body>
</html>
