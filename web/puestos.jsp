<%-- 
    Document   : puestos
    Created on : 6/11/2024, 9:24:24 a. m.
    Author     : IT
--%>
<%@page import="modelo.Puesto"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PUESTOS</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </head>
<body>
        <br>
    <center><h1>Formulario Puestos</h1></center> 
        <div class="container">
            <form action="sr_puestos" method="post" class="form-group">
                <label for="lbl_id_puesto"><b>Id Puesto:</b></label>
                <input type="text" name="lbl_id_puesto" id="lbl_id_puesto" class="form-control" value="0" readonly>
                <label for="lbl_puesto"><b>Puesto:</b></label>
                <input type="text" name="txt_puesto" id="txt_puesto" class="form-control" placeholder="Ejemplo: nombre de puesto" required>
                <br>   
                    <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary btn-lg" onclick="javascript:if(!confirm('¿Desea Agregar Puesto?'))" style="background-color: #1e74a7; border:none ">AGREGAR</button>
                    <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-primary btn-lg" onclick="javascript:if(!confirm('¿Desea Modificar Puesto?'))return false" style="background-color: #1e74a7; border:none ">MODIFICAR</button>
                    <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-primary btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar Puesto?'))return false" style="background-color: #1e74a7; border:none">ELIMINAR</button>
                    
                    
        </form>
            <table class="table table-bordered">
    <thead>
      <tr>
        <th style="text-align: center">ID PUESTO</th>
        <th style="text-align: center">PUESTO</th>
      </tr>
    </thead>
    <tbody id="tbl_puestos">
        <%
        Puesto puesto= new Puesto();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = puesto.leerPuestos();
        for (int t=0;t<tabla.getRowCount();t++){
            out.println("<tr data-id='" + tabla.getValueAt(t, 0) + "'>");
            out.println("<td>" + tabla.getValueAt(t, 0)+ "</td>");
            out.println("<td>" + tabla.getValueAt(t, 1)+ "</td>");
            out.println("</tr>");
         }   
        %>   
    </tbody>
  </table>
     </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

    <script type="text/javascript">
            $('#tbl_puestos').on('click','tr td',function(evt){
             var target,id_puesto,puesto;
             target = $(event.target);
             id_puesto = target.parent("tr").find("td").eq(0).html();
             puesto = target.parent("tr").find("td").eq(1).html();
             
             $("#lbl_id_puesto").val(id_puesto);
             $("#txt_puesto").val(puesto);
             
            });
        </script>           
            
    </body>
</html>
