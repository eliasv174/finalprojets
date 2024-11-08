/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;
import java.sql.PreparedStatement;

/**
 *
 * @author yeymi
 */


public class Proveedor {
    private int id_proveedor;
    private String proveedor, nit, direccion, telefono;
    private Conexion cn;

    public Proveedor (){}
    
    public Proveedor(int id_proveedor, String proveedor, String nit, String direccion, String telefono) {
        this.id_proveedor = id_proveedor;
        this.proveedor = proveedor;
        this.nit = nit;
        this.direccion = direccion;
        this.telefono = telefono;
   
        
    }

    public int getId_proveedor() {
        return id_proveedor;
    }

    public void setId_proveedor(int id_proveedor) {
        this.id_proveedor = id_proveedor;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public DefaultTableModel leerProv(){
        DefaultTableModel tabla = new DefaultTableModel();
        try{
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT * FROM proveedores;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id_proveedor","proveedor","nit","direccion","telefono"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[5];
            while (consulta.next()){
                datos[0] = consulta.getString("id_proveedor");
                datos[1] = consulta.getString("proveedor");
                datos[2] = consulta.getString("nit");
                datos[3] = consulta.getString("direccion");
                datos[4] = consulta.getString("telefono");
                tabla.addRow(datos);
                
            }
            cn.cerrar_conexion();
     }catch (SQLException ex){
         System.out.println(ex.getMessage());
        }
        return tabla;      
                }
    
    
    public int agregar(){
     int retorno = 0;
      try{
        PreparedStatement parametro;
        cn = new Conexion();
        String query =  "INSERT INTO proveedores (proveedor,nit,direccion,telefono) VALUES (?,?,?,?)";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setString(1, this.getProveedor());
        parametro.setString(2, this.getNit());
        parametro.setString(3, this.getDireccion());
        parametro.setString(4, this.getTelefono());
        retorno=parametro.executeUpdate();
        cn.cerrar_conexion();
        
    }catch(SQLException ex){
        System.out.println(ex.getMessage()); 
}
    return retorno;
}
    
    public int modificar(){
        int retorno = 0;
    try{
        PreparedStatement parametro;
        cn = new Conexion();
        String query = "UPDATE puntoventa_bd.proveedores SET proveedor=?, nit=?, direccion=?, telefono=? WHERE (id_proveedor = ?)";

        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setString(1, getProveedor());
        parametro.setString(2, getNit());
        parametro.setString(3, getDireccion());
        parametro.setString(4, getTelefono());
        parametro.setInt(5, getId_proveedor());
        retorno=parametro.executeUpdate();
        cn.cerrar_conexion();
        
        }catch(SQLException ex){
        System.out.println(ex.getMessage()); 
        retorno = 0;
        }
    return retorno;
    }


    public int eliminarProv(){int retorno = 0;
    try{
        PreparedStatement parametro;
        cn = new Conexion();
        String query =  "DELETE FROM puntoventa_bd.proveedores WHERE (id_proveedor = ?);";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setInt(1, getId_proveedor());
        retorno=parametro.executeUpdate();
        cn.cerrar_conexion();
        
    }catch(SQLException ex){
        System.out.println(ex.getMessage()); 
}
    return retorno;
}
}
    
