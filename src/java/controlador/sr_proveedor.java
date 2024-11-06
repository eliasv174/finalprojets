/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import modelo.Proveedor;
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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 
 */

@WebServlet(name = "sr_proveedor", urlPatterns = {"/sr_proveedor"})
public class sr_proveedor extends HttpServlet {
    private Connection conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String mensaje = "";

        if (accion != null) {
            try {
                switch (accion) {
                    case "agregar":
                        // Recoger los datos del formulario para agregar
                        String proveedor = request.getParameter("proveedor");
                        String NIT = request.getParameter("NIT");
                        String direccion = request.getParameter("direccion");
                        String telefono = request.getParameter("telefono");

                        // Llamar al método para agregar proveedor
                        agregarProveedor(new Proveedor(0, proveedor, NIT, direccion, telefono));
                        mensaje = "Proveedor agregado exitosamente.";
                        break;

                    case "actualizar":
                        // Actualizar el proveedor existente
                        int idProveedor = Integer.parseInt(request.getParameter("idProveedor"));
                        Proveedor proveedorExistente = buscarProveedor(idProveedor);

                        if (proveedorExistente != null) {
                            proveedor = request.getParameter("proveedor");
                            NIT = request.getParameter("NIT");
                            direccion = request.getParameter("direccion");
                            telefono = request.getParameter("telefono");

                            Proveedor proveedorActualizado = new Proveedor(idProveedor, proveedor, NIT, direccion, telefono);
                            if (actualizarProveedor(proveedorActualizado)) {
                                mensaje = "Proveedor actualizado exitosamente.";
                            } else {
                                mensaje = "Error al actualizar el proveedor.";
                            }
                        } else {
                            mensaje = "Proveedor no encontrado.";
                        }
                        break;
                }
            } catch (SQLException e) {
                throw new ServletException("Error al interactuar con la base de datos", e);
            }
        }

        // Redirigir al JSP con los mensajes y la lista de proveedores actualizada
        request.setAttribute("mensaje", mensaje);
        request.setAttribute("listaProveedores", leerProv());
        request.getRequestDispatcher("proveedor.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String mensaje = "";

        if (accion != null) {
            try {
                switch (accion) {
                    case "editar":
                        // Recoger el ID del proveedor y buscarlo en la base de datos
                        int idProveedor = Integer.parseInt(request.getParameter("idProveedor"));
                        Proveedor proveedor = buscarProveedor(idProveedor);

                        // Si el proveedor existe, lo enviamos al formulario para edición
                        if (proveedor != null) {
                            request.setAttribute("proveedor", proveedor);
                        } else {
                            mensaje = "Proveedor no encontrado.";
                        }
                        break;

                    case "eliminar":
                        // Eliminar el proveedor
                        idProveedor = Integer.parseInt(request.getParameter("idProveedor"));
                        if (eliminarProveedor(idProveedor)) {
                            mensaje = "Proveedor eliminado exitosamente.";
                        } else {
                            mensaje = "Proveedor no encontrado.";
                        }
                        break;
                }
            } catch (SQLException e) {
                throw new ServletException("Error al interactuar con la base de datos", e);
            }
        }

        // Redirigir al JSP con la lista de proveedores actualizada
        request.setAttribute("mensaje", mensaje);
        request.setAttribute("listaProveedores", leerProv());
        request.getRequestDispatcher("proveedor.jsp").forward(request, response);
    }

    private void agregarProveedor(Proveedor proveedor) throws SQLException {
        String sql = "INSERT INTO proveedores (proveedor, NIT, direccion, telefono) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setString(1, proveedor.getProveedor());
            stmt.setString(2, proveedor.getNit());
            stmt.setString(3, proveedor.getDireccion());
            stmt.setString(4, proveedor.getTelefono());
            stmt.executeUpdate();
        }
    }

    private Proveedor buscarProveedor(int idProveedor) throws SQLException {
        String sql = "SELECT * FROM proveedores WHERE idProveedor = ?";
        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setInt(1, idProveedor);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Proveedor(
                        rs.getInt("idProveedor"),
                        rs.getString("proveedor"),
                        rs.getString("NIT"),
                        rs.getString("direccion"),
                        rs.getString("telefono")
                    );
                }
            }
        }
        return null;
    }

    private boolean actualizarProveedor(Proveedor proveedor) throws SQLException {
        String sql = "UPDATE proveedores SET proveedor = ?, NIT = ?, direccion = ?, telefono = ? WHERE idProveedor = ?";
        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setString(1, proveedor.getProveedor());
            stmt.setString(2, proveedor.getNit());
            stmt.setString(3, proveedor.getDireccion());
            stmt.setString(4, proveedor.getTelefono());
            stmt.setInt(5, proveedor.getId_proveedor());
            return stmt.executeUpdate() > 0;
        }
    }

    private boolean eliminarProveedor(int idProveedor) throws SQLException {
        String sql = "DELETE FROM proveedores WHERE idProveedor = ?";
        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setInt(1, idProveedor);
            return stmt.executeUpdate() > 0;
        }
    }

    private List<Proveedor> leerProv() {
        List<Proveedor> lista = new ArrayList<>();
        String sql = "SELECT * FROM proveedores";
        try (PreparedStatement stmt = conexion.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Proveedor proveedor = new Proveedor(
                    rs.getInt("idProveedor"),
                    rs.getString("proveedor"),
                    rs.getString("NIT"),
                    rs.getString("direccion"),
                    rs.getString("telefono")
                );
                lista.add(proveedor);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
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
        } catch (SQLException ex) {
        System.out.println(ex.getMessage());
        }
    }
}
