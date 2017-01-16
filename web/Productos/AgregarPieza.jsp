<%-- 
    Document   : ModificarInventario
    Created on : 3/11/2016, 12:18:15 AM
    Author     : Senko
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   HttpSession sesion = request.getSession();
   String usuario;

   if(sesion.getAttribute("Admin")!=null){
       usuario = session.getAttribute("Admin").toString();
   } else{
       out.println("<script> location.replace('/MQST/index.jsp'); </script>");
   }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>MQST - Agregar Pieza</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="../js/Animaciones.js"></script>
        <script src="../js/validator.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="../js/fileinput.min.js"></script>
        <link href="../css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
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
        <% BD.MQST bd = new BD.MQST();
            try{
                bd.conectar();
                ResultSet resultados = bd.consulta("call ConsultasProv()"); 
        %>                
        <h1 align="center">Agregar Piezas al Inventario</h1>
        <h3 align="center">Ingresa los datos en los campos correspondientes.</h3>
        <div class="text-center container-fluid">
        <p>Por el momento no se permite el uso de espacios en el nombre de la pieza, puedes usar el "_" (Guión bajo).
        <form class="form-horizontal" enctype="multipart/form-data" method="post" action='/MQST/AgregaPiezas' 
             onSubmit="return confirmar()" onkeypress="return kp(event)">
            <div class="form-group">
                <label class="control-label col-md-3">Nombre:</label>
                <div class="col-md-6">
                    <input type="text" class="form-control" placeholder="Ingresa el nombre de la pieza." 
                           maxlength="30" name="NombrePieza" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Estado:</label>
                <div class="col-md-3">
                    <select name="EstadoPieza"  class="form-control" required>
                        <option value='1' selected>Visible para el cliente</option>
                        <option value='2'>Invisible para el cliente</option>
                    </select>
                </div>
                <label class="control-label col-md-1">Costo:</label>
                <div class="col-md-2">
                    <input type="text" class="form-control" placeholder="Costo de la pieza" 
                           name="CostoPieza" min="0" onkeypress="return vn(event)" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Cantidad:</label>
                <div class="col-md-2">
                    <input type="number" class="form-control" placeholder="Cantidad en almacen" 
                           name="CantidadNuevo" min="0" max="3000" required>
                </div>
                <label class="control-label col-md-1">Proveedor:</label>
                <div class="col-md-3">
                    <select name="ProveedorPieza" class="form-control" required>
                        <option value="0">Selecciona un Proveedor</option>
                        <%while(resultados.next()){%>
                        <%
                            out.println("<option value='"+resultados.getInt("id")+"'>"+resultados.getString("Nombre")+" "+resultados.getString("Apellido1")+" — "+resultados.getString("Empresa")+"</option>");
                        }%>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Imagen:</label>
                <div class="col-md-6">
                    <input type="file" class="file" name="imagen" required>
                </div>
            </div> 
            <div class="form-group">
                <label class="control-label col-md-3">Detalles:</label>
                <div class="col-md-6">
                    <textarea rows="4" class="form-control" placeholder="Descripción de la pieza" 
                              maxlength="50" name="detalles" required></textarea>
                </div>
            </div>
            <div class="form-group">
                <input type="reset" class="btn btn-default" value="Limpiar" style="width: 20%">
                <input type="submit" class="btn btn-primary" value="Agregar Pieza" style="width: 20%">
            </div>
        </form>
        </div>
        <% bd.cierraConexion();
            } catch(Exception xxxD){}
        %>
        <footer class="container-fluid text-center">
            <a href="#Inicio" title="Volver al Inicio">
                <span class="glyphicon glyphicon-chevron-up" style="font-size:20px;"></span>
            </a>
            <p>MacQuality Service Tracker By <a href="/MQST/QuienesSomos.jsp" title="¿Quiénes Somos?">Sofficcesware</a></p>
            << <a href="/MQST/Cliente/Condiciones.jsp">Terminos y Condiciones</a> >>
        </footer>
    </body>
</html>