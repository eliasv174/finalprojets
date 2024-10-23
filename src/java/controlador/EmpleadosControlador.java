/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Conexion;
import modelo.Empleado;

@WebServlet("/empleados")
public class EmpleadosControlador extends HttpServlet {

    private Conexion conexion = new Conexion();  // Instancia de la clase de conexión

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "listar"; // Acción predeterminada
        }

        switch (action) {
            case "eliminar":
                eliminarEmpleado(request, response);
                break;
            case "editar":
                mostrarFormularioEditar(request, response);
                break;
            default:
                listarEmpleados(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "listar"; // Acción predeterminada
        }

        switch (action) {
            case "agregar":
                agregarEmpleado(request, response);
                break;
            case "actualizar":
                actualizarEmpleado(request, response);
                break;
            default:
                listarEmpleados(request, response);
                break;
        }
    }

    // Método para listar empleados
    private void listarEmpleados(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Empleado> empleados = new ArrayList<>();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = conexion.getConnection();  // Obtener la conexión a la base de datos
            String sql = "SELECT * FROM empleados";  // Consulta para obtener todos los empleados
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            // Iterar sobre el resultado de la consulta y agregar empleados a la lista
            while (rs.next()) {
                Empleado empleado = new Empleado();
                empleado.setIdEmpleado(rs.getInt("idEmpleado"));
                empleado.setNombres(rs.getString("nombres"));
                empleado.setApellidos(rs.getString("apellidos"));
                empleado.setDireccion(rs.getString("direccion"));
                empleado.setTelefono(rs.getString("telefono"));
                empleado.setDpi(rs.getString("DPI"));
                empleado.setGenero(rs.getBoolean("genero"));
                empleado.setFechaNacimiento(rs.getString("fecha_nacimiento"));
                empleado.setIdPuesto(rs.getInt("idPuesto"));
                empleado.setFechaInicioLabores(rs.getString("fecha_inicio_labores"));
                empleado.setFechaIngreso(rs.getTimestamp("fechaingreso"));

                // Agregar empleado a la lista
                empleados.add(empleado);
            }

            // Pasar la lista de empleados al JSP
            request.setAttribute("empleados", empleados);

            // Redirigir al JSP de empleados
            request.getRequestDispatcher("empleados.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            // Mostrar un mensaje de error en la consola
            System.out.println("Error al obtener empleados: " + e.getMessage());

        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Método para agregar empleado a la base de datos
    private void agregarEmpleado(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = conexion.getConnection();  // Obtener la conexión a la base de datos
            String sql = "INSERT INTO empleados (nombres, apellidos, direccion, telefono, DPI, genero, fecha_nacimiento, idPuesto, fecha_inicio_labores, fechaingreso) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            ps = conn.prepareStatement(sql);

            // Asignar los valores del formulario al PreparedStatement
            ps.setString(1, request.getParameter("nombres"));
            ps.setString(2, request.getParameter("apellidos"));
            ps.setString(3, request.getParameter("direccion"));
            ps.setString(4, request.getParameter("telefono"));
            ps.setString(5, request.getParameter("dpi"));
            ps.setBoolean(6, Boolean.parseBoolean(request.getParameter("genero")));  // Convertir género a booleano
            ps.setString(7, request.getParameter("fecha_nacimiento"));
            ps.setInt(8, Integer.parseInt(request.getParameter("idPuesto")));  // Convertir idPuesto a entero
            ps.setString(9, request.getParameter("fecha_inicio_labores"));

            // Convertir la fecha y hora recibida en `Timestamp` para `DATETIME`
            String fechaIngresoStr = request.getParameter("fechaingreso");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Timestamp fechaIngreso = new Timestamp(dateFormat.parse(fechaIngresoStr).getTime());
            ps.setTimestamp(10, fechaIngreso);  // Insertar el Timestamp en la base de datos

            // Ejecutar la inserción
            int rowsAffected = ps.executeUpdate();  // Esta línea devuelve cuántas filas fueron afectadas
            System.out.println("Filas insertadas: " + rowsAffected);

            // Redirigir a la acción "listar" para mostrar la lista actualizada de empleados
            response.sendRedirect("empleados");

        } catch (SQLException | ParseException e) {
            e.printStackTrace();
            // Mostrar un mensaje de error en la consola
            System.out.println("Error al insertar empleado: " + e.getMessage());

            // Opcionalmente, puedes enviar un mensaje de error al usuario si algo falla
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al insertar empleado en la base de datos.");
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Método para eliminar empleado
    private void eliminarEmpleado(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idEmpleado = Integer.parseInt(request.getParameter("id"));
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = conexion.getConnection();
            String sql = "DELETE FROM empleados WHERE idEmpleado = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idEmpleado);
            ps.executeUpdate();
            System.out.println("Empleado eliminado con éxito.");

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error al eliminar empleado: " + e.getMessage());
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("empleados");
    }

    // Método para mostrar formulario de edición con datos del empleado
    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idEmpleado = Integer.parseInt(request.getParameter("id"));
        Empleado empleado = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = conexion.getConnection();
            String sql = "SELECT * FROM empleados WHERE idEmpleado = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idEmpleado);
            rs = ps.executeQuery();

            if (rs.next()) {
                empleado = new Empleado();
                empleado.setIdEmpleado(rs.getInt("idEmpleado"));
                empleado.setNombres(rs.getString("nombres"));
                empleado.setApellidos(rs.getString("apellidos"));
                empleado.setDireccion(rs.getString("direccion"));
                empleado.setTelefono(rs.getString("telefono"));
                empleado.setDpi(rs.getString("DPI"));
                empleado.setGenero(rs.getBoolean("genero"));
                empleado.setFechaNacimiento(rs.getString("fecha_nacimiento"));
                empleado.setIdPuesto(rs.getInt("idPuesto"));
                empleado.setFechaInicioLabores(rs.getString("fecha_inicio_labores"));
                empleado.setFechaIngreso(rs.getTimestamp("fechaingreso"));
            }

            request.setAttribute("empleado", empleado);
            request.getRequestDispatcher("empleados.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error al obtener empleado: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Método para actualizar empleado en la base de datos
    private void actualizarEmpleado(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = conexion.getConnection();
            String sql = "UPDATE empleados SET nombres = ?, apellidos = ?, direccion = ?, telefono = ?, DPI = ?, genero = ?, fecha_nacimiento = ?, idPuesto = ?, fecha_inicio_labores = ?, fechaingreso = ? WHERE idEmpleado = ?";
            ps = conn.prepareStatement(sql);

            // Asignar los valores actualizados
            ps.setString(1, request.getParameter("nombres"));
            ps.setString(2, request.getParameter("apellidos"));
            ps.setString(3, request.getParameter("direccion"));
            ps.setString(4, request.getParameter("telefono"));
            ps.setString(5, request.getParameter("dpi"));
            ps.setBoolean(6, Boolean.parseBoolean(request.getParameter("genero")));
            ps.setString(7, request.getParameter("fecha_nacimiento"));
            ps.setInt(8, Integer.parseInt(request.getParameter("idPuesto")));
            ps.setString(9, request.getParameter("fecha_inicio_labores"));

            String fechaIngresoStr = request.getParameter("fechaingreso");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Timestamp fechaIngreso = new Timestamp(dateFormat.parse(fechaIngresoStr).getTime());
            ps.setTimestamp(10, fechaIngreso);

            ps.setInt(11, idEmpleado);

            ps.executeUpdate();

        } catch (SQLException | ParseException e) {
            e.printStackTrace();
            System.out.println("Error al actualizar empleado: " + e.getMessage());
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("empleados");
    }
}
