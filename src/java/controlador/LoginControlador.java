/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;
import modelo.UsuarioDAO;

/**
 *
 * @author yeymi
 */






@WebServlet(name = "LoginControlador", urlPatterns = {"/LoginControlador"})
public class LoginControlador extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Manejo del cierre de sesión
        String accion = request.getParameter("accion");
        if ("cerrar".equals(accion)) {
            HttpSession session = request.getSession();
            session.invalidate();  // Invalida la sesión
            response.sendRedirect("login.jsp");  // Redirige a login
            return;
        }
        
        // Obtener parámetros del formulario de login
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        // Crear un objeto Usuario y asignar valores
        Usuario user = new Usuario();
        user.setUsuario(usuario);
        user.setContrasena(contrasena);

        // Crear un DAO para validar el usuario
        UsuarioDAO dao = new UsuarioDAO();
        int resultado = dao.validarUsuario(user);

        // Si el login es exitoso
        if (resultado == 1) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);  // Almacenar el usuario en la sesión
            response.sendRedirect("index.jsp");  // Redirigir a la página principal
        } else {
            // Si el login falla, redirigir al login con un error
            response.sendRedirect("login.jsp?error=true");
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

    @Override
    public String getServletInfo() {
        return "Servlet para gestionar el login y cierre de sesión";
    }
}

