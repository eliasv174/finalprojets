/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author IT
 */
public class Conexion {
    public Connection conexionBD;
    private final String bd = "puntoventa_bd";
    private final String puerto = "3306";
    private final String urlConexion = String.format("jdbc:mysql://localhost:%s/%s?serverTimezone=UTC", puerto, bd);
    private final String usuario = "usr_empresa";
    private final String contra = "Empres@123";
    private final String jdbc = "com.mysql.cj.jdbc.Driver";

    // Método para abrir la conexión y devolver el objeto Connection
    public Connection abrir_conexion() {
        try {
            Class.forName(jdbc);
            conexionBD = DriverManager.getConnection(urlConexion, usuario, contra);
            System.out.println("Conexion exitosa a la base de datos");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Error al conectar con la base de datos: " + ex.getMessage());
        }
        return conexionBD;
    }

    // Método para cerrar la conexión
    public void cerrar_conexion() {
        try {
            if (conexionBD != null && !conexionBD.isClosed()) {
                conexionBD.close();
                System.out.println("Conexión cerrada");
            }
        } catch (SQLException ex) {
            System.out.println("Error al cerrar la conexión: " + ex.getMessage());
        }
    }
}

/*package modelo;

import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


/**
 *
 * @author yeymi
 */

/*public class Conexion {
    Connection con;

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3307/puntoventa_bd", "root", "Elias174+-");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error en la conexión: " + e.getMessage());
        }
        return con;
    }
}*/
