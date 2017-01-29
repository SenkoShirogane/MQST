<%-- 
    Document   : InicioAdmin
    Created on : 22/10/2016, 09:23:02 PM
    Author     : Angie
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   HttpSession sesion = request.getSession();
   String usuario;
    if(session.getAttribute("Admin")!=null){ usuario = session.getAttribute("Admin").toString();
    }else{ out.println("<script> location.replace('/MQST/index.jsp'); </script>");}
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    
   String BuscarPieza="";
   try {
        BD.MQST bd = new BD.MQST();  
        bd.conectar();
        ResultSet resultados = bd.consulta("call ConsultaPzas()");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>MQST - Inventario de Piezas</title>
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
                    <!-- Expandible Catalogo -->
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
                        <ul class="dropdown-menu">
                            <li><a href="../Productos/GestionProductos.jsp">
                                    <span class="glyphicon glyphicon-phone"></span> Productos</a></li>
                            <li class="active"><a href="">
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
        <h1 align="center">Gestionar Inventario</h1>
        <h3 align="center">Aquí puedes ver la visibilidad de los productos del inventario.</h3>
        <div class="container-fluid text-center">
            <div class="col-md-4 col-md-offset-4">
                <form role="search">
                    <div class="input-group">
                        <input type="search" class="form-control" placeholder="¿Deseas buscar alguna Pieza?" name="Buscar"
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
                <form action="/MQST/Productos/AgregarPieza.jsp" class="form-horizontal">
                    <input type="submit" class="btn btn-block btn-primary" value="Agregar una Pieza">
                </form>
            </div>
        </div>
        <div class="container-fluid">    
        <%
        BuscarPieza = request.getParameter("Buscar");
        if(BuscarPieza==null){
            while(resultados.next()) {
    %> 
            <div class=" col-md-offset-0 col-md-6" Style="padding-bottom: 40px; padding-right: 0px;"> 
                <div id="Foto" class="col-md-offset-0 col-md-5" align="center">
                    <img src="/MQST/F?Pieza=<%out.println(resultados.getObject("idAlmacen"));%>" class="img-rounded img img-responsive"
                         Style="width:260px;height:260px;display:inline;" alt="Imagen de la Pieza">
                </div>
                <div class="col-md-offset-0 col-md-7">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 align="center"><%out.println(resultados.getObject("Producto"));%></h3>
                        </div>
                        <div class="panel-body">
                            <div class="col-md-8"><p><strong>Proveedor:</strong> <%out.println(resultados.getString("Empresa"));%> </div>
                            <div class="col-md-4"><p><strong>$<%out.println(resultados.getObject("Precio"));%></strong> </div>
                            <div class="col-md-6"><p><strong>Cantidad:</strong> <%out.println(resultados.getObject("cantidad"));%> </div>
                            <div class="col-md-6"><p><strong>Estado:</strong> <%out.println(resultados.getString("Edo"));%> </div>
                            <div class="col-md-6">
                                <form action='../Productos/ModificarInventario.jsp' method='post'>
                                    <input type='hidden' name='name' value="<%out.print(resultados.getString("Producto"));%>" >
                                    <input type='submit' class='btn btn-info' value="Modificar" style="width: 100%;" >
                                </form>
                            </div>
                            <div class="col-md-6">
                                <form action='/MQST/EliminarPza' method='get' onSubmit='return confirmar()' > 
                                    <input type='hidden' value="<%out.print(resultados.getString("Producto"));%>" name='nombreP'>
                                    <input type='submit' class='btn btn-danger' value='Eliminar' style="width: 100%;" >
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    <%  } } else {
                ResultSet rs2 = bd.consulta("select * from ConsultaPieza where (Producto like '%"+BuscarPieza+"%' "
                + "or Edo like '%"+BuscarPieza+"%' or Detalles like '%"+BuscarPieza+"%' or Empresa like '%"+BuscarPieza+"%' "
                + "or Cantidad like '%"+BuscarPieza+"%' or Precio like '%"+BuscarPieza+"%') ");
            out.println("<h2 align='center'>Éstos son los Resultados que se encontraron para '"+BuscarPieza+"'.</h2> ");  
            while(rs2.next()){ 
    %>
            <div class=" col-md-offset-0 col-md-6" Style="padding-bottom: 40px; padding-right: 0px;"> 
                <div id="Foto" class="col-md-offset-0 col-md-5" align="center">
                    <img src="/MQST/F?Pieza=<%out.println(rs2.getObject("idAlmacen"));%>" class="img-rounded img img-responsive"
                         Style="width:260px;height:260px;display:inline;" alt="Imagen de la Pieza">
                </div>
                <div class="col-md-offset-0 col-md-7">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 align="center"><%out.println(rs2.getObject("Producto"));%></h3>
                        </div>
                        <div class="panel-body">
                            <div class="col-md-8"><p><strong>Proveedor:</strong> <%out.println(rs2.getString("Empresa"));%> </div>
                            <div class="col-md-4"><p><strong>$<%out.println(rs2.getObject("Precio"));%></strong> </div>
                            <div class="col-md-6"><p><strong>Cantidad:</strong> <%out.println(rs2.getObject("cantidad"));%> </div>
                            <div class="col-md-6"><p><strong>Estado:</strong> <%out.println(rs2.getString("Edo"));%> </div>
                            <div class="col-md-6">
                                <form action='../Productos/ModificarInventario.jsp' method='post'>
                                    <input type='hidden' name='name' value="<%out.print(rs2.getString("Producto"));%>" >
                                    <input type='submit' class='btn btn-info' value="Modificar" style="width: 100%;" >
                                </form>
                            </div>
                            <div class="col-md-6">
                                <form action='/MQST/EliminarPza' method='get' onSubmit='return confirmar()' > 
                                    <input type='hidden' value="<%out.print(rs2.getString("Producto"));%>" name='nombreP'>
                                    <input type='submit' class='btn btn-danger' value='Eliminar' style="width: 100%;" >
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
   <%
        } }  

    } catch (Exception e) {
           out.println("Excepcion "+e);
           e.printStackTrace();
    }
    %>    
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