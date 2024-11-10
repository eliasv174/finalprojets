/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import modelo.Conexion;
import java.util.List;
import java.util.ArrayList;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashSet;
import java.util.Set;
import modelo.Producto;
/**
 *
 * @author PC
 */
public class ProductoDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Conexion cn = new Conexion(); // Suponiendo que tienes una clase de conexión llamada 'Conexion'

    public Producto ListarId(int id) {
        Producto pr = new Producto();
        String sql = "SELECT * FROM productos WHERE id_producto=" + id;
        try {
            con = cn.abrir_conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                // Inicializar el objeto Producto solo si encuentra resultados
                pr.setId_producto(rs.getInt("id_producto"));
                pr.setProducto(rs.getString("producto"));
                pr.setId_marca(rs.getInt("id_marca"));
                pr.setDescripcion(rs.getString("descripcion"));
                pr.setImagen(rs.getBinaryStream("imagen"));

                // Almacena la ruta de la imagen (ajusta según la estructura de la base de datos)
                /*String rutaImagen = rs.getString("imagen"); // Suponiendo que el campo imagen almacena la ruta
                pr.setImagen(rutaImagen);*/
               

                pr.setPrecio_costo(rs.getDouble("precio_costo"));
                pr.setPrecio_venta(rs.getDouble("precio_venta"));
                pr.setExistencia(rs.getInt("existencia"));
                pr.setFecha_ingreso(rs.getString("fecha_ingreso"));
            }
        } catch (Exception e) {
            System.out.println("Error al listar producto por ID: " + e.getMessage());
        } finally {
            // Cerrar conexiones para evitar fugas
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error al cerrar conexiones: " + e.getMessage());
            }
        }
        return pr;
    }

    public List Listar() {
        List<Producto> productos = new ArrayList();
        String sql = "select * from productos";
        try {
            con = cn.abrir_conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId_producto(rs.getInt(1));
                p.setProducto(rs.getString(2));
                p.setId_marca(rs.getInt(3));
                p.setDescripcion(rs.getString(4));
                p.setImagen(rs.getBinaryStream(5));
                p.setPrecio_costo(rs.getDouble(6));
                p.setPrecio_venta(rs.getDouble(7));
                p.setExistencia(rs.getInt(8));
                p.setFecha_ingreso(rs.getString(9));
                productos.add(p);
                
            }

        } catch (Exception e) {

        }
        return productos;
    }
    
    
    public void ListarImg(int id,HttpServletResponse response){
        String sql="select * from productos where id_producto="+id;
        InputStream inputStream=null;
        OutputStream outputStream=null;
        BufferedInputStream bufferedInputStream=null;
        BufferedOutputStream bufferedOutputStream=null;
        try{
            con=cn.abrir_conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            if(rs.next()){
            inputStream=rs.getBinaryStream("imagen");
            }
        bufferedInputStream=new BufferedInputStream(inputStream);
        bufferedOutputStream=new BufferedOutputStream(outputStream);
        int i= 0;
        while((i=bufferedInputStream.read())!=-1){
        bufferedOutputStream.write(i);
        }
        
        }catch(Exception e){
        }
    
    }

}
