<%@page import="modelo.Puesto"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Puestos</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <br>
        <center><h1>MANTENIMIENTO DE PUESTOS</h1></center>
        <div class="container">
            <!-- Formulario para Agregar/Modificar Puesto -->
            <form action="sr_puestos" method="post" class="form-group">
                <label for="lbl_id_puesto"><b>Id Puesto:</b></label>
                <input type="text" name="txt_id_puesto" id="txt_id_puesto" class="form-control" value="0" readonly>
                <label for="lbl_puesto"><b>Nombre de Puesto</b></label>
                <input type="text" name="txt_puesto" id="txt_puesto" class="form-control" placeholder="Ejemplo: Nombre Puesto" required>
                <br>   
                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary btn-lg" onclick="javascript:if(!confirm('¿Desea Agregar?'))return false">AGREGAR</button>
                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success btn-lg" onclick="javascript:if(!confirm('¿Desea Modificar?'))return false">MODIFICAR</button>
                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">ELIMINAR</button>                        
            </form>
            
            <!-- Tabla para Mostrar Puestos -->
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th style="text-align: center">ID Puesto</th>
                        <th style="text-align: center">Puesto</th>
                    </tr>
                </thead>
                <tbody id="tbl_puestos">
                    <%
                    Puesto puesto = new Puesto();
                    DefaultTableModel tabla = puesto.leerPuestos();
                    for (int t = 0; t < tabla.getRowCount(); t++) {
                        out.println("<tr data-id='" + tabla.getValueAt(t, 0) + "'>");
                        out.println("<td>" + tabla.getValueAt(t, 0) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                        out.println("</tr>");
                    }
                    %>
                </tbody>
            </table>
        </div>

        <!-- Scripts de JavaScript y Bootstrap -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        
        <!-- Script de Interacción para Llenar Formulario -->
        <script type="text/javascript">
            $('#tbl_puestos').on('click', 'tr', function() {
                var id_puesto = $(this).data('id');
                var puesto = $(this).find("td").eq(1).html();
                
                $("#txt_id").val(id_puesto);
                $("#txt_puesto").val(puesto);
            });
        </script>
    </body>
</html>
