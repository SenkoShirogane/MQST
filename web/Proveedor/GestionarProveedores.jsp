<%-- 
    Document   : GestionarProveedores
    Created on : 2/11/2016, 09:14:23 PM
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
        out.println("<script> location.replace('/MQST/index.jsp'); </script>");}
    
    BD.MQST base2 = new BD.MQST();
    String ElimProveedor = "";
    String BuscarProveedor= "";
    try{
        base2.conectar();
            ResultSet rs = base2.consulta("call ConsultasProv();");
%>
<html lang="es">
    <head>
        <title>MQST - Gestionar Proveedores</title> <!-- lo ve el admin -->
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
                            <li class="active"><a href="">
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
        <h1 align="center">Gestionar Proveedores</h1>
        <h3 align="center">Aquí puedes consultar y eliminar a los Proveedores.</h3>
        <% ElimProveedor = request.getParameter("EmpresaEl");
            if(ElimProveedor==null){
            }else{
                ResultSet rs2 = base2.borrar("call EliminaProveedor('"+ElimProveedor+"');");
                out.println("<script> location.replace('/MQST/Proveedor/GestionarProveedores.jsp'); </script>");
            } %>
        <div class="container-fluid text-center">
            <div class="col-md-4 col-md-offset-4" Style="padding-bottom: 10px;">
                <form role="search">
                    <div class="input-group">
                        <input type="search" class="form-control" placeholder="¿Deseas buscar a algún Proveedor?" name="Buscar"
                               minlength="3" autofocus onkeypress="return kp(event)" required>
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-4 col-md-offset-4">
                <form action="/MQST/Proveedor/AgregarProveedor.jsp" class="form-horizontal">
                    <input type="submit" class="btn btn-block btn-primary" value="Agregar un Proveedor">
                </form>
            </div>
        </div>
        <div class="container-fluid">
            <div class="table-responsive">
                <table class="table">                                     
                  <thead>
                    <tr>
                      <th>Empresa</th>
                      <th>Nombre</th>
                      <th>Correo</th>
                      <th></th>
                      <th>¿Modificar?</th>
                      <th></th>
                      <th>¿Eliminar?</th>
                    </tr>
                  </thead>  
                  <tbody>
                    <%  BuscarProveedor = request.getParameter("Buscar");
                        if(BuscarProveedor==null){
                    %>
                    <% while(rs.next()){ %>
                    <tr>
                        <form action="../Proveedor/ModificarProveedor.jsp" method="get" >
                            <td><%out.println(rs.getObject("Empresa"));%></td> 
                            <td><%out.println(rs.getObject("Nombre"));%>
                                <%out.println(rs.getObject("Apellido1"));%>
                                <%out.println(rs.getObject("Apellido2"));%>
                            </td>
                            <td><%out.println(rs.getObject("Email"));%></td>
                            <td><%out.println("<input type = 'hidden' name='EmpresaMod' value="+rs.getObject("Empresa")+" ");%></td>
                            <td><input type="submit" class="btn btn-info" value="Modificar"></td>
                        </form>
                        <form method="get" onSubmit="return confirmar2()">
                            <td><%out.println(" <input type='hidden' name='EmpresaEl' value="+rs.getObject("Empresa")+" ");%></td>
                            <td><input type="submit" class="btn btn-danger" 
                                       value="Eliminar <%out.println(rs.getObject("Empresa"));%>"></td>
                        </form>
                    </tr>
                    <% } %>
                    <% } else{
                            ResultSet rs2 = base2.consulta("select * from ConsultaProveedor where (Empresa like '%"+BuscarProveedor+"%' "
                            + "OR Nombre like '%"+BuscarProveedor+"%' OR Apellido1 like '%"+BuscarProveedor+"%' OR Apellido2 like '%"+BuscarProveedor+"%' "
                            + "OR Email like '%"+BuscarProveedor+"%' OR Municipio like '%"+BuscarProveedor+"%' OR Estado like '%"+BuscarProveedor+"%');");
                    %>  
                    <%while(rs2.next()){ %>
                    <tr>
                        <form action="../Proveedor/ModificarProveedor.jsp" method="get" >
                            <td><%out.println(rs2.getObject("Empresa"));%></td> 
                            <td><%out.println(rs2.getObject("Nombre"));%>
                                <%out.println(rs2.getObject("Apellido1"));%>
                                <%out.println(rs2.getObject("Apellido2"));%>
                            </td>
                            <td><%out.println(rs2.getObject("Email"));%></td>
                            <td><%out.println("<input type = 'hidden' name='EmpresaMod' value="+rs2.getObject("Empresa")+"");%></td>
                            <td><input type="submit" class="btn btn-info" value="Modificar"></td>
                        </form>
                        <form method="get" onSubmit="return confirmar2()">
                            <td><%out.println(" <input type='hidden' name='EmpresaEl' value="+rs2.getObject("Empresa")+" ");%></td>
                            <td><input type="submit" class="btn btn-danger" 
                                       value="Eliminar <%out.println(rs2.getObject("Empresa"));%>"></td>
                        </form>
                    </tr>
                    <% } } %>
                  </tbody>
                </table>
            </div>
        </div>
        <% base2.cierraConexion();
            }catch(Exception xxxD){} %>
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