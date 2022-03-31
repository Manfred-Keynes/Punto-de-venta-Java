<%-- 
Document   : Empleados
Created on : 28/09/2021, 22:19:06
Author     : Lenovo FX
--%>

<%@page import="Modelo.Menu"%>
<%@page import="Modelo.Cliente"%>
<%@page import="Modelo.ClienteDAO"%>
<%@page import="java.util.HashMap"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <!--iconos fontawesome-->
        <script src="https://kit.fontawesome.com/ac17241314.js" crossorigin="anonymous"></script>
        <!--Estilos css-->
        <link href="css/custom__css.css" rel="stylesheet" type="text/css"/>
        <!--logo icon-->
        <link rel="icon" type="" href="img/header/bag-shopping-blue-solid.png">
        <title>Clientes</title>
  <section class="fondo-navbar">
    <nav class="navbar navbar-dark  navbar-expand-md fixed-top" id="mainNav">
      <div class="container">
        <a href="#" class="navbar-brand">
            <img src="img/header/bag-shoppingMain.ico" alt="logo">
          <span class="nombre-logo  font-weight-bold" href="welcome.jsp">Manfred Sirin</span>
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
<body class="main">



    <div class="container content-tbl">
        <h1><i class="fa-solid fa-user-pen"></i> Clientes</h1>
         <div class="divider-custom1">
         <div class="divider-custom-line"></div>
        </div>
        <button type="button" class="btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#modal_clientes" onclick="limpiar()" ><i class="fa-solid fa-plus"></i> Nuevo Cliente</button> 
        <a href="reportes/cliente_pdf.jsp" class="btn btn-danger btn-lg"><i class="fa-solid fa-sheet-plastic"></i> Generar reporte</a>
        <div  class="container-data mt-5">
            <table class="table table-hover table-light table-striped table-sm table-bordered text-center">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">#</th>                    
                        <th scope="col">Nombres</th>
                        <th scope="col">Apellidos</th>
                        <th scope="col">Nit</th>
                        <th scope="col">Género</th>
                        <th scope="col">Teléfono</th>
                        <th scope="col">Email</th>
                        <th scope="col">F. Ingreso</th>
                    </tr>
                </thead>
                <tbody id="tbl_clientes" class="text-center">
                    <%
                        Cliente cliente = new ClienteDAO();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = cliente.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-gen=" + tabla.getValueAt(t, 4) + " data-id=" + tabla.getValueAt(t, 0) + ">");
                            out.println("<td>" + t + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                            out.println("</tr>");
                        }
                    %>

                </tbody>
            </table>
        </div>
    </div>
    <div class="container">
        <!-- Modal -->
        <div class="modal fade" id="modal_clientes" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-dark">
                        <h5 class="modal-title text-white" id="staticBackdropLabel">Clientes</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="sr_cliente" method="post" class="form-group">
                            <label for="lbl_id"><b>ID</b></label>
                            <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>                
                            <label for="lbl_nombres"><b>Nombres</b></label>
                            <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Nombre1 Nombre2" required="">
                            <label for="lbl_apellidos"><b>Apellido</b></label>
                            <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Apellido1 Apellido2" required="">
                            <label for="lbl_nit"><b>Nit</b></label>
                            <input type="text" name="txt_nit" id="txt_nit" class="form-control" placeholder="Ej: 12345678 ó C/F" maxlength="8" minlength="3" required pattern="^([C,c]+\/?+[F,f])|[1-9][0-9]{7,8}?" oninvalid="this.setCustomValidity('Debe contener almenos 7 numeros y no debe contener letras, o en su defecto C/F.')" oninput="this.setCustomValidity('')">

                            <label for="lbl_genero"><b>Género</b></label>
                            <select name="drop_genero" id="drop_genero" class="form-select" required oninvalid="this.setCustomValidity('Selecciona un género porfavor.')" oninput="this.setCustomValidity('')">
                                <option value="" disabled selected>Elija su genero...</option>
                                <option value="0">Femenino</option>
                                <option value="1">Masculino</option>
                            </select>
                            <label for="lbl_telefono"><b>Telefono</b></label>
                            <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ej: 30518836" required>
                            <label for="lbl_email"><b>Email</b></label>
                            <input type="email" name="txt_email" id="txt_email" class="form-control" placeholder="Ej: user@gmail.com" required pattern="^[^@]+@[^@]+\.[a-zA-Z]{2,3}$">
                            <label for="lbl_fi"><b>F. Ingreso</b></label>
                            <input type="text" name="txt_fi" id="txt_fi" class="form-control" placeholder="YYYY-MM-DD" readonly>
                            <br>
                            <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary"><i class="fa-solid fa-plus"></i> Agregar</button>
                            <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success"><i class="fa-solid fa-pen-to-square"></i> Modificar</button>
                            <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                        return false"><i class="fa-solid fa-trash"></i> Eliminar</button>                   
                        </form>
                    </div>

                </div>
            </div>
        </div>  
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function limpiar() {
            $("#txt_id").val(0);
            $("#txt_nombres").val('');
            $("#txt_apellidos").val('');
            $("#txt_nit").val('');
            $("#drop_genero").val(0);
            $("#txt_telefono").val('');
            $("#txt_email").val('');
            $("#txt_fi").val('');
            $("#modal_clientes").modal('show');
        }

        $('#tbl_clientes').on('click', 'tr td', function (evt) {
            var target, id, nombres, apellidos, nit, genero, telefono, correo, Fingreso;
            target = $(event.target);
            id = target.parent().data('id');
            genero = target.parent().data('gen');
            nombres = target.parent("tr").find("td").eq(1).html();
            apellidos = target.parent("tr").find("td").eq(2).html();
            nit = target.parent("tr").find("td").eq(3).html();
            telefono = target.parent("tr").find("td").eq(5).html();
            correo = target.parent("tr").find("td").eq(6).html();
            Fingreso = target.parent("tr").find("td").eq(7).html();




            $("#txt_id").val(id);
            $("#txt_nombres").val(nombres);
            $("#txt_apellidos").val(apellidos);
            $("#txt_nit").val(nit);
            $("#txt_telefono").val(telefono);

            //valida el genero para insertar dentro del drop
            if (genero === "M") {
                $("#drop_genero").val('1');
            }
            if (genero === "F") {
                $("#drop_genero").val('0');
            }
            $("#txt_email").val(correo);
            $("#txt_fi").val(Fingreso);
            $("#modal_clientes").modal('show');

        });
    </script>
    <script src="js/main.js" type="text/javascript"></script>

</body>
</html>
