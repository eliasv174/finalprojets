<%-- 
    Document   : vistaMarca
    Created on : 24/10/2024, 10:09:41 a. m.
    Author     : yeymi
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.List, modelo.Marca" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Marcas</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Gestión de Marcas</h2>

        <!-- Botones para redirigir al CRUD de productos y al index -->
        <div class="text-center mb-4">
            <a href="productos.jsp" class="btn btn-primary">Ir a Productos</a>
            <a href="index.jsp" class="btn btn-secondary">Ir al Inicio</a>
        </div>

        <!-- Formulario para agregar / actualizar marca -->
        <div class="card mb-4">
            <div class="card-header">
                <%
                    Marca marca = (Marca) request.getAttribute("marca");
                    boolean editando = marca != null;
                    String titulo = editando ? "Actualizar Marca" : "Agregar Marca";
                %>
                <%= titulo %>
            </div>
            <div class="card-body">
                <form action="MarcaControlador" method="post" onsubmit="return validarFormulario();">
                    <%
                        if (editando) {
                    %>
                        <input type="hidden" name="accion" value="actualizar">
                        <input type="hidden" name="idMarca" value="<%= marca.getIdMarca() %>">
                    <%
                        } else {
                    %>
                        <input type="hidden" name="accion" value="agregar">
                    <%
                        }
                    %>
                    <div class="mb-3">
                        <label for="marca" class="form-label">Nombre de la Marca <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="marca" id="marca" value="<%= editando ? marca.getMarca() : "" %>" required maxlength="100">
                        <div class="invalid-feedback" id="marcaFeedback">
                            El nombre de la marca es obligatorio y no puede exceder los 100 caracteres.
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">
                        <%= editando ? "Actualizar Marca" : "Agregar Marca" %>
                    </button>
                </form>
            </div>
        </div>

        <!-- Lista de marcas -->
        <div class="card">
            <div class="card-header">
                Lista de Marcas
            </div>
            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID Marca</th>
                            <th>Nombre de la Marca</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Marca> marcas = (List<Marca>) request.getAttribute("listaMarcas");

                            if (marcas != null && !marcas.isEmpty()) {
                                for (Marca m : marcas) {
                        %>
                        <tr>
                            <td><%= m.getIdMarca() %></td>
                            <td><%= m.getMarca() %></td>
                            <td>
                                <a href="MarcaControlador?accion=editar&idMarca=<%= m.getIdMarca() %>" class="btn btn-warning">Editar</a>
                                <a href="MarcaControlador?accion=eliminar&idMarca=<%= m.getIdMarca() %>" class="btn btn-danger" onclick="return confirm('¿Estás seguro de que deseas eliminar esta marca?');">Eliminar</a>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="3" class="text-center">No hay marcas registradas.</td>
                        </tr>
                        <%
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
            var marcaInput = document.getElementById("marca");
            var feedback = document.getElementById("marcaFeedback");

            if (marcaInput.value.trim() === "" || marcaInput.value.length > 100) {
                marcaInput.classList.add("is-invalid");
                feedback.style.display = "block";
                return false; // Previene el envío del formulario
            }

            marcaInput.classList.remove("is-invalid");
            feedback.style.display = "none";
            return true; // Permite el envío del formulario
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
