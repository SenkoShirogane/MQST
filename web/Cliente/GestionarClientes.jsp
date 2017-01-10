<%-- 
    Document   : GestionarClientes
    Created on : 3/11/2016, 12:32:46 AM
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
%>
<% BD.MQST base2 = new BD.MQST();
    String ElimCliente = "";
    String ElimCliente2 = "";
    String BuscarCliente="";
    try{
        base2.conectar();
            ResultSet rs = base2.consulta("select * from ConsultaCliente where idEdoCuenta=1");
%>
<html>
    <html lang="es">
    <head>
        <title>MQST - Gestionar Clientes</title> <!-- Lo ve el admin -->
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
                            <li class="active"><a href="">
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
        <h1 align="center">Gestionar Clientes</h1>
        <h3 align="center">Aquí puedes consultar y eliminar a los Clientes Activos.</h3><BR>
        <% ElimCliente = request.getParameter("UsuarioEl");
           ElimCliente2 = request.getParameter("ContraEl");
            if(ElimCliente==null){ }else{
                ResultSet rs2 = base2.borrar("call EliminaUsuarios('"+ElimCliente+"','"+ElimCliente2+"' ); ");
                out.println("<script> location.replace('/MQST/Cliente/GestionarClientes.jsp'); </script>");
            } 
        %>  
        <form action="../Cliente/ConsultarClientes.jsp" method="post" class="form-horizontal">
            <div class="col-md-offset-5 col-md-2">
                <input type="submit" class="btn btn-group-justified" value="Consultar Clientes">
            </div>
        </form>
        <div class="container-fluid text-center">
            <div class="col-md-6 col-md-offset-3">
                <form class="navbar-form" role="search">  
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Buscar Clientes" name="Buscar" id="Busqueda" 
                               minlength="3" autofocus onkeypress="return kp(event)">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div><BR>
        <div class="container">
            <div class="table-responsive">
                <table class="table">
                  <thead>
                    <tr>
                      <th>Usuario</th>
                      <th>Nombre</th>
                      <th>Correo</th>
                      <th></th>
                      <th></th>
                      <th>¿Eliminar?</th>
                    </tr>
                  </thead>
                  <tbody>
                    <%  BuscarCliente = request.getParameter("Buscar");
                            if(BuscarCliente==null){
                    %>
                    <%while(rs.next()){ %>
                    <form method="get" onSubmit="return confirmar2()">
                        <tr>
                            <td><%out.println(rs.getObject("Usr"));%></td> 
                            <td><%out.println(rs.getObject("Nombre"));%>
                                <%out.println(rs.getObject("Ap1"));%>
                                <%out.println(rs.getObject("Ap2"));%></td>
                            <td><%out.println(rs.getObject("Email"));%></td>
                            <td><%out.println("<input type='hidden' name='UsuarioEl' value="+rs.getObject("Usr")+" ");%></td>
                            <td><%out.println("<input type='hidden' name='ContraEl' value="+rs.getObject("PSW")+" ");%></td>
                            <td><input type="submit" class="btn btn-danger" value="Eliminar"></td>
                        </tr>
                    </form>
                    <% } %>
                    <% } else{
                            ResultSet rs2 = base2.consulta("select * from ConsultaCliente where idEdoCuenta=1 and (Nombre like '%"+BuscarCliente+"%' "
                        + "OR Ap1 like '%"+BuscarCliente+"%' OR Ap2 like '%"+BuscarCliente+"%' OR Usr like '%"+BuscarCliente+"%' "
                        + "or Email like '%"+BuscarCliente+"%' or EstadoUsuario like '%"+BuscarCliente+"%' or Municipio like '%"+BuscarCliente+"%' "
                        + "or Estado like '%"+BuscarCliente+"%');");
                    %>  
                    <%while(rs2.next()){ %>
                    <form method="get" onSubmit="return confirmar2()">
                        <tr>
                            <td><%out.println(rs2.getObject("Usr"));%></td> 
                            <td><%out.println(rs2.getObject("Nombre"));%>
                                <%out.println(rs2.getObject("Ap1"));%>
                                <%out.println(rs2.getObject("Ap2"));%></td>
                            <td><%out.println(rs2.getObject("Email"));%></td>
                            <td><%out.println("<input type='hidden' name='UsuarioEl' value="+rs2.getObject("Usr")+" ");%></td>
                            <td><%out.println("<input type='hidden' name='ContraEl' value="+rs2.getObject("PSW")+" ");%></td>
                            <td><input type="submit" class="btn btn-danger" value="Eliminar"></td>
                        </tr>
                    </form>
                    <% } } %>
                  </tbody>
                </table>
            </div>
        </div>      
        <%  base2.cierraConexion();
            }catch(Exception xxxD){}
        %>
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