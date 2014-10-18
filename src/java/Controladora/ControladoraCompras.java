package Controladora;

import Datos.DAOcompras;
import Modelo.Compras;
import Modelo.Usuarios;
import java.sql.SQLException;
import java.util.Hashtable;

public class ControladoraCompras {
    
    DAOcompras Dcompras;
    
    public Boolean AltaCompra(Compras compra) throws Exception{
        try{
            Dcompras.CrearCompra(compra);
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
    
    public Hashtable ObtenerCabezeraCompras(Compras compra) throws Exception{
        try{
            return Dcompras.TraerTodasCabacerasCompras();
        }catch (SQLException ex){
            return null;
        } 
    }
    
    public Hashtable ObtenerCabezeraCompras(int idCompra) throws Exception{
        try{
            return Dcompras.TraerLineasComprasPorIdCabecera(idCompra);
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
}
