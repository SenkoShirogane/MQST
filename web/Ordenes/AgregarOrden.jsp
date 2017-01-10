<%-- 
    Document   : AgregarOrden
    Created on : 2/11/2016, 12:34:19 AM
    Author     : CITLALLI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<!DOCTYPE html>
<script>
    function ocultar(){ document.getElementById('mostoc').style.display = 'none';}
    function mostrar(){ document.getElementById('mostoc').style.display = 'block';}
</script>
<%
    HttpSession sesion = request.getSession();
    String usuario;
    if(session.getAttribute("Admin")!=null){
        usuario = session.getAttribute("Admin").toString();
    }else{ out.println("<script> location.replace('/MQST/index.jsp'); </script>");}
    
    BD.MQST bd = new BD.MQST();
    try{
        bd.conectar();
%>  
<html lang="es">
    <head>
        <title>MQST - Agregar Orden</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="../js/Animaciones.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="../js/fileinput.js"></script>
        <link href="../css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
        <style>
            
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
        <% ResultSet resultados = bd.consulta("call ConsultasCliente()"); %>                
        <h1 align="center">Agregar Orden</h1>
        <h3 align="center">Ingresa los datos en los campos solicitados.</h3>
        <div class="container-fluid text-center">
            <form class="form-horizontal" method='get' action="/MQST/AgregarOrden" onkeypress="return kp(event)">
                <div class="form-group">
                <label class="control-label col-md-3">Cliente:</label>
                    <div class="col-md-6">
                        <select name="Clientes" class="form-control" required>
                            <option value="0" selected>Seleccionar</option>
                            <%while(resultados.next()){
                                out.println("<option value='"+resultados.getInt("idC")+"'>"+resultados.getString("Nombre")+" "+resultados.getString("Ap1")+" "+resultados.getString("Ap2")+"</option>");
                            }%>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Estado:</label>
                        <div class="col-md-3">
                            <select name="EstadoOrden" class="form-control" required>
                                <option value='1' selected>Standby</option>
                                <option value='2'>Esperando piezas</option>
                                <option value='3'>En reparación</option>
                                <option value='4'>Completado</option>
                            </select>
                        </div>
                    <label class="control-label col-md-1">Costo:</label>
                    <div class="col-md-2">
                        <input type="number" class="form-control" placeholder="Costo de la orden" 
                           name="CostoO" min="0" required>
                    </div>
                </div>        
                <div class="form-group">
                <label class="control-label col-md-3">¿Necesita Piezas? </label>
                    <div class="col-md-2">
                        <label class="radio-inline"><input type="radio" name="P" value="1" onclick="mostrar()" checked> Sí </label>
                        <label class="radio-inline"><input type="radio" name="P" value="2" onclick="ocultar()"> No </label><br>
                    </div>
                </div>
                <div class="form-group" id="mostoc">
                    <label class="control-label col-md-3">Pieza:</label>
                    <div class="col-md-3">
                        <select name="Pza" class="form-control" required>
                                <option value="0" selected>Seleccionar</option>
                                <%
                                    ResultSet result2 = bd.consulta("call ConsultaPzas()");
                                    while(result2.next()){
                                        out.println("<option value='"+result2.getInt("idPza")+"'> "+result2.getString("Producto")+ " - " +result2.getString("Empresa")+ "</option>");
                                    }
                                 %>
                        </select>
                    </div>
                    <label class="control-label col-md-1">Cantidad:</label>
                    <div class="col-md-2">
                        <input type="number" class="form-control" placeholder="Cantidad de la pieza" 
                           name="CantidadPieza" min="0">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Fecha de entrega:</label>
                    <div class="col-md-3">
                        <input type="date" name="fecent" class="form-control" required>
                    </div>
                </div> 
                <div class="form-group">
                <label class="control-label col-md-3">Detalles:</label>
                    <div class="col-md-6">
                        <textarea rows="3" class="form-control" placeholder="Descripción de la pieza" name="detalles" 
                                  maxlength="50" required></textarea>
                    </div>
                </div><BR>
                <div class="form-group">
                    <input type="reset" class="btn btn-default" value="Limpiar" style="width: 20%">
                    <input type="submit" class="btn btn-primary" value="Iniciar" style="width: 20%">
                </div>      
            </form>
                                     
        <% bd.cierraConexion();
            } catch(Exception xxxD){}
        %>
        </div><BR><BR> 
        <footer class="container-fluid text-center">
            <a href="#Inicio" title="Volver al Inicio">
                <span class="glyphicon glyphicon-chevron-up" style="font-size:20px;"></span>
            </a>
            <p>MacQuality Service Tracker By <a href="/MQST/QuienesSomos.jsp" title="¿Quiénes Somos?">Sofficcesware</a></p>
            << <a href="/MQST/Cliente/Condiciones.jsp">Terminos y Condiciones</a> >>
        </footer>
    </body>
</html>