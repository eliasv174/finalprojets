<%-- 
    Document   : puestos
    Created on : 22/10/2024, 11:33:58 a. m.
    Author     : yeymi
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.List, modelo.Puestos" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Puestos</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Gestión de Puestos</h2>

        <!-- Botones para redirigir al CRUD de empleados y al index -->
        <div class="text-center mb-4">
            <a href="empleados" class="btn btn-primary">Ir  Empleados</a>
            <a href="index.jsp" class="btn btn-secondary">Ir al Inicio</a>
        </div>

        <!-- Formulario para agregar / actualizar puesto -->
        <div class="card mb-4">
            <div class="card-header">
                Agregar / Actualizar Puesto
            </div>
            <div class="card-body">
                <form action="PuestosControlador" method="post">
                    <div class="mb-3">
                        <label for="idPuesto" class="form-label">ID Puesto</label>
                        <input type="text" class="form-control" name="idPuesto" id="idPuesto" placeholder="Dejar en blanco para agregar nuevo" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="puesto" class="form-label">Puesto</label>
                        <input type="text" class="form-control" name="puesto" id="puesto" required>
                    </div>
                    <button type="submit" name="action" value="agregar" class="btn btn-primary">Agregar Puesto</button>
                    <button type="submit" name="action" value="actualizar" class="btn btn-warning">Actualizar Puesto</button>
                </form>
            </div>
        </div>

        <!-- Lista de puestos -->
        <div class="card">
            <div class="card-header">
                Lista de Puestos
            </div>
            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID Puesto</th>
                            <th>Puesto</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            // Aquí se espera que la lista de puestos esté disponible como atributo de solicitud (request attribute)
                            List<Puestos> puestos = (List<Puestos>) request.getAttribute("puestos");
                            if (puestos != null) {
                                for (Puestos puesto : puestos) {
                        %>
                            <tr>
                                <td><%= puesto.getIdPuesto() %></td>
                                <td><%= puesto.getPuesto() %></td>
                                <td>
                                    <a href="PuestosControlador?action=eliminar&id=<%= puesto.getIdPuesto() %>" class="btn btn-danger">Eliminar</a>
                                    <button class="btn btn-info" onclick="editarPuesto(<%= puesto.getIdPuesto() %>, '<%= puesto.getPuesto() %>')">Editar</button>
                                </td>
                            </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        function editarPuesto(id, nombre) {
            document.getElementById('idPuesto').value = id;
            document.getElementById('puesto').value = nombre;
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
