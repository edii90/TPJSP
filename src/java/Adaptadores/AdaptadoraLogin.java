package Adaptadores;

import Controladora.ControladoraUsuarios;
import Modelo.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdaptadoraLogin", urlPatterns = {"/AdaptadoraLogin"})
public class AdaptadoraLogin extends HttpServlet {

    Usuarios Eusuarios;
    ControladoraUsuarios Cusuarios;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String usuario    = request.getParameter("usuario");
            String contraseña = request.getParameter("contraseña");
            
            Eusuarios         = Cusuarios.Login(usuario, contraseña);
            
            if (Eusuarios != null){
                //guardar en bean
                //redireccionar
            }else{
                //error
            }
            
        }catch (Exception ex){
        
        }finally {
        
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
