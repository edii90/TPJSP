/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Modelo;

/**
 *
 * @author Edii
 */
public class LineaDePiqueo {

    private int idProd;
    private String nombre;
    private int cantidad;
    
    public int getCantidad() {
        return cantidad;
    }
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    public int getIdProd() {
        return idProd;
    }
    public void setIdProd(int idProd) {
        this.idProd = idProd;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public LineaDePiqueo(int idP,String nomb,int cant)
    {
        idProd = idP;
        nombre = nomb;
        cantidad = cant;
    }
}
