<%-- 
    Document   : listaPuestos
    Created on : 14/10/2024, 8:11:09 p. m.
    Author     : yeymi
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de Puestos</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2 class="mt-4">Lista de Puestos</h2>

      
        <a href="PuestoControlador?accion=nuevo" class="btn btn-primary mb-3">Agregar Nuevo Puesto</a>

        
        <table class="table table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre del Puesto</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
           
                <c:forEach var="puesto" items="${puestos}">
                    <tr>
                        <td>${puesto.idPuesto}</td>
                        <td>${puesto.puesto}</td>
                        <td>
                            
                            <a href="PuestoControlador?accion=editar&id=${puesto.idPuesto}" class="btn btn-warning btn-sm">Editar</a>
                           
                            <a href="PuestoControlador?accion=eliminar&id=${puesto.idPuesto}" class="btn btn-danger btn-sm" 
                               onclick="return confirm('¿Está seguro de que desea eliminar este puesto?');">Eliminar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="index.jsp" class="btn btn-secondary">Volver al Menú</a>
    </div>
</body>
</html>
