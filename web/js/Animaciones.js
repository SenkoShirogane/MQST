/* Volver al inicio*/
$(document).ready(function(){
      $(".navbar a, footer a[href='#Inicio']").on('click', function(event) {
      if (this.hash !== "") {
        event.preventDefault();
        var hash = this.hash;
        $('html, body').animate({
          scrollTop: $(hash).offset().top
        }, 900, function(){
          window.location.hash = hash;
          });
      } });
    });
/* Animaciones */
$(window).scroll(function() {
  $(".slideanim").each(function(){
    var pos = $(this).offset().top;
    var winTop = $(window).scrollTop();
    if (pos < winTop + 600) {
      $(this).addClass("slide");
    }
  });
});

/* Validaciones */
function validarPasswd(){
    var p1 = document.getElementById("psw").value;
    var p2 = document.getElementById("psw2").value;
    var p3 = document.getElementById("Email").value;
    var p4 = document.getElementById("Email2").value;
    
    if(p3!=p4){
        if (p1 != p2) {
            alert("¡No coinciden las contraseñas ni los correos!");
        } else { 
            alert("¡Los correos deben de coincidir!");
        }
        return false; 
    } else {
        if (p1 != p2) {
            alert("¡No coinciden las contraseñas!");
            return false;
        } else { 
            return true; 
        }
    }
}
function validarEmail(){
    var p3 = document.getElementById("Email").value;
    var p4 = document.getElementById("Email2").value;
    if (p3 != p4) {
        alert("¡No coinciden los E-mail!");
        return false;
    } else { 
        return true; 
    }
}
function confirmar(){
    var respuesta;
    respuesta=confirm("¿Estás seguro?");
    if(respuesta){ return true;
    } else { return false; }
};
function confirmar2(){
    var respuesta;
    respuesta=confirm("¿Estás seguro?");
    if(respuesta){
        alert("¡Realizado con éxito!");
        return true;
    } else { return false; }
};
function vn(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode; //If simplificado
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
       alert('¡Sólo se aceptan números!');
       return false;
    } return true;
};
function kp(e){
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla==8) return true; // 3
    patron =/[''""<>]/; // 4
    te = String.fromCharCode(tecla); // 5
    if (!patron.test(te)){
    } else { alert("Lo sentimos, por el momento no está disponible esa tecla."); }
    return !patron.test(te); //6
};
function correo(e){
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla==8) return true; // 3
    patron =/[áéíóú´]/; // 4
    te = String.fromCharCode(tecla); // 5
    if (!patron.test(te)){
    } else { alert("Lo sentimos, no se aceptan los acentos en el correo."); }
    return !patron.test(te); //6
};
