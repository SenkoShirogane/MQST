package Administrador;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author IPN
 */
    public class EliminarPza extends HttpServlet {
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
        
        String nombre = request.getParameter("nombreP");
        String mensaje = "";
            
        try{
            HttpSession sesion = request.getSession();
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection (cadenaConexion,usuarioBD,clave);
            sentencia = conexion.createStatement();

            resultados = sentencia.executeQuery("call EliminaPza('"+nombre+"');");
            while(resultados.next()){
                mensaje = resultados.getString("MSJ");
            }
            
            out.println("<html>");
            out.println("<head></head>");
            out.println("<body onload=\"alert('"+mensaje+"'); window.location='/MQST/Administrador/InicioAdmin.jsp' \"></body>");
            out.println("</html>");    
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}