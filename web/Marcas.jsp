<%-- 
    Document   : Marcas
    Created on : 8/10/2021, 23:33:33
    Author     : Lenovo FX
--%>

<%@page import="Modelo.Menu"%>
<%@page import="Modelo.Marca"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <!--estilos css-->
        <link href="css/custom__css.css" rel="stylesheet" type="text/css"/>
        <!--iconos fontawesome-->
        <script src="https://kit.fontawesome.com/ac17241314.js" crossorigin="anonymous"></script>
        <!--logo icon-->
        <link rel="icon" type="" href="img/header/bag-shopping-blue-solid.png">
        <title>Marcas</title>
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
               <h1><i class="fa-solid fa-boxes-packing"></i> Marcas</h1>
               <div class="divider-custom1">
                   <div class="divider-custom-line"></div>
               </div>
               <button id="btnNuevo-marca" type="button" class="btn btn-success btn-lg" data-toggle="modal"><i class="fa-solid fa-plus"></i> Nuevo</button>
               <div class="container-data mt-5">
                   <table class="table table-hover table-light table-sm table-striped table-bordered table-sm">
                       <thead class="table-dark text-center">
                  <tr>
                    <th scope="col">ID</th>                    
                    <th scope="col">Nombre de la marca</th>
                    <th scope="col">Fecha de Ingreso</th> 
                    <th scope="col" class='d-none'>Id_estado</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Usuario de ingreso</th>
                    <th scope="col">Acciones</th>
                  </tr>
                </thead>
                <tbody id="tbl_marcas" class="text-center">
                    <%
                      Marca marca = new Marca();
                      DefaultTableModel tabla = new DefaultTableModel();
                      tabla = marca.leer();
                      for (int t = 0; t < tabla.getRowCount(); t++) {
                        out.println("<tr data-id=" + tabla.getValueAt(t, 0) +">");
//                            out.println("<td>" + t + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 0) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td class='d-none'>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>Mfer119416</td>");
                            out.println("<td>"
                                    + "<div class='text-center'>"
                                    + "<div class='btn-group'>"
                                    + "<a href='#' class='btn btn-primary btn-editar-marca'><i class='fa-solid fa-pen-to-square'></i></a>"
                                    + "<a href='#' class='btn btn-danger btnBorrar-marca'><i class='fa-solid fa-trash'></i></a>"
                                    + "</div>"
                                    + "</td>");

                            out.println("</tr>");
                        out.println("</tr>");
                      }
                    %>
                </tbody>
            </table>
               </div>
            </div> 
       
                
        <div class="container">
        <!--Modal para CRUD-->
        <div class="modal fade" id="modalCRUD" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </button>
                    </div>
                       
                        <div class="modal-body">
                             <form action="sr_marca" method="post">
                            <div class="container mt-0">

                                <div class="divider-custom1">
                                    <div class="divider-custom-line"></div>
                                </div>
                                <div class="row">
                                    <div class="container col-4 offset-4">
                                        <label for="lbl_id" ><b>ID</b></label>
                                        <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly="">
                                    </div>
                                    <div class="container col-4">
                                        <label for="lbl_marca" ><b>Nombre de la marca</b></label>
                                        <input type="text" name="txt_marca" id="txt_marca" class="form-control" required placeholder="Nombre Marca">
                                    </div>

                                    <div class="container col-4">
                                        <label for="lbl_fecha" ><b>Fecha de ingreso</b></label>
                                        <input type="date" name="txt_fechaIngreso" id="txt_fechaIngreso" class="form-control" placeholder="MM/YY/AA">
                                    </div>
                                    <div class="container col-4">
                                        <label for="drop_estado" ><b>Estado</b></label>
                                        <select name="drop_estado" id="drop_estado" class="form-select">
                                            <option value="" disabled selected>Eliga el estado...</option>
                                            <option value="1">Activo</option>
                                            <option value="2">Inactivo</option>
                                        </select>
                                    </div>
                                    <div class="container col-4">
                                        <label for="lbl_ingreso" ><b><i class="fa-solid fa-user"></i> Usuario de ingreso</b></label>
                                        <input type="text" name="txt_ingreso" id="txt_ingreso" class="form-control" placeholder="user123" readonly="">
                                    </div>
                                </div>
                            </div>
                            <div class="container col-12 text-end pt-3">
                                <button name="btnGuardar-marca" id="btnGuardar-marca"  class="btn btn-primary">Aceptar</button>
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                            </div>
                    </form>    
                </div>
            </div>
        </div> 
    </div>
</div>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>

