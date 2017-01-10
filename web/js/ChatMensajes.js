/* JQuery */
$(function(){
    $("#textbox").keypress(function(event){
        if(event.which === 13){ /*El 13 no se para qué es.. pero es necesario*/
            $("#send").click();/*Para que se limpie x3*/
            event.preventDefault(); /*No agrega más líneas*/
        }
    });
    $("#send").click(function(){
        var inicio = "<div class='mensaje-amigo'><div class='contenido'>";
        var fin = "</div><div class='flecha-derecha'></div></div>";
        
        var newMessage = $("#textbox").val(); /*La variable userMessage obtendrá lo que se escribió*/
        $("#textbox").val("");/*Para que se limpie sin haber seleccionado la wea esa*/
        var prevState = $("#mensajes").html(); /*Variable que guarda los mensajes previos*/

        if(prevState.length > 22){ /*Para que ya no esté el pinshi espacio en blanco del comienzo x3 */
            prevState = prevState + "";
        }
        $("#mensajes").html(prevState + inicio + newMessage + fin);
        $("#mensajes").scrollTop($("#mensajes").prop("scrollHeight"));/*Para que el scroll baje conforme envías mensajes*/
    });
});
