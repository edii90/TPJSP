package Adaptadores;

import Controladora.ControladoraUsuarios;
import Datos.DAOusuarios;
import Modelo.Usuarios;
import java.beans.Beans;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ControladoraUsuarios", urlPatterns = {"/ControladoraUsuarios"})

public class AdaptadoraABMUsuarios extends HttpServlet {
    
    ControladoraUsuarios Cusuario;
    Usuarios Eusuarios;
    @Override
     public void init(){
        try {
            Cusuario = new ControladoraUsuarios();
        } catch (Exception ex) {
            Logger.getLogger(AdaptadoraABMUsuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
    
    
    private boolean NuevoUsuario(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        String usuario    =   request.getParameter("usuario");
        String contraseña =   request.getParameter("contraseña");
        int documento     =   Integer.parseInt(request.getParameter("documento"));
        String nombre     =   request.getParameter("nombre");
        String apellido   =   request.getParameter("apellido");
        int tipo          =   Integer.parseInt(request.getParameter("tipo"));
                
        return Cusuario.AltaUsuario(usuario, contraseña, documento, nombre, apellido, tipo);
    }
    
    private boolean EliminarUsuario(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        int id            =  Integer.parseInt(request.getParameter("id"));
        
        return Cusuario.BajaUsuario(id);
    }
    
    private boolean ModificarUsuario(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        int id            =   Integer.parseInt(request.getParameter("id"));
        String usuario    =   request.getParameter("usuario");
        String contraseña =   request.getParameter("contraseña");
        int documento     =   Integer.parseInt(request.getParameter("documento"));
        String nombre     =   request.getParameter("nombre");
        String apellido   =   request.getParameter("apellido");
        int tipo          =   Integer.parseInt(request.getParameter("tipo"));
        
        Eusuarios = new Usuarios(id, usuario, contraseña, documento, nombre, apellido, tipo);
        
        return Cusuario.ModificarUsuario(Eusuarios);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            
            String funcion = request.getParameter("funcion");
            
            if (funcion == null){
                //error
            }else{
                if(funcion.equals("alta"))
                {
                    boolean respuesta;
                    respuesta = NuevoUsuario(request, response);
                }
                else if(funcion.equals("baja"))
                {
                    boolean respuesta;
                    respuesta = EliminarUsuario(request, response);
                }
                else if(funcion.equals("modificacion"))
                {
                    boolean respuesta;
                    respuesta = ModificarUsuario(request, response);
                }
            }
                
        }catch (Exception ex){
        
        }finally {
        
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
