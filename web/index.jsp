<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" width=device-width, initial-scale=1.0">
    <title>PROYECTO FINAL G5</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <style>
        .dropdown-submenu {
            position: relative;
        }
        .dropdown-submenu .dropdown-menu {
            left: 100%;
            top: 0;
            display: none;
        }
        .dropdown-submenu:hover .dropdown-menu {
            display: block;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #1e74a7;">
        <a class="navbar-brand" href="index.jsp" style="color: white;" >INICIO</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="false" style="color: white;">
                        PRODUCTOS
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="productos.jsp" target="FramePrincipal" >EDITAR PRODUCTOS</a>
                        <a class="dropdown-item" href="marcas.jsp" target="FramePrincipal" >EDITAR MARCAS</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="false" style="color: white;">
                        VENTAS
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="ventas.jsp" target="FramePrincipal">EDITAR VENTAS</a>
                        <a class="dropdown-item" href="clientes.jsp" target="FramePrincipal">EDITAR CLIENTES</a>
                        <div class="dropdown-submenu">
                            <hr class="dropdown-divider">
                            <a class="dropdown-item dropdown-toggle">EMPLEADOS</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="empleados.jsp" target="FramePrincipal">EDITAR EMPLEADOS</a>
                                <a class="dropdown-item" href="puestos.jsp" target="FramePrincipal">EDITAR PUESTOS</a>
                            </div>
                        </div>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="false" style="color: white;">
                        COMPRAS
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="compras.jsp" target="FramePrincipal">EDITAR COMPRAS</a>
                        <a class="dropdown-item" href="proveedores.jsp" target="FramePrincipal">EDITAR PROVEEDORES</a>
                    </div>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="reportes.jsp" target="FramePrincipal" style="color: white;">REPORTES</a>
                </li>
            </ul>

            <div class="dropdown">
                <button class="btn dropdown-toggle" type="button" id="btnCerrarSesion" data-toggle="dropdown" aria-expanded="false" style="color: white;">
                    LOGIN
                </button>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="btnCerrarSesion">
                        <form action="sr_validar" method="doPost">
                            <button 
                                class="dropdown-item text-danger" 
                                name="accion" 
                                value="cerrar" 
                                type="submit">
                                Cerrar Sesión
                            </button>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="m-4" style="height: 550px;">
        <iframe name="FramePrincipal" src="fondo.jsp" style="height:100%; width:100%; border:none">
            
        </iframe>
    </div>
</body>
</html>
