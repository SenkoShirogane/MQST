<%-- 
    Document   : Notificaciones
    Created on : 3/11/2016, 09:21:00 PM
    Author     : Angie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    HttpSession sesion = request.getSession();
    String usuario;
    if(session.getAttribute("Cliente")!=null){ usuario = session.getAttribute("Cliente").toString();
    }else{ out.println("<script> location.replace('/MQST/index.jsp'); </script>");}
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>MQST - Notificaciones</title> <!-- Lo ve el cliente -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="../js/ChatMensajes.js"></script>
        <script src="../js/Animaciones.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <style>
            .def{ border-color: black;}
            .container-fluid { padding-top: 10px; padding-bottom: 10px; }
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
                    <span class="glyphicon glyphicon-home"></span> Inicio </a>
              </div>
              <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="../Cliente/InicioCliente.jsp">
                        <span class="glyphicon glyphicon-th-list"></span> Catálogo</a></li>
                    <li><a href="../Ordenes/MisOrdenes.jsp">
                        <span class="glyphicon glyphicon-time"></span> Mis Órdenes </a></li> 
                    <!-- Expandible Mi Perfil -->
                    <li class="dropdown">
                          <a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
                              <span class="glyphicon glyphicon-user"></span> ${sessionScope.Cliente}
                          <span class="caret"></span></a>
                          <ul class="dropdown-menu">
                              <li><a href="../Cliente/MiPerfil.jsp">
                                     <span class="glyphicon glyphicon-arrow-right"></span> Mi Perfil</a></li>
                              <li><a href="../Contacto.jsp">
                                     <span class="glyphicon glyphicon-comment"></span> Contacto</a></li>
                              <li class="divider"></li>       
                              <li><a href="/MQST/CerrarSesion">
                                     <span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión</a></li>
                          </ul>
                    </li>
                    <li class="active"><a><span class="glyphicon glyphicon-bell">
                            </span><span class="badge">1</span></a>
                </ul>
              </div>
            </div>
        </nav>
        <h1 align="center">Notificaciones</h1>
        <h3 align="center">Aquí puedes aceptar o cancelar los servicios extras para tus órdenes</h3><BR>
        <!--
        <BR><BR>
        <h1 align="center"><span class="glyphicon glyphicon-ok"></span></h1>
        <h3 align="center"> ¡Aún no tienes órdenes que necesiten servicios extra! </h3>
        -->
        <div class="container-fluid">
        <%
            int pato=0;
            int contador=1; //Será la ID de la orden extra x3
            for(pato=1; pato<=3; pato++){ 
        %>
        <div class="col-md-offset-2 col-md-8">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        Orden #<%=contador%> ||
                        Especificaciones de la orden: dhdhdhdhdh dhdhdhdhd
                    </h4>
                </div>
                <div class="panel-body">
                    <form action="" method="post">
                        <div class="col-md-3">
                            <p>Costo actual: $ 9999</p>
                        </div>
                        <div class="col-md-3">
                            <p>Costo nuevo: $ 10000</p>
                        </div>
                        <div class="col-md-6">
                            <p>Especificaciones: dhdhdhdhdh dhdhdhdhd dhdhdhdhd dhdhdhdhd</p>
                        </div>
                        <div class="col-md-12">
                            <p>Servicio Extra: dhdhdhdhdh dhdhdhdhd</p>
                        </div>
                        <div class="col-md-6">
                            <input type="submit" class="btn btn-primary" value="Aceptar Servicio" style="width: 100%">
                        </div>
                    </form>
                    <Form action="" method="post" onsubmit="return confirmar2()">
                        <input type="hidden" name="OrdenCancelar" value="  " required>
                        <div class="col-md-6">
                            <input type="submit" class="btn btn-default def" value="Rechazar Servicio" style="width: 100%">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <% contador++; } %>
        </div>
        <!-- Inicia Chat --><!--
        <nav class="navbar navbar-inverse navbar-fixed-bottom" style="background-color:transparent;">
            <div id="chat" class="panel nav navbar-nav navbar-right">
                <div id="header-chat" class="panel-heading">
                    <a data-toggle="collapse" href="#colapse" style="color:white; font-size:15px;">
                        Chat en línea (No Disponible)
                    </a>
                </div>
                <div id="colapse" class="panel-collapse collapse" >
                    <div id="mensajes">
                        <div class="mensaje-autor">
                            <div class="flecha-izquierda"></div>
                            <div class="contenido">
                                    Buenas tardes, ¿en qué puedo ayudarle?
                            </div>
                        <!--<div class="fecha">Enviado: 14-04-2001</div>
                        </div>
                    </div>
                    <div id="caja-mensaje">
                        <input type="text" placeholder="Escribir mensaje..." id="textbox">
                        <button id="send"> &#8594; </button>
                    </div>
                </div>
            </div>
        </nav>-->
        <!--Cierra Chat -->
        <footer class="container-fluid text-center">
            <a href="#Inicio" title="Volver al Inicio">
                <span class="glyphicon glyphicon-chevron-up" style="font-size:20px;"></span>
            </a>
            <p>MacQuality Service Tracker By <a href="/MQST/QuienesSomos.jsp" title="¿Quiénes Somos?">Sofficcesware</a></p>
            << <a href="/MQST/Cliente/Condiciones.jsp">Terminos y Condiciones</a> >>
        </footer>
    </body>
</html>