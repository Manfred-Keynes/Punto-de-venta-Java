<%-- 
    Document   : ventasDetalle
    Created on : 16/11/2021, 12:39:23
    Author     : mfer_
--%>

<%@page import="Modelo.ventasDetalle"%>
<%@page import="Modelo.VentaDAO"%>
<%@page import="Modelo.ClienteDAO"%>
<%@page import="Modelo.Cliente"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
         <meta charset="utf-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Detalle de Ventas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    </head>
    <body>
        <h1 class="text-center mt-4">Hello World!</h1>
        
        <div class="container">
                    <!-- Modal -->
<div class="modal fade" id="modal_clientes" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Detalle de facura</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <form action="detalle_venta" method="post">
            <input type="text" id="txt_idv" name="txt_idv">
            <button name="btn_listar" value="listar" class="btn btn-primary">listar</button> 
        </form>
      <div class="modal-body">
         <table class="table table-hover">
                    
                    <thead>
                        <tr class="text-center">
                            <th>ID</th>
                            <th>id-venta</th>
                            <th>producto</th>
                            <th>nombre</th>
                            <!--th>id_PRESENTACION</th-->
                            <th>cantidad</th>
                            <th>precio</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="vdt" items="${vdetalle}">
                            <tr class="text-center">
                                <td>${vdt.id}</td>
                                <td>${vdt.idVenta}</td>
                                <td>${vdt.producto}</td>
                                <!--<td><img src="img/2.jpg" height="100" width="100"></td>-->
                                <!--td><b>"$//{p.ruta}"</b></td-->
                                <td>${vdt.cantidad}</td>
                                <td><b>${vdt.precio_unitario}</b></td>
                                <!--td><b>$//{p.id_presentacion}</b></td-->
                                <!--td>$//{pr.presentacion}</td-->
                            </tr>
                        </c:forEach>                      
                    </tbody>
                </table> 
      </div>
      
    </div>
  </div>
</div>
        <table class="table table-hover" cellspacing="0" width="100%">
                <thead>
                  <tr>
                    <th scope="col">Id Venta</th>                    
                    <th scope="col"># Factura</th>
                    <th scope="col">Serie</th>
                    <th scope="col">Fecha de Emision</th>
                    <th scope="col">Cliente</th>
                    <th scope="col">Nit</th>
                    <th scope="col">Empleado</th>
                    <th scope="col">F. Ingreso</th>
                    <th scope="col">Acciones</th>
                  </tr>
                </thead>
                <tbody id="tbl_clientes" class="text-center">
                    <%
                      ventasDetalle ventadet = new ventasDetalle();
                      DefaultTableModel tabla = new DefaultTableModel();
                      tabla = ventadet.leer();
                      for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr>");
                            out.println("<td>" + tabla.getValueAt(t, 0) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                            out.println("<td>"
                            + "<a class='btn btn-primary'  href='detalle_venta?opcion='listar'&idv=" + tabla.getValueAt(t, 0) + "' id='btn_detalle' data-bs-toggle='modal' data-bs-target='#modal_clientes' style='margin-right: 10px;'>Detalle</a>"
                            + "<button type='button' class='btn btn-danger' id='btn_eliiminar'>Eliminar</button>"
                            + "</td>");
                        out.println("</tr>");
                      }
                    %>
                  
                </tbody>
            </table>
             </div>
        <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
        <script type="text/javascript">
            
            $('#tbl_clientes').on('click','tr td',function(evt){
               var target,idv,factura,serie,fechaemi,cliente,nit,empleado,ingreso;     
               target = $(event.target);
               idv = target.parent("tr").find("td").eq(0).html();
               factura = target.parent("tr").find("td").eq(1).html();
               serie = target.parent("tr").find("td").eq(2).html();
               fechaemi = target.parent("tr").find("td").eq(3).html();
               cliente = target.parent("tr").find("td").eq(4).html();
               nit = target.parent("tr").find("td").eq(5).html();
               empleado = target.parent("tr").find("td").eq(6).html();
               ingreso = target.parent("tr").find("td").eq(7).html();
               
            $("#txt_idv").val(idv);
            $("#modal_clientes").modal('show');
            });
              
        </script>
    </body>
</html>
