<%-- 
    Document   : RegistrarVenta
    Created on : 2/11/2021, 21:41:33
    Author     : mfer_
--%>

<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="Modelo.Menu"%>
<%@page import="Modelo.VentaDAO"%>
<%@page import="Modelo.Generar_numfact"%>
<%@page import="Modelo.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% User user = (User) session.getAttribute("loguser");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
%>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="css/estilos__flex.css" rel="stylesheet" type="text/css" />
  <!-- icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">
  <!--iconos fontawesome-->
  <script src="https://kit.fontawesome.com/ac17241314.js" crossorigin="anonymous"></script>
  <!--logo icon-->
  <link rel="icon" type="" href="img/header/bag-shopping-blue-solid.png">
  <title>Ventas</title>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">>
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
  <section class="entrada-datos">
    <!--incio modal-->
    <!-- Button trigger modal -->

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <!-- <div class="modal fade" id="staticBackdrop"  tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true"></div> -->
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header bg-dark">
            <div class="container py-3 my-0">
              <div class="row">
                <div class="container col-6">
                  <h4 class="text-white page-section">Informacion del Cliente</h4>
                </div>
                <div class="container col-6 text-end pt-3">
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <!-- Icon Divider-->

              </div>
            </div>
          </div>
          <div class="modal-body">
            <!-- Modal body-->
            <form action="sr_ventas?menu=NuevaVenta" method="POST">
              <div class=" row d-flex px-3">
                <!--buscar con nit cliente-->
                <div class="  container  offset-4 col-8 my-1">
                  <div class="row">
                    <label><b>Numero de nit:</b></label>
                    <div class="container col-10 ">
                      <input type="text" name="codigocliente" value="${c.getNit()}" class=" form-control  mx-0 "
                        placeholder="00000001">
                    </div>
                    <div class="container col-2  text-start">
<!--                      <input type="submit" name="accion" value="Buscar Cliente" class="btn btn-dark mx-0">-->
                      <button type="submit" name="accion" value="Buscar Cliente" class="btn btn-primary ">Buscar</button>
                    </div>
                  </div>
                </div>
                <!--data del cliente-->
                <div class="container  col-12 col-md-4 my-1">
                  <label><b>Nombres:</b></label>
                  <input type="text" name="nombrescliente" value="${c.getNombres()}" placeholder="Nombres" class="py-1 px-2 form-control"
                    Readonly="">
                </div>
                <div class="container  col-12 col-md-4 my-1">
                  <label><b>Apellidos:</b></label>
                  <input type="text" name="nombrescliente" value="${c.getApellidos()}" placeholder="Apellidos" class="py-1 px-2 form-control" Readonly="">
                </div>
                <div class="container  col-12 col-md-4 my-1">
                  <label><b>Telefono:</b></label>
                  <input type="text" name="telefono" value="${c.getTelefono()}" placeholder="+502" class="py-1 px-2 form-control"
                    Readonly="">
                </div>
                <!--extras-->
                <div class="container  col-12 col-md-8 my-1">
                  <label><b>Direccion:</b></label>
                  <input type="text" name="direccion" value="" placeholder="3ra. Calle 5av. 7-5 algun lugar"
                    class="py-1 px-2 form-control" Readonly="">
                </div>
                <div class="container  col-12 col-md-4 my-1">
                  <label><b>Correo Electronico:</b></label>
                  <input type="text" name="correo" value="${c.getCorreo()}" placeholder="algien@example.com"
                    class="py-1 px-2 form-control" Readonly="">
                </div>
                <!--end data cliente-->
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fa-solid fa-xmark"></i>Close</button>
            <button type="button" class="btn btn-primary" data-bs-dismiss="modal"><i class="fa-solid fa-check"></i>Save changes</button>
