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
import modelo.Usuario;

/**
 *
 * @author IT
 */

public class sr_usuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    Usuario usuario;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_usuario</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sr_usuario at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            usuario = new Usuario(Integer.valueOf(request.getParameter("txt_id_usuario")),
            Integer.valueOf(request.getParameter("txt_id_empleado")),
            request.getParameter("txt_usuario"),
            request.getParameter("txt_contrasena"));
                    
            if("agregar".equals(request.getParameter("btn_agregar"))){
         if (usuario.agregar()>0){
                response.sendRedirect("usuarios.jsp");
           } else{
               out.println("<h1>-x-x-x-x-x-x-x NO SE INGRESO x-x-x-x-x-x-x-</h1>");
               out.println("<a href='usuarios.jsp'>Regresar</a>");
         }
         }    
            
             if("modificar".equals(request.getParameter("btn_modificar"))){
         if (usuario.modificar()>0){
                response.sendRedirect("usuarios.jsp");
           } else{
               out.println("<h1>-x-x-x-x-x-x-x NO SE MODIFICO x-x-x-x-x-x-x-</h1>");
               out.println("<a href='usuarios.jsp'>Regresar</a>");
         }
         }
                  //eliminar
         if("eliminar".equals(request.getParameter("btn_eliminar"))){
         if (usuario.eliminar()>0){
                response.sendRedirect("usuarios.jsp");
           } else{
               out.println("<h1>-x-x-x-x-x-x-x NO SE ELIMINO x-x-x-x-x-x-x-</h1>");
               out.println("<a href='usuarios.jsp'>Regresar</a>");
            
        }
    }
        }}}