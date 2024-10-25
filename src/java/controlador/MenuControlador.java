/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Conexion;
import modelo.Menu;

public class MenuControlador {

    public List<Menu> obtenerMenusPadre() {
        List<Menu> menusPadre = new ArrayList<>();
        try (Connection con = new Conexion().getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM menus WHERE padre_id IS NULL");
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Menu menu = new Menu();
                menu.setId(rs.getInt("id"));
                menu.setNombre(rs.getString("nombre"));
                menu.setEnlace(rs.getString("enlace"));
                menu.setPadreId(null);
                
                // Cargar submenús
                menu.setSubmenus(obtenerSubmenus(menu.getId()));
                System.out.println("Menú cargado: " + menu.getNombre());
                
                menusPadre.add(menu);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return menusPadre;
    }

    public List<Menu> obtenerSubmenus(int padreId) {
        List<Menu> submenus = new ArrayList<>();
        try (Connection con = new Conexion().getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM menus WHERE padre_id = ?")) {
            ps.setInt(1, padreId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Menu submenu = new Menu();
                    submenu.setId(rs.getInt("id"));
                    submenu.setNombre(rs.getString("nombre"));
                    submenu.setEnlace(rs.getString("enlace"));
                    submenu.setPadreId(rs.getInt("padre_id"));
                    
                    // Cargar submenús de este menú si los tiene
                    submenu.setSubmenus(obtenerSubmenus(submenu.getId()));
                    System.out.println("Submenú cargado: " + submenu.getNombre());
                    
                    submenus.add(submenu);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return submenus;
    }
}
