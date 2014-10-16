package Controladora;

import Datos.DAOusuarios;
import Modelo.Usuarios;
import java.sql.SQLException;
import java.util.Hashtable;


public class ControladoraUsuarios {
    
    DAOusuarios Dusuarios;
    Usuarios Eusuarios;
    
    public Boolean AltaUsuario(String usuario, String contraseña, int doc, String name, String apellido, int tipo) throws Exception{
        try
        {
            Eusuarios = new Usuarios(usuario, contraseña, doc, name, apellido, tipo);
            Dusuarios.CrearUsr(Eusuarios);
            return true;
        }catch (SQLException ex){
            return false;
        }
    }
    
    public Boolean BajaUsuario(int id) throws Exception{
        try
        {
            Dusuarios.EliminarUsr(id);
            return true;
        }catch (SQLException ex){
            return false;
        }
    }
    
    public Boolean BajaUsuario(Usuarios usuario) throws Exception{
        try
        {
            Dusuarios.EliminarUsr(usuario);
            return true;
        }catch (SQLException ex){
            return false;
        }
    }
    
    public Boolean ModificarUsuario(Usuarios usuario) throws Exception{
        try
        {
            Dusuarios.ModificarUsr(usuario);
            return true;
        }catch (SQLException ex){
            return false;
        }
    }
    
    public Usuarios ObtenerUsuario(int id) throws Exception{
        try
        {
            return Dusuarios.traerXid(id);
        }catch (SQLException ex){
            return null;
        }
    }
    
    public Hashtable ObtenerUsuario() throws Exception{
        try{
            return Dusuarios.TraerTodosLosUsuarios();
        }catch (SQLException ex){
            return null;
        }
    }
    
    public Usuarios Login(String usuario, String contraseña) throws Exception{
        try
        {
            return Dusuarios.login(usuario, contraseña);
        }catch (SQLException ex){
            return null;
        }
    }
    
}
