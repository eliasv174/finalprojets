/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Puesto;
import servicio.PuestoServicio;

/**
 *
 * @author yeymi
 */



@WebServlet("/PuestoControlador")
public class PuestoControlador extends HttpServlet {
    private PuestoServicio puestoServicio = new PuestoServicio();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        switch (accion) {
            case "nuevo":
               
                request.getRequestDispatcher("puesto/formularioPuesto.jsp").forward(request, response);
                break;

            case "editar":
                
                int idPuesto = Integer.parseInt(request.getParameter("id"));
                Puesto puesto = puestoServicio.obtenerPuestoPorId(idPuesto);
                request.setAttribute("puesto", puesto);
                request.getRequestDispatcher("puesto/formularioPuesto.jsp").forward(request, response);
                break;

            case "eliminar":
                
                int idPuestoEliminar = Integer.parseInt(request.getParameter("id"));
                puestoServicio.eliminarPuesto(idPuestoEliminar);
                response.sendRedirect("PuestoControlador?accion=listar");
                break;

            case "listar":
            default:
                
                request.setAttribute("puestos", puestoServicio.listarPuestos());
                request.getRequestDispatcher("puesto/listaPuestos.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idPuesto = request.getParameter("idPuesto");
        String nombrePuesto = request.getParameter("puesto");

        Puesto puesto = new Puesto();
        puesto.setPuesto(nombrePuesto);

        if (idPuesto == null || idPuesto.isEmpty()) {
            
            puestoServicio.guardarPuesto(puesto);
        } else {
            
            puesto.setIdPuesto(Integer.parseInt(idPuesto));
            puestoServicio.actualizarPuesto(puesto);
        }

        
        response.sendRedirect("PuestoControlador?accion=listar");
    }
}
