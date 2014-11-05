/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Datos;

import Modelo.LineaDePiqueo;
import Modelo.Piqueos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

/**
 *
 * @author Edii
 */
public class DAOpiqueo extends coneccionBD {
    public DAOpiqueo() throws Exception {
        super();
    }
    
    public Hashtable traerTodosPiqueosPendientes() throws Exception
    {
        try{
            super.conectar();
            Hashtable lista = new Hashtable();

            String sql = "select idpiqueo,idCompras,fecha,estado "
                    + "from piqueos "
                    + "where estado = 1 ";
            PreparedStatement ps = Sentencia(sql);
            ResultSet rows = ConsultaConResultado(ps);
            Piqueos aux;
            while (rows.next()) {
                aux = new Piqueos(rows.getInt("idpiqueo"),rows.getInt("estado"),rows.getDate("fecha"));
                Hashtable prod = TraerLineasDePiqueoPorIdPiqueo(aux.getId());
                aux.setProductos(prod);
                lista.put(aux.getId(), aux);
            }
            return lista;
        } catch (Exception ex) {
            throw new SQLException("Error en traer todos los piqueos " + ex.getMessage());
        } finally {
            super.desconectar();
        }
    }
    private Hashtable TraerLineasDePiqueoPorIdPiqueo(int idPiqueo) throws Exception {
        try {
            Hashtable aux = new Hashtable();
            String sqlProd = "SELECT p.idProductos,p.nombre,sum(pc.cantidad) as cantidad "
                    + "FROM piqueos pi "
                    + "inner join compras c on pi.idCompras = c.idCompras "
                    + "inner join prodxcomp pc on c.idCompras = pc.idCompra "
                    + "inner join productos p on pc.idProd = p.idProductos"
                    + " where pi.idpiqueo = " + idPiqueo
                    + " group by idProd;";
            PreparedStatement psProd = Sentencia(sqlProd);
            ResultSet rows = ConsultaConResultado(psProd);

            while (rows.next()) {
                //int idLin,int idProd,String nombre, float CostoUnit, int Cantidad
                LineaDePiqueo lipi = new LineaDePiqueo(rows.getInt("idProductos"),rows.getString("nombre"), rows.getInt("cantidad"));
                aux.put(lipi.getIdProd(), lipi);
            }
            return aux;
        } catch (SQLException ex) {
            throw new SQLException("Error en traer todas las lineas de piqueo por id de piqueo " + ex.getMessage());
        } finally {}
    }
    
    public void confirmarEntregaPiqueo(int piqueo) throws Exception
    {
        
        try{
            super.conectar();
            String sql = "update piqueo set estado = 2 where idpiqueo="+piqueo;
            PreparedStatement ps = Sentencia(sql);
            ConsultaSinResultado(ps);
        } catch (Exception ex) {
            throw new SQLException("Error en confirmar Piqueo " + ex.getMessage());
        } finally {
            super.desconectar();
        }
    }
}
