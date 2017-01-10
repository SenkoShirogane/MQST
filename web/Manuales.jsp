<%-- 
    Document   : Manuales
    Created on : 20/10/2016, 01:07:11 AM
    Author     : Senko
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>MQST - Manual de Usuario</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/ChatMensajes.js"></script>
        <script src="js/Animaciones.js"></script>
        <script src="js/validator.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <link href="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" rel="stylesheet">
        <script src="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
        <style>
            #Instrucciones{ background-color: transparent; }
            .container-fluid { padding-top: 10px; padding-bottom: 10px; }
            body{background-color: white;}
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
                <% HttpSession sesion = request.getSession(); %>
                <% if(sesion.getAttribute("Cliente")==null && sesion.getAttribute("Admin")==null){ %>
                    <div class="collapse navbar-collapse" id="myNavbar">
                      <ul class="nav navbar-nav navbar-right">
                          <li class="active"><a href="Manuales.jsp">
                            <span class="glyphicon glyphicon-question-sign"></span> Manuales</a></li>
                          <li><a href="Registro.jsp">
                                <span class="glyphicon glyphicon-user"></span> ¡Regístrate!</a></li>
                          <li><a data-toggle="modal" href="#Login">
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
                            <!-- Expandible Catalogo -->
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
                                <!-- Lo que está adentro-->
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
            
        <h1 align="center">¡Bienvenido al Manual de Usuario!</h1>
        <h3 align="center">Selecciona la opción deseada</h3><br>
        <div class="container text-center">
            <ul class="nav nav-tabs">
                <%if(sesion.getAttribute("Cliente")==null && sesion.getAttribute("Admin")==null){%>
                    <li class="active"><a data-toggle="tab" href="#home">Registrarte</a></li>
                    <li><a data-toggle="tab" href="#menu1">Iniciar Sesión</a></li>
                    <li><a data-toggle="tab" href="#menu2">Contactar a un Administrador</a></li>
                <% } else if(sesion.getAttribute("Cliente")==null) { %>
                    <li class="active"><a data-toggle="tab" href="#homeC">Ver Catálogo</a></li>
                    <li><a data-toggle="tab" href="#menu1C">Gestionar Usuarios</a></li>
                    <li><a data-toggle="tab" href="#menu2C">Detalles nuevos del producto</a></li>
                <% } else if(sesion.getAttribute("Admin")==null) { %>
                    <li class="active"><a data-toggle="tab" href="#homeA">Gestionar Mis Órdenes</a></li>
                    <li><a data-toggle="tab" href="#menu1A">Panel de Notificaciones</a></li>
                    <li><a data-toggle="tab" href="#menu2A">Contactar a un administrador</a></li>
                <% } %>
            </ul>
            <div class="tab-content">
              <%if(sesion.getAttribute("Cliente")==null && sesion.getAttribute("Admin")==null){%>
                <!-- Opción 1 Usuario-->
                <div id="home" class="tab-pane fade in active">
                    <h3>REGISTRAR UN NUEVO USUARIO</h3>
                    <h4>Para disfrutar de todos los servicios que ofrece la página necesitarás contar con una cuenta,
                        para hacerlo sólo basta con que te dirijas al apartado "¡Registrate!", ahí deberás ingresar 
                        los datos necesarios en los campos correspondientes. No te preocupes, tu información personal 
                        estará segura con nosotros.</h4>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/Registro.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div><BR><BR>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">Lo primero que verás al ingresar a la sección "¡Registrate!" 
                                        es una pantalla como ésta.</h4>
                                </div>
                            </div>
                        </div><BR><BR><BR>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/Registro1.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">En estos campos sólo basta con que ingreses tu nombre
                                        completo y otros datos en sus respectivos campos, a su vez, ingresa un nombre 
                                        de usuario para identificarte en la página, recuerda que puedes ingresar letras y
                                        numeros.</h4>
                                </div>
                            </div>
                        </div><BR><BR><BR><BR>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/Registro3.png" class="img-responsive" 
                                     style="display:inline;width: 400px" alt="Ayuda">
                            </div>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">Este último campo es muy importante. Es necesario leas los
                                        Términos y Condiciones, así, estarás informado acerca de las políticas de la empresa.
                                        Y una vez estés de acuerdo, entonces marca la casilla.
                                    </h4>
                                </div>
                            </div>
                        </div>
                </div>
                
                <!-- opción 2 Usuario-->
                <div id="menu1" class="tab-pane fade">
                    <h3>INICIAR SESIÓN</h3>
                    <h4>Para iniciar sesion en la página sólo basta con que vayas al apartado "Iniciar Sesión".
                        Sólo es necesario que ingreses tu nombre de usuario y la contraseña 
                        con la que te registraste en la página.
                        Si aún no cuentas con un usuario en la página será necesario que te registres 
                        en la sección: "¡Registrate!".</h4>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/IniciarSesion.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">Lo primero que verás al ingresar a la sección "Iniciar Sesión" 
                                        es una pantalla como ésta.<BR>
                                        En caso de que hayas olvidado tu contraseña será necesario que te contactes
                                        con los administradores.</h4>
                                </div>
                            </div>
                        </div>
                </div>
                
                <!-- Opcion 3 Usuario-->
                <div id="menu2" class="tab-pane fade">
                <h3>¿CÓMO PUEDO CONTACTAR A UN ADMINISTRADOR?</h3>
                <h4>En caso de que los clientes tengan dudas o comentarios acerca del uso de la página web 
                    existe una opción para contactarse directamente con los administradores.</h4>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/ContactoSS.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">Lo primero que verás al ingresar a la sección "Contacto" 
                                        es una pantalla como ésta.<BR>
                                    </h4>
                                </div>
                            </div>
                        </div><BR><BR><BR>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/ContactoSS2.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">Estos son los datos de contacto para los administradores
                                        de la página, utilizalos en caso de que desees un contacto más
                                        personalizado.<BR>
                                    </h4>
                                </div>
                            </div>
                        </div><BR><BR><BR>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/ContactoSS3.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">Ingresa el nombre con el que quieras que se refieran a ti y tu
                                        correo para que los administradores puedan responderte.<BR>
                                    </h4>
                                </div>
                            </div>
                        </div>
                </div>
                
              <% } else if(sesion.getAttribute("Cliente")==null) { %>
                <!-- Opción 1 Administrador-->
                <div id="homeC" class="tab-pane fade in active">
                    <h3>¿QUÉ PUEDO VER EN EL CATÁLOGO?</h3>
                    <h4>En el apartado "Catálogo de..." encontrarás diversas opciones disponibles para mantener
                        la administración de la página, entre las que se encuentran:</h4>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/CatalogoA1.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div><BR><BR>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">Lo primero que verás al seleccionar la opción: "Catálogo de...", 
                                        son estas opciones. Selecciona la opción que desees para ver al respectivo usuario
                                        o producto, recuerda que sólo puedes consultar.</h4>
                                </div>
                            </div>
                        </div><BR><BR><BR>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/CatalogoA2.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">Para modificar los datos de un usuario o de un producto, 
                                        dirigete a la sección "Gestión de..."</h4>
                                </div>
                            </div>
                        </div><BR>
                </div>
                
                <!-- Opción 2 Administrador-->
                <div id="menu1C" class="tab-pane fade">
                    <h3>¿CÓMO PUEDO GESTIONAR A LOS USUARIOS QUE FORMAN PARTE DE LA PÁGINA?</h3>
                    <h4>En el apartado "Gestionar..." encontrarás diversas opciones disponibles para mantener
                      la administración de la página, entre las que se encuentran:</h4>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/GestionUsuarios.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div><BR><BR>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones"> 
                                    <h4 align="left">Lo primero que verás al seleccionar la opción: "Gestión de...",
                                        son estas opciones. Selecciona la opción que desees para gestionar al respectivo
                                        usuario o producto, ten cuidado con las acciones que realices.</h4>
                                </div>
                            </div>
                        </div><BR><BR><BR>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/GestionUsuarios1.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">Para visualizar la información completa de los usuarios o productos,
                                        dirigete a la sección: "Catálogo de...".</h4>
                                </div>
                            </div>
                        </div><BR><BR>
                </div>
                
                <!-- Opción 3 Administrador-->
                <div id="menu2C" class="tab-pane fade">
                    <h3>¿CÓMO MOSTRARLE AL CLIENTE LOS SERVICIOS NUEVOS A SU ORDEN?</h3>
                    <h4>En ocaciones hay veces en las que el diagnostico inicial difiere con el diagnostico final
                        pero el cliente sólo pagó para que se le realizaran ciertos servicios a su equipo,
                        para esos casos puedes agregar servicios extra a la orden, en cada uno que se agregue
                        el cliente podrá aceptarla o rechazarla de acuerdo a su decisión.</h4>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/OrdenE1.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div><BR>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">Lo primero que necesitas hacer es entrar a tu perfil, para hacerlo
                                        sólo dale click al botón con tu nombre y se desplegará la correspondiente 
                                        opción.</h4>
                                </div>
                            </div>
                        </div><BR><BR><BR>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/OrdenE2.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">Entre las diversas opciones que salen en tu Perfil, dale click
                                        a donde dice "Agregar Servicios".</h4>
                                </div>
                            </div>
                        </div><BR><BR><BR><BR>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/OrdenE3.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">Esta es la pantalla que te aparece, basta con que ingreses el ID de
                                        la orden (Lo puedes encontrar en la sección "Catálogo de Órdenes" en la opción
                                        "Catálogo de..."). En caso de que haya un costo agregado al que originalmente
                                        estaba planeado, ingresalo en el campo "Nuevo Costo" y por último en la sección
                                        "Detalles Nuevos" ingresa los servicios nuevos que se encontraron en la orden.
                                    </h4>
                                </div>
                            </div>
                        </div>
                </div>
              <% } else if(sesion.getAttribute("Admin")==null) { %>
                <!-- Opción 1 Cliente-->
                <div id="homeA" class="tab-pane fade in active">
                    <h3>¿CÓMO GESTIONAR MIS ÓRDENES?</</h3>
                    <h4>En la página de Mis Ordenes podrás ver el estado actual de tus órdenes y su costo
                    total, además, si se han observado servicios extra en tu orden, se mostrarán en
                    en el apartado de Especificaciones.</h4>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/MO1.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div><BR>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones"> 
                                    <h4 align="left">Lo primero que necesitas hacer para ver tus órdenes es buscar la
                                        opción que se llama "Mis Órdenes" y darle click.</h4>
                                </div>
                            </div>
                        </div><BR><BR><BR>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/MO2.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">En esta pantalla podrás consultar todas las órdenes que están a tu
                                        nombre, incluyendo las nuevas, las que están en proceso de reparación y las
                                        terminadas.</h4>
                                </div>
                            </div>
                        </div><BR><BR>
                </div>
                <!-- Opción 2 Cliente-->
                <div id="menu1A" class="tab-pane fade">
                    <h3>¿QUÉ FUNCIÓN TIENE EL PANEL DE NOTIFICACIONES?</</h3>
                    <h4>El propósito del panel de Notificaciones es notificarte acerca de servicios
                    extra para tus órdenes que se hayan encontrado al momento de la revisión final. 
                    En esta pantalla se pueden aceptar o rechazar dichos cambios.</h4>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/Not1.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div><BR>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones"> 
                                    <h4 align="left">Lo primero que necesitás hacer para entrar a la página
                                        de Notificaciones es darle click a la campana que aparece al lado de
                                        tu nombre de usuario.</h4>
                                </div>
                            </div>
                        </div><BR><BR><BR>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/Not2.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">En esta pantalla saldrán las solicitudes de servicios
                                        extra asociados a tus órdenes, acepta sólo con las que estés de 
                                        acuerdo.</h4>
                                </div>
                            </div>
                        </div><BR><BR>
                </div>
                <!-- Opción 3 Cliente-->
                <div id="menu2A" class="tab-pane fade">
                    <h3>¿CÓMO PUEDO CONTACTAR A UN ADMINISTRADOR?</</h3>
                    <h4>En caso de que tengas dudas o comentarios acerca del uso de la página web 
                        existen dos formas para que puedes contactarte directamente con los administradores.
                        Por medio del chat en vivo y por medio de correo electrónico.</h4>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/Chat.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div><BR>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones"> 
                                    <h4 align="left">Para contactarte por medio del chat, basta con que busques 
                                        donde dice "Chat en línea" y le des click.</h4>
                                </div>
                            </div>
                        </div><BR><BR><BR>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/Chat2.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">Para contactar al administrador basta con que escribas tu 
                                        mensaje y le des en el botón que contiene una flecha. A veces la respuesta
                                        del administrador puede tardar. Es importante que leas el
                                        texto con el que viene acompañado, cuando diga "No disponible" significa
                                        que actualmente no hay ningún administrador en la página que esté
                                        disponible.</h4>
                                </div>
                            </div>
                        </div><BR><BR>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/ContactoC1.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">El segundo método es por medio de Correo Electrónico, para
                                        ello, tan sólo busca el botón que contiene tu nombre de usuario y dale
                                        click a la opción "Contacto" entre las opciones que aparecen.</h4>
                                </div>
                            </div>
                        </div><BR><BR>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/ContactoC2.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">También puedes ingresar a la sección de Contacto desde la
                                        pantalla de "Mi Perfil" y seleccionando "Contáctanos".</h4>
                                </div>
                            </div>
                        </div><BR><BR>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/ContactoC3.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">Lo primero que verás al ingresar a la sección "Contacto" 
                                        es una pantalla como ésta.</h4>
                                </div>
                            </div>
                        </div><BR><BR>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/ContactoSS2.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">Estos son los datos de contacto para los administradores
                                        de la página, utilizalos en caso de que desees un contacto más
                                        personalizado.</h4>
                                </div>
                            </div>
                        </div><BR><BR>
                    <!-- Imagenes e instrucciones -->
                        <div class="container-fluid">
                            <div class="col-md-offset-0 col-md-6">
                                <img src="img/ContactoC4.png" class="img-responsive" 
                                     style="display:inline;" alt="Ayuda">
                            </div>
                            <div class="col-md-offset-0 col-md-6">
                                <div id="Instrucciones">
                                    <h4 align="left">Aquí sólo basta con que ingreses tu mensaje, tu nombre de
                                        usuario y tu correo ya están de forma automática.</h4>
                                </div>
                            </div>
                        </div><BR><BR>
                </div>
              <% } %>
            </div>
        </div>
        <% if(sesion.getAttribute("Cliente")==null && sesion.getAttribute("Admin")==null){%>
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
                            <a>¿Olvidaste tu Contraseña?</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Fin Modal -->
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
                        <!--<div class="fecha">Enviado: 14-04-2001</div>
                        </div>
                    </div>
                    <div id="caja-mensaje">
                        <input type="text" placeholder="Escribir mensaje..." id="textbox">
                        <button id="send"> &#8594; </button>
                    </div>
                </div>
            </div>
        </nav>
        <!--Cierra Chat -->-->
        <% } else if(sesion.getAttribute("Cliente")==null) {} %>
        <BR><BR>
        <footer class="container-fluid text-center">
            <a href="#Inicio" title="Volver al Inicio">
                <span class="glyphicon glyphicon-chevron-up" style="font-size:20px;"></span>
            </a>
            <p>MacQuality Service Tracker By <a href="QuienesSomos.jsp" title="¿Quienes Somos?">Sofficcesware</a></p>
            << <a href="/MQST/Cliente/Condiciones.jsp">Terminos y Condiciones</a> >>
        </footer>
    </body>
</html>