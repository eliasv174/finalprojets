/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Producto;

/**
 *
 * @author PC
 */
@WebServlet(name = "sr_productos", urlPatterns = {"/sr_productos"})
public class sr_productos extends HttpServlet {

    Producto producto;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setHeader("target", "FramePrincipal");

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_productos</title>");
            out.println("</head>");
            out.println("<body>");
            producto = new Producto(
                    Integer.valueOf(request.getParameter("lbl_id_producto")),
                    request.getParameter("txt_producto"),
                    Integer.valueOf(request.getParameter("id_marca")),
                    request.getParameter("txt_descripcion"),
                    null, // Imagen (puedes ajustarlo según tu implementación para manejar archivos)
                    Double.valueOf(request.getParameter("txt_precio_costo")),
                    Double.valueOf(request.getParameter("txt_precio_venta")),
                    Integer.valueOf(request.getParameter("txt_existencia")),
                    request.getParameter("txt_fecha_ingreso"));
            // agregar
            if ("agregar".equals(request.getParameter("btn_agregar"))) {
                if (producto.agregarProducto() > 0) {
                    response.sendRedirect("productos.jsp");
                } else {
                    out.println("<h1>-x-x-x-x-x-x-x NO SE AGREGO x-x-x-x-x-x-x-</h1>");
                    out.println("<a href='productos.jsp'>Regresar</a>");
                }
            }

            // modificar
            if ("modificar".equals(request.getParameter("btn_modificar"))) {
                if (producto.actualizarProducto() > 0) {
                    response.sendRedirect("productos.jsp");
                } else {
                    out.println("<h1>-x-x-x-x-x-x-x NO SE MODIFICO x-x-x-x-x-x-x-</h1>");
                    out.println("<a href='productos.jsp'>Regresar</a>");
                }
            }

            // eliminar
            if ("eliminar".equals(request.getParameter("btn_eliminar"))) {
                if (producto.eliminarProducto() > 0) {
                    response.sendRedirect("productos.jsp");
                } else {
                    out.println("<h1>-x-x-x-x-x-x-x NO SE ELIMINO x-x-x-x-x-x-x-</h1>");
                    out.println("<a href='productos.jsp'>Regresar</a>");
                }
            }
        }
    }

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