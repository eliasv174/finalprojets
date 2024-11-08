/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Empleado {
    private int id_puesto, genero, id_empleado;
    private String nombres,apellidos,direccion,telefono,dpi,fecha_nacimiento,fecha_inicio_labores,fecha_ingreso;
    private Conexion cn;

    public Empleado(){}
    
    public Empleado(int id_empleado, String nombres, String apellidos, String direccion, String telefono, String dpi, String fecha_nacimiento, int id_puesto, String fecha_inicio_labores, String fecha_ingreso, int genero) {
        this.id_empleado = id_empleado;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.direccion = direccion;
        this.telefono = telefono;
        this.dpi = dpi;
        this.fecha_nacimiento = fecha_nacimiento;
        this.id_puesto = id_puesto;
        this.fecha_inicio_labores = fecha_inicio_labores;
        this.fecha_ingreso = fecha_ingreso;
        this.genero = genero;
    }

        public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
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

    public String getDpi() {
        return dpi;
    }

    public void setDpi(String dpi) {
        this.dpi = dpi;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public int getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getFecha_inicio_labores() {
        return fecha_inicio_labores;
    }

    public void setFecha_inicio_labores(String fecha_inicio_labores) {
        this.fecha_inicio_labores = fecha_inicio_labores;
    }

    public String getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(String fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }

    public int getGenero() {
        return genero;
    }

    public void setGenero(int genero) {
        this.genero = genero;
    }

    
    public DefaultTableModel leer(){
          DefaultTableModel tabla = new DefaultTableModel();
    try{
         cn = new Conexion();
         cn.abrir_conexion();
         String query = "SELECT e.id_empleado as id, e.nombres, e.apellidos, e.direccion, e.telefono, e.dpi, e.fecha_nacimiento, e.fecha_inicio_labores, e.fecha_ingreso, g.genero, p.puesto,p.id_puesto,g.id_genero FROM puntoventa_bd.empleados AS e INNER JOIN puestos AS p ON e.id_puesto = p.id_puesto INNER JOIN genero as g ON e.genero = g.id_genero;";
         ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
         String encabezado[] = {"id","nombres","apellidos","direccion","telefono","dpi","fecha_nacimiento","fecha_inicio_labores","fecha_ingreso","genero","puesto","id_puesto","id_genero"};
         tabla.setColumnIdentifiers(encabezado);
         String datos[] = new String[13];
         while (consulta.next()){
             datos[0] = consulta.getString("id");
             datos[1] = consulta.getString("nombres");
             datos[2] = consulta.getString("apellidos");             
             datos[3] = consulta.getString("direccion");
             datos[4] = consulta.getString("telefono");
             datos[5] = consulta.getString("dpi");
             datos[6] = consulta.getString("fecha_nacimiento");
             datos[7] = consulta.getString("fecha_inicio_labores");
             datos[8] = consulta.getString("fecha_ingreso");   
             datos[9] = consulta.getString("genero");   
             datos[10] = consulta.getString("puesto");   
             datos[11] = consulta.getString("id_puesto");
             datos[12] = consulta.getString("id_genero");
             tabla.addRow(datos);
         }
         cn.cerrar_conexion();
    }catch(SQLException ex){
     System.out.println(ex.getMessage());
        }
        return tabla;
    }
    
    
    public int agregarEmpl(){
        int retorno = 0;
      try{
        PreparedStatement parametro;
        cn = new Conexion();
        String query =  "INSERT INTO puntoventa_bd.empleados (nombres,apellidos,direccion,telefono,dpi,fecha_nacimiento,id_puesto,fecha_inicio_labores,fecha_ingreso,genero) VALUES (?,?,?,?,?,?,?,?,?,?);";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setString(1, this.getNombres());
        parametro.setString(2, this.getApellidos());
        parametro.setString(3, this.getDireccion());
        parametro.setString(4, this.getTelefono());
        parametro.setString(5, this.getDpi());
        parametro.setString(6, this.getFecha_nacimiento());
        parametro.setInt(7, this.getId_puesto());
        parametro.setString(8, this.getFecha_inicio_labores());
        parametro.setString(9, this.getFecha_ingreso());
        parametro.setInt(10, this.getGenero());
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
        String query = "UPDATE puntoventa_bd.empleados SET nombres=?,apellidos=?,direccion=?,telefono=?,dpi=?,fecha_nacimiento=?,id_puesto=?,fecha_inicio_labores=?,fecha_ingreso=?,genero=? WHERE id_empleado=?;";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setString(1, getNombres());
        parametro.setString(2, getApellidos());
        parametro.setString(3, getDireccion());
        parametro.setString(4, getTelefono());
        parametro.setString(5, getDpi());
        parametro.setString(6, getFecha_nacimiento());
        parametro.setInt(7, getId_puesto());
        parametro.setString(8, getFecha_inicio_labores());
        parametro.setString(9, getFecha_ingreso());
        parametro.setInt(10, getGenero());
        parametro.setInt(11, getId_empleado());
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
        String query =  "DELETE FROM puntoventa_bd.empleados where id_empleado=?;";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setInt(1, getId_empleado());
        retorno=parametro.executeUpdate();
        cn.cerrar_conexion();
        
    }catch(SQLException ex){
        System.out.println(ex.getMessage()); 
}
    return retorno;
}
}
