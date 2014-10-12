package Modelo;
public class Piqueos {
    private int id;
    private String nombre;
    private int cantidad;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public int getCantidad() {
        return cantidad;
    }
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    public Piqueos(int Id,String nomb,int cant)
    {
        id=Id;
        nombre=nomb;
        cantidad=cant;
    }
}
