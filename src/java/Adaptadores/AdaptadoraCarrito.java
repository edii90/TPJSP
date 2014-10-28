/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Adaptadores;

import Modelo.LineaDeCompra;
import Modelo.Productos;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Leandro
 */
public class AdaptadoraCarrito extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String tipo = request.getParameter("accionCarro").toUpperCase();
            if (tipo.equals("A")) {
                int items = agregarItem(request, response);
                out.println(items);
            } else if (tipo.equals("M")) {
                modificarItem(request, response);
                out.println("checkout.jsp");
            } else if (tipo.equals("E")) {
                eliminarItem(request, response);
                out.println("checkout.jsp");
            }

        } finally {
            out.close();
        }
    }

    protected int agregarItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);

        Hashtable lista = new Hashtable();
        Hashtable detalles = new Hashtable();

        lista = (Hashtable) session.getAttribute("Productos");
        if (session.getAttribute("detalles") != null) {
            detalles = (Hashtable) session.getAttribute("detalles");
        }

        int idprod = Integer.parseInt(request.getParameter("idprod"));
        int cant = Integer.parseInt(request.getParameter("cant"));
        int items = 0;

        Productos prod = new Productos();
        if (lista.containsKey(idprod)) {
            prod = (Productos) lista.get(idprod);
            if (detalles.containsKey(prod.getId())) {
                LineaDeCompra aux = new LineaDeCompra();
                aux = (LineaDeCompra) detalles.get(prod.getId());
                aux.setCantidad(aux.getCantidad() + cant);
                detalles.put(aux.getId(), aux);
                session.setAttribute("detalles", detalles);
            } else {
                LineaDeCompra aux = new LineaDeCompra(prod.getId(), prod.getNombre(), prod.getPrecio(), cant);
                aux.setImg(prod.getImg());
                aux.setStock(prod.getStock());
                detalles.put(aux.getId(), aux);
                session.setAttribute("detalles", detalles);
            }
        }
        items = detalles.size();
        return items;

    }
    protected void eliminarItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        Hashtable detalles = new Hashtable();
        if (session.getAttribute("detalles") != null) {
            detalles = (Hashtable) session.getAttribute("detalles");
        }

        int idprod = Integer.parseInt(request.getParameter("idprod"));

        detalles.remove(idprod);
        session.setAttribute("detalles", detalles);
    }
    protected void modificarItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        Hashtable detalles = new Hashtable();

        if (session.getAttribute("detalles") != null) {
            detalles = (Hashtable) session.getAttribute("detalles");
        }

        int idprod = Integer.parseInt(request.getParameter("idprod"));
        int cant = Integer.parseInt(request.getParameter("cant"));

        LineaDeCompra aux = new LineaDeCompra();
                aux = (LineaDeCompra) detalles.get(idprod);
                aux.setCantidad(cant);
                detalles.put(aux.getId(), aux);
                session.setAttribute("detalles", detalles);

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
