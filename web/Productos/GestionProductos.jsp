<%-- 
    Document   : GestionProductos
    Created on : 22/10/2016, 10:33:43 PM
    Author     : Senko
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
        out.println("<script> location.replace('/MQST/index.jsp'); </script>"); }
    BD.MQST base2 = new BD.MQST();
    String Buscar="";
    try {
        base2.conectar();
        ResultSet rs = base2.consulta("select * from ConsultaProveedor;");
        ResultSet rs2 = base2.consulta("select * from ConsultaProducto;");
        ResultSet rs4 = base2.consulta("select * from ConsultaProducto;");
%>       
<html lang="es">
    <head>
        <title>MQST - Gestion de Productos</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="../js/Animaciones.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="../js/fileinput.min.js"></script>
        <script src="../js/validator.js"></script>
        <link href="../css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
        <link href="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" rel="stylesheet">
        <script src="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
        <style>
            .container-fluid { padding-top: 10px; padding-bottom: 10px; }
            #Select .form-control {  padding-right: 10px; } #Select .form-control-feedback { right: -15px; }
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
                            <li class="active"><a href="">
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
        <h1 align="center">¡Aquí puedes gestionar el catálogo de productos!</h1><BR>
        <div class="container-fluid">
            <div class="col-md-12" style="padding-bottom: 30px;">
                <div class="col-md-offset-2 col-md-8">
                    <ul class="nav nav-pills nav-justified">
                        <li class="active"><a data-toggle="pill" href="#home">Gestionar Productos</a></li>
                        <li><a data-toggle="pill" href="#menu1">Agregar Productos</a></li>
                    </ul>
                </div>
            </div>
            <div class="tab-content">
                <!-- Gestionar -->
                <div id="home" class="tab-pane fade in active">
                    <div class="container-fluid text-center">
                        <h3>Modificar o Eliminar Productos</h3>
                        <div class="col-md-4 col-md-offset-4">
                            <form role="search">
                                <div class="input-group">
                                    <input type="search" class="form-control" placeholder="¿Deseas buscar algún Producto?" name="Buscar"
                                           minlength="3" autofocus onkeypress="return kp(event)" required>
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <%  
                        Buscar = request.getParameter("Buscar");
                        if(Buscar==null){
                    %>
                    <%while(rs2.next()){ %>
                    <div class=" col-md-offset-0 col-md-12" Style="padding-bottom: 30px;padding-right: 0px;"> 
                        <div id="Foto" class="col-md-offset-0 col-md-4" align="center">
                            <img src="/MQST/F?Producto=<%out.println(rs2.getObject("idAlmacen"));%>" class="img-rounded img img-responsive" 
                                 Style="width:300px;height:300px;display:inline;" alt=" Imagen del Producto">
                        </div>
                        <div class="col-md-offset-0 col-md-8">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 align="center"><%out.println(rs2.getObject("NombreP"));%></h3>
                                </div>
                                <div class="panel-body">
                                <form enctype="multipart/form-data" method="post" action='/MQST/ModificarProductoC' 
                                       onkeypress="return kp(event)">
                                    <div class="col-md-6">
                                        <label for="pre"><strong>Precio:</strong></label>
                                        <input type="number" value="<%out.print(rs2.getInt("Precio"));%>" name='CostoModProd' min="0" 
                                               required class="form-control" id="pre">
                                    </div>
                                    <div class="col-md-6"  style="padding-bottom: 10px">
                                        <label><strong>Proveedor:</strong></label>
                                        <select name="ProveedorModProducto"  class="form-control" required>
                                        <%  out.println("<option value='"+rs2.getString("idP")+"'>Actual: "+rs2.getString("Empresa")+"</option>");
                                        String emp = "";
                                        emp = rs2.getString("Empresa");
                                        ResultSet resulta2 = base2.consulta("call ConsultasProv();");
                                        while(resulta2.next()){
                                            if(emp.equals(resulta2.getString("Empresa"))){
                                            }else{
                                                out.println("<option value='"+resulta2.getInt("id")+"'>"+resulta2.getString("Empresa")+"</option>");
                                            }
                                        } %>
                                        </select>
                                    </div>
                                    <div class="col-md-5">
                                        <label><strong>Estado:</strong></label>
                                        <select name="EstadoModProducto" class="form-control" required>
                                            <%out.println("<option value='"+rs2.getString("idEdo")+"'>Actual: " 
                                                                           +rs2.getString("Estado")+" para el cliente </option>");
                                            String edo = "";
                                            edo = rs2.getString("Estado");
                                            if( edo.equals("Visible")){
                                                    out.println("<option value='2'>Invisible para el cliente </option>");
                                            }else{
                                                    out.println("<option value='1'>Visible para el cliente </option>");
                                            } %>
                                        </select>
                                    </div>
                                    <div class="col-md-7">
                                        <label class="control-label"><strong>Detalles:</strong></label>
                                            <textarea rows="1" class="form-control col-md-4" name="detallesMod" placeholder="Ingresa aquí los nuevos detalles."
                                                      maxlength="50" required><%out.print(rs2.getObject("Detalles"));%></textarea>
                                    </div>
                                    <div class="col-md-12" style="padding-bottom: 10px;">
                                        <label><strong>¿Cambiar imagen?</strong></label>
                                        <input type="file" class="file file-loading" name="imagenMod" 
                                               data-allowed-file-extensions='["png", "jpeg", "jpg", "gif"]' data-show-upload="false">
                                    </div>
                                    <div class="col-md-6">
                                        <input type="hidden" value="<%out.print(rs2.getString("NombreP"));%>" name="NombreModProducto" required>
                                        <button type="submit" class="btn btn-md btn-primary" style="width: 100%">Guardar Cambios</button>
                                    </div>
                                </form> 
                                <form name="eliminarProducto" method='get' action='/MQST/EliminarProducto' onSubmit="return confirmar2()">
                                    <div class="col-md-6">
                                        <input type="hidden" value="<%out.print(rs2.getObject("NombreP"));%>" name="NomProductoEl" required>
                                        <button type="submit" class="btn btn-el btn-danger" style="width: 100%">¿Quieres borrar este producto?</button>
                                    </div>
                                </form>
                                </div>
                            </div>
                        </div>                   
                    </div>               
                    <%} }else{
                            ResultSet rs3 = base2.consulta("select * from ConsultaProducto where (NombreP like '%"+Buscar+"%' "
                                + "or Detalles like '%"+Buscar+"%' or Precio like '%"+Buscar+"%' or Estado like '%"+Buscar+"%' "
                                + "or Empresa like '%"+Buscar+"%'); ");
                    %>    
                    <h2 align="center">Éstos son los Resultados que se encontraron para "<%=Buscar%>".</h2>
                    <% while(rs3.next()){ %>
                    <div class=" col-md-offset-0 col-md-12" Style="padding-bottom: 30px; padding-right: 0px;"> 
                        <div id="Foto" class="col-md-offset-0 col-md-4" align="center">
                            <img src="/MQST/F?Producto=<%out.println(rs3.getObject("idAlmacen"));%>" class="img-rounded img img-responsive" 
                                 Style="width:300px;height:300px;display:inline;" alt=" Imagen del Producto">
                        </div>
                        <div class="col-md-offset-0 col-md-8">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 align="center"><%out.println(rs3.getObject("NombreP"));%></h3>
                                </div>
                                <div class="panel-body">
                                <form enctype="multipart/form-data" method="post" action='/MQST/ModificarProductoC' 
                                      onkeypress="return kp(event)">
                                    <div class="col-md-6">
                                        <label for="pre"><strong>Precio:</strong></label>
                                        <input type="number" value="<%out.print(rs3.getInt("Precio"));%>" name='CostoModProd' min="0" 
                                               required class="form-control" id="pre">
                                    </div>
                                    <div class="col-md-6" style="padding-bottom: 10px">
                                        <label><strong>Proveedor:</strong></label>
                                        <select name="ProveedorModProducto"  class="form-control" required>
                                        <%  out.println("<option value='"+rs3.getString("idP")+"'>Actual: "+rs3.getString("Empresa")+"</option>");
                                        String emp = "";
                                        emp = rs3.getString("Empresa");
                                        ResultSet resulta2 = base2.consulta("call ConsultasProv();");
                                        while(resulta2.next()){
                                            if(emp.equals(resulta2.getString("Empresa"))){
                                            }else{
                                                out.println("<option value='"+resulta2.getInt("id")+"'>"+resulta2.getString("Empresa")+"</option>");
                                            }
                                        } %>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label><strong>Estado:</strong></label>
                                        <select name="EstadoModProducto" class="form-control" required>
                                            <%out.println("<option value='"+rs3.getString("idEdo")+"'>Actual: "+rs3.getString("Estado")+"</option>");
                                            String edo = "";
                                            edo = rs3.getString("Estado");
                                            if( edo.equals("Visible")){
                                                    out.println("<option value='2'>Invisible</option>");
                                            }else{
                                                    out.println("<option value='1'>Visible</option>");
                                            } %>
                                        </select>
                                    </div>
                                    <div class="col-md-8">
                                        <label class="control-label"><strong>Detalles:</strong></label>
                                            <textarea rows="1" class="form-control col-md-4" name="detallesMod" placeholder="Ingresa aquí los nuevos detalles."
                                                      maxlength="50" required><%out.print(rs3.getObject("Detalles"));%></textarea>
                                    </div>
                                    <div class="col-md-12" style="padding-bottom: 10px;">
                                        <label><strong>¿Cambiar imagen?</strong></label>
                                        <input type="file" class="file file-loading" name="imagenMod"
                                               data-allowed-file-extensions='["png", "jpeg", "jpg", "gif"]' data-show-upload="false">
                                    </div>
                                    <div class="col-md-6">
                                        <input type="hidden" value="<%out.print(rs3.getString("NombreP"));%>" name="NombreModProducto" required>
                                        <button type="submit" class="btn btn-md btn-primary" style="width: 100%">Guardar Cambios</button>
                                    </div>
                                </form> 
                                <form name="eliminarProducto" method='get' action='/MQST/EliminarProducto' onSubmit="return confirmar2()">
                                    <div class="col-md-6">
                                        <input type="hidden" value="<%out.print(rs3.getObject("NombreP"));%>" name="NomProductoEl" required>
                                        <button type="submit" class="btn btn-el btn-danger" style="width: 100%">¿Quieres borrar este producto?</button>
                                    </div>
                                </form>
                                </div>
                            </div>
                        </div>                   
                    </div>     
                    <% } } %>
                </div>
                
                <!-- Agregar -->
                <div id="menu1" class="tab-pane fade">
                    <div class="container-fluid text-center">
                        <h3>Agregar un Producto</h3>
                        <p>Consejo: Asegúrate de que siempre haya una imagen ingresada.
                        <form class="form-horizontal" enctype="multipart/form-data" method="post" action='/MQST/AgregarProductoC' 
                             onkeypress="return kp(event)" class="form-inline" id="AgregarProducto">
                            <div class="form-group">
                                <label class="control-label col-md-3">Nombre:</label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" placeholder="Nombre del Producto" name="ProductoNuevo" 
                                           maxlength="30" required>
                                </div>
                                <label class="control-label col-md-1">Costo:</label>
                                <div class="col-md-2">
                                    <input type="text" class="form-control" placeholder="Costo del Producto" name="CostoNuevo" min="1"required>
                                </div>
                            </div>
                            <div class="form-group" id="Select">
                                <label class="control-label col-md-3">Estado:</label>
                                <div class="col-md-2" >
                                    <select name="EstadoProducto" class="form-control" required>
                                        <option value='1'>Visible para el cliente</option>
                                        <option value='2'>Invisible para el cliente</option>
                                    </select>
                                </div>
                                <label class="control-label col-md-1">Proveedor:</label> 
                                <div class="col-md-3">
                                    <select name="ProveedorProducto" class="form-control" required>
                                        <option value='0'>Seleccione valor</option>
                                        <%while(rs.next()){
                                            out.println("<option value='"+rs.getInt("id")+"'>"+rs.getString("Nombre")+" "+rs.getString("Apellido1")+" — "+rs.getString("Empresa")+"</option>");
                                        }%>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group" id="Select">
                                <label class="control-label col-md-3">Imagen:</label>
                                <div class="col-md-6">
                                    <input type="file" class="file file-loading" name="imagen" data-show-remove="false" 
                                           data-show-upload="false" required>
                                </div>
                            </div> 
                            <div class="form-group">
                                <label class="control-label col-md-3">Detalles:</label>
                                <div class="col-md-6">
                                    <textarea rows="3" class="form-control" placeholder="Descripción para el producto" name="detalles" 
                                              maxlength="50" required></textarea>
                                </div>
                            </div><BR>
                            <div class="form-group">
                                <input type="reset" class="btn btn-default" value="Limpiar" style="width: 20%">
                                <input type="submit" class="btn btn-primary" value="Agregar Producto" style="width: 20%">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <% base2.cierraConexion();
    } catch(Exception xxxD){} %>
        <footer class="container-fluid text-center">
            <a href="#Inicio" title="Volver al Inicio">
                <span class="glyphicon glyphicon-chevron-up" style="font-size:20px;"></span>
            </a>
            <p>MacQuality Service Tracker By <a href="/MQST/QuienesSomos.jsp" title="¿Quiénes Somos?">Sofficcesware</a></p>
            << <a href="/MQST/Cliente/Condiciones.jsp">Terminos y Condiciones</a> >>
        </footer>
    </body>
</html>