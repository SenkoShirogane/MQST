
package Administrador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class ModificaOrden extends HttpServlet {

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
        
        String idOr, costn, mensaje, idClie, edo, fech1, fech2, det;
            idOr = request.getParameter("idO");
            costn = request.getParameter("CostoNuevo");
            idClie = request.getParameter("Clie");
            edo = request.getParameter("EdoOrden");
            fech1 = request.getParameter("fec1");
            fech2 = request.getParameter("fec2");
            det = request.getParameter("detalles");
        try{
            
            HttpSession sesion = request.getSession();
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection (cadenaConexion,usuarioBD,clave);
            sentencia = conexion.createStatement();
            
            if(fech2.equals("")){
                fech2 = request.getParameter("fecnm");
            }
            
            //validamos que todos esten llenos
            if(idOr.equals("") && costn.equals("") && idClie.equals("") && edo.equals("") && fech1.equals("") && fech2.equals("") && det.equals("")){
                mensaje = "Debes de completar todos los campos";
                
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                out.println("</html>");
            }
            
            //Procedimiento
            resultados = sentencia.executeQuery("call ModificaOrden('"+idOr+"', '"+idClie+"', '"+edo+"', '"+det+"', '"+costn+"', '"+fech1+"', '"+fech2+"')");
            while(resultados.next()){
                mensaje = resultados.getString("MSJ");
                
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); window.location='/MQST/Ordenes/Ordenes.jsp' \"></body>");
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
