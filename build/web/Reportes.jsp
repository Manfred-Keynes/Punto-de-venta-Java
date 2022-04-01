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
        <!--Bootstrap CSS-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!--iconos fontawesome-->
        <script src="https://kit.fontawesome.com/ac17241314.js" crossorigin="anonymous"></script>
        <!--Estilos CSS-->
        <link href="css/custom__css.css" rel="stylesheet" type="text/css"/>
        <!--logo icon-->
        <link rel="icon" type="" href="img/header/bag-shopping-blue-solid.png">
        <title>Reportes</title>
    <section class="fondo-navbar">
    <nav class="navbar navbar-dark  navbar-expand-md fixed-top" id="mainNav">
      <div class="container">
        <a href="#" class="navbar-brand">
           <img src="img/header/terminal-solid_blue.ico" alt="logo">
            <span class="nombre-logo  font-weight-bold" href="welcome.jsp"><span class="text-primary"><b>Blues</b></span> Sytem
        </a>
        <!--Boton Collapse-->
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarResponsive"
          aria-controls="menu-principal" aria-expanded="false" aria-label="Desplegar menu de navegacion">
          <!--span class="navbar-toggler-icon"></span-->
          <span class="text-white">Menu</span>
          <!-- <i class="fas fa-bars"></i> -->
        </button>
        <!--collapse-->
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <!--margin left auto -->
          <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a href="welcome.jsp"
                class="nav-link py-2 px-0 px-md-3 px-lg-3 active font-weight-bold text-center rounded"><i class="fa-solid fa-house"></i></a></li>
                <li class="nav-item"><a href="Empleados.jsp"
                class="nav-link py-2 px-0 px-md-3 px-lg-3 font-weight-bold text-center rounded">Empleados</a></li>
            <li class="nav-item"><a href="Clientes.jsp"
                class="nav-link py-2 px-0 px-md-3 px-lg-3 font-weight-bold text-center rounded">Clientes</a></li>
            <li class="nav-item"><a href="Proveedores.jsp"
                class="nav-link py-2 px-0 px-md-3 px-lg-3 font-weight-bold text-center rounded">Proveedores <i class="fa-solid fa-dolly"></i></a></li>
            <li class="nav-item"><a href="Puestos.jsp"
                class="nav-link py-2 px-0 px-md-3 px-lg-3 font-weight-bold text-center rounded">Puestos <i class="fa-solid fa-user-tie"></i></a></li>
            <li class="nav-item"><a href="Marcas.jsp"
                class="nav-link py-2 px-0 px-md-3 px-lg-3 font-weight-bold text-center rounded">Marcas <i class="fa-solid fa-boxes-packing"></i></a></li>
            <li class="nav-item"><a href="Productos.jsp"
                class="nav-link py-2 px-0 px-md-3 px-lg-3 font-weight-bold text-center rounded">Productos <i class="fa-solid fa-box-open"></i></a></li>
            <li class="nav-item"><a href="RegistrarVenta.jsp"
                class="nav-link py-2 px-0 px-md-3 px-lg-3 font-weight-bold text-center rounded">Ventas <i class="fa-solid fa-bag-shopping"></i></a></li>
            <li class="nav-item"><a href="Reportes.jsp"
                class="nav-link py-2 px-0 px-md-3 px-lg-3 font-weight-bold text-center rounded">Reportes <i class="fa-solid fa-sheet-plastic"></i></a></li>
          </ul>
        </div>
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
  </section>
</head>
<body>
    <div class="container content-tbl">
        <h1><i class="fa-solid fa-rocket"></i> Reportes por categoria</h1>
        <div class="divider-custom1">
            <div class="divider-custom-line"></div>
        </div>
        <!-- comment -->
        <div class="container pt-5 pb-0">
            <div class="body__page">
                <div class="container__card">
                    <div class="card c1">
                        <div class="icon">
                            <i class="fa-solid fa-box-open"></i>
                        </div>
                        <div class="info__description">
                            <p>Aui puede consultar de forma resumida los productos ingresados al sistema</p>
                            <a href="reportes/productos_pdf.jsp" class="btn btn-danger">Generar un reporte de Productos</a>
                        </div>
                    </div>
                    <div class="card c2">
                        <div class="icon">
                            <i class="fa-solid fa-dolly"></i>
                        </div>
                        <div class="info__description">
                            <p>Aui puede consultar de forma resumida los proveedores ingresados al sistema</p>
                            <a href="reportes/proveedores_pdf.jsp" class="btn btn-danger">Generar un reporte de Proveedores</a>
                        </div>
                    </div>
                    <div class="card c3">
                        <div class="icon">
                            <i class="fa-solid fa-bag-shopping"></i>
                        </div>
                        <div class="info__description">
                            <p>Aui puede consultar de forma resumida las ventas realizadas</p>
                            <a href="reportes/productos_pdf.jsp" class="btn btn-danger">Generar un reporte de ventas</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="js/main.js" type="text/javascript"></script>
</body>
</html>