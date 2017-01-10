<%-- 
    Document   : ModificarOrden
    Created on : 1/11/2016, 11:44:42 PM
    Author     : Senko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%
    HttpSession sesion = request.getSession();
    String usuario;
    if(session.getAttribute("Admin")!=null){
        usuario = session.getAttribute("Admin").toString();
    }else{
        out.println("<script> location.replace('../index.jsp'); </script>");}
    
    BD.MQST bd = new BD.MQST();
    try{
        bd.conectar();
            int idO = Integer.parseInt(request.getParameter("idO"));
            //int idC = Integer.parseInt(request.getParameter("idC"));
            String clie = request.getParameter("idC");
            String npieza = "";
            
            ResultSet resultados = bd.consulta("select * from ConsultaOSN where idO = '"+idO+"'");
            while(resultados.next()){
                npieza = "No";
            }
%>
<!DOCTYPE html>
<html>
    <html lang="es">
    <head>
        <title>MQST - Modificar Orden</title> <!-- Lo ve el admin -->
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
                    <span class="glyphicon glyphicon-home"></span> Inicio </a>
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
                    <!-- Expandible Gestionar Usuarios -->
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
                    <!-- Expandible Mi Perfil -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
                            <span class="glyphicon glyphicon-user"></span> ${sessionScope.Admin}
                        <span class="caret"></span></a>
                        <!-- Lo que está adentro-->
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
        <h1 align="center">Modificar Orden</h1>
        <div class="container-fluid">
            <% if(npieza.equals("No")){ %>
            <!-- Orden sin piezas -->
            <%
                ResultSet resulta3 = bd.consulta("call ConsultaOrdenSP("+idO+");");
                while(resulta3.next()){
            %>   
            <div class="container-fluid text-center">
                <h3>Modificar Orden sin piezas</h3><BR>
                <form class="form-horizontal" method='post' action='/MQST/ModificaOrden' onSubmit="return confirmar()" onkeypress="return kp(event)">
                    <div class="form-group">
                        <input type="hidden" name="idO" value="<%out.println(idO);%>">
                        <input type="hidden" name="fechnc" value="<%out.print(resulta3.getString("fec2"));%>">
                        <label class="control-label col-md-5">ID de la Orden:  #<%out.print(idO);%> </label>
                        <label class="control-label col-md-2">Nuevo Costo: </label>
                        <div class="col-md-2">
                            <input type="number" class="form-control" value="<%out.print(resulta3.getInt("costo"));%>"
                                   placeholder="Costo del Producto" name="CostoNuevo" min="0" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Nombre del Cliente:</label>
                        <div class="col-md-6">
                            <select name="Clie" class="form-control" required>
                                <option value='<%out.println(clie);%>'> Actual: <%out.println(resulta3.getString("Nombre"));%> <%out.println(resulta3.getString("Apellido1"));%> <%out.println(resulta3.getString("Apellido2"));%></option>
                            <%  ResultSet resulta = bd.consulta("call ConsultasCliente()");
                                while(resulta.next()){
                                    if(clie.equals(resulta.getString("idC"))){
                                    } else {
                                        out.println("<option value='"+resulta.getInt("idC")+"'> "+resulta.getString("Nombre")+" "+resulta.getString("Ap1")+" "+resulta.getString("Ap2")+"</option>");
                                    }
                                }  
                            %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Fecha de Creación: </label>
                        <div class="col-md-2">
                            <input type="Text" value="<%out.print(resulta3.getString("fec1"));%>" name="fec1" class="form-control" readonly>
                        </div>
                        <label class="control-label col-md-2">Estado actual:</label> 
                        <div class="col-md-2">
                            <select name="EdoOrden" class="form-control" required>
                                <%  String oredo = oredo = resulta3.getString("edo");
                                    String idEdoO;
                                    ResultSet idE = bd.consulta("select * from estados where edos = '"+oredo+"'");
                                    while(idE.next()){
                                        idEdoO = idE.getString("idEdoSr");
                        %>      <option value='<%=idEdoO%>'><strong> Actual: </strong><%=oredo%></option>  <%
                            }
                                    ResultSet res = bd.consulta("select * from estados");
                                    while(res.next()){
                                        if(oredo.equals(res.getString("edos"))){
                                        }else{
                                            out.println("<option value='"+res.getString("idEdoSr")+"'>"+res.getString("edos")+"</option>");
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Fecha de Entrega actual: </label>
                        <div class="col-md-2">
                            <input type="Text" value="<%out.print(resulta3.getString("fec2"));%>" name="fecnm" class="form-control" readonly>
                        </div>
                        <label class="control-label col-md-2">¿Actualizar Fecha?: </label> 
                        <div class="col-md-2">
                            <input type="date" name="fec2" class="form-control">
                        </div> 
                    </div> 
                    <div class="form-group">
                        <label class="control-label col-md-3">Detalles:</label>
                        <div class="col-md-6">
                            <textarea rows="3" class="form-control" placeholder="Descripción para el producto" 
                                      name="detalles" required><%out.print(resulta3.getString("det"));%></textarea>
                        </div>
                    </div><BR>
                    <div class="form-group">
                        <input type="reset" class="btn btn-default" value="Limpiar" style="width: 20%">
                        <input type="submit" class="btn btn-primary" value="Confirmar Cambios" style="width: 20%">
                    </div>
                </form>
                <% } %>
            </div>  
        </div>
        <!-- Modificar Orden con Piezas-->
        <% } else if(npieza.equals("No")==false){
            ResultSet resulta2 = bd.consulta("call ConsultaOrdenP("+idO+");");
            while(resulta2.next()){
        %>   
        <div>
            <div class="container-fluid text-center">
                <h3>Modificar Orden con Piezas</h3><BR>
                <form class="form-horizontal" method='post' action='/MQST/ModificaOrdenPza' onSubmit='return confirmar()' onkeypress="return kp(event)">
                    <div class="form-group">
                        <label class="control-label col-md-5">ID de la Orden:  #<%out.println(idO);%> </label>
                        <!-- id de la orden -->
                        <input type="hidden" name="idOr" value="<%out.println(resulta2.getString("idOS"));%>">
                        <!-- id de la rel-->
                        <input type="hidden" name="idRel" value="<%out.println(resulta2.getString("id"));%>">
                        
                        <label class="control-label col-md-2">Costo:</label>
                        <div class="col-md-2">
                            <input type="number" class="form-control" value="<%out.print(resulta2.getInt("cost"));%>" 
                                   name="CostoNuevo" min="0" required>
                        </div>
                       
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label col-md-3">Nombre del Cliente:</label>
                        <div class="col-md-6">
                            <select name="Cliente" class="form-control" required>
                                <option value='<%out.println(clie);%>'> Actual: <%out.println(resulta2.getString("Nom"));%> <%out.println(resulta2.getString("Paterno1"));%> <%out.println(resulta2.getString("Materno1"));%></option>
                                <%  ResultSet resulta = bd.consulta("call ConsultasCliente()");
                                    while(resulta.next()){
                                        if(clie.equals(resulta.getString("idC"))){
                                        } else {
                                            out.println("<option value='"+resulta.getInt("idC")+"'>"+resulta.getString("Nombre")+" "+resulta.getString("Ap1")+" "+resulta.getString("Ap2")+"</option>");
                                        }
                                    }  
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Piezas:</label>
                        <%  
                            String pza = resulta2.getString("nomb");
                            String idp = "";
                            ResultSet id = bd.consulta("select * from ConsultaPieza where Producto = '"+pza+"'");
                            while(id.next()){
                                idp = id.getString("idPza");
                            }
                        %>
                        <div class="col-md-3">
                            <select name="Piezas" class="form-control" required>
                                <option value="<%out.println(idp);%>" selected> Actual: <%out.println(pza);%></option>
                                <%
                                    ResultSet rs = bd.consulta("call ConsultaPzas();");
                                    while(rs.next()){
                                        if(idp.equals(rs.getString("idPza"))){
                                        }else{
                                            out.println("<option value='"+rs.getInt("idPza")+"'>"+rs.getString("Producto")+"</option>") ;
                                        }
                                    }
                                %>
                            </select>
                        </div>
                        <label class="control-label col-md-1">Cantidad:</label> 
                        <div class="col-md-2">
                            <input type="number" class="form-control" value="<%out.print(resulta2.getInt("cantp"));%>" 
                                   name="Cant" min="1" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Fecha de Creación: </label>
                        <div class="col-md-2">
                            <input type="Text" value="<%out.print(resulta2.getString("fec1"));%>" name="fec1" class="form-control" readonly>
                        </div>
                        <label class="control-label col-md-2">Estado de la orden:</label>
                        <div class="col-md-2">
                            <select name="EdoOrden" class="form-control" required>
                                <%  String oredo = oredo = resulta2.getString("edo");
                                    String idEdoO;
                                    ResultSet idE = bd.consulta("select * from estados where edos = '"+oredo+"'");
                                    while(idE.next()){
                                        idEdoO = idE.getString("idEdoSr");
                        %>      <option value='<%=idEdoO%>'><strong> Actual: </strong><%=oredo%></option>  <%
                            }
                                    ResultSet res = bd.consulta("select * from estados");
                                    while(res.next()){
                                        if(oredo.equals(res.getString("edos"))){
                                        }else{
                                            out.println("<option value='"+res.getString("idEdoSr")+"'>"+res.getString("edos")+"</option>");
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Fecha de Entrega actual: </label>
                        <div class="col-md-2">
                            <input type="Text" value="<%out.print(resulta2.getString("fec2"));%>" class="form-control" readonly>
                            <input type="hidden" value="<%out.print(resulta2.getString("fec2"));%>" name="fecnm"> 
                        </div>
                        <label class="control-label col-md-2">¿Actualizar Fecha?: </label> 
                        <div class="col-md-2">
                            <input type="date" name="fec2" class="form-control">
                        </div> 
                    </div> 
                    <div class="form-group">
                        <label class="control-label col-md-3">Detalles:</label>
                        <div class="col-md-6">
                            <textarea rows="3" class="form-control" name="detalles" 
                                      required><%out.print(resulta2.getString("det"));%></textarea>
                        </div>
                    </div><BR>
                    <div class="form-group">
                        <input type="reset" class="btn btn-default" value="Limpiar" style="width: 20%">
                        <input type="submit" class="btn btn-primary" value="Confirmar Cambios" style="width: 20%">
                    </div>
                </form>
            </div>
        </div>
       <% } } %>
        <% bd.cierraConexion();
        } catch(Exception xxxD){} %>
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