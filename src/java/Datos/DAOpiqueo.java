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
    
    public Hashtable traerTodosPiqueos() throws Exception
    {
        try{
            super.conectar();
            Hashtable lista = new Hashtable();

            String sql = "SELECT l.idProd as id,p.nombre as nombre,l.cantidad as cantidad FROM prodxcomp l inner join productos p on l.idProd = p.idProductos inner join compras c on l.idCompra = c.idCompras where c.estado = 3 group by l.idProd;";
            PreparedStatement ps = Sentencia(sql);
            ResultSet rows = ConsultaConResultado(ps);
            Piqueos aux;
            while (rows.next()) {
                aux = new Piqueos(rows.getInt("id"),rows.getString("nombre"),rows.getInt("cantidad"));
                lista.put(aux.getId(), aux);
            }
            return lista;
        } catch (Exception ex) {
            throw new SQLException("Error en traer todos los piqueos " + ex.getMessage());
        } finally {
            super.desconectar();
        }
    }
}
