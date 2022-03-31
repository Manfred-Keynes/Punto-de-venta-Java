<%@page import="Modelo.Menu"%>
<%@page import="Modelo.Marca"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Producto"%>
<%@page import="java.util.HashMap"%>
<%@page import="Modelo.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!--iconos fontawesome-->
        <script src="https://kit.fontawesome.com/ac17241314.js" crossorigin="anonymous"></script>
         <!--estilos css-->    
        <link href="css/custom__css.css" rel="stylesheet" type="text/css"/>
        <!--logo icon-->
        <link rel="icon" type="" href="img/header/bag-shopping-blue-solid.png">
        <title>Productos</title>
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
        
    </head>
    <body class="main">
       <div class="container content-tbl">
           

            
           
           
           
          <h1><i class="fa-solid fa-box-open"></i> Productos</h1>
         <div class="divider-custom1">
         <div class="divider-custom-line"></div>
        </div>
        <button type="button"  class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal_productos" onclick="limpiar()"><i class="fa-solid fa-plus"></i> Nuevo Producto</button>
        <a class="btn btn-success btn-lg" href="sr_productos?accion=Listar"><i class="fa-solid fa-rotate-right"></i> Refrescar</a>
        <a href="reportes/productos_pdf.jsp" class="btn btn-dark btn-lg"><i class="fa-solid fa-sheet-plastic"></i> Generar reporte</a>
           
           
           
           
            <div class="container-data mt-5">
                <table class="table table-hover table-light table-striped  table-bordered text-center">
                    <thead class="table-dark">
                        
                                <tr class="text-center">
                                    <!--th>#</th-->
                                    <th>NOMBRE</th>
                                    <th>MARCA</th>
                                    <th>DESCRIPCION</th>
                                    <th>IMAGEN</th>
                                    <th>COSTO</th>
                                    <th>PRECIO</th>
                                    <th>EXISTENCIA</th>
                                    <!--th>FECHA DE INGRESO</th-->
                                </tr>
                       
                    </thead>
                            <tbody  id="tbl_productos" class="text-center font-weight-bold">
                                <tr >
                                    <%
                                        Producto producto = new Producto();
                                        DefaultTableModel tabla = new DefaultTableModel();
                                        tabla = producto.leer();
                                        for (int t = 0; t < tabla.getRowCount(); t++) {
                                            out.println("<tr data-id=" + tabla.getValueAt(t, 0) + " data-id_m=" + tabla.getValueAt(t, 9) + ">");
                                            //out.println("<td>" + t + "</td>");
                                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                                            out.println("<td><img src=" + tabla.getValueAt(t, 4) + " height='100' width='100' ></td>");
                                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                                            out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                                            //out.println("<td>" + tabla.getValueAt(t, 8) + "</td>");
                                            out.println("</tr>");
                                        }
                                    %>
                                </tr>                              
                        </tbody>        
                    </table> 
            </div>
                </div>
                                
            <!-- Modal -->
           <div id="modal_productos" class="modal fade" role="dialog">
               <div class="modal-dialog modal-lg">

                   <!-- Modal content-->
                   <div class="modal-content">

                       <div class="modal-body">
                           <form action="sr_productos?accion=Guardar" id="form_productos" class="form-group" method="POST" enctype="multipart/form-data">
                               <label>Id</label>
                               <input type="text" name="txt_id" id="txt_id" value="0" readonly class="form-control"  >

                               <label>Nombre del Producto</label>
                               <input type="text" name="txt_nombre" id="txt_nombre" value="" class="form-control" >

                               <label>Marca</label>
                               <select name="drop_marcas" id="drop_marcas"class="form-control" >
                                   <option value="0" disabled selected>--Seleccione--</option>
                                   <%
                                       Marca marca = new Marca();
                                       HashMap<String, String> drop = marca.drop_sangre();
                                       for (String i : drop.keySet()) {
                                           out.println(" <option value='" + i + "'>" + drop.get(i) + "</option>");
                                       }
                                   %>
                               </select>

                               <label>Descripcion</label>
                               <input type="text" name="txt_descripcion" id="txt_descripcion" value="" class="form-control">

                               <label>Costo</label>
                               <input type="number" name="txt_costo" id="txt_costo" value="" class="form-control" >

                               <label>Precio</label>
                               <input type="number" name="txt_precio" id="txt_precio" value="" class="form-control" >

                               <label>Existencia</label>
                               <input type="number" name="txt_existencia" id="txt_existencia" value="" class="form-control" >
                               <div class="mb-3">
                                   <label class="form-label"><b>Selecciona una imagen del producto.</b></label>

                                   <input type="file" class="form-control py-2 bg-light" name="fileImagen" id="fileImagen" >
                               </div>
                               <button class="btn btn-primary" name="accion" value="Guardar"><i class="fa-solid fa-floppy-disk"></i> Guardar</button>
                               <button class="btn btn-secondary" name="accion" value="Actualizar"><i class="fa-solid fa-pen-to-square"></i> Actualizar</button>
                               <button  value="eliminar"class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar el registro?'))return false"><i class="fa-solid fa-trash"></i> Eliminar</button>
                               <button type="button" class="btn btn-dark" data-dismiss="modal"><i class="fa-solid fa-xmark"></i> Cancelar</button>
                           </form>
                       </div>
                   </div>
              </div>
            </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script type="text/javascript">
            
            function limpiar(){
            $("#txt_id").val(0);
            $("#drop_marcas").val(0); 
            $("#txt_nombre").val('');
            $("#txt_descripcion").val('');
            $("#txt_costo").val(0.00); 
            $("#txt_precio").val(0.00);
            $("#txt_existencia").val(0);
            }
            $('#tbl_productos').on('click','tr td',function(evt){
               var target,id,id_m,nombre,descripcion,costo,precio,existencia;     
               target = $(event.target);
               id = target.parent().data('id');
               id_m = target.parent().data('id_m');
               nombre = target.parent("tr").find("td").eq(0).html();
               descripcion = target.parent("tr").find("td").eq(2).html();
               costo = target.parent("tr").find("td").eq(4).html(); 
               precio = target.parent("tr").find("td").eq(5).html();
               existencia = target.parent("tr").find("td").eq(6).html();
               
            $("#txt_id").val(id);
            $("#drop_marcas").val(id_m); 
            $("#txt_nombre").val(nombre);
            $("#txt_descripcion").val(descripcion);
            $("#txt_costo").val(costo); 
            $("#txt_precio").val(precio);
            $("#txt_existencia").val(existencia);
            $("#modal_productos").modal('show');
            });
            
            
        </script>
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>