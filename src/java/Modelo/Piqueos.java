package Modelo;

import java.sql.Date;
import java.util.Hashtable;

public class Piqueos {
    private int id;
    private int idProd;
    private String nombre;
    private int cantidad;
    private String estado;
    private Date fecha;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getCantidad() {
        return cantidad;
    }
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    public String getEstado() {
        return estado;
    }
    public void setEstado(String estado) {
        this.estado = estado;
    }
    public Date getFecha() {
        return fecha;
    }
    public void setFecha(Date fecha) {
        this.fecha = fecha;
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
    
    public Piqueos(int Id,int idp,String name,int cant,int est,Date fec)
    {
        id=Id;
        idProd = idp;
        nombre = name;
        cantidad=cant;
        if(est == 1)
            estado = "No procesado";
        if(est == 2)
            estado = "Entregado";
        fecha = fec;
    }
}
