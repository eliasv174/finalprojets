<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Menu" %>
<%@ page import="controlador.MenuControlador" %>

<%
    MenuControlador menuControlador = new MenuControlador();
    List<Menu> menus = menuControlador.obtenerMenusPadre();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú Dinámico</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #343a40;
            padding-top: 20px;
        }

        .sidebar a {
            text-decoration: none;
            font-size: 18px;
            color: #ccc;
            padding: 10px 20px;
            display: block;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #007bff;
            color: white;
        }

        .submenu {
            padding-left: 20px;
        }

        .submenu a {
            font-size: 16px;
        }

        .content {
            flex-grow: 1;
            background-color: #f8f9fa;
            padding: 20px;
        }

    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <nav>
            <ul class="nav flex-column">
                <%
                    for (Menu menu : menus) {
                        if (menu.getEnlace() != null && !menu.getEnlace().isEmpty()) {
                %>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() + menu.getEnlace() %>">
                            <%= menu.getNombre() %>
                        </a>

                        <%-- Submenu Handling --%>
                        <%
                            if (menu.getSubmenus() != null && !menu.getSubmenus().isEmpty()) {
                        %>
                        <ul class="submenu">
                            <%
                                for (Menu submenu : menu.getSubmenus()) {
                                    if (submenu.getEnlace() != null && !submenu.getEnlace().isEmpty()) {
                            %>
                                <li>
                                    <a href="<%= request.getContextPath() + submenu.getEnlace() %>">
                                        <%= submenu.getNombre() %>
                                    </a>

                                    <%-- Sub-submenu Handling --%>
                                    <%
                                        if (submenu.getSubmenus() != null && !submenu.getSubmenus().isEmpty()) {
                                    %>
                                    <ul class="submenu">
                                        <%
                                            for (Menu subsubmenu : submenu.getSubmenus()) {
                                                if (subsubmenu.getEnlace() != null && !subsubmenu.getEnlace().isEmpty()) {
                                        %>
                                            <li>
                                                <a href="<%= request.getContextPath() + subsubmenu.getEnlace() %>">
                                                    <%= subsubmenu.getNombre() %>
                                                </a>
                                            </li>
                                        <%
                                                }
                                            }
                                        %>
                                    </ul>
                                    <%
                                        }
                                    %>

                                </li>
                            <%
                                    }
                                }
                            %>
                        </ul>
                        <%
                            }
                        %>
                    </li>
                <%
                        }
                    }
                %>
            </ul>
        </nav>
    </div>

    <!-- Content Area -->
    <div class="content">
        <h1>Bienvenido al Sistema</h1>
        <p>Selecciona una opción del menú para continuar.</p>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

