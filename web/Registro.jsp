<%-- 
    Document   : Registro
    Created on : 20/10/2016, 07:01:24 PM
    Author     : Senko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>MQST - ¡Registrate!</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/Animaciones.js"></script>
        <script src="js/validator.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <link href="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" rel="stylesheet">
        <script src="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
        <style>
            #Checkbox .form-control {  padding-right: 10px; } #Checkbox .form-control-feedback { right: -30px; }
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
                    <a class="navbar-brand" href="index.jsp">
                        <span class="glyphicon glyphicon-home"></span> Inicio</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="Manuales.jsp">
                            <span class="glyphicon glyphicon-question-sign"></span> Manuales</a></li>
                        <li class="active"><a>
                                <span class="glyphicon glyphicon-user"></span> ¡Regístrate!</a></li>
                        <li><a data-toggle="modal" href="#Login">
                            <span class="glyphicon glyphicon-log-in"></span> Iniciar Sesión</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <h1 align="center">¡Bienvenido!</h1>
        <h3 align="center">Ingresa tus datos para registrarte.</h3>
        <div class="text-center container-fluid">
        <form class="form-horizontal text-center" method='post' onSubmit="return validarPasswd()" onkeypress="return kp(event)" 
              action='/MQST/RegistrarCliente' id="Registro">
            <div class="form-group">
                <label class="control-label col-md-3">Nombre:</label>
                <div class="col-md-6">
                    <input type="text" class="form-control" placeholder="Ingresa tu nombre." 
                           maxlength="20" name="NombreCliente" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Apellido Paterno:</label>
                <div class="col-md-2">
                    <input type="text" class="form-control" placeholder="Ingresa Apellido Paterno" 
                           maxlength="25" name="ApPatCliente" required>
                </div>
                <label class="control-label col-md-2">Apellido Materno:</label>
                <div class="col-md-2">
                    <input type="text" class="form-control" placeholder="Ingresa Apellido Materno" 
                           maxlength="25" name="ApMatCliente" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Usuario:</label>
                <div class="col-md-6">
                    <input type="text" class="form-control" placeholder="Ingresa el Username que quieras utilizar." 
                           maxlength="12" name="UsuarioCliente" required minlength="5">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">E-mail:</label>
                <div class="col-md-6">
                    <input type="email" class="form-control" placeholder="Ingresa tu Correo Electrónico." 
                           maxlength="25" name="CorreoCliente" id="Email" required onkeypress="return correo(event)">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Repite tu E-mail:</label>
                <div class="col-md-6">
                    <input type="email" class="form-control" placeholder="Repite tu Correo Electrónico." id="Email2"
                           maxlength="25" name="CorreoCliente2" onkeypress="return correo(event)">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Password:</label>
                <div class="col-md-6">
                    <input type="password" class="form-control" placeholder="Ingresa tu nueva contraseña." 
                           maxlength="32" name="ContrasenaCliente" id="psw" minlength="8" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Repite tu Password:</label>
                <div class="col-md-6">
                    <input type="password" class="form-control" placeholder="Repite tu nueva contraseña." 
                           maxlength="32" name="ContrasenaCliente2" id="psw2" minlength="8" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Estado:</label>
                <div class="col-md-3">
                    <input type="text" class="form-control" placeholder="Ingresa el Estado donde vives" 
                           name="EstadoCliente" required maxlength="40">
                </div>
                <label class="control-label col-md-1">Municipio:</label>
                <div class="col-md-2">
                    <input type="text" class="form-control" placeholder="Ingresa Municipio" 
                           name="MunicipioCliente" required maxlength="40" >
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Colonia:</label>
                <div class="col-md-3">
                    <input type="text" class="form-control" placeholder="Ingresa tu colonia" 
                           name="ColoniaCliente" required maxlength="40">
                </div>
                <label class="control-label col-md-1">C.P:</label>
                <div class="col-md-2 inputnumber">
                    <input type="number" class="form-control" placeholder="Ingresa Código Postal" 
                           name="CPCliente" min="0" max="999999" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Calle:</label>
                <div class="col-md-3">
                    <input type="text" class="form-control" placeholder="Ingresa la calle en la que vives" 
                           maxlenght="50" name="CalleCliente" required>
                </div>
                <label class="control-label col-md-1">Número:</label>
                <div class="col-md-2 inputnumber">
                    <input type="number" class="form-control" placeholder="Numero exterior" 
                           name="NumeroCliente" min="0" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Teléfono de Casa:</label>
                <div class="col-md-2 inputnumber">
                    <input type="number" class="form-control" placeholder="Ingresa tu numero de casa" 
                           name="TelCasaCliente" min="0" required>
                </div>
                <label class="control-label col-md-2">Celular:</label>
                <div class="col-md-2 inputnumber">
                    <input type="number" class="form-control" placeholder="Ingresa tu numero celular" 
                           name="TelCelCliente" min="0" required>
                </div>
            </div>
            <div class="form-group" id="Checkbox">
                <label class="checkbox-inline"><input type="checkbox" name="Condiciones" required class="form-group">
                        Acepto los <a target="Condiciones" href="/MQST/Cliente/Condiciones.jsp">Términos y Condiciones.</a></label>
            </div><BR>
            <div class="form-group">
                <input type="reset" class="btn btn-default" value="Limpiar" style="width: 20%">
                <input type="submit" class="btn btn-primary" value="Confirmar Datos" style="width: 20%">
            </div>
        </form>
        </div>
        <BR><BR>
        <!-- Inicio Modal -->
        <div class="modal fade" id="Login" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form class="form-horizontal" method='post' action='/MQST/IniciarSesion' onkeypress="return kp(event)" id="FormLogin">
                        <div class="modal-header">
                             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                             <h1 class="modal-title" align="center">Inicio de Sesión</h1>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label class="control-label col-md-3">Usuario:</label>
                                <div class="col-md-7">
                                    <input type="text" class="form-control" placeholder="Ingresa tu nombre de usuario" 
                                           name="UsuarioCliente" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Password:</label>
                                <div class="col-md-7">
                                    <input type="password" class="form-control" placeholder="Ingresa tu Contraseña" 
                                           name="ContrasenaCliente" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-7 col-md-offset-3">
                                    <input type="submit" class="btn btn-primary" value="Iniciar Sesión" style="width: 100%">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-danger pull-left" data-dismiss="modal">
                                <span class="glyphicon glyphicon-remove"></span> Salir del Inicio de Sesión </button>
                            ¿Aún no estás registrado? <a href="/MQST/Registro.jsp">Registrarse</a><BR>
                            <a>¿Olvidaste tu Contraseña?</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Fin -->
        <footer class="container-fluid text-center">
            <a href="#Inicio" title="Volver al Inicio">
                <span class="glyphicon glyphicon-chevron-up" style="font-size:20px;"></span>
            </a>
            <p>MacQuality Service Tracker By <a href="QuienesSomos.jsp" title="¿Quienes Somos?">Sofficcesware</a></p>
            << <a href="/MQST/Cliente/Condiciones.jsp">Terminos y Condiciones</a> >>
        </footer>
    </body>
</html>

