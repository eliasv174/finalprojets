<%-- 
    Document   : empleados
    Created on : 6/11/2024, 3:50:08 p. m.
    Author     : IT
--%>
<%@page import="modelo.Genero"%>
<%@page import="modelo.Puesto"%>
<%@page import="modelo.Empleado"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </head>
    <body>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <br>
    <center><h1>Formulario Empleados</h1></center>
        <div class="container">
            <form action="sr_empleados" method="post" class="form-group">
                <label for="lbl_id"><b>Id Empleado:</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                <label for="lbl_nombres"><b>Nombres:</b></label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre 1 Nombre 2" required>
                <label for="lbl_nombres"><b>Apellidos:</b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido 1 Apellido 2" required>              
                <label for="lbl_direccion"><b>Direccion:</b></label>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: # de casa Calle Zona Ciudad" required>
                <label for="lbl_telefono"><b>Telefono:</b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: +502 5555 5555" required>
                <label for="lbl_dpi"><b>DPI:</b></label>
                <input type="number" name="txt_dpi" id="txt_dpi" class="form-control" placeholder="Ejemplo: 0101 01010 0101" required>
                <label for="lbl_fecha_nacimiento"><b>Fecha de Nacimiento:</b></label>
                <input type="date" name="txt_fecha_nacimiento" id="txt_fecha_nacimiento" class="form-control" placeholder="Ejemplo: 01/01/2000" required>
                <label for="lbl_fecha_labores"><b>Fecha de Inicio de Labores:</b></label>
                <input type="date" name="txt_fecha_labores" id="txt_fecha_labores" class="form-control" placeholder="Ejemplo: 01/01/2000" required>
                <label for="lbl_fecha_ingreso"><b>Fecha de Ingreso:</b></label>
                <input type="date" name="txt_fecha_ingreso" id="txt_fecha_ingreso" class="form-control" placeholder="Ejemplo: 01/01/2000" required>
                
                <label for="lbl_genero"><b>Genero:</b></label>
                <select name="drop_genero" id="drop_genero" class="form-control">
                    <%
                        Genero genero = new Genero (); 
                    HashMap<String,String> dropGn = genero.drop_genero();
                    for (String i: dropGn.keySet()){
                        out.println("<option value='" + i + "'>"+ dropGn.get(i) + "</option>");
                        }
                    %>
                </select>
                <label for="lbl_puesto"><b>Puesto:</b></label>
                <select name="drop_puesto" id="drop_puesto" class="form-control">
                    <%
                    Puesto puesto = new Puesto (); 
                    HashMap<String,String> drop = puesto.drop_puestos();
                    for (String i: drop.keySet()){
                        out.println("<option value='" + i + "'>"+ drop.get(i) + "</option>");
                        }
                        %>  
                    </select>
                    
                    <br>   
                    <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary btn-lg" style="background-color: #1e74a7; border:none" onclick="javascript:if(!confirm('¿Desea Agregar?'))return false">AGREGAR</button>
                    <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-primary btn-lg" style="background-color: #1e74a7; border:none" onclick="javascript:if(!confirm('¿Desea Modificar?'))return false">MODIFICAR</button>
                    <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-primary btn-lg" style="background-color: #1e74a7; border:none" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">ELIMINAR</button>
               </form>
               <table class="table table-bordered">
    <thead>
      <tr>
        <th style="text-align: center">ID EMPLEADO</th>
        <th style="text-align: center">NOMBRES</th>
        <th style="text-align: center">APELLIDOS</th>
        <th style="text-align: center">DIRECCION</th>
        <th style="text-align: center">TELEFONO</th>
        <th style="text-align: center">DPI</th> 
        <th style="text-align: center">FECHA. NACIMIENTO</th>        
        <th style="text-align: center">FE. IN. LABORES</th>
        <th style="text-align: center">FECHA INGRESO</th> 
        <th style="text-align: center">GENERO</th>
        <th style="text-align: center">PUESTO</th>
      </tr>
      <tbody id="tbl_empleados">
                  <%
        Empleado empleado= new Empleado();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = empleado.leer();
        for (int t=0;t<tabla.getRowCount();t++){
            out.println("<tr data-id_puesto=" + tabla.getValueAt(t, 11)+ " data-id_genero=" + tabla.getValueAt(t, 12)+ ">");
            out.println("<td>" + tabla.getValueAt(t, 0)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 1)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 2)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 3)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 4)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 5)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 6)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 7)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 8)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 9)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 10)+ "</td>");
            out.println("</tr>");
            
         }%>
         </tbody>
            </table>
              </div>
    <script type="text/javascript">
            $('#tbl_empleados').on('click','tr td',function(evt){
                var target,id_puesto,id_genero,id,nombres,apellidos,direccion,telefono,dpi,fecha_nacimiento,fecha_inicio_labores,fecha_ingreso,genero,puesto;
                target = $(event.target);
                id_puesto = target.parent().data('id_puesto');
                id_genero = target.parent().data('id_genero');
                id = target.parent("tr").find("td").eq(0).html();
                nombres = target.parent("tr").find("td").eq(1).html();
                apellidos = target.parent("tr").find("td").eq(2).html();
                direccion = target.parent("tr").find("td").eq(3).html();
                telefono = target.parent("tr").find("td").eq(4).html();
                dpi = target.parent("tr").find("td").eq(5).html();
                fecha_nacimiento = target.parent("tr").find("td").eq(6).html();
                fecha_inicio_labores = target.parent("tr").find("td").eq(7).html();
                fecha_ingreso = target.parent("tr").find("td").eq(8).html();
                genero = target.parent("tr").find("td").eq(9).html();
                puesto = target.parent("tr").find("td").eq(10).html();
                               
                $("#txt_id").val(id);
                $("#txt_nombres").val(nombres);
                $("#txt_apellidos").val(apellidos);
                $("#txt_direccion").val(direccion);
                $("#txt_telefono").val(telefono);
                $("#txt_dpi").val(dpi);
                $("#txt_fecha_nacimiento").val(fecha_nacimiento);
                $("#drop_puesto").val(id_puesto);
                $("#txt_fecha_labores").val(fecha_inicio_labores);
                $("#txt_fecha_ingreso").val(fecha_ingreso);
                $("#drop_genero").val(id_genero);
                
            });
            
        </script>
    
    </body>
</html>
