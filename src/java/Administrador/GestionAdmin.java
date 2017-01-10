package Administrador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class GestionAdmin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        Connection conexion = null;
        Statement sentencia = null;
        ResultSet resultados = null;
        
        String cadenaConexion = "jdbc:mysql://127.0.0.1:3306/MQST";
        String usuarioBD= "root";
        String clave ="n0m3l0";
        
        String usuario, contrasena, msj;
            usuario = request.getParameter("User");
            contrasena = request.getParameter("Pass");
            msj = "";
            int opc;
            int id =0;
        try{
            HttpSession sesion = request.getSession();
            
            String NombUsr = sesion.getAttribute("Admin").toString();
            
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection (cadenaConexion,usuarioBD,clave);
            sentencia = conexion.createStatement();
            
            if(NombUsr.equals(usuario)){
                opc = 1;
            } 
            else {
                opc = 2;
            }
            
            resultados = sentencia.executeQuery("call EliminaUsuarios('"+usuario+"', '"+contrasena+"');");
            while(resultados.next()){
                msj = resultados.getString("mensaje");
            }

            if(opc == 1){
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+msj+"'); window.location='/MQST/index.jsp' \"></body>");
                out.println("</html>");
                sesion.invalidate();
            }
            if(opc == 2){
                msj="¡Borraste Correctamente tu cuenta!";
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+msj+"'); window.location='/MQST/Administrador/GestionarAdministradores.jsp' \">"
                            + "</body>");
                out.println("</html>");
            }
            
        }
            catch (ClassNotFoundException e1){
            out.println("ERROR:No encuentro el driver de la BD: "+ e1.getMessage());
        }
        catch (SQLException e2) {
                //Error SQL: login/passwd mal
		out.println("ERROR:Fallo en SQL: "+e2.getMessage());
	}
        finally {
                //Finalmente desconecto de la BD
		try {
			if (conexion!=null)
				conexion.close();
		} catch (SQLException e3) {
			out.println("ERROR:Fallo al desconectar de la BD: "+
				e3.getMessage());
		}
	
	}
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}