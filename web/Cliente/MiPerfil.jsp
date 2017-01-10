<%-- 
    Document   : MiPerfil
    Created on : 27/10/2016, 05:24:03 PM
    Author     : SENKO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%
    HttpSession sesion = request.getSession();
    String usuario;
    if(session.getAttribute("Cliente")!=null){
        usuario = session.getAttribute("Cliente").toString();
    }else{
        out.println("<script> location.replace('../index.jsp'); </script>");}
    BD.MQST base = new BD.MQST();
    try{
        base.conectar();
            ResultSet rs = base.consulta("call ConsultaCliente('"+sesion.getAttribute("Cliente")+"')");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>MQST - Mi Perfil</title> <!-- Cliente -->
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
            .btn:hover {background-color: transparent;  border: 1px solid white; color: white; }
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
                    <li><a href="../Cliente/InicioCliente.jsp">
                        <span class="glyphicon glyphicon-th-list"></span> Catálogo</a></li>
                    <li><a href="../Ordenes/MisOrdenes.jsp">
                        <span class="glyphicon glyphicon-time"></span> Mis Órdenes </a></li>
                    <li><a href="../CerrarSesion">
                        <span class="glyphicon glyphicon-off"></span> Salir</a></li>
                    <li><a href="../Ordenes/Notificaciones.jsp">
                        <span class="glyphicon glyphicon-bell"></span></a></li>
                </ul>
              </div>
            </div>
        </nav>
        <h1 align="center">¡Buenos días, ${sessionScope.Cliente}!</h1> 
        <h3 align="center">Selecciona la opción deseada.</h3>
        <div class="container-fluid text-center form-group">
            <div class="col-md-offset-0 col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading"><h3>Mis Datos</h3></div>
                    <div class="panel-body">
                        <%while(rs.next()){ %>
                        <p><strong>Usuario:</strong> <%out.println(rs.getObject("Usr"));%>
                        <p><strong>Nombre:</strong> <%out.println(rs.getObject("Nombre"));%>
                                                    <%out.println(rs.getObject("Ap1"));%>
                                                    <%out.println(rs.getObject("Ap2"));%>
                        <p><strong>Correo Electrónico:</strong> <%out.println(rs.getObject("Email"));%>
                        <p><strong>Telefono de Casa:</strong> <%out.print(rs.getInt("TelefonoC"));%>
                        <p><strong>Celular:</strong> <%out.print(rs.getString("TelefonoCel"));%>
                        <p><strong>Estado:</strong> <%out.println(rs.getObject("Estado"));%>
                        <p><strong>Municipio:</strong> <%out.println(rs.getObject("Municipio"));%>
                        <p><strong>Colonia:</strong> <%out.println(rs.getObject("Colonia"));%> 
                        <p><strong>Código Postal:</strong> <%out.print(rs.getInt("CodigoP"));%>
                        <p><strong>Calle:</strong> <%out.println(rs.getObject("Calle"));%>
                        <p><strong>Número Exterior: </strong>#<%out.print(rs.getInt("Numero"));%>
                        <% } %>
                    </div>
                </div>
            </div>
            <div class="col-md-offset-0 col-md-4">
                <div class="jumbotron">
                <h2><span class="glyphicon glyphicon-pencil"></span></h2>
                <h2>Modificar Datos</h2> 
                    <p></p>
                    <form role="form" method='get' action='../Cliente/ModificarCuenta.jsp'>
                      <div class="form-group">
                        <button type="submit" class="btn btn-default btn-lg">Modificar</button>       
                      </div> 
                    </form>
                </div>
            </div>
            <div class="col-md-offset-0 col-md-4">
                <div class="jumbotron">
                <h2><span class="glyphicon glyphicon-question-sign"></span></h2>
                <h2>Manual de usuario</h2> 
                    <p></p>
                    <form role="form" method='get' action='/MQST/Manuales.jsp'>
                      <div class="form-group"  >
                        <button type="submit" class="btn btn-default btn-lg">Ver</button>       
                      </div> 
                    </form>
                </div>
            </div>
            <div class="col-md-offset-0 col-md-8">
                <div class="jumbotron slideanim">
                <h2><span class="glyphicon glyphicon-comment"></span></h2>
                <h2>Contáctanos</h2> 
                    <p></p>
                    <form role="form" method='get' action='../Contacto.jsp'>
                      <div class="form-group"  >
                        <button type="submit" class="btn btn-default btn-lg">Contacto</button>       
                      </div> 
                    </form>
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
        <% base.cierraConexion();
           } catch(Exception xxxD){}%>
        <footer class="container-fluid text-center">
            <a href="#Inicio" title="Volver al Inicio">
                <span class="glyphicon glyphicon-chevron-up" style="font-size:20px;"></span>
            </a>
            <p>MacQuality Service Tracker By <a href="/MQST/QuienesSomos.jsp" title="¿Quienes Somos?">Sofficcesware</a></p>
            << <a href="/MQST/Cliente/Condiciones.jsp">Terminos y Condiciones</a> >>
        </footer>
    </body>
</html>
