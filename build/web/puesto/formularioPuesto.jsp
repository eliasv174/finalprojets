<%-- 
    Document   : formularioPuesto
    Created on : 14/10/2024, 8:12:46 p. m.
    Author     : yeymi
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Formulario de Puesto</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2 class="mt-4">${puesto != null ? 'Editar' : 'Nuevo'} Puesto</h2>

      
        <form action="PuestoControlador" method="POST">
            <!-- Campo oculto para el ID del puesto (solo usado al editar) -->
            <input type="hidden" name="idPuesto" value="${puesto != null ? puesto.idPuesto : ''}">

            <div class="form-group">
                <label for="puesto">Nombre del Puesto:</label>
                <input type="text" class="form-control" id="puesto" name="puesto" 
                       value="${puesto != null ? puesto.puesto : ''}" required>
            </div>


            <button type="submit" class="btn btn-primary">${puesto != null ? 'Actualizar' : 'Guardar'}</button>
            <a href="PuestoControlador?accion=listar" class="btn btn-secondary">Cancelar</a>
        </form>
    </div>
</body>
</html>
