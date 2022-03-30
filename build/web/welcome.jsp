<%-- 
    Document   : index
    Created on : 28/09/2021, 22:11:28
    Author     : Lenovo FX
--%>
<%@page import="Modelo.Menu"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="Modelo.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% User user = (User) session.getAttribute("loguser");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="" href="img/header/marketpv.ico">
          <!--iconos lineicons-->
          <link href="https://cdn.lineicons.com/3.0/lineicons.css" rel="stylesheet">
          <!--iconos fontawesome-->
          <script src="https://kit.fontawesome.com/ac17241314.js" crossorigin="anonymous"></script>
          <link href="css/estilos.css" rel="stylesheet" type="text/css" />
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark justify-content-end">
<!--        <div class="container-fluid">
            <ul class="navbar-nav">
            </ul> 
        </div>-->
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
<body class="main">
      <!--seccion directorio-->
  <section class="directorio-section" id="tecnologia">
    <div class="container">
      <!-- <h1 class="display-4 font-weight-bold text-center py-4 mb-5" id="tecnologias-titulo">Tecnologias que manejo</h1> -->
      <!-- Portfolio Section Heading-->
      <h1 class="page-section-heading text-center display-5 font-weight-bold text-white">Bienvenido <b class="text-warning">Manfred</b></h1>
      <!-- Icon Divider-->
      <div class="divider-custom1">
        <div class="divider-custom-line"></div>
<!--        <div class="divider-custom-icon"><i class="fa-solid fa-laptop-code"></i></div>-->
<!--        <div class="divider-custom-line"></div>-->
      </div>
      <!-- technology boxes -->
      <div class="container__box">
          <a href="Productos.jsp">
              <div class="box bx-1">
                  <i class="fa-solid fa-box"></i>
                  <h5 class="font-weight-bold">Administrar Productos</h5>
                  <h4 class="font-weight-bold">Administrar Productos</h4>
              </div>
          </a>
          <a href="Puestos.jsp">
              <div class="box bx-2">
                  <i class="fa-solid fa-user-gear"></i>
                  <h5 class="font-weight-bold">Administrar Roles</h5>
                  <h4 class="font-weight-bold">Administrar Roles</h4>
              </div>
          </a>
          <a href="Proveedores.jsp">
              <div class="box bx-3">
                  <i class="fa-solid fa-dolly"></i>
                  <h5 class="font-weight-bold">Proveedores</h5>
                  <h4 class="font-weight-bold">Proveedores</h4>
              </div>
          </a>
          <a href="Marcas.jsp">
              <div class="box bx-4">
                  <i class="fa-solid fa-receipt"></i>
                  <h5 class="font-weight-bold">Marcas</h5>
                  <h4 class="font-weight-bold">Marcas</h4>
              </div>
          </a>
          <a href="Clientes.jsp">
              <div class="box bx-5">
                  <i class="fa-solid fa-people-group"></i>
                  <h5 class="font-weight-bold">Clientes</h5>
                  <h4 class="font-weight-bold">Clientes</h4>
              </div>
          </a>
          <a href="RegistrarVenta.jsp">
              <div class="box bx-6">
                  <i class="fa-solid fa-cart-shopping"></i>
                  <h5 class="font-weight-bold">Ventas</h5>
                  <h4 class="font-weight-bold">Ventas</h4>
              </div>
          </a>
<!--          <a href="Puestos.jsp">
              <div class="box bx-7">
                  <i class="fa-solid fa-user-tie"></i>
                  <h5 class="font-weight-bold">Puestos</h5>
                  <h4 class="font-weight-bold">Puestos</h4>
              </div>
          </a>-->
          <a href="Reportes.jsp">
              <div class="box bx-7">
                  <i class="fa-solid fa-chart-line"></i>
                  <h5 class="font-weight-bold">Reportes</h5>
                  <h4 class="font-weight-bold">Reportes</h4>
              </div>
          </a>
          <a href="Productos.jsp">
        <div class="box bx-9">
          <i class="fa-solid fa-magnifying-glass"></i>
          <h5 class="font-weight-bold">Ver existencias</h5>
          <h4 class="font-weight-bold">Ver existencias</h4>
        </div>
         </a>
<!--          <a href="RegistrarVenta.jsp">
              <div class="box bx-6">
                  <i class="fa-solid fa-door-open"></i>
                  <h5 class="font-weight-bold">Salir del sistema</h5>
                  <h4 class="font-weight-bold">Salir del sistema</h4>
              </div>
          </a> -->
    </div>
      <!--end technology boxes-->
   </div>
  </section>
    
    
</body>
</html>
