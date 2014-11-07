/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Adaptadores;

import Controladora.ControladoraPiqueo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Leandro
 */
@WebServlet(name = "ConfirmarPiqueo", urlPatterns = {"/ConfirmarPiqueo"})
public class ConfirmarPiqueo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
      ControladoraPiqueo Cpiqueo;
    
    @Override
     public void init(){

            try {
                Cpiqueo = new ControladoraPiqueo();
            } catch (Exception ex) {
                Logger.getLogger(ConfirmarPiqueo.class.getName()).log(Level.SEVERE, null, ex);
            }

     }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           boolean rta = false;
           int idpiqueo = Integer.parseInt(request.getParameter("idp"));
           rta = Cpiqueo.ConfirmarPiqueo(idpiqueo);
           
           if(rta)
           {
               request.getSession().setAttribute("MsjPiqueos", new String ("Piqueo confirmado correctamente"));
               out.println("piqueo.jsp");
           }
           else
           {
               request.getSession().setAttribute("MsjPiqueos", new String ("Error al confirmar piqueo"));
               out.println("piqueo.jsp");
           }
           
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
          try {
              processRequest(request, response);
          } catch (Exception ex) {
              Logger.getLogger(ConfirmarPiqueo.class.getName()).log(Level.SEVERE, null, ex);
          }
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
          try {
              processRequest(request, response);
          } catch (Exception ex) {
              Logger.getLogger(ConfirmarPiqueo.class.getName()).log(Level.SEVERE, null, ex);
          }
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
