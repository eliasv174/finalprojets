/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;  // Importa HttpSession
import modelo.Usuario;
import modelo.UsuarioDAO;

@WebServlet(name = "sr_validar", urlPatterns = {"/sr_validar"})
public class sr_validar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        if ("cerrar".equals(accion)) {
            HttpSession session = request.getSession(false);  // Usa getSession(false) para evitar crear una nueva sesión
            if (session != null) {
                session.invalidate();  // Invalida la sesión si existe
            }
            response.sendRedirect("login.jsp");  // Redirige a login
            return;
        }
        
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        Usuario user = new Usuario();
        user.setUsuario(usuario);
        user.setContrasena(contrasena);

        UsuarioDAO dao = new UsuarioDAO();
        int resultado = dao.validarUsuario(user);

        if (resultado == 1) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario); 
            response.sendRedirect("index.jsp"); 
        } else {
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
