package Catalogo;

import Imagen.Funciones;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

/**
 *
 * @author Senko
 */
public class ModificarProductoC extends HttpServlet {

    @Override
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException{
        
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        try{
            Part foto = request.getPart("imagenMod");   //Este es el Part de la foto (Osea que aqui viene TODO sobre la foto, de este salen las variables de abajo...)
            long tamanioFoto = foto.getSize();         //El tamaño de la foto (Sirve para hacer validacion de tamaño)
            String tipoFoto = foto.getContentType();   //El tipo de extension de la foto, sirve para hacer validaciones (por ejemplo, validas que la foto sea .jpg o .png, etc)
            InputStream f = foto.getInputStream();     //Esta es la foto en sí
            
            String Nombre=request.getParameter("NombreModProducto");
            String Costo=request.getParameter("CostoModProd");
            String Detalles=request.getParameter("detallesMod");
            int idE= Integer.parseInt(request.getParameter("EstadoModProducto"));
            int idp = Integer.parseInt(request.getParameter("ProveedorModProducto"));
            String mensaje = "";
            
            //String Imagen2 = request.getParameter("imagenOriginal");
            
            ///////////////////////////////////////
            Funciones Funcion = new Funciones(); //Instanciamos la clase Funciones para poder utilizar el metodo guardaImagen...
            
            //resultados = sentencia.executeQuery("call ModificaProducto('"+idp+"', '"+idE+"', '"+Nombre+"', '"+Detalles+"', '"+Costo+"', '"+Shida+"') ");
            Funcion.modificaImagenProducto(idp, idE, Nombre, Detalles, Costo, f); //f es la imagen
            mensaje = "¡Producto Modificado con éxito!";
            /*while(resultados.next()){
                mensaje = resultados.getString("msj");
            } */
            out.println("<html>"); 
            out.println("<head></head>");
            out.println("<body onload=\"alert('"+mensaje+"'); window.location='/MQST/Productos/ConsultarCatalogo.jsp' \"></body>");
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