<%-- 
    Document   : logout
    Created on : 23/10/2024, 10:16:08 a. m.
    Author     : yeymi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   
    if (session != null) {
        session.invalidate();  
    }
    
    response.sendRedirect("login.jsp");
%>
