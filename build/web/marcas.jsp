<%-- 
    Document   : marcas
    Created on : 8/11/2024, 8:50:37 a. m.
    Author     : IT
--%>

<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="modelo.Marca"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MARCAS</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </head>
    <body>
         <br>
    <center><h1>Formulario Proveedores</h1></center>
        <div class="container">
            <form action="sr_marca" method="post" class="form-group">
                <label for="lbl_id_marca"><b>Id Marca:</b></label>
                <input type="text" name="txt_id_marca" id="txt_id_marca" class="form-control" value="0" readonly>
                <label for="lbl_marca"><b>Nombre de Marca:</b></label>
                <input type="text" name="txt_marca" id="txt_marca" class="form-control" placeholder="Ejemplo: Nombre 1 Nombre 2" required>
                             
                <br>   
                    <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary btn-lg" style="background-color: #1e74a7; border:none" onclick="javascript:if(!confirm('¿Desea Agregar?'))return false">AGREGAR</button>
                    <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-primary btn-lg" style="background-color: #1e74a7; border:none" onclick="javascript:if(!confirm('¿Desea Modificar?'))return false">MODIFICAR</button>
                    <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-primary btn-lg" style="background-color: #1e74a7; border:none" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">ELIMINAR</button>
                    <button name="btn_productos" id="btn_productos" value="" class="btn btn-primary btn-lg" style="background-color: #1e74a7; border:none" onclick="javascript:if(confirm('¿Desea ir a: Agregar productos?')) { window.location.href='productos.jsp'; }"))return false">AGREGAR PRODUCTOS</button>
        </form>
           <table class="table table-bordered">
    <thead>
      <tr>
        <th style="text-align: center">  ID  </th>
        <th style="text-align: center">MARCA</th>  
      </tr>
    </thead>
    
    <tbody id="tbl_marcas">
        <%
        Marca marca = new Marca();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = marca.leer();
        for (int t=0;t<tabla.getRowCount();t++){
            out.println("<tr>");
            out.println("<td>" + tabla.getValueAt(t, 0)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 1)+ "</td>");
            out.println("</tr>");
         }%>   
       
        
    </tbody>
     </table>        
        </div>
    
     <script type="text/javascript">
            $('#tbl_marcas').on('click','tr td',function(evt){
                var target,id_marca,marca;
                target = $(event.target);
                id_marca = target.parent("tr").find("td").eq(0).html();
                marca = target.parent("tr").find("td").eq(1).html();        
                
                $("#txt_id_marca").val(id_marca);
                $("#txt_marca").val(marca);
            });
            
        </script>             
        
        
        
               
        
        
    </body>
</html>
