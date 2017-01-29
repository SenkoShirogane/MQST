<%-- 
    Document   : Contacto
    Created on : 20/10/2016, 12:39:21 AM
    Author     : Senko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    BD.MQST bd = new BD.MQST();
    
    try{ bd.conectar();
        ResultSet resultados = bd.consulta("call ConsultaCliente('"+sesion.getAttribute("Cliente")+"');");
%>
<html lang="es">
    <head>
        <title>MQST - Contacto</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/Animaciones.js"></script>
        <script src="js/validator.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <link href="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" rel="stylesheet">
        <script src="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
        <style>
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
                    <a class="navbar-brand" href="index.jsp">
                        <span class="glyphicon glyphicon-home"></span> Inicio</a>
                </div>
                <% if(sesion.getAttribute("Cliente")==null){%>
                    <div class="collapse navbar-collapse" id="myNavbar">
                      <ul class="nav navbar-nav navbar-right">
                          <li><a href="Manuales.jsp">
                            <span class="glyphicon glyphicon-question-sign"></span> Manuales</a></li>
                          <li><a href="Registro.jsp">
                                <span class="glyphicon glyphicon-user"></span> ¡Regístrate!</a></li>
                          <li><a data-toggle="modal" href="#Login"> <!-- data-backdrop="false" data-dismiss="modal" -->
                                <span class="glyphicon glyphicon-log-in"></span> Iniciar Sesión</a></li>
                      </ul>
                    </div>
                <% } else { %>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="/MQST/Cliente/InicioCliente.jsp">
                                <span class="glyphicon glyphicon-th-list"></span> Catálogo</a></li>
                            <li><a href="/MQST/Ordenes/MisOrdenes.jsp">
                                <span class="glyphicon glyphicon-time"></span> Mis Órdenes </a></li>
                            <li class="dropdown">
                                  <a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
                                      <span class="glyphicon glyphicon-user"></span> ${sessionScope.Cliente}
                                  <span class="caret"></span></a>
                                  <!-- Lo que está adentro-->
                                  <ul class="dropdown-menu">
                                      <li><a href="/MQST/Cliente/MiPerfil.jsp">
                                            <span class="glyphicon glyphicon-arrow-right"></span> Mi Perfil</a></li>
                                      <li class="active"><a><span class="glyphicon glyphicon-comment"></span> Contacto</a></li>
                                      <li class="divider"></li>
                                      <li><a href="/MQST/CerrarSesion">
                                            <span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión</a></li>
                                  </ul>
                            </li>
                            <li><a href="/MQST/Ordenes/Notificaciones.jsp"><span class="glyphicon glyphicon-bell">
                                </span><span class="badge">1</span></a>
                        </ul>
                    </div>
                <% } %>
            </div>
        </nav>
        <h1 align="center">¡Contáctanos!</h1>
        <div class="container-fluid">
            <h2 class="text-center">¿Tienes algún problema con la página? 
                ¡Te responderemos lo más pronto posible!</h2><BR>
            <div class="row">
                <div class="col-md-3 col-md-offset-2">
                    <p>Administradores MQST</p>
                    <p><span class="glyphicon glyphicon-map-marker"></span> México, CDMX</p>
                    <p><span class="glyphicon glyphicon-phone"></span> +55 12345678</p>
                    <p><span class="glyphicon glyphicon-envelope"></span> sofficcesware.ssw@gmail.com</p> 
                </div>
                <form action="/MQST/EnviarEmail" method="post" onSubmit="return confirmar()" onkeypress="return kp(event)">
                  <div class="col-md-6">
                    <div class="row">
                      <div class="col-sm-6 form-group">
                        <% if(sesion.getAttribute("Cliente")==null){ %>
                            <input class="form-control" name="Usuario" placeholder="Ingresa tu Nombre." type="text" maxlength="40" required>
                        <% }else{ %>
                            <label> Usuario: ${sessionScope.Cliente}</label>
                            <input name="Usuario" type="hidden" required value="${sessionScope.Cliente}">
                        <% } %>
                      </div>
                      <div class="col-md-6 form-group">
                        <% if(sesion.getAttribute("Cliente")==null){ %>
                            <input class="form-control" name="Correo" placeholder="Ingresa tu Correo." type="email" maxlength="30" required>
                        <% }else{ 
                            while(resultados.next()){ %>
                            <label> E-mail: <%out.print(resultados.getString("Email"));%> </label>
                            <input name="Correo" type="hidden" required value="<%out.print(resultados.getString("Email"));%>">
                        <% } } %>
                      </div>
                    </div>
                    <textarea class="form-control" name="mensaje" placeholder="Pon aquí tu comentario." rows="4" maxlength="100" required></textarea><br>
                    <div class="col-md-12">
                        <button class="btn btn-default pull-right" type="submit">Enviar Comentarios</button>
                    </div>
                  </div>
                </form>
            </div>
        </div>
        <h2 align="center">Nuestra ubicación</h2>
        <h3 align="center">Golfo de San Lorenzo 56, Colonia: Tacuba, C.P.:11410, Miguel Hidalgo, CDMX</h3>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3761.9860794425013!2d-99.19325998532906!3d19.456166986870905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85d202756dbcd02b%3A0xb6cc92e96ec3fd47!2sGolfo+de+San+Lorenzo+56%2C+Tacuba%2C+11410+Ciudad+de+M%C3%A9xico%2C+CDMX!5e0!3m2!1ses-419!2smx!4v1481596018704" 
                width="100%" height="400" frameborder="0" style="border:0" allowfullscreen></iframe>
        <% if(sesion.getAttribute("Admin")==null){ %>  
        <!-- Inicio Modal -->
        <div class="modal fade" id="Login" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form class="form-horizontal" method='post' action='/MQST/IniciarSesion' onkeypress="return kp(event)" id="FormLogin">
                        <div class="modal-header">
                             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                             <h1 class="modal-title" align="center">Inicio de Sesión</h1>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label class="control-label col-md-3">Usuario:</label>
                                <div class="col-md-7">
                                    <input type="text" class="form-control" placeholder="Ingresa tu nombre de usuario" 
                                           name="UsuarioCliente" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Password:</label>
                                <div class="col-md-7">
                                    <input type="password" class="form-control" placeholder="Ingresa tu Contraseña" 
                                           name="ContrasenaCliente" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-7 col-md-offset-3">
                                    <input type="submit" class="btn btn-primary" value="Iniciar Sesión" style="width: 100%">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-danger pull-left" data-dismiss="modal">
                                <span class="glyphicon glyphicon-remove"></span> Salir del Inicio de Sesión </button>
                            ¿Aún no estás registrado? <a href="/MQST/Registro.jsp">Registrarse</a><BR>
                            <a data-toggle="tooltip" title="Por el momento no está disponible esta opción.">¿Olvidaste tu Contraseña?</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Fin -->
        <% } %>
        
    <% } catch(Exception xxxD){} %>
        <BR><BR>
        <footer class="container-fluid text-center">
            <a href="#Inicio" title="Volver al Inicio">
                <span class="glyphicon glyphicon-chevron-up" style="font-size:20px;"></span>
            </a>
            <p>MacQuality Service Tracker By <a href="QuienesSomos.jsp" title="¿Quiénes Somos?">Sofficcesware</a></p>
            << <a href="/MQST/Cliente/Condiciones.jsp">Terminos y Condiciones</a> >>
        </footer>
    </body>
</html>
