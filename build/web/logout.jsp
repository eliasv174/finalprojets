<%-- 
    Document   : logout
    Created on : 23/10/2024, 10:16:08 a. m.
    Author     : yeymi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Invalida la sesión actual sin declarar la variable 'session' nuevamente
    if (session != null) {
        session.invalidate();  // Cierra la sesión
    }
    // Redirige al login después de cerrar sesión
    response.sendRedirect("login.jsp");
%>
