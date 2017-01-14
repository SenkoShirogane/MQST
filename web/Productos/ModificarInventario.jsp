<%-- 
    Document   : ModificarInventario
    Created on : 3/11/2016, 12:18:15 AM
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
%>
<!DOCTYPE html>
<html>
    <html lang="es">
    <head>
        <title>MQST - Modificar Producto</title> <!-- Lo ve el admin -->
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
        <h1 align="center">Modificar Producto en el Inventario</h1>
        <h3 align="center">Ingresa los nuevos datos sólo en los campos deseados.</h3><BR>
        <div class="container">
    <%  try {
        String nombre = request.getParameter("name");
        BD.MQST bd = new BD.MQST();  
        bd.conectar();
        ResultSet resultados = bd.consulta("call ConsultaPza('"+nombre+"')");

        while(resultados.next()) {
    %>
        <form action='/MQST/ModificaPieza' enctype='multipart/form-data' method='post' onSubmit='return confirmar()' onkeypress='return kp(event)'>
            <div align='center'>
                <h1>Imagen Actual</h1>
                <img src="/MQST/F?Pieza=<%out.println(resultados.getObject("idAlmacen"));%>" class="img-rounded img img-responsive" 
                                 Style="width:300px;height:300px;display:inline;" alt=" Imagen de la pieza">
            </div><BR>
            <div class='table-responsive slideanim'>
                <table class='table'>
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>¿Cambiar Imagen?</th>
                            <th>Cantidad Actual</th>
                            <th>Agregar piezas</th>
                            <th>Precio</th>
                            <th>Estado</th>
                            <th>Detalles</th>
                            <th>Proveedor</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
    <%                      String imagenvieja = resultados.getString("Imagen");
                            out.println("<input type='hidden' value='"+nombre+"' name='NP'>");
                            //out.println("<input type='hidden' value='"+imagenvieja+"' name='imgvieja'>");
                            out.println("<td>"+nombre+"</td>");
                            out.println("<td><input type='file' name='img'></td>");
                            out.println("<td><input type='number' value='"+resultados.getString("Cantidad")+"' name='cant' min='0' required></td>");
                            out.println("<td><input type='number' value='0' name='ncant' required min='0'></td>");
                            out.println("<td><input type='number' value='"+resultados.getString("Precio")+"' name='pre' min='0' required></td>");
                            out.println("<td>");
                                out.println("<select name='Edo' style='color:Black' required>");
                                    out.println("<option value='"+resultados.getString("idE")+"'>Actual: "+resultados.getString("Edo")+"</option>");
                                    String edo = "";
                                    edo = resultados.getString("Edo");
                                    if( edo.equals("Visible")){
                                        out.println("<option value='2'>Invisible</option>");
                                    }else{
                                        out.println("<option value='1'>Visible</option>");
                                    }
                            out.println("<td><input type='text' value='"+resultados.getString("Detalles")+"' name='det' maxlength='50' "
                                    + "required onkeypress='return kp(event)'></td>");
                            out.println("<td>");
                                out.println("<select name='Prov' style='color:Black' required>");
                                    out.println("<option value='"+resultados.getString("idP")+"'>Actual: "+resultados.getString("Empresa")+"</option>");
                                    String emp = "";
                                    emp = resultados.getString("Empresa");
                                    ResultSet resulta2 = bd.consulta("call ConsultasProv()");
                                    while(resulta2.next()){
                                        if(emp.equals(resulta2.getString("Empresa"))){
                                        }else{
                                            out.println("<option value='"+resulta2.getInt("id")+"'>"+resulta2.getString("Empresa")+"</option>");
                                        }
                                    } 
                                out.println("</select>");    
                            out.println("</td>");
    %>
                        </tr>
                    </tbody>
                </table>
            </div><BR>
            <div class='form-group' align='center'>
                <input type='submit' class='btn btn-primary' value='Confirmar Cambios' style="width: 20%;">  
            </div>
        </form>
    <%
        } } catch(Exception xxxD){ }
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