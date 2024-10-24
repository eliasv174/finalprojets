/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controlador;

import modelo.Cliente;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * @author yeymi
 */
@WebServlet(name = "ClienteControlador", urlPatterns = {"/ClienteControlador"})
public class ClienteControlador extends HttpServlet {
    private Connection conexion;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/puntoventa", "root", "123456789");
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException("Error al conectar con la base de datos", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String mensaje = "";

        if (accion != null) {
            try {
                switch (accion) {
                    case "agregar":
                        String nombres = request.getParameter("nombres");
                        String apellidos = request.getParameter("apellidos");
                        String nit = request.getParameter("nit");
                        boolean genero = Boolean.parseBoolean(request.getParameter("genero"));
                        String telefono = request.getParameter("telefono");
                        String correoElectronico = request.getParameter("correoElectronico");
                        LocalDateTime fechaIngreso = LocalDateTime.now();

                        agregarCliente(new Cliente(0, nombres, apellidos, nit, genero, telefono, correoElectronico, fechaIngreso));
                        mensaje = "Cliente agregado exitosamente.";
                        break;
                    case "eliminar":
                        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
                        if (eliminarCliente(idCliente)) {
                            mensaje = "Cliente eliminado exitosamente.";
                        } else {
                            mensaje = "Cliente no encontrado.";
                        }
                        break;
                    case "actualizar":
                        idCliente = Integer.parseInt(request.getParameter("idCliente"));
                        Cliente clienteExistente = buscarCliente(idCliente);
                        if (clienteExistente != null) {
                            nombres = request.getParameter("nombres");
                            apellidos = request.getParameter("apellidos");
                            nit = request.getParameter("nit");
                            genero = Boolean.parseBoolean(request.getParameter("genero"));
                            telefono = request.getParameter("telefono");
                            correoElectronico = request.getParameter("correoElectronico");
                            fechaIngreso = LocalDateTime.now();

                            Cliente clienteActualizado = new Cliente(idCliente, nombres, apellidos, nit, genero, telefono, correoElectronico, fechaIngreso);
                            if (actualizarCliente(clienteActualizado)) {
                                mensaje = "Cliente actualizado exitosamente.";
                            } else {
                                mensaje = "Error al actualizar el cliente.";
                            }
                        } else {
                            mensaje = "Cliente no encontrado.";
                        }
                        break;
                }
            } catch (SQLException e) {
                throw new ServletException("Error al interactuar con la base de datos", e);
            }
        }

        request.setAttribute("mensaje", mensaje);
        request.setAttribute("listaClientes", listarClientes());
        request.getRequestDispatcher("vistaCliente.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String mensaje = "";

        if ("eliminar".equals(accion)) {
            try {
                int idCliente = Integer.parseInt(request.getParameter("idCliente"));
                if (eliminarCliente(idCliente)) {
                    mensaje = "Cliente eliminado exitosamente.";
                } else {
                    mensaje = "Cliente no encontrado.";
                }
            } catch (SQLException e) {
                throw new ServletException("Error al interactuar con la base de datos", e);
            }
        }

        request.setAttribute("mensaje", mensaje);
        request.setAttribute("listaClientes", listarClientes());
        request.getRequestDispatcher("vistaCliente.jsp").forward(request, response);
    }

    private void agregarCliente(Cliente cliente) throws SQLException {
        String sql = "INSERT INTO clientes (nombres, apellidos, nit, genero, telefono, correo_electronico, fechaingreso) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setString(1, cliente.getNombres());
            stmt.setString(2, cliente.getApellidos());
            stmt.setString(3, cliente.getNit());
            stmt.setBoolean(4, cliente.isGenero());
            stmt.setString(5, cliente.getTelefono());
            stmt.setString(6, cliente.getCorreoElectronico());
            stmt.setObject(7, cliente.getFechaIngreso());
            stmt.executeUpdate();
        }
    }

    private Cliente buscarCliente(int idCliente) throws SQLException {
        String sql = "SELECT * FROM clientes WHERE idCliente = ?";
        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setInt(1, idCliente);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Cliente(
                        rs.getInt("idCliente"),
                        rs.getString("nombres"),
                        rs.getString("apellidos"),
                        rs.getString("nit"),
                        rs.getBoolean("genero"),
                        rs.getString("telefono"),
                        rs.getString("correo_electronico"),
                        rs.getTimestamp("fechaingreso").toLocalDateTime()
                    );
                }
            }
        }
        return null;
    }

    private boolean actualizarCliente(Cliente cliente) throws SQLException {
        String sql = "UPDATE clientes SET nombres = ?, apellidos = ?, nit = ?, genero = ?, telefono = ?, correo_electronico = ?, fechaingreso = ? WHERE idCliente = ?";
        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setString(1, cliente.getNombres());
            stmt.setString(2, cliente.getApellidos());
            stmt.setString(3, cliente.getNit());
            stmt.setBoolean(4, cliente.isGenero());
            stmt.setString(5, cliente.getTelefono());
            stmt.setString(6, cliente.getCorreoElectronico());
            stmt.setObject(7, cliente.getFechaIngreso());
            stmt.setInt(8, cliente.getIdCliente());
            return stmt.executeUpdate() > 0;
        }
    }

    private boolean eliminarCliente(int idCliente) throws SQLException {
        String sql = "DELETE FROM clientes WHERE idCliente = ?";
        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setInt(1, idCliente);
            return stmt.executeUpdate() > 0;
        }
    }

    private List<Cliente> listarClientes() {
        List<Cliente> lista = new ArrayList<>();
        String sql = "SELECT * FROM clientes";
        try (PreparedStatement stmt = conexion.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Cliente cliente = new Cliente(
                    rs.getInt("idCliente"),
                    rs.getString("nombres"),
                    rs.getString("apellidos"),
                    rs.getString("nit"),
                    rs.getBoolean("genero"),
                    rs.getString("telefono"),
                    rs.getString("correo_electronico"),
                    rs.getTimestamp("fechaingreso").toLocalDateTime()
                );
                lista.add(cliente);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    @Override
    public void destroy() {
        super.destroy();
        try {
            if (conexion != null && !conexion.isClosed()) {
                conexion.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
