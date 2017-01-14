<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>MQST - Inicio</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/Animaciones.js"></script>
        <script src="js/validator.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" rel="stylesheet">
        <script src="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
        <style>
            .bg-1{ /*Quienes Somos*/ background-color: #6555F3; color: #ffffff; }
            .bg-2{ /*Manuales*/  background-color: #4CDCC8; color: #2f2f2f; } 
            .bg-3{ /*Quienes Somos*/ background-color: #E9BD68; color: #2f2f2f; }
            .logo{color:black;font-size:200px} .close {font-size:30px} p{font-size: 17px;}
            .btn-2:hover,.btn-3:hover { background-color: transparent; border: 2px solid black;  color: black; }
            .btn-1:hover{ background-color: transparent; border: 1px solid white; color: white; }
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
                    <a class="navbar-brand active">
                        <span class="glyphicon glyphicon-home"></span> Inicio</a>
                </div>
                <% HttpSession sesion = request.getSession(); %>
                <% if(sesion.getAttribute("Cliente")==null && sesion.getAttribute("Admin")==null){%>
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
                                  <ul class="dropdown-menu">
                                        <li><a href="../Cliente/MiPerfil.jsp">
                                                <span class="glyphicon glyphicon-arrow-right"></span> Mi Perfil</a></li>
                                        <li><a href="../Contacto.jsp" id="a">
                                                <span class="glyphicon glyphicon-comment"></span> Contacto</a></li>
                                        <li class="divider"></li>
                                        <li><a href="/MQST/CerrarSesion" id="a">
                                                <span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión</a></li>
                                  </ul>
                            </li>
                            <li><a href="/MQST/Ordenes/Notificaciones.jsp"><span class="glyphicon glyphicon-bell"></span>
                                </a></li>
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
                                        <span class="glyphicon glyphicon-arrow-right"></span> Mi Perfil </a></li>
                                    <li><a href="/MQST/CerrarSesion"> 
                                        <span class="glyphicon glyphicon-arrow-right"></span> Cerrar Sesión </a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                <% } %>
            </div>
        </nav>
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
        <div class="container-fluid bg-1 text-center">
            <div class="row"> <!--slideanim-->
                <div class="col-md-6 col-md-offset-1">
                    <h2>¿Quiénes Somos?</h2> 
                    <h3><i>MacQuick Solutions</i></h3>
                    <p align="center"> El propósito de MacQuick Service Tracker es aumentar la eficiencia del 
                        servicio proporcionado por el dueño de MacQuick 
                        Solutions, a través de un software para administrar los pedidos de los clientes, 
                        así como informar a estos sobre el tipo de procesos que...</p>
                        <a href="/MQST/QuienesSomos.jsp" class="btn btn-default btn-lg btn-1">Más información</a>
                </div>
                <div class="col-md-5">
                    <span class="glyphicon glyphicon-info-sign logo" style="color:white"></span>
                </div>
            </div>
        </div>         
        <div class="container-fluid bg-2 text-center">
            <div class="row slideanim">
                <div class="col-md-5">
                    <span class="glyphicon glyphicon-question-sign logo"></span>
                </div>
                <div class="col-md-7">
                    <h2>Manuales de Usuario</h2> 
                    <p>¿Tienes alguna duda acerca de cómo se usa la página?</p>
                    <a href="/MQST/Manuales.jsp" class="btn btn-default btn-lg btn-2">Ver Manual</a> 
                </div>
            </div>
        </div>
        <% if(sesion.getAttribute("Admin")==null) { %>    
        <div class="container-fluid bg-3 text-center"> 
            <div class="row slideanim">
                <div class="col-md-7">
                    <h2>¡Contáctanos!</h2> 
                    <p>¿Tienes algun problema con el sitio? ¡No dudes en decirnoslo!</p>
                    <a href="/MQST/Contacto.jsp" class="btn btn-default btn-lg btn-3">Contáctanos</a>       
                </div>
                <div class="col-md-5">
                    <span class="glyphicon glyphicon-comment logo"></span>
                </div>
            </div>
        </div>
        <% } %>
        <div class="container-fluid text-center">
            <h1><span class="glyphicon glyphicon-globe" style="color:black"></span></h1>
            <h2 class="margin">Plataformas</h2>
            <div class="row  slideanim">
                <% if(sesion.getAttribute("Admin")!=null) { %>
                <div class="col-md-4">
                    <h3>Página Web</h3><BR>
                    <span class="glyphicon glyphicon-shopping-cart" style="color:black;font-size:170px"></span>
                    <p>¡Aquí puedes gestionar a los clientes y a los productos del catálogo o del inventario 
                        sin problemas!</p>
                <% } else { %>
                <div class="col-md-6">
                    <h3>Página Web</h3><BR>
                    <span class="glyphicon glyphicon-shopping-cart" style="color:black;font-size:170px"></span>
                    <p>Contacta a los administradores y ve el estado de tus ordenes en tiempo real así como
                        su ubicación actual.</p>
                <% } %>
                </div>
                <% if(sesion.getAttribute("Admin")!=null) { %>    
                <div class="col-md-4"> 
                <% } else { %>
                <div class="col-md-6"> 
                <% } %>
                    <h3>Aplicación Móvil</h3><BR>
                    <span class="glyphicon glyphicon-phone" style="color:black;font-size:170px"></span>
                    <p>Todo lo que puedes realizar en web, ¡desde cualquier parte en tu dispositivo móvil!<BR>
                       Proximamente...</p>
                </div>
                <% if(sesion.getAttribute("Admin")!=null) { %>    
                <div class="col-md-4" align="center">
                    <h3>Aplicación Local</h3><BR>
                    <span class="glyphicon glyphicon-user" style="color:black;font-size:170px"></span>
                    <p>Exclusivo del Administrador.<BR>
                    ¡Consulta a los usuarios y modifica tus datos sin conexión a internet!</p>
                </div>
                <% } %>   
            </div>
        </div>
        
        <footer class="container-fluid text-center">
            <a href="#Inicio" title="Volver al Inicio">
                <span class="glyphicon glyphicon-chevron-up" style="font-size:20px;"></span>
            </a>
            <p>MacQuality Service Tracker By <a href="QuienesSomos.jsp" title="¿Quienes Somos?">Sofficcesware</a></p>
            << <a href="/MQST/Cliente/Condiciones.jsp">Terminos y Condiciones</a> >>
        </footer>
    </body>
</html>