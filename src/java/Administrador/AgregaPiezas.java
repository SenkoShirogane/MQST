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

public class AgregaPiezas extends HttpServlet {
    
    @Override
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException{
        
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        try{
            Part foto = request.getPart("imagen");//Este es el Part de la foto (Osea que aqui viene TODO sobre la foto, de este salen las variables de abajo...)
            long tamanioFoto = foto.getSize();         //El tamaño de la foto (Sirve para hacer validacion de tamaño)
            String tipoFoto = foto.getContentType();   //El tipo de extension de la foto, sirve para hacer validaciones (por ejemplo, validas que la foto sea .jpg o .png, etc)
            InputStream f = foto.getInputStream();     //Esta es la foto en sí
            
            String pasa = "", nombre;
            int idE= Integer.parseInt(request.getParameter("EstadoPieza"));
            int cant= Integer.parseInt(request.getParameter("CantidadNuevo"));
            int idp = Integer.parseInt(request.getParameter("ProveedorPieza"));
            int numero = 0;
           
            String det= request.getParameter("detalles");
            String name= request.getParameter("NombrePieza");
            String cost= request.getParameter("CostoPieza");
            String mensaje;
            ///////////////////////////////////////
            Funciones Funcion = new Funciones(); //Instanciamos la clase Funciones para poder utilizar el metodo guardaImagen...
            
            char[] arreglo;
            nombre = name;
            arreglo = nombre.toCharArray();
            char valor;
            for(int i = 0; i < arreglo.length; i++){
                valor = arreglo[i];
                
                if(valor == ' '){
                    pasa = "no";
                }
            }
           
            if(pasa.equals("no")){
                mensaje = "El nombre de la pieza no debe tener espacios en blanco";
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                out.println("</html>"); 
            }
            else{
                if(idp == 0){
                    mensaje = "Debes escoger un proveedor";
                    out.println("<html>");
                    out.println("<head></head>");
                    out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                    out.println("</html>"); 
                }else{
                    mensaje = Funcion.guardaImagenPieza(idp, idE, name, det, cost, f, cant); //f es la imagen
                    
                    if(mensaje.equals("¡Pieza registrada con éxito!")){
                        out.println("<html>"); 
                        out.println("<head></head>");
                        out.println("<body onload=\"alert('"+mensaje+"'); window.location='/MQST/Administrador/InicioAdmin.jsp' \"></body>");
                        out.println("</html>");
                    }
                    if(mensaje.equals("Ya hay una pieza con el mismo nombre.")){
                        out.println("<html>");
                        out.println("<head></head>");
                        out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                        out.println("</html>");
                    }
                    
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
    /*
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    */
}