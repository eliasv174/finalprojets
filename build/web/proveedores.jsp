<%-- 
    Document   : proveedores
    Created on : 7/11/2024, 9:14:50 a. m.
    Author     : IT
--%>

<%@page import="modelo.Proveedor"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PROVEEDORES</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </head>
    <body>
        <br>
    <center><h1>Formulario Proveedores</h1></center>
        <div class="container">
            <form action="sr_proveedor" method="post" class="form-group">
                <label for="lbl_id_proveedor"><b>Id Proveedor:</b></label>
                <input type="text" name="txt_id_proveedor" id="txt_id_proveedor" class="form-control" value="0" readonly>
                <label for="lbl_proveedor"><b>Nombre de Proveedor:</b></label>
                <input type="text" name="txt_proveedor" id="txt_proveedor" class="form-control" placeholder="Ejemplo: Nombre 1 Nombre 2" required>
                <label for="lbl_nit"><b>Nit:</b></label>
                <input type="text" name="txt_nit" id="txt_nit" class="form-control" placeholder="Ejemplo: 0000000 " required>
                <label for="lbl_direccion"><b>Direccion:</b></label>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: 0 calle, 0-0 city" required>
                <label for="lbl_telefono"><b>Telefono:</b></label>
                <input type="text" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: +502 5555 5555" required>
                
                <br>   
                    <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary btn-lg" style="background-color: #1e74a7; border:none" onclick="javascript:if(!confirm('¿Desea Agregar?'))return false">AGREGAR</button>
                    <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-primary btn-lg" style="background-color: #1e74a7; border:none" onclick="javascript:if(!confirm('¿Desea Modificar?'))return false">MODIFICAR</button>
                    <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-primary btn-lg" style="background-color: #1e74a7; border:none" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">ELIMINAR</button>            </form>
                    
                    <table class="table table-bordered">
    <thead>
      <tr>
        <th style="text-align: center">  ID  </th>
        <th style="text-align: center">PROVEEDOR</th>
        <th style="text-align: center">NIT</th>
        <th style="text-align: center">DIRECCION</th>
        <th style="text-align: center">TELEFONO</th>           
      </tr>
    </thead>
    
    <tbody id="tbl_proveedores">
        <%
        Proveedor proveedor = new Proveedor();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = proveedor.leerProv();
        for (int t=0;t<tabla.getRowCount();t++){
            out.println("<td>" + tabla.getValueAt(t, 0)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 1)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 2)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 3)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 4)+ "</td>");
            out.println("</tr>");
            
         }%>   
       
        
    </tbody>
     </table>        
        </div>
    
     <script type="text/javascript">
            $('#tbl_proveedores').on('click','tr td',function(evt){
                var target,id_proveedor,proveedor,nit,direccion,telefono;
                target = $(event.target);
                id_proveedor = target.parent("tr").find("td").eq(0).html();
                proveedor = target.parent("tr").find("td").eq(1).html();        
                nit = target.parent("tr").find("td").eq(2).html();
                direccion = target.parent("tr").find("td").eq(3).html();
                telefono = target.parent("tr").find("td").eq(4).html();
                
                $("#txt_id_proveedor").val(id_proveedor);
                $("#txt_proveedor").val(proveedor);
                $("#txt_nit").val(nit);
                $("#txt_direccion").val(direccion);
                $("#txt_telefono").val(telefono);

            });
            
        </script>             
        
        
        
        
    </body>
</html>