<%-- 
    Document   : AgregarServicio
    Created on : 5/11/2016, 05:15:31 PM
    Author     : Senko
--%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  HttpSession sesion = request.getSession();
    String usuario;
    if(session.getAttribute("Admin")!=null){ usuario = session.getAttribute("Admin").toString();
    }else{ out.println("<script> location.replace('/MQST/index.jsp'); </script>");}
%>  
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>MQST - Agregar Servicios</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="../js/Animaciones.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <style>

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
        <h1 align="center">Agregar Servicios.</h1>
        <h3 align="center">Aquí puedes agregar servicios nuevos a las ordenes y notificar a sus respectivos dueños.</h3><br>
        <form action="../Ordenes/Ordenes.jsp" method="post" class="form-horizontal">
            <div class="col-md-offset-5 col-md-2">
                <input type="submit" class="btn btn-group-justified" value="Consultar Órdenes">
            </div>
        </form>       
        <div class="container-fluid text-center">
            <form class="form-horizontal" method='post' action="    " onkeypress="return kp(event)"> 
                <%  String ID = request.getParameter("AgregarOrden");
                    String ESP = request.getParameter("Esp");
                    String Nom = request.getParameter("Nom");
                    String costo = request.getParameter("Costo");
                    if(ID==null){
                %>
                <div class="form-group">
                    <label class="control-label col-md-3">ID de la Orden:</label>
                    <div class="col-md-2">
                        <input type="number" class="form-control" placeholder="Ingresa el identificador." 
                               name="IdOrden" min="1" max="9999" required>
                    </div>
                    <label class="control-label col-md-2">Precio Agregado:</label>
                    <div class="col-md-2">
                        <input type="number" class="form-control" placeholder="Costo agregado a la orden" 
                               name="CostoNuevo" min="0" max="9999" value="0" required>
                    </div>
                </div>
                    <% } else{ %>
                <div class="form-group">
                    <input type="hidden" name="idOrden" value="<%=ID%>" required>
                    <label class="control-label col-md-5">ID de la Orden:  #<%=ID%> </label>
                    <label class="control-label col-md-2">Precio Agregado: </label>
                    <div class="col-md-2">
                        <input type="number" class="form-control" placeholder="Costo agregado a la orden" 
                           name="CostoNuevo" min="0" max="9999" value="0" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Cliente:</label>
                    <div class="col-md-2">
                        <input type="text" class="form-control" value="<%=Nom%>" readonly>
                    </div>
                    <label class="control-label col-md-2">Costo Actual:</label>
                    <div class="col-md-2">
                        <input type="text" class="form-control" value="$<%=costo%>" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Especificaciones de la orden:</label>
                    <div class="col-md-6">
                        <input type="text" class="form-control" value="<%=ESP%>" readonly>
                    </div>
                </div>
                    <% } %>
                <div class="form-group">
                    <label class="control-label col-md-3">Detalles Nuevos:</label>
                    <div class="col-md-6">
                        <textarea rows="4" class="form-control" placeholder="¿Qué se le podría agregar a la orden del cliente?" 
                                  name="detalles" maxlength="50" required></textarea>
                    </div>
                </div><BR>
                <div class="form-group">
                    <input type="reset" class="btn btn-default" value="Limpiar" style="width: 20%">
                    <input type="submit" class="btn btn-primary" value="Guardar Cambios" style="width: 20%">
                </div>
            </form>
        </div>
        <footer class="container-fluid text-center">
            <a href="#Inicio" title="Volver al Inicio">
                <span class="glyphicon glyphicon-chevron-up" style="font-size:20px;"></span>
            </a>
            <p>MacQuality Service Tracker By <a href="/MQST/QuienesSomos.jsp" title="¿Quiénes Somos?">Sofficcesware</a></p>
            << <a href="/MQST/Cliente/Condiciones.jsp">Terminos y Condiciones</a> >>
        </footer>
    </body>
</html>