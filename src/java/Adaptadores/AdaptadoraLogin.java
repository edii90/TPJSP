package Adaptadores;

import Controladora.ControladoraUsuarios;
import Modelo.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdaptadoraLogin", urlPatterns = {"/AdaptadoraLogin"})
public class AdaptadoraLogin extends HttpServlet {

    Usuarios Eusuarios;
    ControladoraUsuarios Cusuarios;

    @Override
    public void init() throws ServletException {
        try {
            Cusuarios = new ControladoraUsuarios();
        } catch (Exception ex) {
            Logger.getLogger(AdaptadoraLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String usuario = request.getParameter("usuario");
            String contraseña = request.getParameter("pass");

            Eusuarios = Cusuarios.Login(usuario, contraseña);

            if (Eusuarios != null) {
                request.getSession().setAttribute("user", Eusuarios);
                response.sendRedirect("main.jsp");

            } else {
                request.setAttribute("ErrorLogin", new String("Usuario o Contraseña Incorrecta"));
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);

            }

        } catch (Exception ex) {
            request.getSession().setAttribute("ErrorLogin", "Error al loguearse");
            response.sendRedirect("index.jsp");

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
