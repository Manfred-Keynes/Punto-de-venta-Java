<%-- 
    Document   : Proveedores
    Created on : 8/10/2021, 22:18:03
    Author     : Lenovo FX
--%>

<%@page import="Modelo.Menu"%>
<%@page import="Modelo.Proveedor"%>
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
<!--        <link href="css/estilos__empleados.css" rel="stylesheet" type="text/css"/>-->
        <link href="css/custom__css.css" rel="stylesheet" type="text/css"/>
        
        <title>Proveedores</title>
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
<body class="main">

    
    
    

    
    
    
    <div class="container content-tbl">
             <h1><i class="fa-solid fa-dolly"></i> Proveedores</h1>
         <div class="divider-custom1">
         <div class="divider-custom-line"></div>
        </div>
        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modal_prove" onclick="limpiar()"><i class="fa-solid fa-plus"></i>Nuevo Proveedor</button>
    <a href="reportes/proveedores_pdf.jsp" class="btn btn-danger"><i class="fa-solid fa-sheet-plastic"></i> Generar reporte</a>
            <div class="container-data mt-5">
        <table class="table table-hover table-light table-striped table-sm table-bordered">
            <thead class="table-dark text-center">
                <tr>
                    <th scope="col">#</th>                    
                    <th scope="col">Proveedor</th>
                    <th scope="col">Nit</th>
                    <th scope="col">Direccion</th>
                    <th scope="col">Teléfono</th>
                </tr>
            </thead>
            <tbody id="tbl_proveedores" class="text-center">
                <%
                    Proveedor proveedor = new Proveedor();
                    DefaultTableModel tabla = new DefaultTableModel();
                    tabla = proveedor.leer();
                    for (int t = 0; t < tabla.getRowCount(); t++) {
                        out.println("<tr data-id=" + tabla.getValueAt(t, 0) + ">");
                        out.println("<td>" + t + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                        out.println("</tr>");
                    }
                %>

            </tbody>
        </table>
    </div>
    </div>

    <div class="container">
        <!-- Modal -->
        <div class="modal fade" id="modal_prove" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-dark text-white">
                        <h5 class="modal-title" id="staticBackdropLabel">Clientes</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="sr_proveedor" method="post" class="form-group">
                            <label for="lbl_id"><b>ID</b></label>
                            <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>                
                            <label for="lbl_proveedor"><b>Nombre del Proveedor</b></label>
                            <input type="text" name="txt_proveedor" id="txt_proveedor" class="form-control" placeholder="NombreProveedor" required pattern="[A-Z]{1}[a-z]{2,9}([ ][A-Z]{1}[a-z]{2,9})?" oninvalid="this.setCustomValidity('Los nombres deben iniciar con mayúsculas')" oninput="this.setCustomValidity('')">
                            <label for="lbl_nit"><b>Nit</b></label>
                            <input type="text" name="txt_nit" id="txt_nit" class="form-control" placeholder="12345678 Ó C/F" required pattern="^([C,c]+\/?+[F,f])|[1-9][0-9]{7,8}?" oninvalid="this.setCustomValidity('Debe contener almenos 7 numeros y no debe contener letras, o en su defecto C/F.')" oninput="this.setCustomValidity('')">
                            <label for="lbl_direccion"><b>Direccion</b></label>
                            <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ej: Street123, Av. Anywhere" required>
                            <label for="lbl_telefono"><b>Telefono</b></label>
                            <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ej: 30518836" required pattern="[0-9]{5,18}" oninvalid="this.setCustomValidity('Ingrese un número de telefono sin espacios o guiones')" oninput="this.setCustomValidity('')">

                            <br>
                            <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary"><i class="fa-solid fa-plus"></i> Agregar</button>
                            <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success"><i class="fa-solid fa-pen-to-square"></i> Modificar</button>
                            <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false"><i class="fa-solid fa-trash"></i> Eliminar</button>                   
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
        function limpiar(){
            $("#txt_id").val(0);  
            $("#txt_proveedor").val(''); 
            $("#txt_nit").val('');
            $("#txt_direccion").val('');
            $("#txt_telefono").val('');
            $("#modal_prove").modal('show');
            }    
    
    $('#tbl_proveedores').on('click','tr td',function(evt){
            var target,id,proveedor,nit,direccion,telefono;
            target = $(event.target);
            id = target.parent().data('id');
            proveedor = target.parent("tr").find("td").eq(1).html();
            nit = target.parent("tr").find("td").eq(2).html();
            direccion = target.parent("tr").find("td").eq(3).html();
            telefono = target.parent("tr").find("td").eq(4).html();
            
            $("#txt_id").val(id);
            $("#txt_proveedor").val(proveedor);
            $("#txt_nit").val(nit);
            $("#txt_direccion").val(direccion);
            $("#txt_telefono").val(telefono);
            $("#modal_prove").modal('show');
        });
    </script>
    
    </body>
</html>
