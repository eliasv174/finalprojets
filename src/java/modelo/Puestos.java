/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author yeymi
 */
// Modelo Puestos.java


public class Puestos {
    private int idPuesto;
    private String puesto;
    
    // Getters y Setters
    public int getIdPuesto() {
        return idPuesto;
    }

    public void setIdPuesto(int idPuesto) {
        this.idPuesto = idPuesto;
    }

    public String getPuesto() {
        return puesto;
    }

    public void setPuesto(String puesto) {
        this.puesto = puesto;
    }
    
    // Método para listar todos los puestos
    public List<Puestos> listar() {
        List<Puestos> lista = new ArrayList<>();
        Conexion conexion = new Conexion();
        Connection con = conexion.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        
        try {
            String sql = "SELECT * FROM puestos";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Puestos puesto = new Puestos();
                puesto.setIdPuesto(rs.getInt("idPuesto"));
                puesto.setPuesto(rs.getString("puesto"));
                lista.add(puesto);
            }
            
        } catch (SQLException e) {
            System.out.println("Error al listar puestos: " + e.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión: " + e.getMessage());
            }
        }
        
        return lista;
    }
    
    // Método para agregar un nuevo puesto
    public void agregar(Puestos puesto) {
        Conexion conexion = new Conexion();
        Connection con = conexion.getConnection();
        PreparedStatement ps;
        
        try {
            String sql = "INSERT INTO puestos (puesto) VALUES (?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, puesto.getPuesto());
            ps.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("Error al agregar puesto: " + e.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión: " + e.getMessage());
            }
        }
    }
    
    // Método para actualizar un puesto existente
    public void actualizar(Puestos puesto) {
        Conexion conexion = new Conexion();
        Connection con = conexion.getConnection();
        PreparedStatement ps;
        
        try {
            String sql = "UPDATE puestos SET puesto = ? WHERE idPuesto = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, puesto.getPuesto());
            ps.setInt(2, puesto.getIdPuesto());
            ps.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("Error al actualizar puesto: " + e.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión: " + e.getMessage());
            }
        }
    }
    
    // Método para eliminar un puesto
    public void eliminar(int idPuesto) {
        Conexion conexion = new Conexion();
        Connection con = conexion.getConnection();
        PreparedStatement ps;
        
        try {
            String sql = "DELETE FROM puestos WHERE idPuesto = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, idPuesto);
            ps.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("Error al eliminar puesto: " + e.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión: " + e.getMessage());
            }
        }
    }
}
