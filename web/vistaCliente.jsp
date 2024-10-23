<%-- 
    Document   : vistaCliente
    Created on : 22/10/2024, 9:37:46?p. m.
    Author     : yeymi
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.List, modelo.Cliente" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Clientes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Gestión de Clientes</h2>

        <!-- Botones para redirigir al index -->
        <div class="text-center mb-4">
            <a href="index.jsp" class="btn btn-secondary">Ir al Inicio</a>
        </div>

        <!-- Formulario para agregar / actualizar cliente -->
        <div class="card mb-4">
            <div class="card-header">
                Agregar / Actualizar Cliente
            </div>
            <div class="card-body">
                <form action="ClienteControlador" method="post">
                    <div class="mb-3">
                        <label for="idCliente" class="form-label">ID Cliente</label>
                        <input type="text" class="form-control" name="idCliente" id="idCliente" placeholder="Dejar en blanco para agregar nuevo" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="nombres" class="form-label">Nombres</label>
                        <input type="text" class="form-control" name="nombres" id="nombres" required>
                    </div>
                    <div class="mb-3">
                        <label for="apellidos" class="form-label">Apellidos</label>
                        <input type="text" class="form-control" name="apellidos" id="apellidos" required>
                    </div>
                    <div class="mb-3">
                        <label for="NIT" class="form-label">NIT</label>
                        <input type="text" class="form-control" name="NIT" id="NIT" required>
                    </div>
                    <div class="mb-3">
                        <label for="genero" class="form-label">Género</label>
<select class="form-control" name="genero" id="genero" required>
    <option value="true">Masculino</option>
    <option value="false">Femenino</option>
</select>
                    </div>
                    <div class="mb-3">
                        <label for="telefono" class="form-label">Teléfono</label>
                        <input type="text" class="form-control" name="telefono" id="telefono" required>
                    </div>
                    <div class="mb-3">
                        <label for="correo_electronico" class="form-label">Correo Electrónico</label>
                        <input type="email" class="form-control" name="correo_electronico" id="correo_electronico" required>
                    </div>
                    <button type="submit" name="accion" value="agregar" class="btn btn-primary">Agregar Cliente</button>
                    <button type="submit" name="accion" value="actualizar" class="btn btn-warning">Actualizar Cliente</button>
                </form>
            </div>
        </div>

        <!-- Lista de clientes -->
        <div class="card">
            <div class="card-header">
                Lista de Clientes
            </div>
            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID Cliente</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>NIT</th>
                            <th>Género</th>
                            <th>Teléfono</th>
                            <th>Correo Electrónico</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Cliente> clientes = (List<Cliente>) request.getAttribute("listaClientes");
                            if (clientes != null) {
                                for (Cliente cliente : clientes) {
                        %>
                            <tr>
                                <td><%= cliente.getIdCliente() %></td>
                                <td><%= cliente.getNombres() %></td>
                                <td><%= cliente.getApellidos() %></td>
                                <td><%= cliente.getNIT() %></td>
                                <td><%= cliente.isGenero() ? "Masculino" : "Femenino" %></td>
                                <td><%= cliente.getTelefono() %></td>
                                <td><%= cliente.getCorreoElectronico() %></td>
                                <td>
                                    <form action="ClienteControlador" method="post" style="display:inline;">
    <input type="hidden" name="accion" value="eliminar">
    <input type="hidden" name="idCliente" value="<%= cliente.getIdCliente() %>">
    <button type="submit" class="btn btn-danger">Eliminar</button>
</form>
                                    <button class="btn btn-info" onclick="editarCliente(<%= cliente.getIdCliente() %>, '<%= cliente.getNombres() %>', '<%= cliente.getApellidos() %>', '<%= cliente.getNIT() %>', <%= cliente.isGenero() %>, '<%= cliente.getTelefono() %>', '<%= cliente.getCorreoElectronico() %>')">Editar</button>
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
        function editarCliente(id, nombres, apellidos, NIT, genero, telefono, correoElectronico) {
            document.getElementById('idCliente').value = id;
            document.getElementById('nombres').value = nombres;
            document.getElementById('apellidos').value = apellidos;
            document.getElementById('NIT').value = NIT;
            document.getElementById('genero').value = genero;
            document.getElementById('telefono').value = telefono;
            document.getElementById('correo_electronico').value = correoElectronico;
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
