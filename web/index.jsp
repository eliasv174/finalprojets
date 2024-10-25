<%-- 
    Document   : index
    Created on : 22/10/2024, 9:48:40 a. m.
    Author     : yeymi
--%>
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
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        h1 {
            text-align: center;
            color: #555;
            font-size: 2.5em;
            margin-bottom: 20px;
        }
        nav {
            width: 100%;
            max-width: 400px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        li {
            margin-bottom: 10px;
        }
        li a {
            text-decoration: none;
            color: #333;
            padding: 12px 20px;
            display: block;
            background-color: #f0f0f0;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        li a:hover {
            background-color: #007bff;
            color: white;
            transform: translateY(-2px);
        }
        ul ul {
            margin-left: 20px;
            margin-top: 10px;
        }
        ul ul li a {
            background-color: #e9e9e9;
            font-weight: normal;
        }
        ul ul li a:hover {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>

    <div>
        <h1>Menú Principal</h1>
        <nav>
            <ul>
                <%
                    for (Menu menu : menus) {
                %>
                    <li>
                        <a href="<%= request.getContextPath() + menu.getEnlace() %>"><%= menu.getNombre() %></a>
                        <%
                            if (menu.getSubmenus() != null && !menu.getSubmenus().isEmpty()) {
                        %>
                        <ul>
                            <%
                                for (Menu submenu : menu.getSubmenus()) {
                            %>
                                <li>
                                    <a href="<%= request.getContextPath() + submenu.getEnlace() %>"><%= submenu.getNombre() %></a>
                                    <%
                                        if (submenu.getSubmenus() != null && !submenu.getSubmenus().isEmpty()) {
                                    %>
                                    <ul>
                                        <%
                                            for (Menu subsubmenu : submenu.getSubmenus()) {
                                        %>
                                            <li>
                                                <a href="<%= request.getContextPath() + subsubmenu.getEnlace() %>"><%= subsubmenu.getNombre() %></a>
                                            </li>
                                        <%
                                            }
                                        %>
                                    </ul>
                                    <%
                                        }
                                    %>
                                </li>
                            <%
                                }
                            %>
                        </ul>
                        <%
                            }
                        %>
                    </li>
                <%
                    }
                %>
            </ul>
        </nav>
    </div>

</body>
</html>
