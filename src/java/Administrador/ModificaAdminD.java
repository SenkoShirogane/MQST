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


public class ModificaAdminD extends HttpServlet {

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
        
        String usuario, mensaje = "", apem, apemt, nombre, msj, nombr;
            usuario = request.getParameter("Usr");
            nombre = request.getParameter("Nomb");
            nombr = request.getParameter("Nomb");
            apem = request.getParameter("AP");
            apemt = request.getParameter("AM");
		
        try{
            
            HttpSession sesion = request.getSession();
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection (cadenaConexion,usuarioBD,clave);
            sentencia = conexion.createStatement();

            
            BD.validar valida = new BD.validar();
            
            valida.nombreLong(nombre);
            msj = valida.getMensaje();
            
            if(msj.equals("No")){
                mensaje = "Mínimo tres carácteres en el nombre, máximo veinte";
                
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                out.println("</html>");
            }else{
                if(msj.equals("Si")){
                    valida.nombreLong(apem);
                    msj = valida.getMensaje(); 
                    
                    if(msj.equals("No")){
                        mensaje = "Mínimo tres carácteres en los apellidos, máximo veinte";
                
                        out.println("<html>");
                        out.println("<head></head>");
                        out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                        out.println("</html>");
                    }else{
                        if(msj.equals("Si")){
                            valida.nombreLong(apemt);
                            msj = valida.getMensaje(); 

                            if(msj.equals("No")){
                                mensaje = "Mínimo tres carácteres en los apellidos, máximo veinte";

                                out.println("<html>");
                                out.println("<head></head>");
                                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                                out.println("</html>");
                            }
                            else{
                                if(msj.equals("Si")){
                                    valida.espacios(nombre);
                                    msj = valida.getMensaje();

                                    if(msj.equals("No")){
                                        mensaje = "Cuidado con los espacios en blanco";

                                        out.println("<html>");
                                        out.println("<head></head>");
                                        out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                                        out.println("</html>");
                                    }else{
                                        if(msj.equals("Si")){
                                            valida.espacios(apem);
                                            msj = valida.getMensaje();

                                            if(msj.equals("No")){
                                                mensaje = "Cuidado con los espacios en blanco";

                                                out.println("<html>");
                                                out.println("<head></head>");
                                                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                                                out.println("</html>");
                                            }else{
                                               if(msj.equals("Si")){
                                                   valida.espacios(apemt);
                                                   msj = valida.getMensaje();

                                                   if(msj.equals("No")){
                                                    mensaje = "Cuidado con los espacios en blanco";

                                                    out.println("<html>");
                                                    out.println("<head></head>");
                                                    out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                                                    out.println("</html>"); 
                                                    }
                                                   else{
                                                       if(nombre.equals("") && apem.equals("") && apemt.equals("")){
                                                            mensaje = "Completa todos los campos";

                                                            out.println("<html>");
                                                            out.println("<head></head>");
                                                            out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                                                            out.println("</html>"); 
                                                        }
                                                       else{
                                                            valida.soloLetras(nombre);
                                                            msj = valida.getMensaje();
                                                           
                                                            if(msj.equals("No")){
                                                                mensaje = "No se admiten carácteres especiales en el nombre";

                                                                out.println("<html>");
                                                                out.println("<head></head>");
                                                                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                                                                out.println("</html>"); 
                                                            }else{
                                                                if(msj.equals("Si")){
                                                                    valida.soloLetras(apem);
                                                                    msj = valida.getMensaje();
                                                                    
                                                                    if(msj.equals("No")){
                                                                        mensaje = "No se admiten carácteres especiales en el apellido paterno";

                                                                        out.println("<html>");
                                                                        out.println("<head></head>");
                                                                        out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                                                                        out.println("</html>");
                                                                    }else{
                                                                        if(msj.equals("Si")){
                                                                            valida.soloLetras(apemt);
                                                                            valida.getMensaje();
                                                                            
                                                                            if(msj.equals("No")){
                                                                                mensaje = "No se admiten carácteres especiales en el apellido materno";

                                                                                out.println("<html>");
                                                                                out.println("<head></head>");
                                                                                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                                                                                out.println("</html>");
                                                                            }
                                                                            else{
                                                                                if(msj.equals("Si")){
                                                                                    resultados = sentencia.executeQuery("call ModificaAdmin('"+nombr+"', '"+apem+"', '"+apemt+"', '"+usuario+"');");
                                                                                    while(resultados.next()){
                                                                                        mensaje = resultados.getString("MSJ");
                                                                                    }

                                                                                    out.println("<html>");
                                                                                    out.println("<head></head>");
                                                                                    out.println("<body onload=\"alert('"+mensaje+"'); window.location='/MQST/Administrador/Perfil.jsp' \"></body>");
                                                                                    out.println("</html>");
                                                                                }
                                                                                else{
                                                                                    mensaje = "Ocurrió un error, vuele a intentarlo más tarde";

                                                                                    out.println("<html>");
                                                                                    out.println("<head></head>");
                                                                                    out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                                                                                    out.println("</html>");  
                                                                                }
                                                                            }
                                                                        }
                                                                        else{
                                                                            mensaje = "Ocurrió un error, vuele a intentarlo más tarde";
                    
                                                                            out.println("<html>");
                                                                            out.println("<head></head>");
                                                                            out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                                                                            out.println("</html>"); 
                                                                        }
                                                                    }
                                                                }else{
                                                                    mensaje = "Ocurrió un error, vuele a intentarlo más tarde";
                    
                                                                    out.println("<html>");
                                                                    out.println("<head></head>");
                                                                    out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                                                                    out.println("</html>"); 
                                                                }
                                                            }
                                                       }
                                                   }
                                                }

                                            }
                                        }

                                    }
                                }else{
                                    mensaje = "Ocurrió un error, vuele a intentarlo más tarde";
                    
                                    out.println("<html>");
                                    out.println("<head></head>");
                                    out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                                    out.println("</html>");  
                                }
                            }
                        }else{
                            mensaje = "Ocurrió un error, vuele a intentarlo más tarde";
                    
                            out.println("<html>");
                            out.println("<head></head>");
                            out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                            out.println("</html>");
                        }
                    }
                }else{
                    mensaje = "Ocurrió un error, vuele a intentarlo más tarde";
                    
                    out.println("<html>");
                    out.println("<head></head>");
                    out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                    out.println("</html>");
                }
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