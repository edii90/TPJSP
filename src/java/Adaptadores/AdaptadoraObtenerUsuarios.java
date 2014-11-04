package Adaptadores;

import Controladora.ControladoraCompras;
import Controladora.ControladoraUsuarios;
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

@WebServlet(name = "AdaptadoraObtenerUsuarios", urlPatterns = {"/AdaptadoraObtenerUsuarios"})
public class AdaptadoraObtenerUsuarios extends HttpServlet {

    ControladoraUsuarios Cusuarios;
    Usuarios Eusuarios;
    @Override
     public void init(){
        try {
            Cusuarios = new ControladoraUsuarios();
        } catch (Exception ex) {
            Logger.getLogger(AdaptadoraObtenerUsuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            
            if(request.getParameter("id") != null){
                
                request.getSession().setAttribute("usuario", Cusuarios.ObtenerUsuario(Integer.parseInt(request.getParameter("id"))));                
            }else{
                 request.getSession().setAttribute("usuarios", Cusuarios.ObtenerUsuario());                 
            }
        } catch (Exception ex) {
            
        } finally {
            
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
