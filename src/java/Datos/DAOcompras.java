package Datos;

import Modelo.Compras;
import Modelo.LineaDeCompra;
import Modelo.Productos;
import Modelo.Usuarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Savepoint;
import java.util.Enumeration;
import java.util.Hashtable;

public class DAOcompras extends coneccionBD {

    public DAOcompras() throws Exception {
        super();
    }
    
    public Compras TraerUnaCompra(int idCompra) throws Exception{
        try {
            
            Compras Ecompras = null;
            
            String sql = "SELECT * FROM Compras;";
            PreparedStatement ps = Sentencia(sql);
            ResultSet rows = ConsultaConResultado(ps);
            
            return Ecompras;
        } catch (SQLException ex) {
             throw new SQLException(" " + ex.getMessage());
        } finally {
            super.desconectar();
        }
    }

    public Hashtable TraerTodasCabacerasCompras() throws Exception {

//      Esta consulta esta mal. Deberia ser una sola consulta asi 
//      "SELECT * FROM compras c inner join prodxcomp pc where c.idCompras=pc.idCompra" 
//      pero no se como manejar los datos
        try {
            DAOusuarios dusr = new DAOusuarios();
            Hashtable lista = new Hashtable();

            String sql = "SELECT * FROM Compras;";
            PreparedStatement ps = Sentencia(sql);
            ResultSet rows = ConsultaConResultado(ps);

            while (rows.next()) {
                Usuarios usr = dusr.traerXid(rows.getInt("idUsuario"));
                Compras aux = new Compras(rows.getInt("idCompras"), usr, rows.getDate("fecha"),rows.getInt("estado"));
                aux.setTotal(rows.getFloat("total"));
                aux.setLista(TraerLineasComprasPorIdCabecera(aux.getId()));
                lista.put(aux.getId(), aux);
            }
            return lista;
        } catch (SQLException ex) {
            throw new SQLException("Error en traer todas las cabeceras de Compras " + ex.getMessage());
        } finally {
            super.desconectar();
        }
    }

    private Hashtable TraerLineasComprasPorIdCabecera(int idCabecera) throws Exception {
        try {
            Hashtable aux = new Hashtable();
            String sqlProd = "SELECT idLinea,idProd,nombre,precioUnit,cantidad FROM prodxcomp pc inner join productos p on p.idProductos=pc.idProd where idCompra =" + idCabecera + ";";
            PreparedStatement psProd = Sentencia(sqlProd);
            ResultSet rows = ConsultaConResultado(psProd);

            while (rows.next()) {
                //int idLin,int idProd,String nombre, float CostoUnit, int Cantidad
                LineaDeCompra pro = new LineaDeCompra(rows.getInt("idLinea"), rows.getInt("idProd"), rows.getString("nombre"), rows.getFloat("precioUnit"), rows.getInt("cantidad"));
                aux.put(pro.getIdLinea(), pro);
            }
            return aux;
        } catch (SQLException ex) {
            throw new SQLException("Error en traer todas las lineas de compras por cabecera de Compra " + ex.getMessage());
        } finally {
            super.desconectar();
        }
    }

    public Hashtable TraerComprasXusr(Usuarios user) throws Exception {
        try {
            Hashtable lista = new Hashtable();

            String sql = "SELECT * FROM Compras where idUsuario = '" + user.getId() + "';";
            PreparedStatement ps = Sentencia(sql);
            ResultSet rows = super.ConsultaConResultado(ps);

            while (rows.next()) {
                Compras aux = new Compras(rows.getInt("idCompras"), user, rows.getDate("fecha"),rows.getInt("estado"));
                aux.setTotal(rows.getFloat("total"));
                aux.setLista(TraerLineasComprasPorIdCabecera(aux.getId()));
                lista.put(aux.getId(), aux);
            }
            return lista;
        } catch (SQLException ex) {
            throw new SQLException("Error en traer todas las Compras por usuario " + ex.getMessage());
        } finally {
            super.desconectar();
        }
    }
    
    public void RechazarCompra(Compras compra) throws Exception{
        try{
            String sql = "UPDATE `compras` SET `estado`= 2 WHERE `idCompra`='" + compra.getId() + "';";
            PreparedStatement ps = Sentencia(sql);
            ConsultaSinResultado(ps);
            
        }catch (SQLException ex) {
            throw new SQLException("Error en Rechazar compra " + ex.getMessage());
        } finally {
            super.desconectar();
        }
    }

    public void ConfirmarCompra(Compras compra) throws Exception{
        try{
            String sql = "UPDATE `compras` SET `estado`= 3 WHERE `idCompra`='" + compra.getId() + "';";
            PreparedStatement ps = Sentencia(sql);
            ConsultaSinResultado(ps);
            
        }catch (SQLException ex) {
            throw new SQLException("Error en Confirmar compra " + ex.getMessage());
        } finally {
            super.desconectar();
        }
    }
    
    public void CrearCompra(Compras comp) throws Exception {

        Connection conn = super.getConexion();
        Savepoint savepoint1 = null;
        try {
            conn.setAutoCommit(false);
            savepoint1 = conn.setSavepoint("Savepoint1");
            String sql = "INSERT INTO compras (idUsuario,total) values('" + comp.getUsr().getId() + "','" + comp.getTotal() + "'); ";
            PreparedStatement psCompras = Sentencia(sql);
            super.ConsultaSinResultado(psCompras);

            //Recorre la lista de productos e Inserta la lista en la tabla relacinal productos X compra
            Enumeration e = comp.getLista().elements();
            LineaDeCompra aux;
            while (e.hasMoreElements()) {
                aux = (LineaDeCompra) e.nextElement();
                sql = "INSERT INTO prodxcomp (idCompra,idProd,cantidad,precioUnit) values((SELECT max(idCompras) FROM compras),'" + aux.getId() + "','" + aux.getCantidad() + "','" + aux.getCostoUnit() + "'); ";
                PreparedStatement psLinea = Sentencia(sql);
                super.ConsultaSinResultado(psLinea);
            }
            conn.commit();

        } catch (SQLException ex) {
            conn.rollback(savepoint1);
            throw new SQLException("Error en crear la Compra " + ex.getMessage() + " ");
        } finally {
            super.desconectar();
        }
    }
}
