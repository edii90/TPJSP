package Datos;

import Modelo.Usuarios;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;


public class DAOusuarios extends coneccionBD {

    public DAOusuarios() throws Exception {
        super();
    }

    public Hashtable TraerTodosLosUsuarios() throws Exception {
        try {
            super.conectar();
            Hashtable lista = new Hashtable();
            String sql = "SELECT * FROM usuarios;";
            PreparedStatement ps = Sentencia(sql);
            ResultSet rows = ConsultaConResultado(ps);
            while (rows.next()) {
                if (rows.getBoolean("estado") == true) {
                    Usuarios aux = new Usuarios(rows.getInt("idUsr"), rows.getString("usuario"), rows.getString("pass"), rows.getInt("DNI"), rows.getString("nombre"), rows.getString("apellido"), rows.getInt("tipo"));
                    lista.put(aux.getId(), aux);
                }
            }
            return lista;
        } catch (SQLException ex) {
            throw new SQLException("Error en traer todos los usuarios Usuario " + ex.getMessage());
        } finally {
            super.desconectar();
        }
    }

    public Usuarios login(String usuario, String pass) throws Exception {
        try {
            super.conectar();
            Usuarios usr = null;
            String sql = "SELECT * FROM usuarios WHERE usuario='" + usuario + "' AND pass='" + pass + "'";
            PreparedStatement ps = Sentencia(sql);
            ResultSet rows = ConsultaConResultado(ps);
            if (rows.next()) {
                usr = new Usuarios(rows.getInt("idUsr"), usuario, pass, rows.getInt("DNI"), rows.getString("nombre"), rows.getString("apellido"), rows.getInt("tipo"),rows.getBoolean("estado"));
            }
            if(usr.isEstado()==false)
            {
                PreparedStatement activarUsr = Sentencia("UPDATE `usuarios` SET `estado`=1 WHERE `idUsr`='"+usr.getId()+"';");
                ConsultaSinResultado(activarUsr);
            }
            return usr;
        } catch (SQLException ex) {
            throw new SQLException("Error en el login Usuario " + ex.getMessage());
        } finally {
            super.desconectar();
        }
    }

    public Usuarios traerXid(int id) throws Exception {
        try {
            super.conectar();
            Usuarios usr = null;
            String sql = "SELECT * FROM usuarios WHERE idUsr='" + id + "'";
            PreparedStatement ps = Sentencia(sql);
            ResultSet rows = ConsultaConResultado(ps);
            if (rows.next()) {
                return usr = new Usuarios(rows.getString("usuario"), rows.getString("pass"), rows.getInt("DNI"), rows.getString("nombre"), rows.getString("apellido"), rows.getInt("tipo"));
            }
            return usr;
        } catch (SQLException ex) {
            throw new SQLException("Error al traer por id Usuario " + ex.getMessage());
        } finally {
            super.desconectar();
        }
    }

    public void ModificarUsr(Usuarios usr) throws Exception {
        try {
            super.conectar();
            String sql = "UPDATE usuarios SET usuario='"
                    + usr.getUsuario()
                    + "', pass='"
                    + usr.getContrasenia()
                    + "', DNI="
                    + usr.getDNI()
                    + ", nombre='"
                    + usr.getNombre()
                    + "', apellido='"
                    + usr.getApellido()
                    + "', tipo="
                    + usr.getTipoUsr()
                    + " WHERE idUsr='"
                    + usr.getId()
                    + "';";
            PreparedStatement ps = Sentencia(sql);
            ConsultaSinResultado(ps);
        } catch (SQLException ex) {
            throw new SQLException("Error al modificar Usuario " + ex.getMessage());
        } finally {
            super.desconectar();
        }
    }

    public void CrearUsr(String usr, String pass, int doc, String name, String ape) throws Exception {
        try {
            super.conectar();
            String sql = "INSERT INTO `usuarios` (`usuario`, `pass`, `DNI`, `nombre`, `apellido`) VALUES ('"
                    + usr + "', '" + pass + "', '" + doc + "', '" + name + "', '" + ape + "');";
            PreparedStatement ps = Sentencia(sql);
            ConsultaSinResultado(ps);
        } catch (SQLException ex) {
            throw new SQLException("Error al crear Usuario " + ex.getMessage());
        } finally {
            super.desconectar();
        }
    }

    public void CrearUsr(Usuarios usuario) throws Exception {
        try {
            super.conectar();
            String sql = "INSERT INTO `usuarios` (`usuario`, `pass`, `DNI`, `nombre`, `apellido`, `tipo`) VALUES ('"
                    + usuario.getUsuario() + "', '" + usuario.getContrasenia() + "', '" + usuario.getDNI() + "', '" + usuario.getNombre() + "', '" + usuario.getApellido() + "', '" + usuario.getTipoUsr() + "');";
            PreparedStatement ps = Sentencia(sql);
            ConsultaSinResultado(ps);
        } catch (SQLException ex) {
            throw new SQLException("Error al crear Usuario " + ex.getMessage());
        } finally {
            super.desconectar();
        }
    }

    public void EliminarUsr(Usuarios id) throws Exception {
        try {
            super.conectar();
            String sql = "UPDATE `usuarios` SET `estado`=0 WHERE `idUsr`='"
                    + id.getId() + "';";
            PreparedStatement ps = Sentencia(sql);
            ConsultaSinResultado(ps);
        } catch (SQLException ex) {
            throw new SQLException("Error al eliminar Usuario " + ex.getMessage());
        } finally {
            super.desconectar();
        }
    }

    public void EliminarUsr(int id) throws Exception {
        try {
            super.conectar();
            String sql = "UPDATE `usuarios` SET `estado`=0 WHERE `idUsr`='"
                    + id + "';";
            PreparedStatement ps = Sentencia(sql);
            ConsultaSinResultado(ps);
        } catch (SQLException ex) {
            throw new SQLException("Error al eliminar Usuario " + ex.getMessage());
        } finally {
            super.desconectar();
        }
    }
}
