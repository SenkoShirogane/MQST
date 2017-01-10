package Proveedor;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

/**
 *
 * @author Senko
 */
public class EliminarProveedor extends HttpServlet {

  @Override
  public void init(ServletConfig conf)
    throws ServletException {
    super.init(conf);
  }

  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

    Connection conexion = null;
    Statement sentencia = null;
    ResultSet resultados = null;
    //Nombre
        String Empresa=req.getParameter("EmpresaEl");
        
    res.setContentType("text/html;charset=UTF-8");
    req.setCharacterEncoding("UTF-8");
    PrintWriter out = res.getWriter();
    
    try {
        HttpSession ses7 = req.getSession();
        //Leemos el driver de MySQL
	Class.forName("com.mysql.jdbc.Driver");

	//Nos conectamos a la BD local
	conexion = DriverManager.getConnection (
            "jdbc:mysql://127.0.0.1:3306/MQST", //nombre bases de datos
            "root","n0m3l0");

	//para buscar los registros
	sentencia = conexion.createStatement();
	sentencia.executeUpdate("call EliminaProveedor('"+Empresa+"')");
        
        res.sendRedirect("../MQST/Proveedor/GestionarProveedores.jsp");
        
    }catch (ClassNotFoundException e1) {
                //Error si no puedo leer el driver de Oracle 
		out.println("ERROR:No encuentro el driver de la BD: "+
				e1.getMessage());
    }catch (SQLException e2) {
                //Error SQL: login/passwd mal
		out.println("ERROR:Fallo en SQL: "+e2.getMessage());
    }finally {
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
  public void doPost(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {
    doGet(req, res);
  }
}