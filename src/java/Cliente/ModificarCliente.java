package Cliente;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class ModificarCliente extends HttpServlet {

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
        String nombre=req.getParameter("NombreModC");
        String ApPat=req.getParameter("ApPatModC");
        String ApMat=req.getParameter("ApMatModC");
        String Correo=req.getParameter("CorreoModC");
        String Calle=req.getParameter("CalleModC");
        String Colonia=req.getParameter("ColoniaModC");
        String Estado=req.getParameter("EstadoModC");
        String CP=req.getParameter("CPModC");
        String TelCasa=req.getParameter("TelefonoModC");
        String TelCel=req.getParameter("CelularModC");
        String Numero=req.getParameter("NumeroModC");
        String Municipio=req.getParameter("DelegacionModC");
        
        String Usuario=req.getParameter("UsuarioModC");
        String Contrasena=req.getParameter("PassModC"); //Nueva
        String Contrasena2=req.getParameter("PSWModC"); //Antigua
        String Shida="";
        
        if(Contrasena==null){
            Shida=Contrasena2;
        }else{
            Shida=Contrasena;
        }
        
    
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
        
        if(Contrasena==""){
            //out.println(Contrasena2); 
            sentencia.executeUpdate(" call ModificaCliente('"+TelCasa+"','"+TelCel+"','"+Correo+"','"+nombre+"','"+ApPat+"','"+ApMat+"','"+Usuario+"','"+Contrasena2+"', '"+Calle+"','"+Numero+"','"+Municipio+"','"+Colonia+"','"+Estado+"','"+CP+"'); ");
        }else{
            //out.println(Contrasena);
            sentencia.executeUpdate(" call ModificaCliente('"+TelCasa+"','"+TelCel+"','"+Correo+"','"+nombre+"','"+ApPat+"','"+ApMat+"','"+Usuario+"',md5('"+Contrasena+"'), '"+Calle+"','"+Numero+"','"+Municipio+"','"+Colonia+"','"+Estado+"','"+CP+"'); ");
        }
	
        res.sendRedirect("/MQST/Cliente/MiPerfil.jsp");
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