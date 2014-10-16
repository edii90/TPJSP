package Adaptadores;

import Controladora.ControladoraCompras;
import Controladora.ControladoraUsuarios;
import Modelo.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdaptadoraObtenerUsuarios", urlPatterns = {"/AdaptadoraObtenerUsuarios"})
public class AdaptadoraObtenerUsuarios extends HttpServlet {

    ControladoraUsuarios Cusuarios;
    Usuarios Eusuarios;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            
            if(request.getParameter("id") != null){
                int idUsuario = Integer.parseInt(request.getParameter("id"));
                Eusuarios     = Cusuarios.ObtenerUsuario(idUsuario);
                //guardo en session o paso por request
            }else{
                Hashtable Usuarios = Cusuarios.ObtenerUsuario();
                //guardo en session o paso por request
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
