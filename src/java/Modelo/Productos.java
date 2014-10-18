/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Modelo;

public class Productos {
    private int id;
    private String nombre;
    private float precio;
    private int stock;
    private String img;

    public int getId() {
        return id;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String Nombre) {
        this.nombre = Nombre;
    }
    public float getPrecio() {
        return precio;
    }
    public void setPrecio(float precio) {
        this.precio = precio;
    } 
    public int getStock() {
        return stock;
    }
    public void setStock(int stock) {
        this.stock = stock;
    }
    public String getImg() {
        return img;
    }
    public void setImg(String img) {
        this.img = img;
    }
    
    public Productos()
    {
        
    }
    
    public Productos(String Nombre,float Precio,int Stock,String imagen)
    {
        nombre = Nombre;
        precio = Precio;
        stock = Stock;
        img = imagen;
    }
    
    public Productos(int Id, String Nombre,float Precio,int Stock,String imagen)
    {
        id = Id;
        nombre = Nombre;
        precio = Precio;
        stock = Stock;
        img = imagen;
    }
    public Productos(int Id, String Nombre)
    {
        id = Id;
        nombre = Nombre;
    }
}
