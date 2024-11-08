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
import modelo.Proveedor;

/**
 *
 * @author IT
 */
@WebServlet(name = "sr_proveedor", urlPatterns = {"/sr_proveedor"})
public class sr_proveedor extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Proveedor proveedor;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_proveedor</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sr_proveedor at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            proveedor = new Proveedor(Integer.valueOf(request.getParameter("txt_id_proveedor")),
                    request.getParameter("txt_proveedor"),
                    request.getParameter("txt_direccion"),
                    request.getParameter("txt_nit"),
                    request.getParameter("txt_telefono"));
            
            if("agregar".equals(request.getParameter("btn_agregar"))){
         if (proveedor.agregar()>0){
                response.sendRedirect("proveedores.jsp");
           } else{
               out.println("<h1>-x-x-x-x-x-x-x NO SE INGRESO x-x-x-x-x-x-x-</h1>");
               out.println("<a href='proveedores.jsp'>Regresar</a>");
         }
         }    
            
             if("modificar".equals(request.getParameter("btn_modificar"))){
         if (proveedor.modificar()>0){
                response.sendRedirect("proveedores.jsp");
           } else{
               out.println("<h1>-x-x-x-x-x-x-x NO SE MODIFICO x-x-x-x-x-x-x-</h1>");
               out.println("<a href='proveedores.jsp'>Regresar</a>");
         }
         }
                  //eliminar
         if("eliminar".equals(request.getParameter("btn_eliminar"))){
         if (proveedor.eliminarProv()>0){
                response.sendRedirect("proveedores.jsp");
           } else{
               out.println("<h1>-x-x-x-x-x-x-x NO SE ELIMINO x-x-x-x-x-x-x-</h1>");
               out.println("<a href='proveedores.jsp'>Regresar</a>");
         }
         }
            
            
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
