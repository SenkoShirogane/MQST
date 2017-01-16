//JQuery
$(function(){
    $("#textbox").keypress(function(event){
        if(event.which === 13){ /*El 13 no se para qué es.. pero es necesario*/
                $("#Send").click();/*Para que se limpie x3*/
                event.preventDefault(); /*No agrega más líneas*/
        }
    });

    $("#Send").click(function(){
        $("#mensajes").scrollTop($("#mensajes").prop("scrollHeight"));/*Para que el scroll baje conforme envías mensajes*/
    });
});

//JavaScript
document.observe("dom:loaded", function() {
    function container(text) {
        $("mensajes").innerHTML = $("mensajes").innerHTML + "<div class='mensaje-autor'><div class='flecha-izquierda'></div><div class='contenido'>" + (!Object.isUndefined(text) && text !== null ? text.escapeHTML() : "null")  + "</div></div>"; 
    }
    function containerC(text) {
        $("mensajes").innerHTML = $("mensajes").innerHTML + "<div class='mensaje-amigo'><div class='contenido'>" + (!Object.isUndefined(text) && text !== null ? text.escapeHTML() : "null")  + "</div><div class='flecha-derecha'></div></div>"; 
    }

    if (!window.WebSocket) {
        alert("No se soporta WebSocket :C");
    }

    var ws;
    $("uriForm").observe("submit", function(e) {
        e.stop();
        ws = new WebSocket($F("uri"));
        ws.onopen = function() {
            container("Conexión establecida");
            //container("");
        };
        ws.onmessage = function(e) {
            container(e.data);
        };
        ws.onclose = function() {
            container("Desconexión");
            $("uri", "connect").invoke("enable");
            $("disconnect").disable();
            ws = null;
        };
        $("uri", "connect").invoke("disable");
        $("disconnect").enable();
    });

    $("sendForm").observe("submit", function(e) {
        e.stop();
        if (ws) {
            var textbox = $("textbox");
            ws.send(textbox.value);
            containerC(textbox.value );
            textbox.value = "";
            textbox.focus();
        }
    });

    $("disconnect").observe("click", function(e) {
        e.stop();
        if (ws) {
            ws.close();
            ws = null;
        }
    });
});
