package Controladora;

import Datos.DAOpiqueo;
import Modelo.Piqueos;
import java.sql.SQLException;
import java.util.Hashtable;

public class ControladoraPiqueo {
    
    DAOpiqueo Dpiqueo;
    public ControladoraPiqueo() throws Exception
    {
        Dpiqueo = new DAOpiqueo();
    }
    
    public Boolean ConfirmarPiqueo(int piqueo) throws Exception{
        try
        {
            Dpiqueo.confirmarEntregaPiqueo(piqueo);
            return true;
        }catch (SQLException ex){
            return false;
        }
    }
    
    public Hashtable ObtenerPiqueos() throws Exception{
        try{
            return Dpiqueo.traerTodosPiqueosPendientes();
        }catch (SQLException ex){
            return null;
        }
    }
}
