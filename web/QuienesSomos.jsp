<%-- 
    Document   : QuienesSomos
    Created on : 20/10/2016, 01:13:40 AM
    Author     : Senko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>MQST - ¿Quiénes Somos?</title>
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
            #Foto{ background-color: transparent; display:inline; }
            #Empresa{ background-color: #6555F3; color: #ffffff; font-family: Montserrat, sans-serif; }
            h4{ color:white; }
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
                    <span class="glyphicon glyphicon-home"></span> Inicio </a> 
                </div>
                <% HttpSession sesion = request.getSession(); %>
                <% if(sesion.getAttribute("Cliente")==null && sesion.getAttribute("Admin")==null){%>
                    <div class="collapse navbar-collapse" id="myNavbar">
                      <ul class="nav navbar-nav navbar-right">
                          <li><a href="Manuales.jsp">
                            <span class="glyphicon glyphicon-question-sign"></span> Manuales</a></li>
                          <li><a href="Registro.jsp">
                                <span class="glyphicon glyphicon-user"></span> ¡Regístrate!</a></li>
                          <li><a data-toggle="modal" href="#LoginModal">
                                <span class="glyphicon glyphicon-log-in"></span> Iniciar Sesión</a></li>
                      </ul>
                    </div>
                <% } else if(sesion.getAttribute("Admin")==null) { %>
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
                                      <li><a href="/MQST/Contacto.jsp">
                                             <span class="glyphicon glyphicon-comment"></span> Contacto</a></li>
                                      <li class="divider"></li>
                                      <li><a href="/MQST/CerrarSesion">
                                             <span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión</a></li>
                                  </ul>
                            </li>
                            <li><a href="/MQST/Ordenes/Notificaciones.jsp">
                                <span class="glyphicon glyphicon-bell"></span></a></li>
                        </ul>
                    </div>
                <% } else if(sesion.getAttribute("Cliente")==null) { %>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
                                    <span class="glyphicon glyphicon-th-list"></span> Catálogo <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="/MQST/Productos/ConsultarCatalogo.jsp">
                                           <span class="glyphicon glyphicon-phone"></span> Productos</a></li>
                                    <li><a href="/MQST/Productos/ConsultarInventario.jsp">
                                           <span class="glyphicon glyphicon-tag"></span> Inventario</a></li>
                                    <li><a href="/MQST/Proveedor/ConsultarProveedores.jsp">
                                           <span class="glyphicon glyphicon-list-alt"></span> Proveedores</a></li>
                                    <li><a href="/MQST/Cliente/ConsultarClientes.jsp">
                                           <span class="glyphicon glyphicon-user"></span> Clientes</a></li>
                                    <li><a href="/MQST/Ordenes/ConsultarOrdenes.jsp">
                                           <span class="glyphicon glyphicon-edit"></span> Órdenes</a></li>
                                    <li><a href="/MQST/Administrador/ConsultarAdministradores.jsp">
                                           <span class="glyphicon glyphicon-user"></span> Administradores</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
                                    <span class="glyphicon glyphicon-cog"></span> Gestión <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="/MQST/Productos/GestionProductos.jsp">
                                            <span class="glyphicon glyphicon-phone"></span> Productos</a></li>
                                    <li><a href="/MQST/Administrador/InicioAdmin.jsp">
                                            <span class="glyphicon glyphicon-tag"></span> Inventario</a></li>
                                    <li><a href="/MQST/Proveedor/GestionarProveedores.jsp">
                                            <span class="glyphicon glyphicon-list-alt"></span> Proveedores</a></li>
                                    <li><a href="/MQST/Cliente/GestionarClientes.jsp">
                                            <span class="glyphicon glyphicon-user"></span> Clientes</a></li>
                                    <li><a href="/MQST/Ordenes/Ordenes.jsp">
                                            <span class="glyphicon glyphicon-edit"></span> Órdenes</a></li>
                                    <li><a href="/MQST/Administrador/GestionarAdministradores.jsp">
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
                            <li><a href="/MQST/CerrarSesion"> 
                                   <span class="glyphicon glyphicon-arrow-right"></span> Cerrar Sesión</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                <% } %>
            </div>
        </nav>
        
        <h1 align="center">¿Quiénes Somos?</h1>
        <div class="container-fluid text-center">
            <div class="form group">
                <div id="Foto" class="col-md-5 col-md-offset-1">
                    <BR><img src="img/LogoMacQuick.png" class="img-responsive slideanim" alt="Logo">
                </div>
                <div class="col-md-6 col-md-offset-0"> <!-- 5 --> 
                    <div id="Empresa" class="jumbotron">
                        <h2>¿Cuál es el objetivo de MacQuality Service Tracker?</h2> 
                        <h4 align="justify">Aumentar la eficiencia del servicio proporcionado por el dueño de MacQuick 
                            Solutions  a través de un software para administrar los pedidos de los clientes, 
                            así como informar a estos sobre el tipo de procesos que sufren sus dispositivos 
                            para que sean más críticos al momento de hacer uso del servicio.</h4>
                      <%if(sesion.getAttribute("Admin")==null){%>
                        <a href="/MQST/Contacto.jsp" class="btn btn-default btn-lg">¡Contáctanos!</a>  
                      <% } %>
                    </div>
                </div>
                <div class="col-md-8 col-md-offset-2 col-xs-0">
                    <div id="MQST" class="jumbotron slideanim">
                        <h2>¿A qué se dedica Sofficcesware?</h2>
                        <p><i>"Dedicado a gente como tú"</i></p>
                        <h3>Misión</h3>
                        <h4>“Somos una empresa desarrolladora de software enfocada al desarrollo 
                            del comercio de chicas y medianas empresas, así como una empresa 
                            dirigida a la inclusión de las nuevas tecnologías en el ámbito de la educación.”</h4>
                        <h3>Visión</h3>
                        <h4>“Ser una empresa reconocida por innovar en los ámbitos de la educación y el comercio 
                            a nivel nacional otorgando siempre un servicio de calidad mundial."</h4>
                    </div>    
                </div>
            </div>
        </div>
        <% if(sesion.getAttribute("Cliente")==null && sesion.getAttribute("Admin")==null){%>
        <!-- Inicio Modal -->
        <div class="modal fade" id="LoginModal" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form class="form-horizontal" method='post' action='/MQST/IniciarSesion' onkeypress="return kp(event)" id="Login">
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
                            <a>¿Olvidaste tu Contraseña?</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Fin -->
        <% } else if(sesion.getAttribute("Admin")==null) { %>
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
                                    <div class="fecha">Enviado: 14-04-2001</div>
                            </div>
                            <div class="mensaje-amigo">
                                    <div class="contenido">
                                            Lalalalalalalalala
                                    </div>
                                    <div class="flecha-derecha"></div>
                                    <div class="fecha">Enviado: 14-02-12</div>
                            </div>
                    </div>
                    <div id="caja-mensaje">
                        <input type="text" placeholder="Escribir mensaje...">
                        <button> &#8594; </button> <!--
                    </div>
                </div>
            </div>
        </nav>-->
        <!--Cierra Chat -->
        <% } else if(sesion.getAttribute("Cliente")==null) {} %>
        <footer class="container-fluid text-center">
            <a href="#Inicio" title="Volver al Inicio">
                <span class="glyphicon glyphicon-chevron-up" style="font-size:20px;"></span>
            </a>
            <p>MacQuality Service Tracker By Sofficcesware</p>
            << <a href="/MQST/Cliente/Condiciones.jsp">Terminos y Condiciones</a> >>
        </footer>
    </body>
</html>
