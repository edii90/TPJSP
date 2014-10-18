package Controladora;

import Datos.DAOproductos;
import Modelo.Productos;
import Modelo.Usuarios;
import java.sql.SQLException;
import java.util.Hashtable;

public class ControladoraProductos {
    
    DAOproductos Dproductos;
    Productos Eproductos;
    
    public Boolean AltaProducto(Productos producto) throws Exception{
        try
        {
            Dproductos.CrearProducto(producto);
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
    
    public Boolean ModificarUsuario(Productos producto) throws Exception{
        try
        {
            Dproductos.ModificarProducto(producto);
            return true;
        }catch (SQLException ex){
            return false;
        }
    }
    
    public Productos ObtenerUsuario(int id) throws Exception{
        try
        {
            return Dproductos.TraerProductosXId(id);
        }catch (SQLException ex){
            return null;
        }
    }
    
    public Hashtable ObtenerUsuario() throws Exception{
        try{
            return Dproductos.TraerProductos();
        }catch (SQLException ex){
            return null;
        }
    }
    
}

