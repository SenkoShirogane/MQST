package Administrador;

import Imagen.Funciones;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ModificaPieza extends HttpServlet {

    @Override
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException{
        
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        try{
            Part foto = request.getPart("img");    //Este es el Part de la foto (Osea que aqui viene TODO sobre la foto, de este salen las variables de abajo...)
            long tamanioFoto = foto.getSize();         //El tamaño de la foto (Sirve para hacer validacion de tamaño)
            String tipoFoto = foto.getContentType();   //El tipo de extension de la foto, sirve para hacer validaciones (por ejemplo, validas que la foto sea .jpg o .png, etc)
            InputStream f = foto.getInputStream();     //Esta es la foto en sí
            
            String mensaje = "";
            String pre = request.getParameter("pre");
            String det = request.getParameter("det");
            String nombrep = request.getParameter("NP");
            int idedo = Integer.parseInt(request.getParameter("Edo"));
            int idprov = Integer.parseInt(request.getParameter("Prov"));
            int canta = Integer.parseInt(request.getParameter("cant")); //vieja
            int cantn = Integer.parseInt(request.getParameter("ncant")); //nueva
            
            Funciones Funcion = new Funciones(); //Instanciamos la clase Funciones para poder utilizar el metodo guardaImagen...
            /*
            Part foto1 = request.getPart("imgvieja");
            InputStream f1 = foto.getInputStream(); 
            
            if(foto==null){
                Funcion.modificaImagenPieza(idprov, idedo, nombrep, det, pre, f1, canta, cantn); //f es la imagen
            }else{
                Funcion.modificaImagenPieza(idprov, idedo, nombrep, det, pre, f, canta, cantn); //f es la imagen
            }
            */
            
            //resultados = sentencia.executeQuery("call ModificaPieza('"+idprov+"', '"+idedo+"', '"+nombrep+"', '"+det+"', '"+pre+"','"+img+"', '"+canta+"', '"+cantn+"');");
            mensaje = "¡Pieza modificada con éxito!";
            Funcion.modificaImagenPieza(idprov, idedo, nombrep, det, pre, f, canta, cantn); //f es la imagen
            /*while(resultados.next()){
                mensaje = resultados.getString("msj");
            } */
            out.println("<html>"); 
            out.println("<head></head>");
            out.println("<body onload=\"alert('"+mensaje+"'); window.location='/MQST/Administrador/InicioAdmin.jsp' \"></body>");
            out.println("</html>");
                
            //////////////////////////////////////
            /*
            if (tamanioFoto < 1500000L) { //Se valida que la foto no mida mas de 1500000 bytes 
                if (tipoFoto.equals("image/jpeg") || tipoFoto.equals("image/png") || tipoFoto.equals("image/jpg") || tipoFoto.equals("image/gif")) { //Se valida que la foto sea del tipo correcto
                    Funcion.guardaImagenPieza(pasa, f); //Si todo fue correcto se envia la foto a Funciones.java
                }else {
                    out.println("Hola");
                    //out.println("ERROR: Sólo se aceptan imágenes GIF,PNG,JPG");
                }
            }
            */
        }catch (Exception e){
            out.println("ERROR: " + e);
        }
    }
}