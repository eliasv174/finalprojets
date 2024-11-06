/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Puesto;

/**
 *
 * @author IT
 */
public class sr_puestos extends HttpServlet {
    Puesto puesto;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_empleado</title>");
            out.println("</head>");
            out.println("<body>");
            puesto = new Puesto(Integer.valueOf(request.getParameter("txt_id_puesto")), request.getParameter("txt_puesto"));

            // agregar
            if ("agregar".equals(request.getParameter("btn_agregar"))) {
                if (puesto.agregarPuesto() > 0) {
                    response.sendRedirect("puestos.jsp");
                } else {
                    out.println("<h1>-x-x-x-x-x-x-x NO SE AGREGO x-x-x-x-x-x-x-</h1>");
                    out.println("<a href='puestos.jsp'>Regresar</a>");
              }
            }

            // modificar
            if ("modificar".equals(request.getParameter("btn_modificar"))) {
                if (puesto.modificarPuesto() > 0) {
                    response.sendRedirect("/puestos.jsp");
                } else {
                    out.println("<h1>-x-x-x-x-x-x-x NO SE MODIFICO x-x-x-x-x-x-x-</h1>");
                    out.println("<a href='puestos.jsp'>Regresar</a>");
                }
            }

            // eliminar
            if ("eliminar".equals(request.getParameter("btn_eliminar"))) {
                if (puesto.eliminarPuesto() > 0) {
                    response.sendRedirect("puestos.jsp");
                } else {
                    out.println("<h1>-x-x-x-x-x-x-x NO SE ELIMINO x-x-x-x-x-x-x-</h1>");
                    out.println("<a href='puestos.jsp'>Regresar</a>");
                }
            }
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
}
