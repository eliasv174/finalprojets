/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Puestos;

/**
 *
 * @author yeymi
 */


// Controlador PuestosControlador.java


@WebServlet(name = "PuestosControlador", urlPatterns = {"/PuestosControlador"})
public class PuestosControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        Puestos puestos = new Puestos();
        
        if (action == null) {
            action = "listar";
        }

        switch (action) {
            case "listar":
                List<Puestos> lista = puestos.listar();
                request.setAttribute("puestos", lista);
                request.getRequestDispatcher("puestos.jsp").forward(request, response);
                break;
            case "eliminar":
                try {
                    int idPuesto = Integer.parseInt(request.getParameter("id"));
                    puestos.eliminar(idPuesto);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
                response.sendRedirect("PuestosControlador?action=listar");
                break;
            default:
                response.sendRedirect("PuestosControlador?action=listar");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        Puestos puesto = new Puestos();
        
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "agregar":
                puesto.setPuesto(request.getParameter("puesto"));
                puesto.agregar(puesto);
                response.sendRedirect("PuestosControlador?action=listar");
                break;
            case "actualizar":
                try {
                    puesto.setIdPuesto(Integer.parseInt(request.getParameter("idPuesto")));
                    puesto.setPuesto(request.getParameter("puesto"));
                    puesto.actualizar(puesto);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
                response.sendRedirect("PuestosControlador?action=listar");
                break;
            default:
                response.sendRedirect("PuestosControlador?action=listar");
                break;
        }
    }
}
