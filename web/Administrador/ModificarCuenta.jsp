<%-- 
    Document   : ModificarCuenta
    Created on : 4/11/2016, 08:44:09 PM
    Author     : SENKO
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   HttpSession sesion = request.getSession();
   String usuario;

    if(sesion.getAttribute("Admin")!=null){
       usuario = session.getAttribute("Admin").toString();
    } else{
       out.println("<script> location.replace('/MQST/index.jsp'); </script>"); }
    
    BD.MQST bd = new BD.MQST();
    try{
        bd.conectar();
        ResultSet resultados = bd.consulta("call ConsultaAdmin('"+sesion.getAttribute("Admin")+"')");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>MQST - Modificar Datos</title> <!-- Administrador -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- Importantes xP -->
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="../js/Animaciones.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <style>
            h4{ color:white; }
            td input{ color: black; }
        </style>
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
                    <!-- Expandible Catalogo -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
                            <span class="glyphicon glyphicon-th-list"></span> Catálogo
                        <span class="caret"></span></a>
                        <!-- Lo que está adentro -->
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
                            <li><a href="/MQST/CerrarSesion"> 
                                   <span class="glyphicon glyphicon-arrow-right"></span> Cerrar Sesión</a></li>
                        </ul>
                    </li>
                </ul>
              </div>
            </div>
        </nav>
        <h1 align="center">Modificar datos de la cuenta</h1>
        <h3 align="center">Modifica sólo los campos deseados.</h3><br>
        <!-- Primera tabla -->
        <div class="container">
            <form method='get' action="/MQST/ModificaAdminD" onkeypress="return kp(event)">
            <div>
                <h4 style="color:black;">Datos Personales</h4>
            </div>
            <div class='table-responsive'>
                <table class='table'>
                    <thead>
                        <tr>
                            <th>Usuario</th>
                            <th>Nombre</th>
                            <th>A.Paterno</th>
                            <th>A.Materno</th>
                        </tr>
                    </thead>
                    <%while(resultados.next()) {%>
                    <tbody>
                            <tr>
                                <td><%out.println(resultados.getString("Usuario"));%></td>
                                <td><input type='text' value="<%out.println(resultados.getString("Nombre"));%>" name='Nomb' required minlength="3" maxlenght="20"></td>
                                <td><input type='text' value="<%out.println(resultados.getString("Apellido_Paterno"));%>" name='AP' required minlength="3" maxlenght="20"></td>
                                <td><input type='text' value="<%out.println(resultados.getString("Apellido_Materno"));%>" name='AM' required minlength="3" maxlenght="20"></td>
                                <%out.println("<input type='hidden' value='"+resultados.getString("Usuario")+"' name = 'Usr'");%>
                            </tr>
                    </tbody>
                </table>
            </div><BR>
            <div class="form-group" align="center">
                <input type="submit" class="btn btn-primary" value="Confirmar Cambios" style="width: 20%">
            </div>
            </form>
        </div>
        <% }bd.cierraConexion();
            } catch(Exception xxxD){}
        %>
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