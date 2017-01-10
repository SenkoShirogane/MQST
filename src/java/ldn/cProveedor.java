/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ldn;

import java.sql.ResultSet;
import java.util.ArrayList;
/**
 *
 * @author CITLALLI
 */
public class cProveedor {
    String _nombre = "";
    int _ProveedorId = 0;
    ArrayList<String> _mascotas = new ArrayList<String>();
    boolean _ok = false;
    String _MSJ = "";
    
    public cProveedor(int prov)
    {
        this._ProveedorId = prov;
    }
    public cProveedor()
    {
    
    }
    public cProveedor(String nombre)
    {
        BD.MQST bd = new BD.MQST();
        String nombre2="";
        try
        {
            bd.conectar();
            nombre2=nombre;
            ResultSet rs = bd.consulta(nombre2);
            
            bd.cierraConexion();
        }
        catch(Exception xxxD)
        {
            
        }
        
    }
    public String MSJ()
    {
        return this._MSJ;
    }
}
