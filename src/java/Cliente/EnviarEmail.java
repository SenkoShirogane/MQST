/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Cliente;

import Cliente.Email;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EnviarEmail extends HttpServlet {
    
    @Override
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException{
        
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        try{
            Email email = new Email();
            String de = "sofficcesware.ssw@gmail.com";
            String clave = "sofficcesware2016";
            String para = "dankuso99@live.com.mx";
            String mensaje = request.getParameter("Usuario") + " le envio estos comentarios sobre la pagina web: " + request.getParameter("mensaje");
            String asunto = "Comentarios desde MQST por parte de " + request.getParameter("Correo");
            String msj = "";
            
            boolean resultado = email.enviarCorreo(de, clave, para, mensaje, asunto);
            if(resultado){
                msj = "¡Correo Enviado!";
            } else {
                msj = "Lo sentimos, ha ocurrido un error. Vuelva a enviar el correo más tarde.";
            }
            ///////////////////////////////////////
            out.println("<html>"); 
            out.println("<head></head>");
            out.println("<body onload=\"alert('"+msj+"'); window.location='/MQST/index.jsp' \"></body>");
            out.println("</html>");
            
        }catch (Exception e){
            out.println("ERROR: " + e);
        }
    }
}