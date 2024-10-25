/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package modelo;

import java.util.List;

/**
 *
 * @author yeymi
 */





public class Menu {
    private int id;
    private String nombre;
    private String enlace;
    private Integer padreId;
    private List<Menu> submenus;

    // Constructor vacío
    public Menu() {}

    // Constructor con parámetros
    public Menu(int id, String nombre, String enlace, Integer padreId) {
        this.id = id;
        this.nombre = nombre;
        this.enlace = enlace;
        this.padreId = padreId;
    }

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getEnlace() { return enlace; }
    public void setEnlace(String enlace) { this.enlace = enlace; }

    public Integer getPadreId() { return padreId; }
    public void setPadreId(Integer padreId) { this.padreId = padreId; }

    public List<Menu> getSubmenus() { return submenus; }
    public void setSubmenus(List<Menu> submenus) { this.submenus = submenus; }
}
