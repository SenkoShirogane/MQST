<%-- 
    Document   : ConsultarOrdenes
    Created on : 4/11/2016, 10:14:44 PM
    Author     : CITLALLI
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   HttpSession sesion = request.getSession();
   String usuario;
    if(session.getAttribute("Admin")!=null){ usuario = session.getAttribute("Admin").toString();
    }else{ out.println("<script> location.replace('/MQST/index.jsp'); </script>");}
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");

    BD.MQST bd = new BD.MQST();
    try{
        bd.conectar();
        String BuscarOrden="";
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>MQST - Catálogo de Órdenes</title>  <!-- Lo ve el admin -->
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
                            <li class="active"><a href="">
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
        <h1 align="center">Catálogo de Órdenes</h1>
        <h3 align="center">Aquí puedes ver todas las órdenes realizadas hasta la fecha.</h3>
        <div class="container-fluid text-center">
            <div class="col-md-4 col-md-offset-4">
                <form role="search">
                    <div class="input-group">
                        <input type="search" class="form-control" placeholder="¿Deseas buscar alguna Orden?" name="Buscar"
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
                <form action="/MQST/Ordenes/AgregarOrden.jsp" class="form-horizontal">
                    <input type="submit" class="btn btn-block btn-primary" value="Agregar una Orden">
                </form>
            </div>
        </div>
        <div class="container-fluid">
        <div class="panel-group" id="accordion">
        <div class="col-md-8 col-md-offset-2">
        <%  
            //Busqueda
            BuscarOrden = request.getParameter("Buscar");
            if(BuscarOrden==null){
                
            //Sin piezas
            int id=0;
            int id2 = 0;
            
            ResultSet resultados = bd.consulta("select * from ConsultaOSN");
            while(resultados.next()){
                id = resultados.getInt("idO");
                
                ResultSet resulta2 = bd.consulta("call ConsultaOrdenSP("+id+")");
                while(resulta2.next()){    
        %>            
                <div class="panel panel-primary">
                    <div class="panel-heading">
                      <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%out.print(resulta2.getInt("id"));%>" >
                            ID: <%out.println(resulta2.getInt("id"));%> ||
                            Cliente: <%out.println(resulta2.getString("Nombre"));%>
                                     <%out.println(resulta2.getString("Apellido1"));%>
                                     <%out.println(resulta2.getString("Apellido2"));%> ||   
                            Estado de la orden: <%out.println(resulta2.getString("edo"));%>
                        </a>
                      </h4>
                    </div>
                    <div id="collapse<%out.print(resulta2.getInt("id"));%>" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="col-md-6">
                                <p>ID de la orden: <%out.println(resulta2.getInt("id"));%> </p>
                                <p>Cliente: <%out.println(resulta2.getString("Nombre"));%>
                                              <%out.println(resulta2.getString("Apellido1"));%>
                                              <%out.println(resulta2.getString("Apellido2"));%> </p>
                                <p>Costo de la orden: $<%out.println(resulta2.getInt("costo"));%></p>
                                <p>Estado de la orden: <%out.println(resulta2.getString("edo"));%></p>
                            </div>
                            <div class="col-md-6">
                                <p>Fecha de Creación: <%out.println(resulta2.getString("fec1"));%></p>
                                <p>Fecha de Entrega: <%out.println(resulta2.getString("fec2"));%></p>
                                <p>Especificaciones: <%out.println(resulta2.getString("det"));%></p>
                            </div>
                        </div>
                    </div>
                </div>
            <%
                }
            }
            //Con Piezas
            ResultSet result = bd.consulta("select * from ConsultaOP");
            while(result.next()){
                id = result.getInt("idO");
                int n=0;
                ResultSet resulta2 = bd.consulta("call ConsultaOrdenP("+id+")");
                while(resulta2.next()){
            %>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                      <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%out.print(resulta2.getInt("idOS"));%>">
                            ID: <%out.println(resulta2.getInt("idOS"));%> ||
                            Cliente: <%out.println(resulta2.getString("Nom"));%>
                                 <%out.println(resulta2.getString("Paterno1"));%>
                                 <%out.println(resulta2.getString("Materno1"));%>  ||
                            Estado de la orden: <%out.println(resulta2.getString("edo"));%> ||
                            Pieza Necesaria: <%out.println(resulta2.getString("Nomb"));%>
                        </a>
                      </h4>
                    </div>
                    <div id="collapse<%out.print(resulta2.getInt("idOS"));%>" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="col-md-6">
                                <p>ID de la orden: <%out.println(resulta2.getInt("idOS"));%> </p>
                                <p>Cliente: <%out.println(resulta2.getString("Nom"));%>
                                              <%out.println(resulta2.getString("Paterno1"));%>
                                              <%out.println(resulta2.getString("Materno1"));%> </p>
                                <p>Costo de la orden: $<%out.println(resulta2.getInt("cost"));%></p>
                                <p>Fecha de Creación: <%out.println(resulta2.getString("fec1"));%></p>
                                <p>Fecha de Entrega: <%out.println(resulta2.getString("fec2"));%></p>
                            </div>
                            <div class="col-md-6">
                                <p>Estado de la orden: <%out.println(resulta2.getString("edo"));%></p>
                                <p>Nombre de la Pieza: <%out.println(resulta2.getString("nomb"));%></p>
                                <p>Cantidad de la Pieza: <%out.println(resulta2.getString("cantp"));%></p>
                                <p>Especificaciones: <%out.println(resulta2.getString("det"));%></p>
                            </div>
                        </div>
                    </div>
                </div>
            <%
                }
            }
            //Busqueda
            } else {   
            %><h2 align="center">Éstos son los Resultados que se encontraron para "<%=BuscarOrden%>".</h2><%
            //Sin Piezas
            int id=0;
            int id2 = 0;
            
            ResultSet rs2 = bd.consulta("select * from ConsultaOSN");
            while(rs2.next()){
                id = rs2.getInt("idO");
                
                ResultSet resulta3 = bd.consulta("select * from ConsultaOrden where (det like '%"+BuscarOrden+"%' or "
                            + "costo like '%"+BuscarOrden+"%' or edo like '%"+BuscarOrden+"%' or nombre like '%"+BuscarOrden+"%' or "
                            + "Apellido1 like '%"+BuscarOrden+"%' or Apellido2 like '%"+BuscarOrden+"%' or fec1 like '%"+BuscarOrden+"%') and id = '"+id+"';");
                
                while(resulta3.next()){  
            %>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                      <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%out.print(resulta3.getInt("id"));%>" >
                            ID: <%out.println(resulta3.getInt("id"));%> ||
                            Cliente: <%out.println(resulta3.getString("Nombre"));%>
                                     <%out.println(resulta3.getString("Apellido1"));%>
                                     <%out.println(resulta3.getString("Apellido2"));%> ||   
                            Estado de la orden: <%out.println(resulta3.getString("edo"));%>
                        </a>
                      </h4>
                    </div>
                    <div id="collapse<%out.print(resulta3.getInt("id"));%>" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="col-md-6">
                                <p>ID de la orden: <%out.println(resulta3.getInt("id"));%> </p>
                                <p>Cliente: <%out.println(resulta3.getString("Nombre"));%>
                                              <%out.println(resulta3.getString("Apellido1"));%>
                                              <%out.println(resulta3.getString("Apellido2"));%> </p>
                                <p>Costo de la orden: $<%out.println(resulta3.getInt("costo"));%></p>
                                <p>Estado de la orden: <%out.println(resulta3.getString("edo"));%></p>
                            </div>
                            <div class="col-md-6">
                                <p>Fecha de Creación: <%out.println(resulta3.getString("fec1"));%></p>
                                <p>Fecha de Entrega: <%out.println(resulta3.getString("fec2"));%></p>
                                <p>Especificaciones: <%out.println(resulta3.getString("det"));%></p>
                            </div>
                        </div>
                    </div>
                </div>
            <%
                }
            }
            //Con Piezas
            ResultSet result2 = bd.consulta("select * from ConsultaOP");
            while(result2.next()){
                id = result2.getInt("idO");
                
                ResultSet resulta4 = bd.consulta("select * from ConsultaOrdenP where (det like '%"+BuscarOrden+"%' or idOS like '%"+BuscarOrden+"%' or "
                            + "det like '%"+BuscarOrden+"%' or cost like '%"+BuscarOrden+"%' or edo like '%"+BuscarOrden+"%' or nomb like '%"+BuscarOrden+"%' or "
                            + "cantp like '%"+BuscarOrden+"%' or Nom like '%"+BuscarOrden+"%' or Paterno1 like '%"+BuscarOrden+"%' or Materno1 like '%"+BuscarOrden+"%' or "
                            + "fec1 like '%"+BuscarOrden+"%') and idOS = '"+id+"'; "); 
                
                while(resulta4.next()){ 
            %>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                      <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%out.print(resulta4.getInt("idOS"));%>">
                            ID: <%out.println(resulta4.getInt("idOS"));%> ||
                            Cliente: <%out.println(resulta4.getString("Nom"));%>
                                 <%out.println(resulta4.getString("Paterno1"));%>
                                 <%out.println(resulta4.getString("Materno1"));%>  ||
                            Estado de la orden: <%out.println(resulta4.getString("edo"));%> ||
                            Pieza Necesaria: <%out.println(resulta4.getString("Nomb"));%>
                        </a>
                      </h4>
                    </div>
                    <div id="collapse<%out.print(resulta4.getInt("idOS"));%>" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="col-md-6">
                                <p>ID de la orden: <%out.println(resulta4.getInt("idOS"));%> </p>
                                <p>Cliente: <%out.println(resulta4.getString("Nom"));%>
                                              <%out.println(resulta4.getString("Paterno1"));%>
                                              <%out.println(resulta4.getString("Materno1"));%> </p>
                                <p>Costo de la orden: $<%out.println(resulta4.getInt("cost"));%></p>
                                <p>Fecha de Creación: <%out.println(resulta4.getString("fec1"));%></p>
                                <p>Fecha de Entrega: <%out.println(resulta4.getString("fec2"));%></p>
                            </div>
                            <div class="col-md-6">
                                <p>Estado de la orden: <%out.println(resulta4.getString("edo"));%></p>
                                <p>Nombre de la Pieza: <%out.println(resulta4.getString("nomb"));%></p>
                                <p>Cantidad de la Pieza: <%out.println(resulta4.getString("cantp"));%></p>
                                <p>Especificaciones: <%out.println(resulta4.getString("det"));%></p>
                            </div>
                        </div>
                    </div>
                </div>
            <%
                }
            }
            } bd.cierraConexion();
            } catch(Exception xxxD){}
           %>
        </div>
        </div>
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