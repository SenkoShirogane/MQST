package Catalogo;

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
/**
 *
 * @author Senko
 */
public class AgregarProductoC extends HttpServlet {

    @Override
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException{
        
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        try{
            Part foto = request.getPart("imagen");   //Este es el Part de la foto (Osea que aqui viene TODO sobre la foto, de este salen las variables de abajo...)
            long tamanioFoto = foto.getSize();         //El tamaño de la foto (Sirve para hacer validacion de tamaño)
            String tipoFoto = foto.getContentType();   //El tipo de extension de la foto, sirve para hacer validaciones (por ejemplo, validas que la foto sea .jpg o .png, etc)
            InputStream f = foto.getInputStream();     //Esta es la foto en sí
            
            String Nombre=request.getParameter("ProductoNuevo");
            String Costo=request.getParameter("CostoNuevo");
            String Detalles=request.getParameter("detalles");
            int idE= Integer.parseInt(request.getParameter("EstadoProducto"));
            int idp = Integer.parseInt(request.getParameter("ProveedorProducto"));
            String mensaje;
            ///////////////////////////////////////
            
            Funciones Funcion = new Funciones(); //Instanciamos la clase Funciones para poder utilizar el metodo guardaImagen...
            if(idE == 0){
                mensaje = "El Estado no puede estar en blanco.";
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                out.println("</html>"); 

            } else if (idp == 0){
                mensaje = "¡Agrega un Proveedor!";
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                out.println("</html>"); 
            } else {
                mensaje = Funcion.guardaImagenProducto(idp, idE, Nombre, Detalles, Costo, f);
                //resultados = sentencia.executeQuery("call AgregaProd('"+idp+"', '"+idE+"', '"+Nombre+"', '"+Detalles+"', '"+Costo+"', '"+Imagen+"') ");
                /*while(resultados.next()){
                    mensaje = resultados.getString("msj");
                } */ 
                if(mensaje.equals("¡Producto registrado con éxito!")){
                    out.println("<html>");
                    out.println("<head></head>");
                    out.println("<body onload=\"alert('"+mensaje+"'); window.location='/MQST/Productos/ConsultarCatalogo.jsp' \"></body>");
                    out.println("</html>"); 
                }
                if(mensaje.equals("Ya hay un producto con el mismo nombre.")){
                    out.println("<html>");
                    out.println("<head></head>");
                    out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                    out.println("</html>");
                }
            }
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