package BD;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class IniciarSesion extends HttpServlet {

    
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
        
        String usuario, contrasena, mensaje;
            usuario = request.getParameter("UsuarioCliente");
            contrasena = request.getParameter("ContrasenaCliente");
            
        int idC, idA;
        idC = 0;
        idA = 0;
            
        try{
            
            HttpSession sesion = request.getSession();
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection (cadenaConexion,usuarioBD,clave);
            sentencia = conexion.createStatement();
            
            resultados = sentencia.executeQuery("Call IniciarSesion('"+usuario+"', '"+contrasena+"');");
            while(resultados.next()){
                idA = resultados.getInt("idA");
                idC = resultados.getInt("idC");
            }
                
            if(idA != 0){
                sesion.setAttribute("Admin", usuario);
                response.sendRedirect("Administrador/Perfil.jsp"); //Lo cambié x3
            }
            if(idC != 0){
                sesion.setAttribute("Cliente", usuario);
                response.sendRedirect("Cliente/MiPerfil.jsp");
            }
            mensaje = "No estas registrado o tus datos no estan registrados";
            if(idA ==0 && idC == 0){
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}