<%-- 
    Document   : index
    Created on : 9/11/2021, 17:46:29
    Author     : gerar
--%>

<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="Modelo.Menu"%>
<%@page import="Modelo.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% User user = (User) session.getAttribute("loguser");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">
        <title>Reportes</title>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <div class="container-fluid">
            <ul class="navbar-nav">
                <%
                    Menu menu = new Menu();
                    DefaultTableModel tablaM = new DefaultTableModel();
                    tablaM = menu.leer();
                    for (int t = 0; t < tablaM.getRowCount(); t++) {
                        out.println("<li class='nav-item'><a class='nav-link active' aria-current='page' href='http://localhost:8081/Ventas/" + tablaM.getValueAt(t, 1) + "'>" + tablaM.getValueAt(t, 2) + "</a></li>");
                    }
                %>

            </ul> 
        </div>
        <div class="dropdown m-2">
            <!--button style=" border: none" class="btn  btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
            $//{usuario.getNom()}
            </button-->
            <button class="btn  btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                <label>Manfred keynes sirin</label>
            </button>
            <div class="dropdown-menu text-center px-2" aria-labelledby="dropdownMenuButton1">
                <a class="dropdown-item" href="#">
                    <img src="images/user.png" alt="60" width="60"/>
                </a>
                <!--a class="dropdown-item" href="#">$//{usuario.getUser()}</a-->
                <a class="dropdown-item" href="#">manfred</a>
                <a class="dropdown-item" href="#">usuaio@gmail.com</a>
                <div class="dropdown-divider"></div>
                <form action="sr_login" method="POST">
                    <button  name="btn_Salir" value="Salir" class="dropdown-item">Salir</button>
                </form>
            </div>
        </div>
    </nav>
    </head>
    <body>
        <div class="container">
        <div>
        <h1 class="text-center"><span class="bi bi-file-earmark-text"></span>Reportes</h1>
        <a href="conexion.jsp"></a>
        </div>
        <br>
        <div class="container">
        <a href="reportes/cliente_pdf.jsp" class="btn btn-danger">Generar reporte de Clientes</a>
        </div>
        <br>
        <div class="container">
        <a href="reportes/productos_pdf.jsp" class="btn btn-danger">Generar reporte de Productos</a>
        </div>
        <br>
        <div class="container">
        <a href="reportes/proveedores_pdf.jsp" class="btn btn-danger">Generar reporte de Proveedores</a>
        </div>
        <br>
        <div class="container">
        <a href="reportes/empleados_pdf.jsp" class="btn btn-danger">Generar reporte de Empleados</a>
        </div>
        <br>
        <div class="container">
        <a href="reportes/ventas_pdf.jsp"class="btn btn-danger" >Generar reporte de Ventas</a>
        </div>
        </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
