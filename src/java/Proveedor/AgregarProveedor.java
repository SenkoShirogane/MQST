package Proveedor;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

/**
 *
 * @author Senko
 */
public class AgregarProveedor extends HttpServlet {

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
        String nombre=req.getParameter("NombreProveedor");
        String ApPat=req.getParameter("ApPatProveedor");
        String ApMat=req.getParameter("ApMatProveedor");
        //String Usuario=req.getParameter("UsuarioProveedor");
        String Empresa=req.getParameter("EmpresaProveedor");
        String Correo=req.getParameter("CorreoProveedor");
        //String Contrasena=req.getParameter("ContrasenaProveedor");
        String Calle=req.getParameter("CalleProveedor");
        String Colonia=req.getParameter("ColoniaProveedor");
        String Estado=req.getParameter("EstadoProveedor");
        String CP=req.getParameter("CPProveedor");
        String TelCasa=req.getParameter("TelCasaProveedor");
        String TelCel=req.getParameter("TelCelProveedor");
        String Numero=req.getParameter("NumeroProveedor");
        String Municipio=req.getParameter("MunicipioProveedor");
        String mensaje= "";
        
    
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
	resultados = sentencia.executeQuery("call AltaProveedor('"+TelCasa+"','"+TelCel+"','"+Correo+"', '"+nombre+"', '"+ApPat+"', '"+ApMat+"','"+Calle+"','"+Numero+"','"+Municipio+"', '"+Colonia+"', '"+Estado+"', '"+CP+"', '"+Empresa+"');");
           while(resultados.next()){
              mensaje = resultados.getString("msj");
           }
        if (mensaje.equals("¡Proveedor registrado con éxito!")){
            out.println("<html>");
            out.println("<head></head>");
            out.println("<body onload=\"alert('"+mensaje+"'); window.location='/MQST/Proveedor/GestionarProveedores.jsp' \"></body>");
            out.println("</html>");
        } else{
            out.println("<html>");
            out.println("<head></head>");
            out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
            out.println("</html>");
        }
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