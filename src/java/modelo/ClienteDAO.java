package modelo;

import modelo.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
public class ClienteDAO {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    public Cliente buscar(String nit) {

        Cliente c = new Cliente();
        String sql = "select * from clientes where nit=" + nit;
        try {
            con = cn.abrir_conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                c.setId_cliente(1);
                c.setNombres(rs.getString(2));
                c.setApellidos(rs.getString(3));
                c.setNit(rs.getString(4));
                c.setGenero(rs.getInt(5));
                c.setTelefono(rs.getString(6));
                c.setCorreo_electronico(rs.getString(6));
                c.setFecha_ingreso(rs.getString(7));
            }

        } catch (Exception e) {
        }
        return c;
    }

    public List Listar() {
        List<Cliente> clientes = new ArrayList();
        String sql = "select * from clientes";
        try {
            con = cn.abrir_conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente c = new Cliente();
                c.setId_cliente(rs.getInt(1));
                c.setNombres(rs.getString(2));
                c.setApellidos(rs.getString(3));
                c.setNit(rs.getString(4));
                c.setGenero(rs.getInt(5));
                c.setTelefono(rs.getString(6));
                c.setCorreo_electronico(rs.getString(7));
                c.setFecha_ingreso(rs.getString(8));
                clientes.add(c);

            }

        } catch (Exception e) {

        }
        return clientes;
    }

    public void ListarImg(int id, HttpServletResponse response) {
        String sql = "select * from clientes where id_clientes=" + id;
        try {
            con = cn.abrir_conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

        } catch (Exception e) {
        }

    }

}
