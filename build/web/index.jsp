<%-- 
    Document   : index
    Created on : 14/10/2024, 8:07:47 p. m.
    Author     : yeymi
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sistema de Punto de Venta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f0f0; /* Fondo gris claro */
            color: #212529; /* Color de texto gris oscuro */
            font-family: 'Helvetica', 'Arial', sans-serif; /* Tipografía limpia y profesional */
        }
        .navbar {
            background-color: #333333; /* Barra de navegación negra */
            padding: 15px;
        }
        .navbar-brand, .nav-link {
            color: #ffffff !important; /* Texto blanco en la barra de navegación */
        }
        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
        }
        .container {
            margin-top: 50px;
        }
        .section-title {
            font-size: 2.5rem;
            font-weight: 300;
            color: #444444;
            text-align: center;
            margin-bottom: 50px;
        }
        .card {
            background-color: #ffffff; /* Fondo blanco */
            border: none; /* Sin borde visible */
            border-radius: 10px; /* Bordes redondeados */
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1); /* Sombra suave */
            transition: all 0.3s ease-in-out; /* Transición suave */
        }
        .card:hover {
            transform: translateY(-10px); /* Efecto de desplazamiento en hover */
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2); /* Sombra más marcada en hover */
        }
        .card-header {
            background-color: #212529; /* Fondo gris oscuro */
            color: #ffffff; /* Texto blanco */
            font-size: 1.25rem;
            text-align: center;
            padding: 20px;
            font-weight: bold;
        }
        .card-body {
            padding: 30px;
            text-align: center;
        }
        .btn-custom {
            background-color: #6c757d; /* Color gris medio */
            color: #ffffff;
            padding: 10px 30px;
            font-size: 1rem;
            border-radius: 5px;
            text-transform: uppercase;
            font-weight: bold;
            transition: background-color 0.3s ease;
            width: 100%;
        }
        .btn-custom:hover {
            background-color: #343a40; /* Cambio a gris más oscuro en hover */
        }
        footer {
            margin-top: 50px;
            padding: 20px;
            background-color: #333333; /* Pie de página negro */
            color: #ffffff;
            text-align: center;
        }
    </style>
</head>
<body>

   
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Sistema de Punto de Venta</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Acerca de</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contacto</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    
    <div class="container">
        <h2 class="section-title">Bienvenido al Sistema de Gestión</h2>

        
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-header">Clientes</div>
                    <div class="card-body">
                        <a href="ClienteControlador?accion=listar" class="btn btn-custom">Gestionar Clientes</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-header">Ventas</div>
                    <div class="card-body">
                        <a href="VentaControlador?accion=listar" class="btn btn-custom">Gestionar Ventas</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-header">Empleados</div>
                    <div class="card-body">
                        <a href="EmpleadoControlador?accion=listar" class="btn btn-custom">Gestionar Empleados</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-header">Productos</div>
                    <div class="card-body">
                        <a href="ProductoControlador?accion=listar" class="btn btn-custom">Gestionar Productos</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-header">Proveedores</div>
                    <div class="card-body">
                        <a href="ProveedorControlador?accion=listar" class="btn btn-custom">Gestionar Proveedores</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-header">Compras</div>
                    <div class="card-body">
                        <a href="CompraControlador?accion=listar" class="btn btn-custom">Gestionar Compras</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-header">Detalles de Ventas</div>
                    <div class="card-body">
                        <a href="VentaDetalleControlador?accion=listar" class="btn btn-custom">Gestionar Detalles de Ventas</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-header">Detalles de Compras</div>
                    <div class="card-body">
                        <a href="CompraDetalleControlador?accion=listar" class="btn btn-custom">Gestionar Detalles de Compras</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-header">Marcas</div>
                    <div class="card-body">
                        <a href="MarcaControlador?accion=listar" class="btn btn-custom">Gestionar Marcas</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-header">Puestos</div>
                    <div class="card-body">
                        <a href="PuestoControlador?accion=listar" class="btn btn-custom">Gestionar Puestos</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

 
    <footer>
        <div class="container">
            <p>Sistema de Punto de Venta &copy; 2024 - </p>
        </div>
    </footer>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
