package Administrador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class AgregarOrden extends HttpServlet {

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
        
        String det, cost, fec, hor, mensaje;
            det = request.getParameter("detalles");
            fec = request.getParameter("fecent");
            cost = request.getParameter("CostoO");
            mensaje = "";
        
        int Opc = Integer.parseInt(request.getParameter("P")); //Sí necesita Piezas o no
        int idC = Integer.parseInt(request.getParameter("Clientes"));  
        int idE = Integer.parseInt(request.getParameter("EstadoOrden"));
        int idP = Integer.parseInt(request.getParameter("Pza"));
        int cant = Integer.parseInt(request.getParameter("CantidadPieza"));
            
        try{
            HttpSession sesion = request.getSession();
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection (cadenaConexion,usuarioBD,clave);
            sentencia = conexion.createStatement();
            
            /* Tuve que cambiar el orden de las validaciones x3 algo pasaba si quitaba los required así que puse extras tambíen :3*/
            if(idC==0){
                mensaje = "¡Debes escoger a un cliente!";
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                out.println("</html>");
            } else if(idE==0){
                mensaje = "¡Debes seleccionar un Estado!";
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                out.println("</html>");           
            } else if(idC==0 && idE==0){
                mensaje = "¡Ni el Cliente ni el Estado deben estar vacíos!";
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                out.println("</html>");     
            } else if (cost==null){
                mensaje = "¡Dale un costo a la Orden!";
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                out.println("</html>"); 
            } else if (fec==null){
                mensaje = "Ingresa una fecha de entrega, el formato es DD/MM/AAAA";
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                out.println("</html>");
            } else if (det==null){
                mensaje = "Ingresa los detalles para la orden.";
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                out.println("</html>");
            }
                
            if( Opc==1 ){
                if(idP==0){
                    mensaje = "¡Selecciona una Pieza!";
                    out.println("<html>");
                    out.println("<head></head>");
                    out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                    out.println("</html>"); 
                }else if (cant == 0){
                    mensaje = "La cantidad de piezas no puede ser cero.";
                    out.println("<html>");
                    out.println("<head></head>");
                    out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                    out.println("</html>");
                } else if (idP==0 && cant==0){
                    mensaje = "Debes escoger al menos una pieza y la cantidad debe ser mayor a cero";
                    out.println("<html>");
                    out.println("<head></head>");
                    out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                    out.println("</html>");
                }
                resultados = sentencia.executeQuery("call NuevaOrden('"+idC+"', '"+idE+"', '"+det+"', '"+cost+"', '"+fec+"');");
                while(resultados.next()){
                    mensaje = resultados.getString("msj");
                }
                resultados = sentencia.executeQuery("call NuevaOrdenPza('"+idC+"', '"+det+"', '"+cost+"', '"+idP+"', '"+cant+"')");
                while(resultados.next()){
                    mensaje = resultados.getString("msj");
                }
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); window.location='/MQST/Ordenes/Ordenes.jsp' \"></body>");
                out.println("</html>");
                
            }else if( Opc==2 ){
                idP=0;
                cant=0;
                resultados = sentencia.executeQuery("call NuevaOrden('"+idC+"', '"+idE+"', '"+det+"', '"+cost+"', '"+fec+"');");
                while(resultados.next()){
                    mensaje = resultados.getString("msj");
                }
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); window.location='/MQST/Ordenes/Ordenes.jsp' \"></body>");
                out.println("</html>");
                
            } else {
                mensaje = "Selecciona si la orden debe tener piezas o no";
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                out.println("</html>");    
            }
            
            
            /* Validaciones Ari~ <3
            if(idC == 0){
                mensaje = "¡Debes escoger a un cliente!";
                
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                out.println("</html>");
                
            } else if(Opc == 1 && idP == 0 && cant > 0){
                mensaje = "Debes escoger una pieza";
                
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                out.println("</html>");
                
            } else if(Opc == 2 && idP == 0 && cant > 0){
                mensaje = "Debes escoger una pieza";
                
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                out.println("</html>");
                
            } else{
                if(Opc == 1 && cant == 0 && idP > 0){
                    mensaje = "La cantidad de piezas no debe ser 0";
                    
                    out.println("<html>");
                    out.println("<head></head>");
                    out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                    out.println("</html>");
                } else{
                    if(Opc == 1 && cant == 0 && idP == 0){
                        mensaje = "Debes escoger al menos una pieza y la cantidad debe ser mayor a cero";
                        
                        out.println("<html>");
                        out.println("<head></head>");
                        out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                        out.println("</html>");
                    }
                    else{
                        if(Opc == 2 && cant == 0 && idP == 0){
                            resultados = sentencia.executeQuery("call NuevaOrden('"+idC+"', '"+idE+"', '"+det+"', '"+cost+"', '"+fec+"');");
                            while(resultados.next()){
                                mensaje = resultados.getString("msj");
                            }
                            out.println("<html>");
                            out.println("<head></head>");
                            out.println("<body onload=\"alert('"+mensaje+"'); window.location='/MQST/Ordenes/Ordenes.jsp' \"></body>");
                            out.println("</html>");
                        }
                        else{
                            if(Opc == 1 && cant>0 && idP>0){
                                resultados = sentencia.executeQuery("call NuevaOrden('"+idC+"', '"+idE+"', '"+det+"', '"+cost+"', '"+fec+"');");
                                while(resultados.next()){
                                    mensaje = resultados.getString("msj");
                                }
                                resultados = sentencia.executeQuery("call NuevaOrdenPza('"+idC+"', '"+det+"', '"+cost+"', '"+idP+"', '"+cant+"')");
                                while(resultados.next()){
                                    mensaje = resultados.getString("msj");
                                }
                                out.println("<html>");
                                out.println("<head></head>");
                                out.println("<body onload=\"alert('"+mensaje+"'); window.location='/MQST/Ordenes/Ordenes.jsp' \"></body>");
                                out.println("</html>");
                            } 
                        }
                    }
                }
            }
            */   
            
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