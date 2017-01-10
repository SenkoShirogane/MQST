<html
    <body>
        <script>
        function pruebadeKp(evt)
        {
            var charCode = (evt.which) ? evt.which : event.keyCode; //If simplificado
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
               alert('¡Sólo se aceptan números!');
               return false;
            }
            return true;
        };
        function validar(e) { // 1
            tecla = (document.all) ? e.keyCode : e.which; // 2
            if (tecla==8) return true; // 3
            patron =/[A-Za-zñÑ\s]/; // 4
            te = String.fromCharCode(tecla); // 5
            if (patron.test(te)){
                
            } else {
                alert("Ño.");
            }
            return patron.test(te); // 6
        }
        function validar2(e) { // 1
            tecla = (document.all) ? e.keyCode : e.which; // 2
            if (tecla==8) return true; // 3
            patron =/[''""<>]/; // 4
            te = String.fromCharCode(tecla); // 5
            if (!patron.test(te)){
            } else {
                alert("Lo sentimos, por el momento no está disponible esa tecla.");
            }
            return !patron.test(te); //6
        }
        
        </script>
        <h1>Validaciones</h1>
        <input type="text" onkeypress="return pruebadeKp(event)"> Acepta sólo numeros <BR>
        <input type="text" onkeypress="return validar(event)"> Acepta minusculas, mayusculas, espacio, ñ y Ñ (Acentos y simbolos no)<BR>
        <input type="text" onkeypress="return validar2(event)"> Acepta todo menos ' y " <BR>
        <h1>Form</h1>
        <form onkeypress="return validar(event)">
            <input type="text"><BR>
            <input type="text" onkeypress="return validar2(event)"> 
        </form>
    </body>
</html>

