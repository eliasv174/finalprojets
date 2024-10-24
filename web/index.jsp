<%-- 
    Document   : index
    Created on : 22/10/2024, 9:48:40 a. m.
    Author     : yeymi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%
   
    if (session == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    Object usuario = session.getAttribute("usuario");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <title>Página de Bienvenida</title>
    <style>
        .container {
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card shadow">
            <div class="card-header bg-primary text-white text-center">
                <h3 class="mb-0">Bienvenido, <%= usuario %></h3>
            </div>
            <div class="card-body">
                <p class="text-center">Seleccione una opción para gestionar:</p>
                <div class="list-group">
                    <a href="ClienteControlador" class="list-group-item list-group-item-action list-group-item-primary text-center">Gestionar Clientes</a>
                    <a href="EmpleadosControlador" class="list-group-item list-group-item-action list-group-item-primary text-center">Gestionar Empleados</a>
                    <a href="ProductosControlador" class="list-group-item list-group-item-action list-group-item-primary text-center">Gestionar Productos</a>
                    <a href="VentasControlador" class="list-group-item list-group-item-action list-group-item-primary text-center">Gestionar Ventas</a>
                    <a href="ProveedorControlador" class="list-group-item list-group-item-action list-group-item-primary text-center">Gestionar Proveedores</a>
                    <a href="ComprasControlador" class="list-group-item list-group-item-action list-group-item-primary text-center">Gestionar Compras</a>
                    <a href="ComprasDetalleControlador" class="list-group-item list-group-item-action list-group-item-primary text-center">Gestionar Compras Detalle</a>
                    <a href="PuestosControlador" class="list-group-item list-group-item-action list-group-item-primary text-center">Gestionar Puestos</a>
                    <a href="VentasDetalleControlador" class="list-group-item list-group-item-action list-group-item-primary text-center">Gestionar Ventas Detalle</a>
                    <a href="MarcaControlador" class="list-group-item list-group-item-action list-group-item-primary text-center">Gestionar Marcas</a>
                </div>
            </div>
            <div class="card-footer text-end">
                <a href="logout.jsp" class="btn btn-danger">Cerrar Sesión</a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
