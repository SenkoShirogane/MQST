<%-- 
    Document   : ConsultarClientes
    Created on : 4/11/2016, 10:10:10 PM
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
        out.println("<script> location.replace('/MQST/index.jsp'); </script>");}

    BD.MQST base2 = new BD.MQST();
    String BuscarCliente="";
    try{
        base2.conectar();
            ResultSet rs = base2.consulta("call ConsultasCliente();");
%>
<html lang="es">
    <head>
        <title>MQST - Catálogo de Clientes</title>
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
                            <li class="active"><a href="">
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
        <h1 align="center">Catálogo de Clientes</h1>
        <h3 align="center">Aquí puedes ver a todos los clientes registrados.</h3>
        <div class="container-fluid text-center">
            <div class="col-md-4 col-md-offset-4">
                <form role="search">
                    <div class="input-group">
                        <input type="search" class="form-control" placeholder="¿Deseas buscar a algún Cliente?" name="Buscar"
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
                <form action="/MQST/Cliente/GestionarClientes.jsp" class="form-horizontal">
                    <input type="submit" class="btn btn-block btn-primary" value="Gestionar Clientes">
                </form>
            </div>
        </div>
        <div class="container-fluid">
        <div class="panel-group" id="accordion">
        <div class="col-md-8 col-md-offset-2">
        <%  BuscarCliente = request.getParameter("Buscar");
                if(BuscarCliente==null){
        %>
        <%while(rs.next()){ %>
        <div class="panel panel-primary">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%out.print(rs.getInt("idC"));%>" >
                    ID: <%out.println(rs.getInt("idC"));%> ||
                    Usuario: <%out.println(rs.getString("Usr"));%> ||   
                    Estado actual: <%out.println(rs.getString("EstadoUsuario"));%> 
                </a>
              </h4>
            </div>
            <div id="collapse<%out.print(rs.getInt("idC"));%>" class="panel-collapse collapse">
                <div class="panel-body">
                    <div class="col-md-6">
                        <p>ID del Cliente: <%out.println(rs.getInt("idC"));%> </p>
                        <p>Nombre: <%out.println(rs.getString("Nombre"));%>
                                             <%out.println(rs.getString("Ap1"));%>
                                             <%out.println(rs.getString("Ap2"));%> </p>
                        <p>Usuario: <%out.println(rs.getString("Usr"));%></p>
                        <p>Estado de la cuenta: <%out.println(rs.getString("EstadoUsuario"));%></p>
                        <p>Email: <%out.println(rs.getString("Email"));%></p>
                        <p>Telefono de casa: <%out.println(rs.getString("TelefonoC"));%></p>
                        <p>Telefono Celular: <%out.println(rs.getString("TelefonoCel"));%></p>
                    </div>
                    <div class="col-md-6">
                        <p>Estado: <%out.println(rs.getObject("Estado"));%></p>
                        <p>Municipio: <%out.println(rs.getObject("Municipio"));%></p>
                        <p>Colonia: <%out.println(rs.getObject("Colonia"));%></p>
                        <p>C.P.: <%out.println(rs.getObject("CodigoP"));%></p>
                        <p>Calle: <%out.println(rs.getObject("Calle"));%></p>
                        <p>Número: <%out.println(rs.getObject("Numero"));%></p>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
        <% } else{
                ResultSet rs2 = base2.consulta("select * from ConsultaCliente where (Nombre like '%"+BuscarCliente+"%' "
                    + "OR Ap1 like '%"+BuscarCliente+"%' OR Ap2 like '%"+BuscarCliente+"%' OR Usr like '%"+BuscarCliente+"%' "
                    + "OR Municipio like '%"+BuscarCliente+"%' OR Estado like '%"+BuscarCliente+"%' OR Email like '%"+BuscarCliente+"%' "
                    + "OR EstadoUsuario like '%"+BuscarCliente+"%' );");
        %>  
        <h2 align="center">Éstos son los Resultados que se encontraron para "<%=BuscarCliente%>".</h2>
        <%while(rs2.next()){ %>
        <div class="panel panel-primary">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%out.print(rs2.getInt("idC"));%>" >
                    ID: <%out.println(rs2.getInt("idC"));%> ||
                    Usuario: <%out.println(rs2.getString("Usr"));%> ||   
                    Estado actual: <%out.println(rs2.getString("EstadoUsuario"));%> 
                </a>
              </h4>
            </div>
            <div id="collapse<%out.print(rs2.getInt("idC"));%>" class="panel-collapse collapse">
                <div class="panel-body">
                    <div class="col-md-6">
                        <p>ID del Cliente: <%out.println(rs2.getInt("idC"));%> </p>
                        <p>Nombre: <%out.println(rs2.getString("Nombre"));%>
                                             <%out.println(rs2.getString("Ap1"));%>
                                             <%out.println(rs2.getString("Ap2"));%> </p>
                        <p>Usuario: <%out.println(rs2.getString("Usr"));%></p>
                        <p>Estado de la cuenta: <%out.println(rs2.getString("EstadoUsuario"));%></p>
                        <p>Email: <%out.println(rs2.getString("Email"));%></p>
                        <p>Telefono de casa: <%out.println(rs2.getString("TelefonoC"));%></p>
                        <p>Telefono Celular: <%out.println(rs2.getString("TelefonoCel"));%></p>
                    </div>
                    <div class="col-md-6">
                        <p>Estado: <%out.println(rs2.getObject("Estado"));%></p>
                        <p>Municipio: <%out.println(rs2.getObject("Municipio"));%></p>
                        <p>Colonia: <%out.println(rs2.getObject("Colonia"));%></p>
                        <p>C.P.: <%out.println(rs2.getObject("CodigoP"));%></p>
                        <p>Calle: <%out.println(rs2.getObject("Calle"));%></p>
                        <p>Número: <%out.println(rs2.getObject("Numero"));%></p>
                    </div>
                </div>
            </div>
        </div> 
        <% } } base2.cierraConexion();
             }catch(Exception xxxD){}%>
        </div>
        </div>
        </div>
        <BR><BR>
        <footer class="container-fluid text-center">
            <a href="#Inicio" title="Volver al Inicio">
                <span class="glyphicon glyphicon-chevron-up" style="font-size:20px;"></span>
            </a>
            <p>MacQuality Service Tracker By <a href="QuienesSomos.jsp" title="¿Quiénes Somos?">Sofficcesware</a></p>
            << <a href="/MQST/Cliente/Condiciones.jsp">Terminos y Condiciones</a> >>
        </footer>
    </body>
</html>