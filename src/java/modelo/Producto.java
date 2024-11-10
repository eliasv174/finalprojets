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
    public int agregarProducto() {
        int retorno = 0;
        try {
            PreparedStatement parametro;
            String query = "INSERT INTO productos (producto, id_marca, descripcion, imagen, precio_costo, precio_venta, existencia, fecha_ingreso) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            
            cn.abrir_conexion();
            parametro = cn.conexionBD.prepareStatement(query);
            parametro.setString(1, producto);
            parametro.setInt(2, id_marca);
            parametro.setString(3, descripcion);
            parametro.setBlob(4, imagen);
            parametro.setDouble(5, precio_costo);
            parametro.setDouble(6, precio_venta);
            parametro.setInt(7, existencia);
            parametro.setString(8, fecha_ingreso);
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println("Error al agregar producto: " + ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }

    // Método para actualizar producto
    public int actualizarProducto() {
        int retorno = 0;
        try {
            PreparedStatement parametro;
            String query = "UPDATE productos SET producto=?, id_marca=?, descripcion=?, imagen=?, precio_costo=?, precio_venta=?, existencia=?, fecha_ingreso=? WHERE id_producto=?";
            
            cn.abrir_conexion();
            parametro = cn.conexionBD.prepareStatement(query);
            parametro.setString(1, producto);
            parametro.setInt(2, id_marca);
            parametro.setString(3, descripcion);
            parametro.setBlob(4, imagen);
            parametro.setDouble(5, precio_costo);
            parametro.setDouble(6, precio_venta);
            parametro.setInt(7, existencia);
            parametro.setString(8, fecha_ingreso);
            parametro.setInt(9, id_producto);
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println("Error al actualizar producto: " + ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }

    // Método para eliminar producto
    public int eliminarProducto() {
        int retorno = 0;
        try {
            PreparedStatement parametro;
            String query = "DELETE FROM productos WHERE id_producto=?";
            
            cn.abrir_conexion();
            parametro = cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, id_producto);
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println("Error al eliminar producto: " + ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }

    // Método para consultar producto
    public ResultSet consultarProducto(int idProducto) {
        ResultSet rs = null;
        try {
            String query = "SELECT * FROM productos WHERE id_producto=?";
            cn.abrir_conexion();
            PreparedStatement parametro = cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, idProducto);
            rs = parametro.executeQuery();
        } catch (SQLException ex) {
            System.out.println("Error al consultar producto: " + ex.getMessage());
        }
        return rs;
    }
    public DefaultTableModel leerProductos() {
    DefaultTableModel tableModel = new DefaultTableModel();
    cn = new Conexion();
    try {
        String query = "SELECT * FROM productos;";
        cn.abrir_conexion();
        ResultSet rs = cn.conexionBD.createStatement().executeQuery(query);
        
        // Definir las columnas del DefaultTableModel
        tableModel.addColumn("ID Producto");
        tableModel.addColumn("Producto");
        tableModel.addColumn("ID Marca");
        tableModel.addColumn("Descripción");
        tableModel.addColumn("Precio Costo");
        tableModel.addColumn("Precio Venta");
        tableModel.addColumn("Existencia");
        tableModel.addColumn("Fecha Ingreso");
        
        // Llenar el DefaultTableModel con los datos del ResultSet
        while (rs.next()) {
            Object[] fila = new Object[8];
            fila[0] = rs.getInt("id_producto");
            fila[1] = rs.getString("producto");
            fila[2] = rs.getInt("id_marca");
            fila[3] = rs.getString("descripcion");
            fila[4] = rs.getDouble("precio_costo");
            fila[5] = rs.getDouble("precio_venta");
            fila[6] = rs.getInt("existencia");
            fila[7] = rs.getDate("fecha_ingreso");
            tableModel.addRow(fila);
        }
        
        cn.cerrar_conexion();
    } catch (SQLException ex) {
        System.out.println("Error leer_productos: " + ex.getMessage());
    }
    return tableModel;
}

}
   

