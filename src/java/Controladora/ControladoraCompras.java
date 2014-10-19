package Controladora;

import Datos.DAOcompras;
import Modelo.Compras;
import Modelo.Usuarios;
import java.sql.SQLException;
import java.util.Hashtable;

public class ControladoraCompras {
    
    DAOcompras Dcompras;
    Compras    Ecompras;
    
    public Boolean AltaCompra(Usuarios usuario,Hashtable lista) throws Exception{
        try{
            Ecompras = new Compras(usuario, lista);
            Dcompras.CrearCompra(Ecompras);
            return true;
        }catch (SQLException ex){
            return false;
        } 
    }
    
    public Boolean RechazarCompra(Compras compra) throws Exception{
        try{
            Dcompras.RechazarCompra(compra);
            return true;
        }catch (SQLException ex){
            return false;
        } 
    }
    
    public Boolean ConfirmarCompra(Compras compra) throws Exception{
        try{
            Dcompras.ConfirmarCompra(compra);
            return true;
        }catch (SQLException ex){
            return false;
        } 
    }
    
    public Hashtable ObtenerLineasCompras(int idCompra) throws Exception{
        try{
            return Dcompras.TraerLineasComprasPorIdCabecera(idCompra);
        }catch (SQLException ex){
            return null;
        } 
    }
    
    public Hashtable ObtenerLineasCompras(Compras compra) throws Exception{
        try{
            return Dcompras.TraerLineasComprasPorIdCabecera(compra.getId());
        }catch (SQLException ex){
            return null;
        } 
    }
    
    public Hashtable ObtenerCabezeraCompras() throws Exception{
        try{
            return Dcompras.TraerTodasCabacerasCompras();
        }catch (SQLException ex){
            return null;
        } 
    }
    
    public Hashtable ObtenerCabezeraCompras(Usuarios usuario) throws Exception{
        try{
            return Dcompras.TraerComprasXusr(usuario);
        }catch (SQLException ex){
            return null;
        } 
    }
    
    public Compras ObtenerCabezeraCompras(int idCompra) throws Exception{
        try{
            return Dcompras.TraerUnaCompra(idCompra);
        }catch (SQLException ex){
            return null;
        } 
    }    
}
