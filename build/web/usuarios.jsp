<%-- 
    Document   : usuarios
    Created on : 8/11/2024, 10:16:22 a. m.
    Author     : IT
--%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USUARIOS</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </head>
    <body>
        <br>
    <center><h1>Formulario Usuarios</h1></center> 
        <div class="container">
            <form action="sr_puestos" method="post" class="form-group">
                <label for="lbl_id_usuario"><b>Id Usuario:</b></label>
                <input type="text" name="txt_id_usuario" id="txt_id_usuario" class="form-control" value="0" readonly>
                <label for="lbl_usuario"><b>Usuario:</b></label>
                <input type="text" name="txt_usuario" id="txt_usuario" class="form-control" placeholder="Usuario" required>
                <label for="lbl_contrasena"><b>Contraseña:</b></label>
                <input type="password" name="txt_contrasena" id="txt_contrasena" class="form-control" placeholder="Contraseña" required>
                <br>   
                    <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary btn-lg" onclick="javascript:if(!confirm('¿Desea Agregar Puesto?'))" style="background-color: #1e74a7; border:none ">AGREGAR</button>
                    <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-primary btn-lg" onclick="javascript:if(!confirm('¿Desea Modificar Puesto?'))return false" style="background-color: #1e74a7; border:none ">MODIFICAR</button>
                    <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-primary btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar Puesto?'))return false" style="background-color: #1e74a7; border:none">ELIMINAR</button>
                               
        </form>
            <table class="table table-bordered">
    <thead>
      <tr>
        <th style="text-align: center">ID USUARIO</th>
        <th style="text-align: center">USUARIO</th>
        <th style="text-align: center">CONTRASEÑA</th>
        <th style="text-align: center">NOMBRES</th>
        <th style="text-align: center">APELLIDOS</th>
      </tr>
    </thead>
    <tbody id="tbl_usuarios">
        <%
        Usuario usuario= new Usuario();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = usuario.leer();
        for (int t=0;t<tabla.getRowCount();t++){
            out.println("<td>" + tabla.getValueAt(t, 0)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 1)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 3)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 4)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 5)+ "</td>");
            out.println("</tr>");
         }   
        %>   
    </tbody>
  </table>
     </div>

 <script type="text/javascript">
            $('#tbl_puestos').on('click','tr td',function(evt){
             var target,id_usuario,usuario,contrasena,id_empleado;
             target = $(event.target);
             id_usuario = target.parent("tr").find("td").eq(0).html();
             usuario = target.parent("tr").find("td").eq(1).html();
             contrasena = target.parent("tr").find("td").eq(2).html();
             id_empleado = target.parent("tr").find("td").eq(3).html();
             
             $("#txt_id_usuario").val(id_usuario);
             $("#txt_usuario").val(usuario);            
             $("#txt_contrasena").val(contrasena);
             $("#txt_id_empleado").val(id_empleado);
             
            });
        </script>           
            
    </body>
</html>
