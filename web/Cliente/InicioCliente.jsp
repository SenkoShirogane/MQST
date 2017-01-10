<%-- 
    Document   : InicioCliente
    Created on : 22/10/2016, 09:21:41 PM
    Author     : SENKO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    String usuario;
    if(session.getAttribute("Cliente")!=null){
        usuario = session.getAttribute("Cliente").toString();
    }else{
        out.println("<script> location.replace('/MQST/index.jsp'); </script>");}
    BD.MQST base2 = new BD.MQST();
    String BuscarProducto="";
    try{
        base2.conectar();
            ResultSet rs = base2.consulta("select * from ConsultaProducto where Estado='Visible';");
%>
<html lang="es">
    <head>
        <title>MQST - Catalogo</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="../js/ChatMensajes.js"></script>
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
                    <span class="glyphicon glyphicon-home"></span> Inicio </a>
              </div>
              <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a>
                        <span class="glyphicon glyphicon-th-list"></span> Catálogo</a></li>
                    <li><a href="../Ordenes/MisOrdenes.jsp">
                        <span class="glyphicon glyphicon-time"></span> Mis Órdenes </a></li> 
                    <li class="dropdown">
                          <a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
                              <span class="glyphicon glyphicon-user"></span> ${sessionScope.Cliente}   
                          <span class="caret"></span></a>
                          <ul class="dropdown-menu">
                              <li><a href="../Cliente/MiPerfil.jsp" id="a">
                                     <span class="glyphicon glyphicon-arrow-right"></span> Mi Perfil</a></li>
                              <li><a href="../Contacto.jsp" id="a">
                                     <span class="glyphicon glyphicon-comment"></span> Contacto</a></li>
                              <li class="divider"></li>
                              <li><a href="/MQST/CerrarSesion" id="a">
                                     <span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión</a></li>
                          </ul>
                    </li>
                    <li><a href="../Ordenes/Notificaciones.jsp"><span class="glyphicon glyphicon-bell">
                            </span><span class="badge">1</span></a>
                    </li>
                </ul>
              </div>
            </div>
        </nav>
        <h1 align="center">Catálogo</h1>
        <h3 align="center">Aquí puedes ver todos los productos en venta.</h3>
        <div class="container-fluid text-center">
            <div class="col-md-6 col-md-offset-3">
                <form class="navbar-form" role="search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Buscar Producto" name="Buscar" id="Busqueda" 
                               minlength="3" autofocus onkeypress="return kp(event)" required>
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="container-fluid">
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
                            <div class="col-md-4"> <p><strong>$<%out.println(rs.getObject("Precio"));%></strong> </div>
                            <div class="col-md-8"> <p><strong>Proveedor:</strong> <%out.println(rs.getString("Empresa"));%> </div>
                            <div class="col-md-12"> <p><strong>Detalles:</strong> <%out.println(rs.getString("Detalles"));%> </div>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
            <% } else{
                    ResultSet rs2 = base2.consulta("select * from ConsultaProducto where (NombreP like '%"+BuscarProducto+"%' or "
                        + "Empresa like '%"+BuscarProducto+"%' or Precio like '%"+BuscarProducto+"%' or Detalles like '%"+BuscarProducto+"%') "
                        + "and Estado='Visible';");
            %>        
            <h2 align="center">Éstos son los Resultados que se encontraron para "<%=BuscarProducto%>".</h2>
            <%while(rs2.next()){ %>
            <div class="col-md-6 col-md-offset-0" Style="padding-bottom: 70px; padding-right: 0px;">
                <div id="Foto" class="col-md-offset-0 col-md-5" align="center">
                        <img src="/MQST/F?Producto=<%out.println(rs2.getObject("idAlmacen"));%>" class="img-rounded img img-responsive"
                             Style="width:260px;height:260px;display:inline;" alt="Producto"> <!--width:600px;height:400px -->
                </div>
                <div class="col-md-offset-0 col-md-7">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 align="center"><%out.println(rs2.getObject("NombreP"));%></h3>
                        </div>
                        <div class="panel-body">
                            <div class="col-md-4"> <p><strong>$<%out.println(rs2.getObject("Precio"));%></strong> </div>
                            <div class="col-md-8"> <p><strong>Proveedor:</strong> <%out.println(rs2.getString("Empresa"));%> </div>
                            <div class="col-md-12"> <p><strong>Detalles:</strong> <%out.println(rs2.getString("Detalles"));%> </div>
                        </div>
                    </div>
                </div>
            </div>   
            <% } %>
            <% } base2.cierraConexion();
                }catch(Exception xxxD){}%>
        </div><BR>
        
        <!-- Inicia Chat --><!--
        <nav class="navbar navbar-inverse navbar-fixed-bottom" style="background-color:transparent;">
            <div id="chat" class="panel nav navbar-nav navbar-right">
                <div id="header-chat" class="panel-heading">
                    <a data-toggle="collapse" href="#colapse" style="color:white; font-size:15px;">
                        Chat en línea (No Disponible)
                    </a>
                </div>
                <div id="colapse" class="panel-collapse collapse" >
                    <div id="mensajes">
                        <div class="mensaje-autor">
                            <div class="flecha-izquierda"></div>
                            <div class="contenido">
                                    Buenas tardes, ¿en qué puedo ayudarle?
                            </div>
                        <!--<div class="fecha">Enviado: 14-04-2001</div>
                        </div>
                    </div>
                    <div id="caja-mensaje">
                        <input type="text" placeholder="Escribir mensaje..." id="textbox">
                        <button id="send"> &#8594; </button>
                    </div>
                </div>
            </div>
        </nav>-->
        <!--Cierra Chat -->
        <footer class="container-fluid text-center">
            <a href="#Inicio" title="Volver al Inicio">
                <span class="glyphicon glyphicon-chevron-up" style="font-size:20px;"></span>
            </a>
            <p>MacQuality Service Tracker By <a href="/MQST/QuienesSomos.jsp" title="¿Quienes Somos?">Sofficcesware</a></p>
            << <a href="/MQST/Cliente/Condiciones.jsp">Terminos y Condiciones</a> >>
        </footer>
    </body>
</html>