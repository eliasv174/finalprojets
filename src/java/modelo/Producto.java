/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Elias
 */
public class Producto {

    private int id_producto;
    private String producto;
    private int id_marca;
    private String descripcion;
    private InputStream imagen;
    private double precio_costo;
    private double precio_venta;
    private int existencia;
    private String fecha_ingreso;
    private Conexion cn;

    public Producto() {
    }

    public Producto(int id_producto, String producto, int id_marca, String descripcion, InputStream imagen, double precio_costo, double precio_venta, int existencia, String fecha_ingreso) {
        this.id_producto = id_producto;
        this.producto = producto;
        this.id_marca = id_marca;
        this.descripcion = descripcion;
        this.imagen = imagen;
        this.precio_costo = precio_costo;
        this.precio_venta = precio_venta;
        this.existencia = existencia;
        this.fecha_ingreso = fecha_ingreso;
    }

    public String getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(String fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int idProducto) {
        this.id_producto = idProducto;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public int getId_marca() {
        return id_marca;
    }

    public void setId_marca(int idmarca) {
        this.id_marca = idmarca;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public InputStream getImagen() {
        return imagen;
    }

    public void setImagen(InputStream imagen) {
        this.imagen = imagen;
    }

    public double getPrecio_costo() {
        return precio_costo;
    }

    public void setPrecio_costo(double precio_costo) {
        this.precio_costo = precio_costo;
    }

    public double getPrecio_venta() {
        return precio_venta;
    }

    public void setPrecio_venta(double precio_venta) {
        this.precio_venta = precio_venta;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public boolean agregarProducto(Producto producto) {
        String sql = "INSERT INTO productos (producto, id_marca, descripcion, imagen, precio_costo, precio_venta, existencia, fecha_ingreso) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pst = cn.prepareStatement(sql)) {
            pst.setString(1, producto.getProducto());
            pst.setInt(2, producto.getId_marca());
            pst.setString(3, producto.getDescripcion());
            pst.setBlob(4, producto.getImagen());
            pst.setDouble(5, producto.getPrecio_costo());
            pst.setDouble(6, producto.getPrecio_venta());
            pst.setInt(7, producto.getExistencia());
            pst.setString(8, producto.getFecha_ingreso());
            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error al crear producto: " + e.getMessage());
            return false;
        }
    }

    public Producto leerProductoId(int id_producto) {
        String sql = "SELECT * FROM productos WHERE id_producto = ?";
        try (PreparedStatement pst = cn.prepareStatement(sql)) {
            pst.setInt(1, id_producto);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return new Producto(
                        rs.getInt("id_producto"),
                        rs.getString("producto"),
                        rs.getInt("id_marca"),
                        rs.getString("descripcion"),
                        rs.getBinaryStream("imagen"),
                        rs.getDouble("precio_costo"),
                        rs.getDouble("precio_venta"),
                        rs.getInt("existencia"),
                        rs.getString("fecha_ingreso")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener producto: " + e.getMessage());
        }
        return null;
    }

    public DefaultTableModel leerProductos() {
        String[] columnas = {"ID", "Producto", "ID Marca", "Descripción", "Precio Costo", "Precio Venta", "Existencia", "Fecha Ingreso"};
        DefaultTableModel modelo = new DefaultTableModel(null, columnas);
        String sql = "SELECT id_producto, producto, id_marca, descripcion, precio_costo, precio_venta, existencia, fecha_ingreso FROM productos";

        try (PreparedStatement pst = cn.prepareStatement(sql); ResultSet rs = pst.executeQuery()) {
            while (rs.next()) {
                Object[] fila = new Object[8];
                fila[0] = rs.getInt("id_producto");
                fila[1] = rs.getString("producto");
                fila[2] = rs.getInt("id_marca");
                fila[3] = rs.getString("descripcion");
                fila[4] = rs.getDouble("precio_costo");
                fila[5] = rs.getDouble("precio_venta");
                fila[6] = rs.getInt("existencia");
                fila[7] = rs.getString("fecha_ingreso");
                modelo.addRow(fila);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener productos: " + e.getMessage());
        }
        return modelo;
    }

    public boolean actualizarProducto(Producto producto) {
        String sql = "UPDATE productos SET producto = ?, id_marca = ?, descripcion = ?, imagen = ?, precio_costo = ?, precio_venta = ?, existencia = ?, fecha_ingreso = ? WHERE id_producto = ?";
        try (PreparedStatement pst = cn.prepareStatement(sql)) {
            pst.setString(1, producto.getProducto());
            pst.setInt(2, producto.getId_marca());
            pst.setString(3, producto.getDescripcion());
            pst.setBlob(4, producto.getImagen());
            pst.setDouble(5, producto.getPrecio_costo());
            pst.setDouble(6, producto.getPrecio_venta());
            pst.setInt(7, producto.getExistencia());
            pst.setString(8, producto.getFecha_ingreso());
            pst.setInt(9, producto.getId_producto());
            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error al actualizar producto: " + e.getMessage());
            return false;
        }
    }

    public boolean eliminarProducto(int id_producto) {
        String sql = "DELETE FROM productos WHERE id_producto = ?";
        try (PreparedStatement pst = cn.prepareStatement(sql)) {
            pst.setInt(1, id_producto);
            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error al eliminar producto: " + e.getMessage());
            return false;
        }
    }

}
