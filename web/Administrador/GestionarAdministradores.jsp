<%-- 
    Document   : GestionarAdministradores
    Created on : 2/11/2016, 06:53:24 PM
    Author     : Angie
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    String usuario;
    if(session.getAttribute("Admin")!=null){ usuario = session.getAttribute("Admin").toString();
    }else{ out.println("<script> location.replace('/MQST/index.jsp'); </script>");}
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    
    BD.MQST bd = new BD.MQST();  
    String BuscarAdmin="";
    try{
        bd.conectar();
        ResultSet resultados = bd.consulta("call ConsultasAdmin()");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>MQST - Eliminar Administradores</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="../js/Animaciones.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
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
                        <!-- Lo que está adentro-->
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
                            <li class="active"><a href="">
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
        <h1 align="center">Eliminar Administradores</h1>
        <h3 align="center">Aquí puedes consultar y eliminar a los administradores.</h3>
        <div class="container-fluid text-center">
            <div class="col-md-4 col-md-offset-4">
                <form role="search">
                    <div class="input-group">
                        <input type="search" class="form-control" placeholder="¿Deseas buscar a algún Administrador?" name="Buscar"
                               minlength="3" autofocus onkeypress="return kp(event)" required>
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-12" Style="padding-bottom: 30px;">
            <div class="col-md-4 col-md-offset-4">
                <form action="/MQST/Administrador/ConsultarAdministradores.jsp" class="form-horizontal">
                    <input type="submit" class="btn btn-block btn-primary" value="Consultar Administradores">
                </form>
            </div>
        </div>
        <div class="container-fluid">
            <p align="center"> Recuerda que sólo puedes registrar administradores en la aplicación local.
            <div class='table-responsive'>
                <table class='table'>
                    <thead>
                        <tr>
                            <th>Usuario</th>
                            <th>Nombre</th>
                            <th>Email</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
            <%  BuscarAdmin = request.getParameter("Buscar");
                if(BuscarAdmin==null){
                    while(resultados.next()){ %>
                        <form action='/MQST/GestionAdmin' method='get' onSubmit='return confirmar()'>
                            <tr>
                                <input type='hidden' name='User' value='<%out.print(resultados.getString("Usuario"));%>' required>
                                <input type='hidden' name='Pass' value='<%out.print(resultados.getString("Contrasena"));%>' required>
                                <td><%out.println(resultados.getObject("Usuario"));%></td>
                                <td><%out.println(resultados.getObject("Nombre"));%> 
                                    <%out.println(resultados.getObject("Apellido_Paterno"));%> 
                                    <%out.println(resultados.getObject("Apellido_Materno"));%></td>
                                <td><%out.println(resultados.getObject("Email"));%></td>
                                <td><input type='submit' class='btn btn-danger' value='Eliminar'></td>
                            </tr>
                        </form>
            <%      } 
                } else {
                    ResultSet resulta2 = bd.consulta("select * from ConsultaAdmin where (Usuario like '%"+BuscarAdmin+"%' "
                        + "or Apellido_Paterno like '%"+BuscarAdmin+"%' or Apellido_Materno like '%"+BuscarAdmin+"%' "
                        + "or Email like '%"+BuscarAdmin+"%' ) ");  %>
                    <h2 align="center">Éstos son los Resultados que se encontraron para "<%=BuscarAdmin%>".</h2>
            <%      while(resulta2.next()){  %>
                        <form action='/MQST/GestionAdmin' method='get' onSubmit='return confirmar()'>
                            <tr>
                                <input type='hidden' name='User' value='<%out.print(resulta2.getObject("Usuario"));%>' required>
                                <input type='hidden' name='Pass' value='<%out.println(resulta2.getObject("Contrasena"));%>' required>
                                <td><%out.println(resulta2.getObject("Usuario"));%></td>
                                <td><%out.println(resulta2.getObject("Nombre"));%> 
                                    <%out.println(resulta2.getObject("Apellido_Paterno"));%> 
                                    <%out.println(resulta2.getObject("Apellido_Materno"));%></td>
                                <td><%out.println(resulta2.getObject("Email"));%></td>
                                <td><input type='submit' class='btn btn-danger' value='Eliminar'></td>
                            </tr>
                        </form>
            <%      }
                } %>
                    </tbody>
                </table>
            </div>
        </div>
        <% bd.cierraConexion();
        }catch(Exception xxxD){}%>
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