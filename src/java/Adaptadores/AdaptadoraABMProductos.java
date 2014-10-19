package Adaptadores;

import Controladora.ControladoraProductos;
import Modelo.Productos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdaptadoraABMProductos", urlPatterns = {"/AdaptadoraABMProductos"})
public class AdaptadoraABMProductos extends HttpServlet {

    ControladoraProductos Cproductos;
    Productos Eproductos;
    
    private boolean NuevoProducto(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        String nombre   =   request.getParameter("nombre");
        float precio    =   Float.valueOf(request.getParameter("precio"));
        int stock       =   Integer.parseInt(request.getParameter("stock"));
        String imagen   =   request.getParameter("imagen");
        
        return Cproductos.AltaProducto(nombre, precio, stock, imagen);
    }
    
    private boolean EliminarProducto(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        int id   = Integer.parseInt(request.getParameter("id"));
                
        return Cproductos.BajaProducto(id);
    }
    
    private boolean ModificarProducto(HttpServletRequest request, HttpServletResponse response) throws Exception{
    
        int id          =   Integer.parseInt(request.getParameter("id"));
        String nombre   =   request.getParameter("nombre");
        float precio    =   Float.valueOf(request.getParameter("precio"));
        int stock       =   Integer.parseInt(request.getParameter("stock"));
        String imagen   =   request.getParameter("imagen");
        
        Eproductos = new Productos(id, nombre, precio, stock, imagen);
        
        return Cproductos.ModificarProducto(Eproductos);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {

        try {
            
            String funcion = request.getParameter("funcion");
            
            if (funcion == null){
                //error
            }else{
                if(funcion.equals("alta"))
                {
                    request.setAttribute("respuesta",NuevoProducto(request, response));
                }
                else if(funcion.equals("baja"))
                {
                    request.setAttribute("respuesta",EliminarProducto(request, response));
                }
                else if(funcion.equals("modificacion"))
                {
                    request.setAttribute("respuesta",ModificarProducto(request, response));
                }
            }
                
        }catch (Exception ex){
        
        }finally {
        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
