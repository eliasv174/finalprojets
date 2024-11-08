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
import javax.servlet.http.HttpSession;
import modelo.Usuario;
import modelo.UsuarioDAO;

@WebServlet(name = "sr_validar_admin", urlPatterns = {"/sr_validar_admin"})
public class sr_validar_admin extends HttpServlet {

       UsuarioDAO usuariod;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener parámetros de usuario y contraseña desde la solicitud
        
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");


        // Verificar que los campos no estén vacíos
        if (usuario == null || contrasena == null || usuario.isEmpty() || contrasena.isEmpty()) {
            response.getWriter().write("error"); // Si los campos están vacíos, enviar error
            return;
        }

        // Crear objeto Usuario y establecer usuario y contraseña
        Usuario user = new Usuario();
        user.setUsuario(usuario);
        user.setContrasena(contrasena);

        // Instanciar UsuarioDAO para validar el usuario
        UsuarioDAO dao = new UsuarioDAO();
        int resultado = dao.validarUsuario(user);

        // Configurar la respuesta para ser de tipo texto plano
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        if (resultado == 1) {
            // Usuario válido: Enviar respuesta de éxito
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario); // Establecer el usuario en la sesión
            out.write("success"); // Indicar que la autenticación fue exitosa
            session.setAttribute("usuario", usuario);
            response.getWriter().write("success");
        } else {
            // Usuario no válido: Enviar respuesta de error
            out.write("error"); // Indicar que la autenticación falló}
            response.getWriter().write("error"); // 'error' si la autenticación falla
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para validar administrador y gestionar inicio de sesión";
    }
}
