<%-- 
    Document   : ModficarProveedor
    Created on : 6/11/2016, 11:55:36 PM
    Author     : CITLALLI
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
        out.println("<script> location.replace('../index.html'); </script>");}
    
    BD.MQST base2 = new BD.MQST();
    String NomEmpresa = request.getParameter("EmpresaMod");
    
    try{
        base2.conectar();
            ResultSet rs = base2.consulta("call ConsultaProv('"+NomEmpresa+"');");
%>
<html lang="es">
    <head>
        <title>MQST - Modificar Proveedores</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
    </head>
    <body>
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
                            <span class="glyphicon glyphicon-user"></span> ${sessionScope.Usuario}
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
        <h1 align="center">Modificar datos de Proveedor</h1>
        <h3 align="center">Modifica sólo los campos deseados.</h3><br>
        <!-- Primera tabla -->
        <Form method="get" action="/MQST/ModificarProveedor" onSubmit="return confirmar2()" onkeypress='return kp(event)'>
            <%while(rs.next()){ %>
            <div class="container">
                <div>
                    <h4 style="color:black;">Datos Personales</h4>
                </div>
                <div class='table-responsive'>
                    <table class='table'>
                        <thead>
                            <tr>
                                <th>Empresa</th>
                                <th>Nombre</th>
                                <th>A.Paterno</th>
                                <th>A.Materno</th>
                                <th>Correo</th>
                                <th>Teléfono de casa</th>
                                <th>Teléfono Celular</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><%out.println(rs.getObject("Empresa"));%> </td>
                                <td><input type='text' value="<%out.println(rs.getObject("Nombre"));%>" max="20" name='NombreMod' required></td>
                                <td><input type='text' value="<%out.println(rs.getObject("Apellido1"));%>" max="20" name='ApPatMod' required></td>
                                <td><input type='text' value="<%out.println(rs.getObject("Apellido2"));%>" max="20" name='ApMatMod' required></td>
                                <td><input type='email' value="<%out.println(rs.getObject("Email"));%>" max="25" name='CorreoMod' required></td>
                                <td><input type="number" value="<%out.print(rs.getInt("TelefonoC"));%>" min="0" name='TelefonoMod' required></td>
                                <td><input type="number" value="<%out.print(rs.getString("TelefonoCel"));%>" min="0" name='CelularMod' required></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div><BR>
            <input type="hidden" value="<%out.print(rs.getObject("Empresa"));%>" name="EmpresaMod">
            <!-- Termina primera tabla, empieza la segunda -->
            <div class="container">
                <div>
                    <h4 style="color:black;">Datos de la dirección</h4>
                </div>
                <div class='table-responsive'>
                    <table class='table'>
                        <thead>
                            <tr>
                                <th>Estado</th>
                                <th>Municipio</th>
                                <th>Colonia</th>
                                <th>C. Postal</th>
                                <th>Calle</th>
                                <th>Número</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            <td><input type='text' value="<%out.println(rs.getObject("Estado"));%>" maxlength="20" name='EstadoMod' required></td>
                            <td><input type='text' value="<%out.println(rs.getObject("Municipio"));%>" maxlength="20" name='DelegacionMod' required></td>
                            <td><input type='text' value="<%out.print(rs.getObject("Colonia"));%>" maxlength="20" name='ColoniaMod' required></td>
                            <td><input type='number' value="<%out.print(rs.getInt("CodigoP"));%>" name='CPMod' min="1" required></td>
                            <td><input type='text' value="<%out.println(rs.getObject("Calle"));%>" maxlength="20" name='CalleMod' required></td>
                            <td><input type='number' value="<%out.print(rs.getInt("Numero"));%>" name='NumeroMod' min="1" required></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="form-group" align="center">
                    <input type="submit" class="btn btn-primary" value="Confirmar Cambios" style="width: 20%">
                </div>
                    </form>
            </div>
            <% }base2.cierraConexion();
                }catch(Exception xxxD){}%>
        </form>
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