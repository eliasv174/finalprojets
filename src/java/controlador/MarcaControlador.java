/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;


import modelo.Marca;
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
 * @author yeymi
 */

@WebServlet(name = "MarcaControlador", urlPatterns = {"/MarcaControlador"})
public class MarcaControlador extends HttpServlet {
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
                        String nombreMarca = request.getParameter("marca");
                        agregarMarca(new Marca(0, nombreMarca));
                        mensaje = "Marca agregada exitosamente.";
                        break;
                    case "eliminar":
                        int idMarca = Integer.parseInt(request.getParameter("idMarca"));
                        if (eliminarMarca(idMarca)) {
                            mensaje = "Marca eliminada exitosamente.";
                        } else {
                            mensaje = "Marca no encontrada.";
                        }
                        break;
                    case "actualizar":
                        idMarca = Integer.parseInt(request.getParameter("idMarca"));
                        Marca marcaExistente = buscarMarca(idMarca);
                        if (marcaExistente != null) {
                            nombreMarca = request.getParameter("marca");
                            Marca marcaActualizada = new Marca(idMarca, nombreMarca);
                            if (actualizarMarca(marcaActualizada)) {
                                mensaje = "Marca actualizada exitosamente.";
                            } else {
                                mensaje = "Error al actualizar la marca.";
                            }
                        } else {
                            mensaje = "Marca no encontrada.";
                        }
                        break;
                }
            } catch (SQLException e) {
                throw new ServletException("Error al interactuar con la base de datos", e);
            }
        }

        request.setAttribute("mensaje", mensaje);
        request.setAttribute("listaMarcas", listarMarcas());
        request.getRequestDispatcher("vistaMarca.jsp").forward(request, response);
    }

   @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String accion = request.getParameter("accion");
    String mensaje = "";

    if (accion != null) {
        try {
            switch (accion) {
                case "eliminar":
                    int idMarca = Integer.parseInt(request.getParameter("idMarca"));
                    if (eliminarMarca(idMarca)) {
                        mensaje = "Marca eliminada exitosamente.";
                    } else {
                        mensaje = "Marca no encontrada.";
                    }
                    break;

                case "editar":
                    idMarca = Integer.parseInt(request.getParameter("idMarca"));
                    Marca marca = buscarMarca(idMarca);
                    if (marca != null) {
                        request.setAttribute("marca", marca);
                    } else {
                        mensaje = "Marca no encontrada.";
                    }
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException("Error al interactuar con la base de datos", e);
        }
    }

    request.setAttribute("mensaje", mensaje);
    request.setAttribute("listaMarcas", listarMarcas());
    request.getRequestDispatcher("vistaMarca.jsp").forward(request, response);
}

    private void agregarMarca(Marca marca) throws SQLException {
        String sql = "INSERT INTO marcas (marca) VALUES (?)";
        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setString(1, marca.getMarca());
            stmt.executeUpdate();
        }
    }

    private Marca buscarMarca(int idMarca) throws SQLException {
        String sql = "SELECT * FROM marcas WHERE idMarca = ?";
        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setInt(1, idMarca);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Marca(rs.getInt("idMarca"), rs.getString("marca"));
                }
            }
        }
        return null;
    }

    private boolean actualizarMarca(Marca marca) throws SQLException {
        String sql = "UPDATE marcas SET marca = ? WHERE idMarca = ?";
        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setString(1, marca.getMarca());
            stmt.setInt(2, marca.getIdMarca());
            return stmt.executeUpdate() > 0;
        }
    }

    private boolean eliminarMarca(int idMarca) throws SQLException {
        String sql = "DELETE FROM marcas WHERE idMarca = ?";
        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setInt(1, idMarca);
            return stmt.executeUpdate() > 0;
        }
    }

    private List<Marca> listarMarcas() {
        List<Marca> lista = new ArrayList<>();
        String sql = "SELECT * FROM marcas";
        try (PreparedStatement stmt = conexion.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Marca marca = new Marca(rs.getInt("idMarca"), rs.getString("marca"));
                lista.add(marca);
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
