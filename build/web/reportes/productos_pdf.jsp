<%-- 
    Document   : productos
    Created on : 9/11/2021, 18:40:30
    Author     : gerar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>


<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>

<%@page import="javax.servlet.ServletResponse"%>
<%@include file = "../conexion.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            File reportfile= new File (application.getRealPath("reportes/productos.jasper")); //direccion al archivo jasper 
            Map<String, Object> parameter = new HashMap<String, Object>();

            byte[] bytes =  JasperRunManager.runReportToPdf(reportfile.getPath(), parameter,con);

            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outputstream = response.getOutputStream();
            outputstream.write(bytes,0,bytes.length);

            outputstream.flush();
            outputstream.close();
        %>
    </body>
</html>
