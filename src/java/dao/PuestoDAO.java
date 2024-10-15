/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Puesto;
import utilidad.Conexion;

/**
 *
 * @author yeymi
 */


public class PuestoDAO {

    public List<Puesto> listar() {
        List<Puesto> lista = new ArrayList<>();
        String sql = "SELECT * FROM puestos";
        try (Connection con = Conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Puesto puesto = new Puesto(rs.getInt("idPuesto"), rs.getString("puesto"));
                lista.add(puesto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public boolean insertar(Puesto puesto) {
        String sql = "INSERT INTO puestos (puesto) VALUES (?)";
        try (Connection con = Conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, puesto.getPuesto());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean actualizar(Puesto puesto) {
        String sql = "UPDATE puestos SET puesto=? WHERE idPuesto=?";
        try (Connection con = Conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, puesto.getPuesto());
            ps.setInt(2, puesto.getIdPuesto());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean eliminar(int idPuesto) {
        String sql = "DELETE FROM puestos WHERE idPuesto=?";
        try (Connection con = Conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idPuesto);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Puesto obtenerPorId(int idPuesto) {
        Puesto puesto = null;
        String sql = "SELECT * FROM puestos WHERE idPuesto=?";
        try (Connection con = Conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idPuesto);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    puesto = new Puesto(rs.getInt("idPuesto"), rs.getString("puesto"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return puesto;
    }
}
