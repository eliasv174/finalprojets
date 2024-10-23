<%-- 
    Document   : Empleados
    Created on : 22/10/2024, 3:13:26?p. m.
    Author     : yeymi
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.List, modelo.Empleado" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Empleados</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Gestión de Empleados</h2>

        <!-- Botones para redirigir al CRUD de puestos y al index -->
        <div class="text-center mb-4">
            <a href="puestos.jsp" class="btn btn-primary">Ir a Puestos</a>
            <a href="index.jsp" class="btn btn-secondary">Ir al Inicio</a>
        </div>

        <!-- Formulario para agregar / actualizar empleado -->
        <div class="card mb-4">
            <div class="card-header">
                <%
                    Empleado empleado = (Empleado) request.getAttribute("empleado");
                    boolean editando = empleado != null;
                    String titulo = editando ? "Actualizar Empleado" : "Agregar Empleado";
                %>
                <%= titulo %>
            </div>
            <div class="card-body">
                <form action="empleados" method="post">
                    <%
                        if (editando) {
                    %>
                        <input type="hidden" name="action" value="actualizar">
                        <input type="hidden" name="idEmpleado" value="<%= empleado.getIdEmpleado() %>">
                    <%
                        } else {
                    %>
                        <input type="hidden" name="action" value="agregar">
                    <%
                        }
                    %>
                    <div class="mb-3">
                        <label for="nombres" class="form-label">Nombres</label>
                        <input type="text" class="form-control" name="nombres" id="nombres" value="<%= editando ? empleado.getNombres() : "" %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="apellidos" class="form-label">Apellidos</label>
                        <input type="text" class="form-control" name="apellidos" id="apellidos" value="<%= editando ? empleado.getApellidos() : "" %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="direccion" class="form-label">Dirección</label>
                        <input type="text" class="form-control" name="direccion" id="direccion" value="<%= editando ? empleado.getDireccion() : "" %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="telefono" class="form-label">Teléfono</label>
                        <input type="text" class="form-control" name="telefono" id="telefono" value="<%= editando ? empleado.getTelefono() : "" %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="dpi" class="form-label">DPI</label>
                        <input type="text" class="form-control" name="dpi" id="dpi" value="<%= editando ? empleado.getDpi() : "" %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="genero" class="form-label">Género</label>
                        <select class="form-select" name="genero" id="genero">
                            <option value="true" <%= editando && empleado.getGenero() ? "selected" : "" %>>Masculino</option>
                            <option value="false" <%= editando && !empleado.getGenero() ? "selected" : "" %>>Femenino</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="fecha_nacimiento" class="form-label">Fecha de Nacimiento</label>
                        <input type="date" class="form-control" name="fecha_nacimiento" id="fecha_nacimiento" value="<%= editando ? empleado.getFechaNacimiento() : "" %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="idPuesto" class="form-label">ID Puesto</label>
                        <input type="text" class="form-control" name="idPuesto" id="idPuesto" value="<%= editando ? empleado.getIdPuesto() : "" %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="fecha_inicio_labores" class="form-label">Fecha Inicio Labores</label>
                        <input type="date" class="form-control" name="fecha_inicio_labores" id="fecha_inicio_labores" value="<%= editando ? empleado.getFechaInicioLabores() : "" %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="fechaingreso" class="form-label">Fecha Ingreso</label>
                        <input type="datetime-local" class="form-control" name="fechaingreso" id="fechaingreso" value="<%= editando ? empleado.getFechaIngreso().toLocalDateTime().toString().replace(' ', 'T') : "" %>" required>
                    </div>
                    <button type="submit" class="btn btn-primary">
                        <%= editando ? "Actualizar Empleado" : "Agregar Empleado" %>
                    </button>
                </form>
            </div>
        </div>

        <!-- Lista de empleados -->
        <div class="card">
            <div class="card-header">
                Lista de Empleados
            </div>
            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID Empleado</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Dirección</th>
                            <th>Teléfono</th>
                            <th>DPI</th>
                            <th>Género</th>
                            <th>Fecha de Nacimiento</th>
                            <th>ID Puesto</th>
                            <th>Fecha Inicio Labores</th>
                            <th>Fecha Ingreso</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Empleado> empleados = (List<Empleado>) request.getAttribute("empleados");

                            if (empleados != null && !empleados.isEmpty()) {
                                for (Empleado emp : empleados) {
                        %>
                        <tr>
                            <td><%= emp.getIdEmpleado() %></td>
                            <td><%= emp.getNombres() %></td>
                            <td><%= emp.getApellidos() %></td>
                            <td><%= emp.getDireccion() %></td>
                            <td><%= emp.getTelefono() %></td>
                            <td><%= emp.getDpi() %></td>
                            <td><%= emp.getGenero() ? "Masculino" : "Femenino" %></td>
                            <td><%= emp.getFechaNacimiento() %></td>
                            <td><%= emp.getIdPuesto() %></td>
                            <td><%= emp.getFechaInicioLabores() %></td>
                            <td><%= emp.getFechaIngreso() %></td>
                            <td>
                                <a href="empleados?action=editar&id=<%= emp.getIdEmpleado() %>" class="btn btn-warning">Editar</a>
                                <a href="empleados?action=eliminar&id=<%= emp.getIdEmpleado() %>" class="btn btn-danger">Eliminar</a>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="12" class="text-center">No hay empleados registrados.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
