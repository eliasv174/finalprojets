<%@page import="modelo.Producto"%>
<%@page import="java.util.List"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Producto"%>
<%@page import="modelo.ProductoDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </head>
    <body>
        <br>
        <center><h1>Formulario Productos</h1></center>
        <div class="container">
            <form action="sr_producto" method="post" class="form-group">
                <label for="lbl_id_producto"><b>ID Producto:</b></label>
                <input type="text" name="txt_id_producto" id="txt_id_producto" class="form-control" value="0" >

                <label for="lbl_producto"><b>Producto:</b></label>
                <input type="text" name="txt_producto" id="txt_producto" class="form-control" placeholder="Nombre del Producto" required>

                <label for="lbl_id_marca"><b>ID Marca:</b></label>
                <input type="number" name="txt_id_marca" id="txt_id_marca" class="form-control" placeholder="Id Marca" required>

                <label for="lbl_descripcion"><b>Descripción:</b></label>
                <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder="Descripción del producto" required>

                <label for="lbl_precio_costo"><b>Precio Costo:</b></label>
                <input type="number" step="0.01" name="txt_precio_costo" id="txt_precio_costo" class="form-control" placeholder="Ejemplo: 100.00" required>

                <label for="lbl_precio_venta"><b>Precio Venta:</b></label>
                <input type="number" step="0.01" name="txt_precio_venta" id="txt_precio_venta" class="form-control" placeholder="Ejemplo: 150.00" required>

                <label for="lbl_existencia"><b>Existencia:</b></label>
                <input type="number" name="txt_existencia" id="txt_existencia" class="form-control" placeholder="Cantidad en inventario" required>

                <label for="lbl_fecha_ingreso"><b>Fecha de Ingreso:</b></label>
                <input type="date" name="txt_fecha_ingreso" id="txt_fecha_ingreso" class="form-control" required>

                <br>
                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary btn-lg" onclick="return confirm('¿Desea Agregar?')">AGREGAR</button>
                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-primary btn-lg" onclick="return confirm('¿Desea Modificar?')">MODIFICAR</button>
                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger btn-lg" onclick="return confirm('¿Desea Eliminar?')">ELIMINAR</button>
            </form>
            <div class="container">
        <h1>Lista de Productos</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Producto</th>
                    <th>Marca</th>
                    <th>Descripción</th>
                    <th>Precio Costo</th>
                    <th>Precio Venta</th>
                    <th>Existencia</th>
                    <th>Fecha Ingreso</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ProductoDAO pdao = new ProductoDAO();
                    List<Producto> listaProductos = pdao.Listar();
                    for (Producto p : listaProductos) {
                %>
                <tr>
                    <td><%= p.getId_producto() %></td>
                    <td><%= p.getProducto() %></td>
                    <td><%= p.getId_marca() %></td>
                    <td><%= p.getDescripcion() %></td>
                    <td><%= p.getPrecio_costo() %></td>
                    <td><%= p.getPrecio_venta() %></td>
                    <td><%= p.getExistencia() %></td>
                    <td><%= p.getFecha_ingreso() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
            
        </div>

        <script type="text/javascript">
        $('#tbl_productos').on('click', 'tr', function() {
            var id_producto = $(this).find("td").eq(0).text();
            var producto = $(this).find("td").eq(1).text();
            var id_marca = $(this).find("td").eq(2).text();
            var descripcion = $(this).find("td").eq(3).text();
            var precio_costo = $(this).find("td").eq(4).text();
            var precio_venta = $(this).find("td").eq(5).text();
            var existencia = $(this).find("td").eq(6).text();
            var fecha_ingreso = $(this).find("td").eq(7).text();
            
            $("#txt_id_producto").val(id_producto);
            $("#txt_producto").val(producto);
            $("#txt_id_marca").val(id_marca);
            $("#txt_descripcion").val(descripcion);
            $("#txt_precio_costo").val(precio_costo);
            $("#txt_precio_venta").val(precio_venta);
            $("#txt_existencia").val(existencia);
            $("#txt_fecha_ingreso").val(fecha_ingreso);
        });
    </script>
    </body>
</html>
