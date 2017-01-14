<%-- 
    Document   : ConsultaCatalogo
    Created on : 4/11/2016, 09:07:13 PM
    Author     : SENKO
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
        out.println("<script> location.replace('../index.jsp'); </script>");}
    BD.MQST base2 = new BD.MQST();
    String BuscarProducto="";
    try{
        base2.conectar();
            ResultSet rs = base2.consulta("select * from ConsultaProducto;");
%>
<html lang="es">
    <head>
        <title>MQST - Catálogo de Productos</title>
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
                    <span class="glyphicon glyphicon-home"></span> Inicio </a>
              </div>
              <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
                            <span class="glyphicon glyphicon-th-list"></span> Catálogo <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li class="active"><a href="">
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
        <h1 align="center">Catálogo de Productos</h1>
        <h3 align="center">Aquí puedes ver todos los productos disponibles para los clientes.</h3><br>
        <div class="container-fluid text-center">
            <div class="col-md-4 col-md-offset-4">
                <form role="search">
                    <div class="input-group">
                        <input type="search" class="form-control" placeholder="¿Deseas buscar algún Producto?" name="Buscar"
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
                <form action="../Productos/GestionProductos.jsp" class="form-horizontal">
                    <input type="submit" class="btn btn-block btn-primary" value="Gestionar Catálogo">
                </form>
            </div>
        </div>
        <div class="container-fluid">
            <p align="center"> Recuerda que sólo los que tienen el Estado "Visible" aparecen en el catálogo para los clientes.
        <%  BuscarProducto = request.getParameter("Buscar");
            if(BuscarProducto==null){
        %>
            <%while(rs.next()){ %>
            <div class=" col-md-offset-0 col-md-6" Style="padding-bottom: 50px; padding-right: 0px;"> 
                <div id="Foto" class="col-md-offset-0 col-md-5" align="center">
                    <img src="/MQST/F?Producto=<%out.println(rs.getObject("idAlmacen"));%>" class="img-rounded img img-responsive"
                         Style="width:260px;height:260px;display:inline;" alt="Producto">
                </div>
                <div class="col-md-offset-0 col-md-7">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 align="center"><%out.println(rs.getObject("NombreP"));%></h3>
                        </div>
                        <div class="panel-body">
                            <p><strong>Precio:</strong> <%out.println(rs.getObject("Precio"));%>
                            <p><strong>Estado:</strong> <%out.println(rs.getObject("Estado"));%>
                            <p><strong>Proveedor:</strong> <%out.println(rs.getString("Empresa"));%>
                            <p><strong>Detalles:</strong> <%out.println(rs.getString("Detalles"));%>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        <%  } else{
                ResultSet rs2 = base2.consulta("select * from ConsultaProducto where (NombreP like '%"+BuscarProducto+"%' "
            + "OR Estado like '"+BuscarProducto+"%' OR Empresa like '%"+BuscarProducto+"%' "
            + "OR Detalles like '%"+BuscarProducto+"%' OR Precio like '%"+BuscarProducto+"%');");
        %>        
            <h2 align="center">Éstos son los Resultados que se encontraron para "<%=BuscarProducto%>".</h2>
            <%while(rs2.next()){ %>
            <div class=" col-md-offset-0 col-md-6" Style="padding-bottom: 50px; padding-right: 0px;"> 
                <div id="Foto" class="col-md-offset-0 col-md-5" align="center">
                        <img src="/MQST/F?Producto=<%out.println(rs2.getObject("idAlmacen"));%>" class="img-rounded img img-responsive"
                                      Style="width:260px;height:260px;display:inline;" alt="Producto">
                </div>
                <div class="col-md-offset-0 col-md-7">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 align="center"><%out.println(rs2.getObject("NombreP"));%></h3>
                        </div>
                        <div class="panel-body">
                            <p><strong>Precio:</strong> <%out.println(rs2.getObject("Precio"));%>
                            <p><strong>Estado:</strong> <%out.println(rs2.getObject("Estado"));%>
                            <p><strong>Proveedor:</strong> <%out.println(rs2.getString("Empresa"));%>
                            <p><strong>Detalles:</strong> <%out.println(rs2.getString("Detalles"));%>
                        </div>
                    </div>
                </div>
            </div>
                <% } %>
            <% } base2.cierraConexion();
        } catch(Exception xxxD){}%>
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
