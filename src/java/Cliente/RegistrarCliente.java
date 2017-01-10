package Cliente;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class RegistrarCliente extends HttpServlet {

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
    PrintWriter out = res.getWriter();
    
    Connection conexion = null;
    Statement sentencia = null;
    ResultSet resultados = null;
    //Nombre
        String nombre=req.getParameter("NombreCliente");
        String ApPat=req.getParameter("ApPatCliente");
        String ApMat=req.getParameter("ApMatCliente");
        String Usuario=req.getParameter("UsuarioCliente");
        String Correo=req.getParameter("CorreoCliente");
        String Contrasena=req.getParameter("ContrasenaCliente");
        String Contrasena2=req.getParameter("PSW");
        String Calle=req.getParameter("CalleCliente");
        String Colonia=req.getParameter("ColoniaCliente");
        String Estado=req.getParameter("EstadoCliente");
        String CP=req.getParameter("CPCliente");
        String TelCasa=req.getParameter("TelCasaCliente");
        String TelCel=req.getParameter("TelCelCliente");
        String Numero=req.getParameter("NumeroCliente");
        String Municipio=req.getParameter("MunicipioCliente");
        String mensaje = "";
        
    
    
    try {
        HttpSession sesion = req.getSession();
        //Leemos el driver de MySQL
	Class.forName("com.mysql.jdbc.Driver");

	//Nos conectamos a la BD local
	conexion = DriverManager.getConnection (
            "jdbc:mysql://127.0.0.1:3306/MQST", //nombre bases de datos
            "root","n0m3l0");

	//para buscar los registros
	sentencia = conexion.createStatement();
        
        resultados = sentencia.executeQuery("call AltaCliente('"+TelCasa+"', '"+TelCel+"', '"+Correo+"', '"+nombre+"', '"+ApPat+"', '"+ApMat+"','"+Usuario+"', '"+Contrasena+"','"+Calle+"', '"+Numero+"', '"+Municipio+"','"+Colonia+"', '"+Estado+"','"+CP+"');");
        while(resultados.next()){
           mensaje = resultados.getString("msj");
        }
        
	if(mensaje.equals("¡Usuario registrado con éxito!")){
            sesion.setAttribute("Cliente", Usuario);
            
            out.println("<html>");
            out.println("<head></head>");
            out.println("<body onload=\"alert('"+mensaje+"'); window.location='/MQST/Cliente/MiPerfil.jsp' \"></body>");
            out.println("</html>"); 
        }
        if(mensaje.equals("Usuario anteriormente registrado")){
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