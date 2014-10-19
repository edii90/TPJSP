package Adaptadores;

import Controladora.ControladoraCompras;
import Controladora.ControladoraUsuarios;
import Modelo.Compras;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdaptadoraABMCompras", urlPatterns = {"/AdaptadoraABMCompras"})
public class AdaptadoraABMCompras extends HttpServlet {

    ControladoraCompras   Ccompras;
    ControladoraUsuarios Cusuarios;
    
    private boolean NuevaCompra(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        Hashtable lista = null;
        return Ccompras.AltaCompra(Cusuarios.ObtenerUsuario(Integer.parseInt(request.getParameter("id"))), lista);
    }
    
    private boolean ConfirmarCompra(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        return Ccompras.ConfirmarCompra(Ccompras.ObtenerCabezeraCompras(Integer.parseInt(request.getParameter("id"))));
    }
    
    private boolean RechazarCompra(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        return Ccompras.RechazarCompra(Ccompras.ObtenerCabezeraCompras(Integer.parseInt(request.getParameter("id"))));
    }    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            
            String funcion = request.getParameter("funcion");
            
            if (funcion == null){
                //error
            }else{
                if(funcion.equals("alta"))
                {
                    request.setAttribute("respuesta",NuevaCompra(request, response));
                }
                else if(funcion.equals("confirmar"))
                {
                    request.setAttribute("respuesta",ConfirmarCompra(request, response));
                }
                else if(funcion.equals("rechazar"))
                {
                    request.setAttribute("respuesta",RechazarCompra(request, response));
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
