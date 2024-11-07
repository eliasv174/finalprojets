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
                <form action="sr_cliente" method="post" onsubmit="return validarFormulario();">
                    <div class="mb-3">
                        <label for="idCliente" class="form-label">ID Cliente</label>
                        <input type="text" class="form-control" name="idCliente" id="idCliente" placeholder="Dejar en blanco para agregar nuevo" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="nombres" class="form-label">Nombres <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="nombres" id="nombres" required maxlength="100">
                        <div class="invalid-feedback" id="nombresFeedback">
                            El nombre es obligatorio y no puede exceder los 100 caracteres.
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="apellidos" class="form-label">Apellidos <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="apellidos" id="apellidos" required maxlength="100">
                        <div class="invalid-feedback" id="apellidosFeedback">
                            Los apellidos son obligatorios y no pueden exceder los 100 caracteres.
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="nit" class="form-label">NIT <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="nit" id="nit" required maxlength="15">
                        <div class="invalid-feedback" id="nitFeedback">
                            El NIT es obligatorio y no puede exceder los 15 caracteres.
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="genero" class="form-label">Género <span class="text-danger">*</span></label>
                        <select class="form-control" name="genero" id="genero" required>
                            <option value="true">Masculino</option>
                            <option value="false">Femenino</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="telefono" class="form-label">Teléfono <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="telefono" id="telefono" required pattern="^\d{8,15}$">
                        <div class="invalid-feedback" id="telefonoFeedback">
                            El teléfono es obligatorio y debe tener entre 8 y 15 dígitos.
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="correoElectronico" class="form-label">Correo Electrónico <span class="text-danger">*</span></label>
                        <input type="email" class="form-control" name="correoElectronico" id="correoElectronico" required>
                        <div class="invalid-feedback" id="correoFeedback">
                            El correo electrónico es obligatorio y debe tener un formato válido.
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="fechaIngreso" class="form-label">Fecha de Ingreso <span class="text-danger">*</span></label>
                        <input type="datetime-local" class="form-control" name="fechaIngreso" id="fechaIngreso" required>
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
                            <th>Fecha de Ingreso</th>
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
                                <td><%= cliente.getNit() %></td>
                                <td><%= cliente.isGenero() ? "Masculino" : "Femenino" %></td>
                                <td><%= cliente.getTelefono() %></td>
                                <td><%= cliente.getCorreoElectronico() %></td>
                                <td><%= cliente.getFechaIngreso() %></td>
                                <td>
                                    <form action="ClienteControlador" method="post" style="display:inline;">
                                        <input type="hidden" name="accion" value="eliminar">
                                        <input type="hidden" name="idCliente" value="<%= cliente.getIdCliente() %>">
                                        <button type="submit" class="btn btn-danger">Eliminar</button>
                                    </form>
                                    <button class="btn btn-info" onclick="editarCliente(<%= cliente.getIdCliente() %>, '<%= cliente.getNombres() %>', '<%= cliente.getApellidos() %>', '<%= cliente.getNit() %>', <%= cliente.isGenero() %>, '<%= cliente.getTelefono() %>', '<%= cliente.getCorreoElectronico() %>', '<%= cliente.getFechaIngreso() %>')">Editar</button>
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

    <!-- Validaciones de JavaScript para el formulario -->
    <script>
        function validarFormulario() {
            var nombresInput = document.getElementById("nombres");
            var apellidosInput = document.getElementById("apellidos");
            var nitInput = document.getElementById("nit");
            var telefonoInput = document.getElementById("telefono");
            var correoInput = document.getElementById("correoElectronico");
            var feedback = {
                nombres: document.getElementById("nombresFeedback"),
                apellidos: document.getElementById("apellidosFeedback"),
                nit: document.getElementById("nitFeedback"),
                telefono: document.getElementById("telefonoFeedback"),
                correo: document.getElementById("correoFeedback")
            };

            // Validaciones
            if (nombresInput.value.trim() === "" || nombresInput.value.length > 100) {
                nombresInput.classList.add("is-invalid");
                feedback.nombres.style.display = "block";
                return false;
            }

            if (apellidosInput.value.trim() === "" || apellidosInput.value.length > 100) {
                apellidosInput.classList.add("is-invalid");
                feedback.apellidos.style.display = "block";
                return false;
            }

            if (nitInput.value.trim() === "" || nitInput.value.length > 15) {
                nitInput.classList.add("is-invalid");
                feedback.nit.style.display = "block";
                return false;
            }

            if (!/^\d{8,15}$/.test(telefonoInput.value)) {
                telefonoInput.classList.add("is-invalid");
                feedback.telefono.style.display = "block";
                return false;
            }

            if (!correoInput.checkValidity()) {
                correoInput.classList.add("is-invalid");
                feedback.correo.style.display = "block";
                return false;
            }

            // Si todo está bien, ocultar los mensajes de error
            nombresInput.classList.remove("is-invalid");
            apellidosInput.classList.remove("is-invalid");
            nitInput.classList.remove("is-invalid");
            telefonoInput.classList.remove("is-invalid");
            correoInput.classList.remove("is-invalid");

            return true; // Permite el envío del formulario
        }

        function editarCliente(id, nombres, apellidos, nit, genero, telefono, correoElectronico, fechaIngreso) {
            document.getElementById('idCliente').value = id;
            document.getElementById('nombres').value = nombres;
            document.getElementById('apellidos').value = apellidos;
            document.getElementById('nit').value = nit;
            document.getElementById('genero').value = genero;
            document.getElementById('telefono').value = telefono;
            document.getElementById('correoElectronico').value = correoElectronico;
            document.getElementById('fechaIngreso').value = fechaIngreso;
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
