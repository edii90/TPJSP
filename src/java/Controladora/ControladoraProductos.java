package Controladora;

import Datos.DAOproductos;
import Modelo.LineaDeCompra;
import Modelo.Productos;
import Modelo.Usuarios;
import com.oracle.jrockit.jfr.Producer;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.Hashtable;

public class ControladoraProductos {
    
    DAOproductos Dproductos;
    Productos Eproductos;
    public ControladoraProductos() throws Exception
    {
        Dproductos = new DAOproductos();
    }
    
    public Boolean AltaProducto(String nombre,float precio,int stock,String imagen) throws Exception{
        try
        {
            Eproductos = new Productos(nombre, precio, stock, imagen);
            Dproductos.CrearProducto(Eproductos);
            return true;
        }catch (SQLException ex){
            return false;
        }
    }
    
    public Boolean BajaProducto(int id) throws Exception{
        try
        {
            Dproductos.EliminarProducto(id);
            return true;
        }catch (SQLException ex){
            return false;
        }
    }
    
    public Boolean BajaProducto(Productos producto) throws Exception{
        try
        {
            Dproductos.EliminarProducto(producto);
            return true;
        }catch (SQLException ex){
            return false;
        }
    }
    
    public Boolean ModificarProducto(Productos producto) throws Exception{
        try
        {
            Dproductos.ModificarProducto(producto);
            return true;
        }catch (SQLException ex){
            return false;
        }
    }
    
    public Boolean ModificarProducto(Hashtable productos) throws Exception{
        try
        {
            Enumeration<Productos> Lproductos = productos.elements();
            while(Lproductos.hasMoreElements())
            {
                Eproductos = Lproductos.nextElement();
                ModificarProducto(Eproductos);
            }
            return true;
        }catch (SQLException ex){
            return false;
        }
    }
    
    public Productos ObtenerProducto(int id) throws Exception{
        try
        {
            return Dproductos.TraerProductosXId(id);
        }catch (SQLException ex){
            return null;
        }
    }
    
    public Hashtable ObtenerProducto() throws Exception{
        try{
            return Dproductos.TraerProductos();
        }catch (SQLException ex){
            return null;
        }
    }
    
}

