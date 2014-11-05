package Modelo;

import java.sql.Date;
import java.util.Hashtable;

public class Piqueos {
    private int id;
    private Hashtable productos;
    private String estado;
    private Date fecha;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public Hashtable getProductos() {
        return productos;
    }
    public void setProductos(Hashtable productos) {
        this.productos = productos;
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
    
    public Piqueos(int Id,int est,Date fec)
    {
        id=Id;
        if(est == 1)
            estado = "No procesado";
        if(est == 2)
            estado = "Entregado";
        fecha = fec;
    }
}
