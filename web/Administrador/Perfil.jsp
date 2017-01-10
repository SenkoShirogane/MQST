<%-- 
    Document   : Perfil
    Created on : 27/10/2016, 05:31:21 PM
    Author     : Angie
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
        ResultSet resultados = bd.consulta("call ConsultaAdmin('"+sesion.getAttribute("Admin")+"')");
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
            .btn:hover {background-color: transparent;  border: 1px solid white; color: white; }
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
                    <li><a href="/MQST/CerrarSesion">
                        <span class="glyphicon glyphicon-off"></span> Salir</a></li>
                </ul>
              </div>
            </div>
        </nav>
        <h1 align="center">Buenas tardes, ${sessionScope.Admin}. </h1>
        <h3 align="center">Selecciona la opción deseada.</h3>
        <div class="container-fluid bg-1 text-center">
            <div class="col-md-offset-0 col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading"><h3>Mis Datos</h3></div>
                    <div class="panel-body">
                        <%while(resultados.next()) {%>
                        <p><strong>Usuario:</strong> <%out.println(resultados.getString("Usuario"));%>
                        <p><strong>Nombre:</strong> <%out.println(resultados.getString("Nombre"));%>
                                   <%out.println(resultados.getString("Apellido_Paterno"));%>
                                   <%out.println(resultados.getString("Apellido_Materno"));%>
                        <p><strong>Correo:</strong> <%out.println(resultados.getString("Email"));%>
                        <p><strong>Privilegio:</strong> Administrador
                    </div>
                </div>
            </div>
            <div class="col-md-offset-0 col-md-6">
                <div class="jumbotron">
                <h2><span class="glyphicon glyphicon-pencil"></span></h2>
                <h2>Modificar Datos</h2> 
                    <p></p>
                    <form role="form" method='get' action='../Administrador/ModificarCuenta.jsp'>
                      <div class="form-group"  >
                        <button type="submit" class="btn btn-default btn-lg">Modificar</button>       
                      </div> 
                    </form>
                </div>
            </div>
            <div class="col-md-offset-0 col-md-6">
                <div class="jumbotron slideanim">
                <h2><span class="glyphicon glyphicon-plus"></span></h2>
                <h2>Agregar Servicios</h2> 
                    <p></p>
                    <form role="form" method='get' action='../Ordenes/AgregarServicio.jsp'>
                      <div class="form-group"  >
                        <button type="submit" class="btn btn-default btn-lg">Agregar</button>       
                      </div> 
                    </form>
                </div>
            </div>
            <div class="col-md-offset-0 col-md-6">
                <div class="jumbotron slideanim">
                <h2><span class="glyphicon glyphicon-question-sign"></span></h2>
                <h2>Manual de usuario</h2> 
                    <p></p>
                    <form role="form" method='get' action='/MQST/Manuales.jsp'>
                      <div class="form-group"  >
                        <button type="submit" class="btn btn-default btn-lg">Ver</button>       
                      </div> 
                    </form>
                </div>
            </div>
        </div>
        <% }bd.cierraConexion();
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