package Proveedor;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

/**
 *
 * @author Senko
 */
public class ModificarProveedor extends HttpServlet {

  @Override
  public void init(ServletConfig conf)
    throws ServletException {
    super.init(conf);
  }

  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {
    res.setContentType("text/html;charset=UTF-8");
    req.setCharacterEncoding("UTF-8");

    Connection conexion = null;
    Statement sentencia = null;
    ResultSet resultados = null;
    //Nombre
        String Empresa=req.getParameter("EmpresaMod");
        String nombre=req.getParameter("NombreMod");
        String ApPat=req.getParameter("ApPatMod");
        String ApMat=req.getParameter("ApMatMod");
        String Correo=req.getParameter("CorreoMod");
        String Calle=req.getParameter("CalleMod");
        String Colonia = req.getParameter("ColoniaMod");
        String Estado=req.getParameter("EstadoMod");
        String CP=req.getParameter("CPMod");
        String TelCasa=req.getParameter("TelefonoMod");
        String TelCel=req.getParameter("CelularMod");
        String Numero=req.getParameter("NumeroMod");
        String Municipio=req.getParameter("DelegacionMod");
        
    PrintWriter out = res.getWriter();
    
    try {
        HttpSession ses = req.getSession();
        //Leemos el driver de MySQL
	Class.forName("com.mysql.jdbc.Driver");

	//Nos conectamos a la BD local
	conexion = DriverManager.getConnection (
            "jdbc:mysql://127.0.0.1:3306/MQST", //nombre bases de datos
            "root","n0m3l0");

	//para buscar los registros
	sentencia = conexion.createStatement();
	sentencia.executeUpdate(" call ModificaProveedor('"+TelCasa+"','"+TelCel+"','"+Correo+"','"+nombre+"','"+ApPat+"','"+ApMat+"','"+Calle+"','"+Numero+"','"+Municipio+"','"+Colonia+"','"+Estado+"','"+CP+"','"+Empresa+"'); ");
        
        res.sendRedirect("/MQST/Proveedor/GestionarProveedores.jsp");
        //?EmpresaMod=Apol
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