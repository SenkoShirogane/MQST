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

   if(sesion.getAttribute("Admin")!=null){
       usuario = session.getAttribute("Admin").toString();
   } else{
       out.println("<script> location.replace('/MQST/index.jsp'); </script>");
   }
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
        <h3 align="center">Aquí puedes ver la visibilidad de los productos del inventario.</h3><BR>
        <div class="container">
        <form action="/MQST/Productos/AgregarPieza.jsp" method="post" class="form-horizontal">
            <div class="col-md-offset-5 col-md-2">
                <input type="submit" class="btn btn-group-justified" value="Agregar Pieza">
            </div>
        </form>
        <div class="container-fluid text-center">
            <div class="col-md-6 col-md-offset-3">
                <form class="navbar-form" role="search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Buscar Pieza" name="Buscar" id="Busqueda" 
                               minlength="3" autofocus onkeypress="return kp(event)">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--Tabla x3 -->
        <%
        BuscarPieza = request.getParameter("Buscar");
        if(BuscarPieza==null){
                
        while(resultados.next()) {
            
        out.println("<div class='table-responsive'>");
         out.println("<table class='table'>");
            out.println("<thead>");
                out.println("<tr>");
                    out.println("<th>Imagen</th>");
                    out.println("<th>Nombre</th>");
                    out.println("<th>Proveedor</th>");
                    out.println("<th>Cantidad</th>");
                    out.println("<th>Precio</th>");
                    out.println("<th>Estado</th>");
                    out.println("<th>¿Modificar?</th>");
                    out.println("<th>¿Eliminar?</th>");
                out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
                    out.println("<tr>");
                        out.println("<form action='../Productos/ModificarInventario.jsp' method='post'>");
                            out.println("<td><img src=\"/MQST/F?Pieza=" + resultados.getString("idAlmacen") + "\" style='width: 200px;height: 240px' ></td>");
                            out.println("<td>"+resultados.getString("Producto")+"</td>");
                            out.println("<td>"+resultados.getString("Empresa")+"</td>");
                            out.println("<td>"+resultados.getString("Cantidad")+"</td>");
                            out.println("<td>"+resultados.getString("Precio")+"</td>");
                            out.println("<td>"+resultados.getString("Edo")+"</td>");
                            out.println("<input type='hidden' name='name' value="+resultados.getString("Producto")+">");
                            out.println("<td><input type='submit' class='btn btn-info' value='Modificar'></td>");
                        out.println("</form>");

                        out.println("<form action='/MQST/EliminarPza' method='get' onSubmit='return confMod()' >");
                            out.println("<input type='hidden' value="+resultados.getString("Producto")+" name='nombreP'>");
                            out.println("<td><input type='submit' class='btn btn-danger' value='Eliminar'></td>");    
                        out.println("</form>");
                    out.println("</tr>");
            out.println("</tbody>");
        out.println("</table>");
      out.println("</div>");         
          
        } } else {
                ResultSet rs2 = bd.consulta("select * from ConsultaPieza where (Producto like '%"+BuscarPieza+"%' "
                + "or Edo like '%"+BuscarPieza+"%' or Detalles like '%"+BuscarPieza+"%' or Empresa like '%"+BuscarPieza+"%' "
                + "or Cantidad like '%"+BuscarPieza+"%' or Precio like '%"+BuscarPieza+"%') ");
        out.println("<h2 align='center'>Éstos son los Resultados que se encontraron para '"+BuscarPieza+"'.</h2> ");  
        while(rs2.next()){ 
        out.println("<div class='table-responsive'>");
            out.println("<table class='table'>");
                out.println("<thead>");
                    out.println("<tr>");
                        out.println("<th>Imagen</th>");
                        out.println("<th>Nombre</th>");
                        out.println("<th>Proveedor</th>");
                        out.println("<th>Cantidad</th>");
                        out.println("<th>Precio</th>");
                        out.println("<th>Estado</th>");
                        out.println("<th>¿Modificar?</th>");
                        out.println("<th>¿Eliminar?</th>");
                    out.println("</tr>");
                out.println("</thead>");
                out.println("<tbody>");
                        out.println("<tr>");
                            out.println("<form action='../Productos/ModificarInventario.jsp' method='post'>");
                                out.println("<td><img src=\"/MQST/F?Pieza=" + rs2.getString("idAlmacen") + "\" style='width: 200px;height: 240px' ></td>");
                                out.println("<td>"+rs2.getString("Producto")+"</td>");
                                out.println("<td>"+rs2.getString("Empresa")+"</td>");
                                out.println("<td>"+rs2.getString("Cantidad")+"</td>");
                                out.println("<td>"+rs2.getString("Precio")+"</td>");
                                out.println("<td>"+rs2.getString("Edo")+"</td>");
                                out.println("<input type='hidden' name='name' value="+rs2.getString("Producto")+">");
                                out.println("<td><input type='submit' class='btn btn-info' value='Modificar'></td>");
                            out.println("</form>");
                            
                            out.println("<form action='/MQST/EliminarPza' method='get' onSubmit='return confMod()' >");
                                out.println("<input type='hidden' value="+rs2.getString("Producto")+" name='nombreP'>");
                                out.println("<td><input type='submit' class='btn btn-danger' value='Eliminar'></td>");    
                            out.println("</form>");
                        out.println("</tr>");
                out.println("</tbody>");
            out.println("</table>");
          out.println("</div>");
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