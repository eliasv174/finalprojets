/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author IT
 */
public class Cliente {
    private int id_cliente,genero;
    private String nombres, apellidos, nit, telefono, correo_electronico, fecha_ingreso;
    private Conexion cn;

    public Cliente(){}

    public Cliente(int id_cliente, int genero, String nombres, String apellidos, String nit, String telefono, String correo_electronico, String fecha_ingreso) {
        this.id_cliente = id_cliente;
        this.genero = genero;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.nit = nit;
        this.telefono = telefono;
        this.correo_electronico = correo_electronico;
        this.fecha_ingreso = fecha_ingreso;
        
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getGenero() {
        return genero;
    }

    public void setGenero(int genero) {
        this.genero = genero;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo_electronico() {
        return correo_electronico;
    }

    public void setCorreo_electronico(String correo_electronico) {
        this.correo_electronico = correo_electronico;
    }

    public String getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(String fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }
    
    public DefaultTableModel leer(){
    DefaultTableModel tabla = new DefaultTableModel();
    try{
         cn = new Conexion();
         cn.abrir_conexion();
         String query = "SELECT e.id_cliente, e.nombres, e.apellidos, e.nit, e.telefono, e.correo_electronico, e.fecha_ingreso, g.genero, g.id_genero FROM puntoventa_bd.clientes as e inner join genero as g on e.genero = g.id_genero;";
         ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
         String encabezado[] = {"id_cliente","nombres","apellidos","nit","telefono","correo_electronico","fecha_ingreso","genero","id_genero"};
         tabla.setColumnIdentifiers(encabezado);
         String datos[] = new String[9];
         while (consulta.next()){
             datos[0] = consulta.getString("id_cliente");
             datos[1] = consulta.getString("nombres");
             datos[2] = consulta.getString("apellidos");             
             datos[3] = consulta.getString("nit");
             datos[4] = consulta.getString("telefono");
             datos[5] = consulta.getString("correo_electronico");
             datos[6] = consulta.getString("fecha_ingreso");
             datos[7] = consulta.getString("genero");
             datos[8] = consulta.getString("id_genero");   
             tabla.addRow(datos);
             
         }
        cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
       }
    return tabla;
}
    
    
    public int agregar(){
        int retorno = 0;
    try{
        PreparedStatement parametro;
        cn = new Conexion();
        String query = "INSERT INTO puntoventa_bd.clientes (nombres, apellidos, nit, genero, telefono, correo_electronico, fecha_ingreso) VALUES (?, ?, ?, ?, ?, ?, ?);";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setString(1, getNombres());
        parametro.setString(2, getApellidos());
        parametro.setString(3, getNit());
        parametro.setInt(4, getGenero());
        parametro.setString(5, getTelefono());
        parametro.setString(6, getCorreo_electronico());
        parametro.setString(7, getFecha_ingreso());
        
        retorno=parametro.executeUpdate();
        cn.cerrar_conexion();
        
    }catch(SQLException ex){
        System.out.println(ex.getMessage()); 
        retorno = 0;
}
    return retorno;
}
 
    
    public int modificar(){
        int retorno = 0;
    try{
        PreparedStatement parametro;
        cn = new Conexion();
        String query =  "UPDATE clientes SET nombres=?, apellidos=?, nit=?, genero=?, telefono=?, correo_electronico=?, fecha_ingreso=? WHERE id_cliente = ?";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setString(1, getNombres());
        parametro.setString(2, getApellidos());
        parametro.setString(3, getNit());
        parametro.setInt(4, getGenero());
        parametro.setString(5, getTelefono());
        parametro.setString(6, getCorreo_electronico());
        parametro.setString(7, getFecha_ingreso());
        parametro.setInt(8, getId_cliente());
        retorno=parametro.executeUpdate();
        cn.cerrar_conexion();
        
    }catch(SQLException ex){
        System.out.println(ex.getMessage()); 
        retorno = 0;
}
    return retorno;
}

    

    public int eliminar(){
        int retorno = 0;
    try{
        PreparedStatement parametro;
        cn = new Conexion();
        String query =  "DELETE FROM puntoventa_bd.clientes WHERE id_cliente = ?";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setInt(1, this.getId_cliente());
        retorno=parametro.executeUpdate();
        cn.cerrar_conexion();
        
    }catch(SQLException ex){
        System.out.println(ex.getMessage()); 
        retorno = 0;
}
    return retorno;
    }
}
