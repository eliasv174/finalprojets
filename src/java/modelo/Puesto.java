package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import javax.swing.table.DefaultTableModel;
import java.sql.PreparedStatement;

public class Puesto {
    private int id_puesto;
    private String puesto;
    Conexion cn;

    public Puesto(){}

    public Puesto(int id_puesto, String puesto) {
        this.id_puesto = id_puesto;
        this.puesto = puesto;
    }

    public int getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getPuesto() {
        return puesto;
    }

    public void setPuesto(String puesto) {
        this.puesto = puesto;
    }

    // Leer todos los puestos
// Leer todos los puestos
public DefaultTableModel leerPuestos() {
    DefaultTableModel tableModel = new DefaultTableModel();
    cn = new Conexion();
    try {
        String query = "SELECT * FROM puntoventa_bd.puestos;";
        cn.abrir_conexion();
        ResultSet rs = cn.conexionBD.createStatement().executeQuery(query);
        
        // Definir las columnas del DefaultTableModel
        tableModel.addColumn("ID Puesto");
        tableModel.addColumn("Puesto");
        
        // Llenar el DefaultTableModel con los datos del ResultSet
        while (rs.next()) {
            Object[] fila = new Object[2];
            fila[0] = rs.getInt("id_puesto");
            fila[1] = rs.getString("puesto");
            tableModel.addRow(fila);
        }
        
        cn.cerrar_conexion();
    } catch (SQLException ex) {
        System.out.println("Error leer_puestos: " + ex.getMessage());
    }
    return tableModel;
}

    // Agregar puesto
    public int agregarPuesto() {
        int retorno = 0;
        try {
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "INSERT INTO puestos(id_puesto,puesto) VALUES (?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId_puesto());
            parametro.setString(2, getPuesto());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println("Error agregar_puesto: " + ex.getMessage());
        }
        return retorno;
    }

    // Modificar puesto
    public int modificarPuesto() {
        int retorno = 0;
        try {
            String query = "UPDATE puestos SET puesto=? WHERE id_puesto=?;";
            cn = new Conexion();
            cn.abrir_conexion();
            var ps = cn.conexionBD.prepareStatement(query);
            ps.setString(1, getPuesto());
            ps.setInt(2, getId_puesto());
            retorno = ps.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println("Error modificar_puesto: " + ex.getMessage());
        }
        return retorno;
    }

    // Eliminar puesto
    public int eliminarPuesto() {
        int retorno = 0;
        try {
            String query = "DELETE FROM puestos WHERE id_puesto=?;";
            cn = new Conexion();
            cn.abrir_conexion();
            var ps = cn.conexionBD.prepareStatement(query);
            ps.setInt(1, this.getId_puesto());
            retorno = ps.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println("Error eliminar_puesto: " + ex.getMessage());
        }
        return retorno;
    }

    // Dropdown de puestos
    public HashMap<String, String> drop_puestos() {
        HashMap<String, String> drop = new HashMap<>();
        try {
            String query = "SELECT id_puesto, puesto FROM puestos;";
            cn = new Conexion();
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()) {
                drop.put(consulta.getString("id_puesto"), consulta.getString("puesto"));
            }
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println("Error drop_puesto: " + ex.getMessage());
        }
        return drop;
    }
}
