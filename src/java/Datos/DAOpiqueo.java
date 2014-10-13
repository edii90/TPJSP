/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Datos;

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

            String sql = "select p.idpiqueo,a.idProductos,a.nombre,sum(l.cantidad)as cantidad,p.fecha,p.estado from piqueos p inner join prodxcomp l on p.idCompras = l.idCompra "
                    + "inner join productos a on l.idProd = a.idProductos inner join compras c on c.idCompras = p.idCompras where p.estado = 1 group by a.idProductos;";
            PreparedStatement ps = Sentencia(sql);
            ResultSet rows = ConsultaConResultado(ps);
            Piqueos aux;
            while (rows.next()) {
                //int Id,int idp,String name,int cant,int est,Date fec
                aux = new Piqueos(rows.getInt("idpiqueo"),rows.getInt("idProductos"),rows.getString("nombre"),rows.getInt("cantidad"),rows.getInt("estado"),rows.getDate("fecha"));
                lista.put(aux.getId(), aux);
            }
            return lista;
        } catch (Exception ex) {
            throw new SQLException("Error en traer todos los piqueos " + ex.getMessage());
        } finally {
            super.desconectar();
        }
    }
    
    public void confirmarEntregaPiqueo(int idpiqueo) throws Exception
    {
        
        try{
            super.conectar();
            String sql = "update piqueo set estado = 2";
            PreparedStatement ps = Sentencia(sql);
            ConsultaSinResultado(ps);
        } catch (Exception ex) {
            throw new SQLException("Error en confirmar Piqueo " + ex.getMessage());
        } finally {
            super.desconectar();
        }
    }
}
