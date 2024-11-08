/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import modelo.UsuarioAD;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;

public class sr_validar_adm extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");
        
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        Usuario user = new Usuario();
        user.setUsuario(usuario);
        user.setContrasena(contrasena);

        UsuarioAD dao = new UsuarioAD();
        int resultado = dao.validarUsuario(user);

        if (resultado == 1) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            response.getWriter().write("success");  // Respuesta de éxito
            } else {
            response.getWriter().write("error");  // Respuesta de error
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        processRequest(request, response);
    }
}
