<%-- 
    Document   : proveedor
    Created on : 23/10/2024, 11:47:54 a. m.
    Author     : yeymi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Proveedores</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <style>
        /* Estilo para hacer el asterisco más grande y visible */
        .required-asterisk {
            color: red;
            font-size: 1.5em;
            vertical-align: super;
            line-height: 0.5;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Gestión de Proveedores</h2>

        <!-- Mensaje de confirmación o error -->
        <c:if test="${not empty mensaje}">
            <div class="alert alert-info">${mensaje}</div>
        </c:if>

        <!-- Formulario para agregar o editar proveedores -->
        <form action="ProveedorControlador" method="post">
            <!-- Identifica si estamos agregando o actualizando -->
            <input type="hidden" name="accion" value="${proveedor != null ? 'actualizar' : 'agregar'}">
            <input type="hidden" name="idProveedor" value="${proveedor.idProveedor}">

            <div class="mb-3">
                <label for="proveedor" class="form-label">Proveedor <span class="required-asterisk">*</span></label>
                <input type="text" class="form-control" id="proveedor" name="proveedor" value="${proveedor != null ? proveedor.proveedor : ''}" required>
            </div>
            <div class="mb-3">
                <label for="NIT" class="form-label">NIT <span class="required-asterisk">*</span></label>
                <input type="text" class="form-control" id="NIT" name="NIT" value="${proveedor != null ? proveedor.NIT : ''}" required>
            </div>
            <div class="mb-3">
                <label for="direccion" class="form-label">Dirección <span class="required-asterisk">*</span></label>
                <input type="text" class="form-control" id="direccion" name="direccion" value="${proveedor != null ? proveedor.direccion : ''}" required>
            </div>
            <div class="mb-3">
                <label for="telefono" class="form-label">Teléfono <span class="required-asterisk">*</span></label>
                <input type="text" class="form-control" id="telefono" name="telefono" value="${proveedor != null ? proveedor.telefono : ''}" required>
            </div>
            <button type="submit" class="btn btn-primary">${proveedor != null ? 'Actualizar' : 'Agregar'}</button>
        </form>

        <!-- Tabla de lista de proveedores -->
        <table class="table table-bordered mt-5">
            <thead>
                <tr>
                    <a href="index.jsp" class="btn btn-secondary mt-3">Regresar al Inicio</a>
                    <th>ID</th>
                    <th>Nombre Proveedor</th>
                    <th>NIT</th>
                    <th>Dirección</th>
                    <th>Teléfono</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="proveedor" items="${listaProveedores}">
                    <tr>
                        <td>${proveedor.idProveedor}</td>
                        <td>${proveedor.proveedor}</td>
                        <td>${proveedor.NIT}</td>
                        <td>${proveedor.direccion}</td>
                        <td>${proveedor.telefono}</td>
                        <td>
                            <!-- Botón Editar -->
                            <a href="ProveedorControlador?accion=editar&idProveedor=${proveedor.idProveedor}" class="btn btn-primary">Editar</a>
                            <!-- Botón Eliminar -->
                            <a href="ProveedorControlador?accion=eliminar&idProveedor=${proveedor.idProveedor}" class="btn btn-danger" onclick="return confirm('¿Está seguro de eliminar este proveedor?')">Eliminar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
