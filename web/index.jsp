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
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            .content {
                padding: 20px;
            }
        </style>
    </head>
    <body>

        <!-- Navbar Superior -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Sistema</a>
                <button 
                    class="navbar-toggler" 
                    type="button" 
                    data-bs-toggle="collapse" 
                    data-bs-target="#navbarNavDropdown" 
                    aria-controls="navbarNavDropdown" 
                    aria-expanded="false" 
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav me-auto">
                        <%
                            for (Menu menu : menus) {
                                if (menu.getSubmenus() != null && !menu.getSubmenus().isEmpty()) {
                        %>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <%= menu.getNombre()%>
                            </a>
                            <ul class="dropdown-menu">
                                <%
                                    for (Menu submenu : menu.getSubmenus()) {
                                %>
                                <li>
                                    <a class="dropdown-item" href="<%= request.getContextPath() + submenu.getEnlace()%>" target="myFrame">>
                                        <%= submenu.getNombre()%>
                                    </a>

                                    <!-- Sub-submenús -->
                                    <% if (submenu.getSubmenus() != null && !submenu.getSubmenus().isEmpty()) { %>
                                    <ul class="submenu list-unstyled">
                                        <% for (Menu subsubmenu : submenu.getSubmenus()) {%>
                                        <li>
                                            <a class="dropdown-item" href="<%= request.getContextPath() + subsubmenu.getEnlace()%>" target="myFrame">
                                                <%= subsubmenu.getNombre()%>
                                            </a>
                                        </li>
                                        <% } %>
                                    </ul>
                                    <% } %>

                                </li>
                                <% } %>
                            </ul>
                        </li>
                        <%
                        } else {
                        %>
                        <li class="nav-item">
                            <a class="nav-link" href="<%= request.getContextPath() + menu.getEnlace()%>" target="myFrame">>
                                <%= menu.getNombre()%>
                            </a>
                        </li>
                        <%
                                }
                            }
                        %>
                    </ul>

                    <!-- Perfil Dropdown -->
                    <div class="dropdown">
                        <button 
                            class="btn btn-outline-light dropdown-toggle" 
                            type="button" 
                            id="dropdownMenuButton1" 
                            data-bs-toggle="dropdown" 
                            aria-expanded="false">
                            Perfil
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton1">
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <form action="LoginControlador" method="POST" style="margin: 0;">
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
            </div>
        </nav>

        <!-- Contenido Principal -->
        <div class="-4" style="height: 100%; width: 100">
            <iframe name="myFrame" style="height: 100%; width: 100%"></iframe>

        </div>

    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
