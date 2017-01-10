<%-- 
    Document   : ModificarCuenta
    Created on : 4/11/2016, 07:31:02 PM
    Author     : SENKO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%
    HttpSession sesion = request.getSession();
    String usuario;
    if(session.getAttribute("Cliente")!=null){
        usuario = session.getAttribute("Cliente").toString();
    }else{ out.println("<script> location.replace('/MQST/Index.jsp'); </script>"); }
    
    BD.MQST base = new BD.MQST();
    try{
        base.conectar();
            ResultSet rs = base.consulta("call ConsultaCliente('"+sesion.getAttribute("Cliente")+"')");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>MQST - Modificar Datos</title> <!-- Cliente -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="../js/Animaciones.js"></script>
        <script src="../js/prototype.js" type="text/javascript"></script>
        <script src="../js/ChatMensajes.js"></script>
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
                    <li><a href="../Cliente/InicioCliente.jsp">
                        <span class="glyphicon glyphicon-th-list"></span> Catálogo</a></li>
                    <li><a href="../Ordenes/MisOrdenes.jsp">
                        <span class="glyphicon glyphicon-time"></span> Mis Órdenes </a></li>
                    <li class="dropdown">
                          <a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
                              <span class="glyphicon glyphicon-user"></span> ${sessionScope.Cliente}   
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
                    <li><a href="../Ordenes/Notificaciones.jsp">
                        <span class="glyphicon glyphicon-bell"></span></a></li>
                </ul>
              </div>
            </div>
        </nav>
        <h1 align="center">Modificar datos de la cuenta</h1>
        <h3 align="center">Modifica sólo los campos deseados.</h3><br>
        <!-- Primera tabla -->
        <Form method="get" action="/MQST/ModificarCliente" onkeypress="return kp(event)" > <!-- onSubmit="return validaCon()" -->
            <%while(rs.next()){ %>
            <div class="container">
                <div>
                    <h4 style="color:black;">Datos Personales</h4>
                </div>
                <div class='table-responsive'>
                    <table class='table'>
                        <thead>
                            <tr>
                                <th>Usuario</th>
                                <th>Nombre</th>
                                <th>A.Paterno</th>
                                <th>A.Materno</th>
                                <th>Correo</th>
                                <th>Teléfono de casa</th>
                                <th>Teléfono Celular</th>
                                <th>Nueva Password</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><%out.println(rs.getObject("Usr"));%></td> 
                                <td><input type='text' value="<%out.println(rs.getObject("Nombre"));%>" name='NombreModC' maxlength="20" required></td>
                                <td><input type='text' value="<%out.println(rs.getObject("Ap1"));%>" name='ApPatModC'  maxlength="20" required></td>
                                <td><input type='text' value="<%out.println(rs.getObject("Ap2"));%>" name='ApMatModC'  maxlength="20" required></td>
                                <td><input type='email' value="<%out.println(rs.getObject("Email"));%>" name='CorreoModC'  maxlength="25" required></td>
                                <td><input type="number" value="<%out.print(rs.getInt("TelefonoC"));%>" name='TelefonoModC' min="0"required></td>
                                <td><input type="number" value="<%out.print(rs.getString("TelefonoCel"));%>" name='CelularModC' min="0" required></td>
                                <td><input type='text' value="" name='PassModC' minlength="8"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <input type="text" value="<%out.println(rs.getObject("Usr"));%>" name="UsuarioModC" style="visibility: hidden;">
            <input type="text" value="<%out.println(rs.getObject("PSW"));%>" name="PSWModC" style="visibility: hidden;" id="psw">
            <!-- Termina primera tabla, empieza la segunda -->
            <div class="container">
                <div>
                    <h4 style="color:black;">Datos de la dirección</h4>
                </div>
                <div class='table-responsive'>
                    <table class='table'>
                        <thead>
                            <tr>
                                <th>Estado</th>
                                <th>Delegación</th>
                                <th>Colonia</th>
                                <th>C. Postal</th>
                                <th>Calle</th>
                                <th>Número</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type='text' value="<%out.println(rs.getObject("Estado"));%>" name='EstadoModC' required></td>
                                <td><input type='text' value="<%out.println(rs.getObject("Municipio"));%>" name='DelegacionModC' required></td>
                                <td><input type='text' value="<%out.println(rs.getObject("Colonia"));%>" name='ColoniaModC' required></td>
                                <td><input type='number' value="<%out.print(rs.getInt("CodigoP"));%>" name='CPModC' min="0" required></td>
                                <td><input type='text' value="<%out.println(rs.getObject("Calle"));%>" name='CalleModC' required></td>
                                <td><input type='number' value="<%out.print(rs.getInt("Numero"));%>" name='NumeroModC' min="0" required></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div><BR>
            <div class="form-group" align="center">
                <input type="submit" class="btn btn-primary" value="Confirmar Cambios" style="width: 20%">
            </div>
        </form>
        <% }base.cierraConexion();
        }catch(Exception xxxD){}%>
        <BR><BR>
        <!-- Inicia Chat -->
        <!--
        <nav class="navbar navbar-inverse navbar-fixed-bottom" style="background-color:transparent;">
            <div id="chat" class="panel nav navbar-nav navbar-right">
                <div id="header-chat" class="panel-heading">
                    <a data-toggle="collapse" href="#colapse" style="color:white; font-size:15px;">
                        Chat en línea (No Disponible)
                    </a>
                </div>
                <div id="colapse" class="panel-collapse collapse" >
                    <div id="mensajes"> </div>
                    
                    <div id="caja-mensaje">
                        <form id="uriForm">
                            <input type="hidden" id="uri" value="ws://localhost:8886">
                            <input type="submit" id="connect" value="Connect" class="btn-default">
                            <input type="button" id="disconnect" value="Disconnect" disabled="disabled" class="btn-default">
                        </form>
                        <form id="sendForm">
                            <input type="text" placeholder="Escribir mensaje..." id="textbox">
                            <button type="submit" id="Send" class="btn-success">&#8594;</button> 
                        </form>
                    </div>
                </div>
            </div>
        </nav>-->
        <!--Cierra Chat -->
        <script>
            function validaCon(){
                var ConVieja = document.getElementById("psw").value;;
                var ConVieja2;
                
                ConVieja2 = prompt("Para confirmar las modificaciones hechas, ingresa tu contraseña", "");
                if(ConVieja2 != ConVieja){
                    alert("¡Las contraseñas no coinciden!");
                    return false;
                } else {
                    alert("Validación correcta, ¡datos modificados!");
                    return true;
                } 
            }
        </script>
        <footer class="container-fluid text-center">
            <a href="#Inicio" title="Volver al Inicio">
                <span class="glyphicon glyphicon-chevron-up" style="font-size:20px;"></span>
            </a>
            <p>MacQuality Service Tracker By <a href="/MQST/QuienesSomos.jsp" title="¿Quienes Somos?">Sofficcesware</a></p>
            << <a href="/MQST/Cliente/Condiciones.jsp">Terminos y Condiciones</a> >>
        </footer>
    </body>
</html>