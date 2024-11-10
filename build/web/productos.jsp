<%@page import="modelo.Producto"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRODUCTOS</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </head>
<body>
    <br>
    <center><h1>Formulario Productos</h1></center> 
    <div class="container">
        <form action="sr_productos" method="post" class="form-group" enctype="multipart/form-data">
            <label for="lbl_id_producto"><b>Id Producto:</b></label>
            <input type="text" name="lbl_id_producto" id="lbl_id_producto" class="form-control" value="0" readonly>

            <label for="txt_producto"><b>Producto:</b></label>
            <input type="text" name="txt_producto" id="txt_producto" class="form-control" placeholder="Ejemplo: nombre del producto" required>

            <label for="id_marca"><b>Marca:</b></label>
            <input type="number" name="id_marca" id="id_marca" class="form-control" required>

            <label for="txt_descripcion"><b>Descripción:</b></label>
            <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder="Descripción del producto" required>

            <label for="imagen"><b>Imagen:</b></label>
            <input type="file" name="imagen" id="imagen" class="form-control">

            <label for="txt_precio_costo"><b>Precio Costo:</b></label>
            <input type="text" name="txt_precio_costo" id="txt_precio_costo" class="form-control" required>

            <label for="txt_precio_venta"><b>Precio Venta:</b></label>
            <input type="text" name="txt_precio_venta" id="txt_precio_venta" class="form-control" required>

            <label for="txt_existencia"><b>Existencia:</b></label>
            <input type="text" name="txt_existencia" id="txt_existencia" class="form-control" required>

            <label for="txt_fecha_ingreso"><b>Fecha Ingreso:</b></label>
            <input type="date" name="txt_fecha_ingreso" id="txt_fecha_ingreso" class="form-control" required>

            <br>   
            <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary btn-lg" onclick="javascript:if(!confirm('¿Desea Agregar Producto?'))return false" style="background-color: #1e74a7; border:none">AGREGAR</button>
            <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-primary btn-lg" onclick="javascript:if(!confirm('¿Desea Modificar Producto?'))return false" style="background-color: #1e74a7; border:none">MODIFICAR</button>
            <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-primary btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar Producto?'))return false" style="background-color: #1e74a7; border:none">ELIMINAR</button>
        </form>
        
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th style="text-align: center">ID PRODUCTO</th>
                    <th style="text-align: center">PRODUCTO</th>
                    <th style="text-align: center">MARCA</th>
                    <th style="text-align: center">DESCRIPCIÓN</th>
                    <th style="text-align: center">PRECIO COSTO</th>
                    <th style="text-align: center">PRECIO VENTA</th>
                    <th style="text-align: center">EXISTENCIA</th>
                    <th style="text-align: center">FECHA INGRESO</th>
                </tr>
            </thead>
            <tbody id="tbl_productos">
                <%
                Producto producto = new Producto();
                DefaultTableModel tabla = producto.leerProductos();
                for (int t = 0; t < tabla.getRowCount(); t++) {
                    out.println("<tr data-id='" + tabla.getValueAt(t, 0) + "'>");
                    out.println("<td>" + tabla.getValueAt(t, 0) + "</td>");
                    out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                    out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                    out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                    out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                    out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                    out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                    out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                    out.println("</tr>");
                }
                %>   
            </tbody>
        </table>
    </div>

    <script type="text/javascript">
        $('#tbl_productos').on('click', 'tr td', function() {
            var target, id_producto, producto, id_marca, descripcion, precio_costo, precio_venta, existencia, fecha_ingreso;
            target = $(event.target);
            id_producto = target.parent("tr").find("td").eq(0).html();
            producto = target.parent("tr").find("td").eq(1).html();
            id_marca = target.parent("tr").find("td").eq(2).html();
            descripcion = target.parent("tr").find("td").eq(3).html();
            precio_costo = target.parent("tr").find("td").eq(4).html();
            precio_venta = target.parent("tr").find("td").eq(5).html();
            existencia = target.parent("tr").find("td").eq(6).html();
            fecha_ingreso = target.parent("tr").find("td").eq(7).html();

            $("#lbl_id_producto").val(id_producto);
            $("#txt_producto").val(producto);
            $("#id_marca").val(id_marca);
            $("#txt_descripcion").val(descripcion);
            $("#txt_precio_costo").val(precio_costo);
            $("#txt_precio_venta").val(precio_venta);
            $("#txt_existencia").val(existencia);
            $("#txt_fecha_ingreso").val(fecha_ingreso);
        });
    </script>           
</body>
</html>
