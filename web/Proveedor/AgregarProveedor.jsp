<%-- 
    Document   : AgregarProveedor
    Created on : 2/11/2016, 09:20:15 PM
    Author     : Senko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    String usuario;
    if(session.getAttribute("Admin")!=null){
        usuario = session.getAttribute("Admin").toString();
    }else{
        out.println("<script> location.replace('/MQST/index.jsp'); </script>");}
%>
<html lang="es">
    <head>
        <title>MQST - Agregar Proveedor</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="../js/Animaciones.js"></script>
        <script src="../js/validator.js"></script>
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
                <a class="navbar-brand" href="/MQST/index.jsp">
                    <span class="glyphicon glyphicon-home"></span> Inicio </a>
              </div>
              <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
                            <span class="glyphicon glyphicon-th-list"></span> Catálogo <span class="caret"></span></a>
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
                            <span class="glyphicon glyphicon-cog"></span> Gestión <span class="caret"></span></a>
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
                    <!-- Expandible Mi Perfil -->
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
            </div>
        </nav>
        <h1 align="center">Agregar Proveedor</h1>
        <h3 align="center">Ingresa los datos en los campos correspondientes.</h3><BR>
        <div class="container-fluid text-center">
            <form class="form-horizontal" method='get' action="/MQST/AgregarProveedor" id="AgregarProveedor" 
                  onSubmit="return validarEmail()" onkeypress='return kp(event)'>
                <div class="form-group">
                    <label class="control-label col-md-3">Nombre:</label>
                    <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="Nombre del Proveedor" 
                               maxlength="25" name="NombreProveedor" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Apellido Paterno:</label>
                    <div class="col-md-2">
                        <input type="text" class="form-control" placeholder="Ingresa Apellido Paterno" 
                               maxlength="25" name="ApPatProveedor" required>
                    </div>
                    <label class="control-label col-md-2">Apellido Materno:</label>
                    <div class="col-md-2">
                        <input type="text" class="form-control" placeholder="Ingresa Apellido Materno" 
                               maxlength="25" name="ApMatProveedor" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Empresa:</label>
                    <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="Empresa proveedora." 
                               maxlength="25" name="EmpresaProveedor" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">E-mail:</label>
                    <div class="col-md-6">
                        <input type="email" class="form-control" placeholder="Ingresa el Correo Electrónico" 
                               maxlength="30" name="CorreoProveedor" id="Email" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Repite el E-mail:</label>
                    <div class="col-md-6">
                        <input type="email" class="form-control" placeholder="Repite su Correo Electrónico" 
                               maxlength="30" name="CorreoProveedor2" id="Email2" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Estado:</label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" placeholder="Estado donde se encuentra" 
                               name="EstadoProveedor" required maxlength="40">
                    </div>
                    <label class="control-label col-md-1">Municipio:</label>
                    <div class="col-md-2">
                        <input type="text" class="form-control" placeholder="Ingresa el Municipio" 
                               name="MunicipioProveedor" required maxlength="40">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Colonia:</label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" placeholder="Ingresa la colonia" 
                               name="ColoniaProveedor" required maxlength="40">
                    </div>
                    <label class="control-label col-md-1">C.P:</label>
                    <div class="col-md-2">
                        <input type="number" class="form-control" placeholder="Ingresa el código Postal" 
                               name="CPProveedor" required min="0" max="999999" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Calle:</label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" placeholder="Ingresa la calle de la dirección" 
                               name="CalleProveedor" required maxlength="50">
                    </div>
                    <label class="control-label col-md-1">Número:</label>
                    <div class="col-md-2">
                        <input type="number" class="form-control" placeholder="Ingresa el numero exterior" 
                               name="NumeroProveedor" required min="0" max="99999" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Teléfono de Casa:</label>
                    <div class="col-md-2">
                        <input type="number" class="form-control" placeholder="Ingresa el numero local" 
                               name="TelCasaProveedor" min="0" required>
                    </div>
                    <label class="control-label col-md-2">Teléfono Celular:</label>
                    <div class="col-md-2">
                        <input type="number" id="input" class="form-control" placeholder="Ingresa un numero de celular" 
                               name="TelCelProveedor" min="0" required>
                    </div>
                </div><BR><BR>
                <div class="form-group">
                <input type="reset" class="btn btn-default" value="Limpiar" style="width: 20%">
                <input type="submit" class="btn btn-primary" value="Agregar Proveedor" style="width: 20%">
            </div>
            </form>
        </div>
        <BR><BR>
        <footer class="container-fluid text-center">
            <a href="#Inicio" title="Volver al Inicio">
                <span class="glyphicon glyphicon-chevron-up" style="font-size:20px;"></span>
            </a>
            <p>MacQuality Service Tracker By <a href="/MQST/QuienesSomos.jsp" title="¿Quiénes Somos?">Sofficcesware</a></p>
            << <a href="/MQST/Cliente/Condiciones.jsp">Terminos y Condiciones</a> >>
        </footer>
    </body>
</html>