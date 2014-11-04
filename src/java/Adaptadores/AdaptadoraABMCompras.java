package Adaptadores;

import Controladora.ControladoraCompras;
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

@WebServlet(name = "AdaptadoraABMCompras", urlPatterns = {"/AdaptadoraABMCompras"})
public class AdaptadoraABMCompras extends HttpServlet {

    ControladoraCompras Ccompras;

    @Override
    public void init() {
        try {
            Ccompras = new ControladoraCompras();
        } catch (Exception ex) {
            Logger.getLogger(AdaptadoraABMCompras.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private boolean NuevaCompra(HttpServletRequest request, HttpServletResponse response) throws Exception {

        Hashtable lista = (Hashtable) request.getSession().getAttribute("detalles");
        Usuarios user = (Usuarios) request.getSession().getAttribute("user");
        return Ccompras.AltaCompra(user, lista);
    }

    private boolean ConfirmarCompra(HttpServletRequest request, HttpServletResponse response) throws Exception {

        return Ccompras.ConfirmarCompra(Ccompras.ObtenerCabezeraCompras(Integer.parseInt(request.getParameter("id"))));
    }

    private boolean RechazarCompra(HttpServletRequest request, HttpServletResponse response) throws Exception {

        return Ccompras.RechazarCompra(Ccompras.ObtenerCabezeraCompras(Integer.parseInt(request.getParameter("id"))));
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            String funcion = request.getParameter("funcion");

            if (funcion == null) {
                //error
            } else {
                if (funcion.equals("alta")) {
                    boolean rta = NuevaCompra(request, response);
                    if(rta)
                    {
                        out.println("history.jsp");
                    }
                    
                } else if (funcion.equals("confirmar")) {
                    boolean rta = ConfirmarCompra(request, response);
                    if(rta)
                    {
                        request.getSession().setAttribute("ABMCompras", new String("Compra confirmada"));
                    }
                    else
                    {
                        request.getSession().setAttribute("ABMCompras", new String("Error al confirmar compra"));
                    }
                    
                } else if (funcion.equals("rechazar")) {
                    boolean rta = RechazarCompra(request, response);
                    if(rta)
                    {
                        request.getSession().setAttribute("ABMCompras", new String("Compra rechazada"));
                    }
                    else
                    {
                        request.getSession().setAttribute("ABMCompras", new String("Error al rechazar compra"));
                    }
                }
            }

        } catch (Exception ex) {

        } finally {
            out.close();
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
