package Adaptadores;

import Controladora.ControladoraCompras;
import Controladora.ControladoraUsuarios;
import Modelo.Compras;
import Modelo.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdaptadoraObtenerCompras", urlPatterns = {"/AdaptadoraObtenerCompras"})
public class AdaptadoraObtenerCompras extends HttpServlet {

    ControladoraCompras   Ccompras;
    ControladoraUsuarios Cusuarios;
    Compras               Ecompras;
    Usuarios             Eusuarios;
    
    @Override
     public void init(){
        try {
            Ccompras = new ControladoraCompras();
        } catch (Exception ex) {
            Logger.getLogger(AdaptadoraObtenerCompras.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            Cusuarios = new ControladoraUsuarios();
        } catch (Exception ex) {
            Logger.getLogger(AdaptadoraObtenerCompras.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            
            if(request.getParameter("id") != null){
                
                request.setAttribute("Compra", Ccompras.ObtenerCabezeraCompras(Integer.parseInt(request.getParameter("id"))));
            
            } else { if(request.getParameter("idUsuario") != null){
                
                request.setAttribute("ComprasUsuarios", Ccompras.ObtenerCabezeraCompras(Cusuarios.ObtenerUsuario(Integer.parseInt(request.getParameter("idUsuario")))));
            
            } }
            
        } catch (Exception ex) {
            
        } finally {
            
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
