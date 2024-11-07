<%-- 
    Document   : clientes
    Created on : 7/11/2024, 2:19:44 p. m.
    Author     : IT
--%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Genero"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CLIENTES</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </head>
    <body>
        <br>
    <center><h1>Formulario Clientes</h1></center>
        <div class="container">
            <form action="sr_cliente" method="post" class="form-group">
                <label for="lbl_id_cliente"><b>Id Cliente:</b></label>
                <input type="text" name="txt_id_cliente" id="txt_id_cliente" class="form-control" value="0" readonly>
                <label for="lbl_nombres"><b>Nombres:</b></label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre 1 Nombre 2" required>
                <label for="lbl_nombres"><b>Apellidos:</b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido 1 Apellido 2" required>              
                <label for="lbl_nit"><b>Nit:</b></label>
                <input type="text" name="txt_nit" id="txt_nit" class="form-control" placeholder="Ejemplo: 0000000 " required>
                <label for="lbl_telefono"><b>Telefono:</b></label>
                <input type="text" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: +502 5555 5555" required>
                <label for="lbl_correo_electronico"><b>Correo Electronico:</b></label>
                <input type="text" name="txt_correo_electronico" id="txt_correo_electronico" class="form-control" placeholder="Ejemplo: ejemplo@mail.com" required>
                <label for="lbl_fecha_ingreso"><b>Fecha de Ingreso:</b></label>
                <input type="date" name="txt_fecha_ingreso" id="txt_fecha_ingreso" class="form-control" placeholder="Ejemplo: 01/01/2000" required>
                <label for="lbl_genero"><b>Genero:</b></label>
                <select name="drop_genero" id="drop_genero" class="form-control">
                             <%
                        Genero genero = new Genero (); 
                    HashMap<String,String> drop_genero = genero.drop_genero();
                    for (String i: drop_genero.keySet()){
                        out.println("<option value='" + i + "'>"+ drop_genero.get(i) + "</option>");
                        }
                    %>
                
                </select>
                    <br>   
                    <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary btn-lg" style="background-color: #1e74a7; border:none" onclick="javascript:if(!confirm('¿Desea Agregar?'))return false">AGREGAR</button>
                    <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-primary btn-lg" style="background-color: #1e74a7; border:none" onclick="javascript:if(!confirm('¿Desea Modificar?'))return false">MODIFICAR</button>
                    <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-primary btn-lg" style="background-color: #1e74a7; border:none" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">ELIMINAR</button>            </form>
            
       <table class="table table-bordered">
    <thead>
      <tr>
        <th style="text-align: center">  ID  </th>
        <th style="text-align: center">NOMBRES</th>
        <th style="text-align: center">APELLIDOS</th>
        <th style="text-align: center">NIT</th>
        <th style="text-align: center">TELEFONO</th>
        <th style="text-align: center">CORREO ELECTRONICO</th>
        <th style="text-align: center">FECHA INGRESO</th>
        <th style="text-align: center">GENERO</th>           
      </tr>
    </thead>
    
    <tbody id="tbl_clientes">
        <%
        Cliente cliente = new Cliente();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = cliente.leer();
        for (int t=0;t<tabla.getRowCount();t++){
            out.println("<tr data-id_genero=" + tabla.getValueAt(t, 8)+ ">");
            out.println("<td>" + tabla.getValueAt(t, 0)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 1)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 2)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 3)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 4)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 5)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 6)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 7)+ "</td>");
            out.println("</tr>");
            
         }%>   
       
        
    </tbody>
     </table>        
        </div>
    
     <script type="text/javascript">
            $('#tbl_clientes').on('click','tr td',function(evt){
                var target,id_genero,id_cliente,nombres,apellidos,nit,telefono,correo_electronico,fecha_ingreso,genero;
                target = $(event.target);
                id_genero = target.parent().data('id_genero');
                id_cliente = target.parent("tr").find("td").eq(0).html();
                nombres = target.parent("tr").find("td").eq(1).html();        
                apellidos = target.parent("tr").find("td").eq(2).html();
                nit = target.parent("tr").find("td").eq(3).html();
                telefono = target.parent("tr").find("td").eq(4).html();
                correo_electronico = target.parent("tr").find("td").eq(5).html();
                fecha_ingreso = target.parent("tr").find("td").eq(6).html();
                genero = target.parent("tr").find("td").eq(7).html();
                
                
                $("#txt_id_cliente").val(id_cliente);
                $("#txt_nombres").val(nombres);
                $("#txt_apellidos").val(apellidos);
                $("#txt_nit").val(nit);
                $("#drop_genero").val(id_genero);
                $("#txt_telefono").val(telefono);
                $("#txt_correo_electronico").val(correo_electronico);
                $("#txt_fecha_ingreso").val(fecha_ingreso);

            });
            
        </script>             
    </body>
</html>
