<%-- 
    Document   : Condiciones
    Created on : 3/11/2016, 06:49:52 PM
    Author     : CITLALLI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>MQST - Términos y Condiciones.</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="../js/Animaciones.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
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
                    <% HttpSession sesion = request.getSession(); %>
                    <% if(sesion.getAttribute("Admin")==null){%>
                    <li><a href="Contacto.jsp">
                           <span class="glyphicon glyphicon-comment"></span> ¡Contáctanos!</a></li>
                    <li><a href="Manuales.jsp">
                           <span class="glyphicon glyphicon-question-sign"></span> Manuales</a></li>
                    <% } %>
                </ul>
              </div>
            </div>
        </nav>
        <h1 align="center">Términos y Condiciones</h1>
        <h3 align="center">¡Lee con atención los siguientes puntos!</h3>
        <div class="container-fluid">
        <div class="col-md-offset-2 col-md-8">
        <h2>CONDICIONES PARA EL CLIENTE</h2>
        <ol type="1" align="justify">
        <li> Ni <strong>Raúl Núñez Estrada</strong>, ni su departamento de servicio así como el personal que en él laboran por 
            ningún motivo se hacen responsables por la información contenida en cualquier medio de almacenamiento 
            entregado a nosotros o del daño que esta sufra durante la revisión o reparación del equipo que lo 
            contiene ya que es responsabilidad del usuario tener respaldo de su información antes de someter a 
            cualquier revisión su equipo. Mediante la firma de conformidad del cliente a estas condiciones, se 
            exime a <strong>Raúl Núñez Estrada</strong> de cualquier responsabilidad por la información contenida en el equipo 
            descrito en esta orden de reparación.</p>

        <li> Los trabajos efectuados al amparo de esta orden de reparación están garantizados por <strong>Raúl Núñez Estrada</strong>
            por tres meses a partir de la fecha en que se reparó el equipo. En caso de aplicar la garantía 
            por reparación se corregirá cualquier defecto de los materiales o mano de obra usados en 
            la reparación, siempre y cuando el equipo ingrese inmediatamente a nuestro <i>Centro de Servicio</i> 
            junto con una copia de esta Orden de Reparación. Nos reservamos el derecho de invalidar cualquier 
            garantía si detectamos que la reparación que nosotros hicimos fue modificada después de la fecha de 
            entrega del equipo al cliente.</p>

        <li> Nuestra garantía limitada o nuestro servicio no afecta la duración de la garantía original de 
            la fabrica del producto, la cual está basada en la fecha de adquisición del mismo. (Recurra al manual 
            de usuario o póliza de garantía original de su producto para más detalles al respecto). </p>

        <li> Esta ni ninguna otra garantía aplica si el producto ha sido dañado por accidente, agresión o
            mal uso, o como resultado de una intervención, modificación o servicio realizado por el personal 
            ajeno a un centro de servicio autorizado por el fabricante del equipo. Los cargos por el servicio 
            que se requiera en estas circunstancias se cotizarán bajo el criterio del tiempo y los materiales 
            necesarios para la reparación. </p>

        <li> Nuestro personal técnico realiza una revisión al equipo descrito en esta orden para 
            posteriormente cotizar el costo de la reparación. </p>

        <li> Si el cliente acepa la cotización de la reparación del equipo descrito en esta orden deberá 
            pagar el importe de las refacciones mas el importe por mano de obra y en caso de haberlo solicitado, 
            el importe por el recolección o entrega a domicilio. Aceptando la cotización para la reparación de su 
            equipo no se cobrará importe por revisión. </p>

        <li> Si el cliente decide no reparar su equipo una vez que se haya presentado la cotización, se 
            cobrara por concepto de revisión <i>(400 pesos M.N. mas I.V.A.)</i> </p>

        <li> En el caso de que transcurran mas de los <i>30 días</i> de realizado la cotización de reparación y no
            tengamos respuesta por parte del cliente acerca de como debemos proceder con su equipo, 
            (repararlo o no) el equipo descrito en esta orden le será devuelto sin ser reparado y se le cobrara
            el importe por revisión <i>($400.00 pesos M.N. mas I.V.A.)</i>. En caso de que el equipo no pueda ser 
            devuelto por causas ajenas a nuestros mensajeros, el cliente deberá recogerlo en nuestras oficinas 
            en un lapso no mayor a 90 días, de lo contrario no nos hacemos responsables del equipo no reclamado,
            haya sido reparado o no. </p>

        <li> <strong>Raúl Núñez Estrada</strong> no se hace responsable por accesorios no declarados en esta
            orden de reparación. </p>

        <li> <strong>Raúl Núñez Estrada</strong> solo entregará el equipo descrito al portador de esta 
            orden relevando el cliente a nuestra empresa de toda responsabilidad por el extravío de la misma y 
            siendo necesario para la entrega del equipo la presentación de un comprobante de propiedad del equipo 
            por parte del cliente (factura). </p>

        <li> Mediante la firma de la presente orden de reparación, el cliente libera a <strong>Raúl Núñez Estrada</strong>, 
            de cualquier responsabilidad sobre el estado legal del equipo que entrega para servicio así como del 
            software instalado o contenido en éste dejando por entendido que el cliente conoce las disposiciones 
            legales que existen en cuestiones de piratería del software en nuestro país. Por ningún motivo 
            instalaremos software del cual el cliente no acredite su propiedad legal aún y cuando la reparación 
            así lo requiera. </p>

        <li> <strong>Raúl Núñez Estrada</strong> se rige para la aplicación de garantías para equipo nuevo en
            las políticas establecidas por el fabricante mismo. </p>
        </ol>
        <p align="justify"> Estoy de acuerdo con los datos asentados en esta orden y conozco de la las condiciones de la misma por
            lo que autorizo a <strong>Raúl Núñez Estrada</strong> a efectuar las revisiones necesarias para la cotización o reparación 
            del equipo y acepto liquidar el importe que aplique por la revisión, mano de obra y las refacciones 
            necesarias, la aceptación de este documento por el cliente y/o su representante implica la aceptación de los
            puntos arriba mencionados </p>
        </div>
        </div>
        
        <footer class="container-fluid text-center">
            <a href="#Inicio" title="Volver al Inicio">
                <span class="glyphicon glyphicon-chevron-up" style="font-size:20px;"></span>
            </a>
            <p>MacQuality Service Tracker By <a href="/MQST/QuienesSomos.jsp" title="¿Quienes Somos?">Sofficcesware</a></p>
            << Terminos y Condiciones >>
        </footer>
    </body>
</html>