<!--            <button type="button" class="btn btn-primary"><i class="fa-solid fa-check"></i> Save changes</button>-->
          </div>
        </div>
      </div>
    </div>
    <!--inicio del codigo-->
    <form action="sr_ventas?menu=NuevaVenta" method="POST">
      <!-- <div class="container-head">
        <h2 class="text-center">Nueva venta</h2>
      </div> -->
      <div class="container  info-cliente mt-2 pt-1">
        <h4 class="text-dark page-section">Producto</h4>

        <div class="divider-custom1">
          <div class="divider-custom-line"></div>
        </div>
        <div class="row d-flex">
          <div class="container my-1">
            <div class="row">
              <div class="container col-3 text-start">
                <button type="button" class="btn btn-primary btn-lg " data-bs-toggle="modal" data-bs-target="#exampleModal">Datos del cliente</button>
              </div>
              <!--container buscar producto-->
              <div class="container col-6 offset-3">
                <label><b>Codigo del producto:</b></label>
                <div class=" d-flex ">
                  <div class=" flex-grow-1">
                    <input type="text" name="codigoproducto" value="${producto.getId()}" class=" form-control  mx-0 " placeholder="000000001">
                  </div>
                  <div class=" justify-content-end ">
                    <button type="submit" name="accion" value="BuscarProducto" class="btn btn-dark mx-0">Buscar</button>
                  </div>
                </div>
              </div>
              <!--end container buscar producto-->
            </div>
          </div>
          <div class="container  col-12 col-md-3 my-1">
            <label><b>Nombre del producto</b></label>
            <input type="text" name="nomproducto" value="${producto.getProducto()}" placeholder="Nombre del producto" class="py-1 px-2 form-control" Readonly="">
          </div>
          <div class="container  col-12 col-md-3 my-1">
            <label><b>Precio</b></label>
            <input type="text" name="precio" value="${producto.getPrecioVenta()}" placeholder="Q 0.00" class="py-1 px-2 form-control" Readonly="">
          </div>
          <div class="container  col-12 col-md-3 my-1">
            <label><b>Cantidad:</b></label>
            <input type="text" name="cant" value="1" class="py-1 px-2 form-control">
          </div>
          <div class="container  col-12 col-md-3 my-1">
            <label><b>Existencia</b></label>
            <input type="text" name="stock" value="${producto.getExistencia()}" placeholder="0" class="py-1 px-2 form-control" Readonly="">
          </div>
          <!--boton-->
          <div class="container  col-12 text-end my-1">
            <button type="submit" name="accion" value="Agregar" class="btn btn-primary"><span class="bi bi-cart-plus"></span> Agregar Producto</button>
          </div>
        </div>
        <div class="row d-flex">
          <div class="  container col-12  my-1">
            <div class="row">
              <%
                //GENERAR NUMERO DE FACTURA
                    VentaDAO vdao = new VentaDAO();
                    String numerofactura = vdao.GenerarSerie();
                    if (numerofactura == null) {
                        numerofactura = "00000001";
                        request.setAttribute("nfactura", numerofactura);
                    } else {
                        int incrementar = Integer.parseInt(numerofactura);
                        Generar_numfact gnf = new Generar_numfact();
                        numerofactura = gnf.NumeroFactura(incrementar);
                        request.setAttribute("nfactura", numerofactura);
                    }
              %>
              <div class="container col-4 offset-4  ">
                <label><b>Numero de Factura:</b></label>
                <input type="text" name="Nserie" value="${nfactura}" class=" form-control  mx-0 " placeholder="00000001" Readonly="">
              </div>
              <div class="container col-4  ">
                <label><b>Fecha:</b></label>
                <input type="date" id="fecha" name="fecha" class="form-control mx-0" Readonly="">
              </div>
            </div>
          </div>
          <div class="card col-12 my-1">
            <div class="card-body">
              <table class="table table-hover " cellspacing="0" width="100%">
                <thead>
                  <tr class="text-center">
                    <th>No.</th>
                    <th>CODIGO</th>
                    <th>DESCRIPCION</th>
                    <th>PRECIO</th>
                    <th>CANTIDAD</th>
                    <th>SUB-TOTAL</th>
                    <th>ACCIONES</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="list" items="${lista}">
                    <tr class="text-center">
                      <td>${list.getItem()}</td>
                      <td>${list.getIdproducto()}</td>
                      <td>${list.getDescripcionp()}</td>
                      <td>${list.getPrecio_unitario()}</td>
                      <td>${list.getCantidad()}</td>
                      <td>${list.getSubtotal()}</td>
                      <td class="">
                        <a href="sr_ventas?menu=NuevaVenta&accion=Delete&idp=${list.getIdproducto()}" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar el registro?'))return false"><i class="fa-solid fa-trash-can"></i></a>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
            <div class="card-footer d-flex justify-content-around">
              <div class="container text-end">
                <input type="text" name="txtTotal" value="Q/. ${totalpagar}0" class="form-control" Readonly="">
              </div>
              <div class="container text-end">
                <a href="sr_ventas?menu=NuevaVenta&accion=GenerarVenta&useremp=${usuario.getUser()}" class="btn btn-success"><i class="fa-solid fa-cart-shopping"></i> Generar
                  Venta</a>
                <a href="sr_ventas?menu=NuevaVenta&accion=cancelarfactura" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar el la factura?'))return false"><i class="fa-solid fa-xmark"></i> Cancelar Venta</a>
              </div>
            </div>
          </div>

        </div>

      </div>

      <!--tabla-->
      </div>
    </form>
  </section>
  <!-- Optional JavaScript; choose one of the two! -->

  <!-- Option 2: Separate Popper and Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
  <script>
    $(document).ready(function () {
      $('#exampleModal').modal('show');
    }); 

    $( document ).ready(function() {
            var now = new Date();
            var day = ("0" + now.getDate()).slice(-2);
            var month = ("0" + (now.getMonth() + 1)).slice(-2);
            var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
            $("#fecha").val(today);
        });
  </script>
</body>

</html>