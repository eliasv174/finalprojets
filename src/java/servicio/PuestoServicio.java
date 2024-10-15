/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servicio;
import java.util.List;
import dao.PuestoDAO;
import modelo.Puesto;
/**
 *
 * @author yeymi
 */


public class PuestoServicio {
    private PuestoDAO puestoDAO = new PuestoDAO();

    public List<Puesto> listarPuestos() {
        return puestoDAO.listar();
    }

    public boolean guardarPuesto(Puesto puesto) {
        return puestoDAO.insertar(puesto);
    }

    public Puesto obtenerPuestoPorId(int idPuesto) {
        return puestoDAO.obtenerPorId(idPuesto);
    }

    public boolean actualizarPuesto(Puesto puesto) {
        return puestoDAO.actualizar(puesto);
    }

    public boolean eliminarPuesto(int idPuesto) {
        return puestoDAO.eliminar(idPuesto);
    }
}
