<%-- 
    Document   : ConsultarOrdenes
    Created on : 4/11/2016, 10:14:44 PM
    Author     : CITLALLI
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   HttpSession sesion = request.getSession();
   String usuario;

   if(sesion.getAttribute("Cliente")!=null){
       usuario = session.getAttribute("Cliente").toString();
   } else{
       out.println("<script> location.replace('/MQST/index.jsp'); </script>");
   }

    BD.MQST bd = new BD.MQST();
    try{
        bd.conectar();
        String BuscarOrden="";
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <title>MQST - Catálogo de Órdenes</title>  <!-- Lo ve el cliente -->
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
            h4{ color:white; }
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
                    <li><a href="../Cliente/InicioCliente.jsp">
                        <span class="glyphicon glyphicon-th-list"></span> Catálogo</a></li>
                    <li class="active"><a><span class="glyphicon glyphicon-time"></span> Mis Órdenes </a></li> 
                    <li class="dropdown">
                          <a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
                              <span class="glyphicon glyphicon-user"></span> ${sessionScope.Cliente}
                          <!-- Lo que está adentro-->
                          <span class="caret"></span></a>
                          <ul class="dropdown-menu">
                              <li><a href="../Cliente/MiPerfil.jsp">
                                     <span class="glyphicon glyphicon-arrow-right"></span> Mi Perfil</a></li>
                              <li><a href="../Contacto.jsp">
                                     <span class="glyphicon glyphicon-comment"></span> Contacto</a></li>
                              <li class="divider"></li>
                              <li><a href="/MQST/CerrarSesion">
                                     <span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión</a></li>
                          </ul>
                    </li>
                    <li><a href="../Ordenes/Notificaciones.jsp"><span class="glyphicon glyphicon-bell"></span></a></li>
                </ul>
              </div>
            </div>
        </nav>
        <h1 align="center">Mis Órdenes</h1>
        <h3 align="center">Aquí puedes ver todos las órdenes a tu nombre.</h3><br>
        <!-- Busqueda -->
        <div class="container-fluid text-center">
            <div class="col-md-6 col-md-offset-3">
                <form class="navbar-form" role="search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Buscar Orden" name="Buscar" id="Busqueda" 
                               minlength="3" autofocus onkeypress="return kp(event)">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                        </div>
                    </div>
                </form>
            </div>
        </div><BR>
        <div class="container">
        <div class="panel-group" id="accordion">
        <div class="col-md-8 col-md-offset-2">
        <%  //Busqueda
            BuscarOrden = request.getParameter("Buscar");
            if(BuscarOrden==null){
            
            //Sin piezas
            int id=0;
            int idCl =0;
            String C = "";
            C = sesion.getAttribute("Cliente").toString();
            ResultSet res = bd.consulta("select idC from ConsultaCliente where Usr = '"+C+"';");
            while(res.next()){
                idCl = res.getInt("idC");
            }
            
            ResultSet resultados = bd.consulta("select * from ConsultaOSN");
            while(resultados.next()){
                id = resultados.getInt("idO");
                
                ResultSet resulta2 = bd.consulta("call ConsultaOrdenSPCliente("+id+", '"+idCl+"')");
                while(resulta2.next()){
        %>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                      <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%out.print(resulta2.getInt("id"));%>" >
                            Especificaciones: <%out.println(resulta2.getString("det"));%> ||
                            Estado de la orden: <%out.println(resulta2.getString("edo"));%> ||
                            Costo: $<%out.println(resulta2.getInt("costo"));%>
                        </a>
                      </h4>
                    </div>
                    <div id="collapse<%out.print(resulta2.getInt("id"));%>" class="panel-collapse collapse">
                        <div class="panel-body">
                          <p>Identificador de la orden: <%out.println(resulta2.getInt("id"));%> </p>
                          <p>Nombre del Cliente: <%out.println(resulta2.getString("Nombre"));%>
                                              <%out.println(resulta2.getString("Apellido1"));%>
                                              <%out.println(resulta2.getString("Apellido2"));%> </p>
                          <p>Costo de la orden: $<%out.println(resulta2.getInt("costo"));%></p>
                          <p>Fecha de Creación: <%out.println(resulta2.getString("fec1"));%></p>
                          <p>Fecha de Entrega: <%out.println(resulta2.getString("fec2"));%></p>
                          <p>Estado de la orden: <%out.println(resulta2.getString("edo"));%></p>
                          <p>Especificaciones: <%out.println(resulta2.getString("det"));%></p>
                        </div>
                    </div>
                </div>
        <%
                }
            }
            //Con piezas
            ResultSet result = bd.consulta("select * from ConsultaOP");
            while(result.next()){
                id = result.getInt("idO");
 
                ResultSet resulta2 = bd.consulta("call ConsultaOrdenPCliente("+id+",'"+idCl+"')");
                while(resulta2.next()){
        %>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                      <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%out.print(resulta2.getInt("idOS"));%>">
                            Especificaciones: <%out.println(resulta2.getString("det"));%> ||
                            Estado de la orden: <%out.println(resulta2.getString("edo"));%> ||
                            Costo: $<%out.println(resulta2.getInt("cost"));%>
                        </a>
                      </h4>
                    </div>
                    <div id="collapse<%out.print(resulta2.getInt("idOS"));%>" class="panel-collapse collapse">
                        <div class="panel-body">
                          <p>Identificador de la orden: <%out.println(resulta2.getInt("idOS"));%> </p>
                          <p>Nombre del Cliente: <%out.println(resulta2.getString("Nom"));%>
                                              <%out.println(resulta2.getString("Paterno1"));%>
                                              <%out.println(resulta2.getString("Materno1"));%> </p>
                          <p>Costo de la orden: $<%out.println(resulta2.getInt("cost"));%></p>
                          <p>Fecha de Creación: <%out.println(resulta2.getString("fec1"));%></p>
                          <p>Fecha de Entrega: <%out.println(resulta2.getString("fec2"));%></p>
                          <p>Estado: <%out.println(resulta2.getString("edo"));%></p>
                          <p>Especificaciones: <%out.println(resulta2.getString("det"));%></p>
                          <p>Nombre de la Pieza: <%out.println(resulta2.getString("nomb"));%></p>
                          <p>Cantidad de la Pieza: <%out.println(resulta2.getString("cantp"));%></p>
                        </div>
                    </div>
                </div>
        <%
                }
            }
            //Busqueda
            } else {  
            
            //Sin piezas
            int id=0;
            int idCl =0;
            String C = "";
            C = sesion.getAttribute("Cliente").toString();
            ResultSet res = bd.consulta("select idC from ConsultaCliente where Usr = '"+C+"';");
            while(res.next()){
                idCl = res.getInt("idC");
            }
            
            ResultSet resultados = bd.consulta("select * from ConsultaOSN");
            while(resultados.next()){
                id = resultados.getInt("idO");
                
                //ResultSet resulta2 = bd.consulta("call ConsultaOrdenSPCliente("+id+", '"+idCl+"')");
                ResultSet resulta2 = bd.consulta("select * from ConsultaOrden where (det like '%"+BuscarOrden+"%' or "
                            + "costo like '%"+BuscarOrden+"%' or edo like '%"+BuscarOrden+"%') and id = "+id+" and idC = "+idCl+";");
                while(resulta2.next()){    
        %>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                      <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%out.print(resulta2.getInt("id"));%>" >
                            Especificaciones: <%out.println(resulta2.getString("det"));%> ||
                            Estado de la orden: <%out.println(resulta2.getString("edo"));%> ||
                            Costo: $<%out.println(resulta2.getInt("costo"));%>
                        </a>
                      </h4>
                    </div>
                    <div id="collapse<%out.print(resulta2.getInt("id"));%>" class="panel-collapse collapse">
                        <div class="panel-body">
                          <p>Identificador de la orden: <%out.println(resulta2.getInt("id"));%> </p>
                          <p>Nombre del Cliente: <%out.println(resulta2.getString("Nombre"));%>
                                              <%out.println(resulta2.getString("Apellido1"));%>
                                              <%out.println(resulta2.getString("Apellido2"));%> </p>
                          <p>Costo de la orden: $<%out.println(resulta2.getInt("costo"));%></p>
                          <p>Fecha de Creación: <%out.println(resulta2.getString("fec1"));%></p>
                          <p>Fecha de Entrega: <%out.println(resulta2.getString("fec2"));%></p>
                          <p>Estado: <%out.println(resulta2.getString("edo"));%></p>
                          <p>Especificaciones: <%out.println(resulta2.getString("det"));%></p>
                        </div>
                    </div>
                </div>
                
        <%
                }
            }
            //Con piezas
            ResultSet result = bd.consulta("select * from ConsultaOP");
            while(result.next()){
                id = result.getInt("idO");
                ResultSet resulta2 = bd.consulta("select * from ConsultaOrdenP where (det like '%"+BuscarOrden+"%' or idOS like '%"+BuscarOrden+"%' or "
                            + "cost like '%"+BuscarOrden+"%' or edo like '%"+BuscarOrden+"%' or nomb like '%"+BuscarOrden+"%' or "
                            + "cantp like '%"+BuscarOrden+"%') and idOS = "+id+" and idC = "+idCl+"; ");
                while(resulta2.next()){    
        %>
                    <div class="panel panel-primary">
                    <div class="panel-heading">
                      <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%out.print(resulta2.getInt("idOS"));%>">
                            Especificaciones: <%out.println(resulta2.getString("det"));%> ||
                            Estado de la orden: <%out.println(resulta2.getString("edo"));%> ||
                            Costo: $<%out.println(resulta2.getInt("cost"));%>
                        </a>
                      </h4>
                    </div>
                    <div id="collapse<%out.print(resulta2.getInt("idOS"));%>" class="panel-collapse collapse">
                        <div class="panel-body">
                          <p>Identificador de la orden: <%out.println(resulta2.getInt("idOS"));%> </p>
                          <p>Nombre del Cliente: <%out.println(resulta2.getString("Nom"));%>
                                              <%out.println(resulta2.getString("Paterno1"));%>
                                              <%out.println(resulta2.getString("Materno1"));%> </p>
                          <p>Costo de la orden: $<%out.println(resulta2.getInt("cost"));%></p>
                          <p>Fecha de Creación: <%out.println(resulta2.getString("fec1"));%></p>
                          <p>Fecha de Entrega: <%out.println(resulta2.getString("fec2"));%></p>
                          <p>Estado: <%out.println(resulta2.getString("edo"));%></p>
                          <p>Especificaciones: <%out.println(resulta2.getString("det"));%></p>
                          <p>Nombre de la Pieza: <%out.println(resulta2.getString("nomb"));%></p>
                          <p>Cantidad de la Pieza: <%out.println(resulta2.getString("cantp"));%></p>
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