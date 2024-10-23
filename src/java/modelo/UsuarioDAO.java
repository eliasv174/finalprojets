/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author yeymi
 */


public class UsuarioDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public int validarUsuario(Usuario usuario) {
        String sql = "SELECT * FROM usuarios WHERE usuario = ? AND contraseña = ?";
        try {
            con = cn.getConnection();
            if (con != null) {
                System.out.println("Conexión establecida correctamente.");
            } else {
                System.out.println("Error al establecer la conexión con la base de datos.");
                return 0;
            }

            ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getUsuario());
            ps.setString(2, usuario.getContrasena());

            System.out.println("Usuario: " + usuario.getUsuario());
            System.out.println("Contraseña: " + usuario.getContrasena());

            rs = ps.executeQuery();
            if (rs.next()) {
                return 1;  // Usuario válido
            }
        } catch (SQLException e) {
            System.out.println("Error en la validación del usuario: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión: " + e.getMessage());
            }
        }
        return 0;  // Usuario no válido
    }
}

