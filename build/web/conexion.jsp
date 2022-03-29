<%-- 
    Document   : conexion
    Created on : 9/11/2021, 17:48:55
    Author     : gerar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Modelo.User"%>
<% User user = (User) session.getAttribute("loguser");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            Connection con = null;
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto2_db","root","515919");
                out.println("Conexion en linea");
            }
            catch(Exception ex){
                out.print("Error: " + ex.getMessage());
            }
        %>
        
    </body>
</html>


