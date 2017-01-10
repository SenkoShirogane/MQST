package Imagen;

import BD.MQST;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.*;

public class Funciones {
    
    private String query;
    private final MQST DB;
    private ResultSet resultados;
    String mensaje;
    
    public Funciones() {
        DB = new MQST();
    }
    
    public String guardaImagenPieza(int idp, int idE, String name, String det, String cost, InputStream foto, int cant)throws SQLException, FileNotFoundException { //
        //resultados = sentencia.executeQuery("call AgregaPza('"+idp+"', '"+idE+"', '"+name+"', '"+det+"', '"+cost+"', '"+foto+"', '"+cant+"');");
        DB.conectar();
        Connection con = DB.getCon();
        try (PreparedStatement ps = con.prepareStatement("call AgregaPza(?, ?, ?, ?, ?, ?, ?);")) {
            ps.setInt(1, idp); //El primer signo de interrogacion se remplaza por el dato
            ps.setInt(2, idE);
            ps.setString(3, name);
            ps.setString(4, det);
            ps.setString(5, cost);
            ps.setBinaryStream(6, foto); //El segundo signo de interrogacion se remplaza por la foto en sí
            ps.setInt(7, cant);
            resultados = ps.executeQuery();  //Se ejecuta el query
            while(resultados.next()){
                mensaje = resultados.getString("msj");
            }
            ps.close();   
        }
        DB.cierraConexion();       
        return mensaje;
    }
    public void modificaImagenPieza(int idprov, int idEdo, String nombrep, String det, String pre, InputStream foto, int canta, int cantn) throws SQLException, FileNotFoundException {
        //resultados = sentencia.executeQuery("call ModificaPieza('"+idprov+"', '"+idedo+"', '"+nombrep+"', '"+det+"', '"+pre+"','"+img+"', '"+canta+"', '"+cantn+"');");
        DB.conectar();
        Connection con = DB.getCon();
        try (PreparedStatement ps = con.prepareStatement("call ModificaPieza(?, ?, ?, ?, ?, ?, ?, ?);")) {
            ps.setInt(1, idprov); //El primer signo de interrogacion se remplaza por el dato
            ps.setInt(2, idEdo);
            ps.setString(3, nombrep);
            ps.setString(4, det);
            ps.setString(5, pre);
            ps.setBinaryStream(6, foto); //El segundo signo de interrogacion se remplaza por la foto en sí
            ps.setInt(7, canta);
            ps.setInt(8, cantn);
            ps.executeUpdate();  //Se ejecuta el query
            ps.close();   
        }
        DB.cierraConexion();       
    }
    public String guardaImagenProducto(int idp, int idE, String name, String det, String cost, InputStream foto) throws SQLException, FileNotFoundException { //
        //resultados = sentencia.executeQuery("call AgregaProd('"+idp+"', '"+idE+"', '"+Nombre+"', '"+Detalles+"', '"+Costo+"', '"+Imagen+"') ");
        DB.conectar();
        Connection con = DB.getCon();
        try (PreparedStatement ps = con.prepareStatement("call AgregaProd(?, ?, ?, ?, ?, ?);")) {
            ps.setInt(1, idp); //El primer signo de interrogacion se remplaza por el dato
            ps.setInt(2, idE);
            ps.setString(3, name);
            ps.setString(4, det);
            ps.setString(5, cost);
            ps.setBinaryStream(6, foto); //El segundo signo de interrogacion se remplaza por la foto en sí
            resultados = ps.executeQuery();  //Se ejecuta el query
            while(resultados.next()){
                mensaje = resultados.getString("msj");
            }
            return mensaje;
        }
    }
    public void modificaImagenProducto(int idp, int idE, String name, String det, String cost, InputStream foto)throws SQLException, FileNotFoundException { //
        //resultados = sentencia.executeQuery("call ModificaProducto('"+idp+"', '"+idE+"', '"+Nombre+"', '"+Detalles+"', '"+Costo+"', '"+Shida+"') ");
        DB.conectar();
        Connection con = DB.getCon();
        try (PreparedStatement ps = con.prepareStatement("call ModificaProducto(?, ?, ?, ?, ?, ?);")) {
            ps.setInt(1, idp); //El primer signo de interrogacion se remplaza por el dato
            ps.setInt(2, idE);
            ps.setString(3, name);
            ps.setString(4, det);
            ps.setString(5, cost);
            ps.setBinaryStream(6, foto); //El segundo signo de interrogacion se remplaza por la foto en sí
            ps.executeUpdate();  //Se ejecuta el query
            ps.close();   
        }
        DB.cierraConexion();       
    }
}