/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author yeymi
 */

public class Usuario {
    private int id_usuario, id_empleado;
    private String usuario, contrasena;
    private Conexion cn;
    
    public Usuario (){}

    public Usuario(int id_usuario, int id_empleado, String usuario, String contrasena) {
        this.id_usuario = id_usuario;
        this.id_empleado = id_empleado;
        this.usuario = usuario;
        this.contrasena = contrasena;
    }
    
    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
    
    public DefaultTableModel leer(){
    DefaultTableModel tabla = new DefaultTableModel();
    try{
         cn = new Conexion();
         cn.abrir_conexion();
         String query = "SELECT e.id_usuario, e.usuario, e.contrasena, p.nombres, p.apellidos, e.id_empleado FROM usuarios AS e INNER JOIN empleados AS p ON e.id_empleado = p.id_empleado;";
         ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
         String encabezado[] = {"id_usuario","usuario","contrasena","nombres","apellidos","id_empleado"};
         tabla.setColumnIdentifiers(encabezado);
         String datos[] = new String[6];
         while (consulta.next()){
             datos[0] = consulta.getString("id_usuario");
             datos[1] = consulta.getString("usuario");
             datos[2] = consulta.getString("contrasena");
             datos[3] = consulta.getString("nombres");
             datos[4] = consulta.getString("apellidos");
             datos[5] = consulta.getString("id_empleado");
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
        String query = "INSERT INTO puntoventa_bd.usuarios (usuario,contrasena,id_empleado) VALUES (?,?,?);";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setString(1, this.getUsuario());
        parametro.setString(2, this.getContrasena());
        parametro.setInt(3, this.getId_empleado());
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
        String query =  "UPDATE puntoventa_bd.usuarios SET usuario=?,contrasena==?,id_empleado==? WHERE (id_usuario=?);";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setString(1, getUsuario());
        parametro.setString(2, getContrasena());
        parametro.setInt(3, getId_empleado());
        parametro.setInt(4, getId_usuario());
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
        String query =  "DELETE FROM puntoventa_bd.usuarios WHERE (id_usuario =20);";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setInt(1, this.getId_usuario());
        retorno=parametro.executeUpdate();
        cn.cerrar_conexion();
        
    }catch(SQLException ex){
        System.out.println(ex.getMessage()); 
        retorno = 0;
}
    return retorno;
    }

    
}
