
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;
import java.sql.Connection;

/**
 *
 * @author yeymi
 */
public class Puestos {
    private int id_puesto;
    private String puesto;
    private Conexion cn;
    

    public Puestos(){}
    
    public Puestos(int id_puesto, String puesto) {
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

    public DefaultTableModel leerPuesto() {
        DefaultTableModel tabla = new DefaultTableModel();
        try {
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT * FROM puestos";
            ResultSet consultaPuestos = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id_puesto","puesto"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[2];
            while (consultaPuestos.next()) {
                datos[0] = consultaPuestos.getString("id_puesto");
                datos[1] = consultaPuestos.getString("puesto");
                tabla.addRow(datos);
            }
            cn.cerrar_conexion();
        } catch (SQLException e) {
            System.out.println("Error al listar puestos: " + e.getMessage());
        }
        return tabla;
    }
    
    
    
    public void agregar(Puestos puesto) {
        Conexion conexion = new Conexion();
        Connection con = conexion.abrir_conexion();
        try {
            String query = "INSERT INTO puestos (puesto) VALUES (?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, puesto.getPuesto());
            ps.executeUpdate();
             conexion.cerrar_conexion();
        } catch (SQLException e) {
            System.out.println("Error al agregar puesto: " + e.getMessage());
        }
      }
    
    
    public void actualizar(Puestos puesto) {
        Conexion conexion = new Conexion();
        Connection con = conexion.abrir_conexion();
        try {
            String query = "UPDATE puestos SET puesto = ? WHERE id_puesto = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, puesto.getPuesto());
            ps.setInt(2, puesto.getId_puesto());
            ps.executeUpdate();
            conexion.cerrar_conexion();
            
        } catch (SQLException e) {
            System.out.println("Error al actualizar puesto: " + e.getMessage());            
        }
    }
    
    public void eliminar(int idPuesto) {
        Conexion conexion = new Conexion();
        Connection con = conexion.abrir_conexion();

        try {
            String sql = "DELETE FROM puestos WHERE id_puesto = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idPuesto);
            ps.executeUpdate();
            conexion.cerrar_conexion();
            
        } catch (SQLException e) {
            System.out.println("Error al eliminar puesto: " + e.getMessage());
 
        }
        }
}
