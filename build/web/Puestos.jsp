<%-- 
    Document   : Puestos
    Created on : 8/10/2021, 23:03:09
    Author     : Lenovo FX
--%>

<%@page import="Modelo.Menu"%>
<%@page import="Modelo.Puesto"%>
<%@page import="Modelo.Departamento"%>
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
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!--iconos fontawesome-->
        <script src="https://kit.fontawesome.com/ac17241314.js" crossorigin="anonymous"></script>
        <!--Estilos css-->
        <link href="css/estilos__empleados.css" rel="stylesheet" type="text/css"/>
        <title>Puestos DB</title>
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
<!--    <section class="quien-soy" id="home">-->
        <div class="container">
<!--            <div class="row">-->
               
                <!--imagen desarrollador-->
<!--                <div class=" img-cool">
                    <div class="container mr-5">
                        <img src="images/undraw_team.svg" alt="Soy el desarrollador" class="img-fluid mb-4">
                    </div>           
                </div>-->
                
                <div class="  px-5 bg-light rounded py-5">
<!--                    <div class="container">
                        <h1 class="text-center text-dark display-5 font-weight-bold mb-5">Mantenimiento de Puestos</h1>
                        <form action="sr_puesto" method="post" class="form-group">
                            <label for="lbl_id" class="text-dark"><b>ID</b></label>
                            <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>    

                            <label for="lbl_puesto" class="text-dark"><b>Nombre del Puesto</b></label>
                            <input type="text" name="txt_puesto" id="txt_puesto" class="form-control" placeholder="NombrePuesto">

                            <label for="lbl_departamento" ><b>Departamento</b></label>
                                <select name="drop_departamento" id="drop_departamento" class="form-select">
                                    
                                   
                                </select>

                            <label for="lbl_fechaIngreso" ><b>Fecha de ingreso</b></label>
                            <input type="text" name="txt_fechaIngreso" id="txt_fechaIngreso" class="form-control" value="" placeholder="22/02/2022">

                            <label for="lbl_estado" ><b>Estado</b></label>
                            <input type="text" name="txt_estado" id="txt_estado" class="form-control" placeholder="activate">

                            <div class="pt-2 text-end">
                                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar</button>
                                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
                                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if (!confirm('¿Desea Eliminar?'))return false">Eliminar</button> 
                            </div>                  
                        </form>
                    </div>-->

                   
                    <div class="container">
                        <table class="table table-hover table-light table-sm table-striped table-bordered" >
                            <thead class="table-dark text-center">
                                <tr>
                                    <th scope="col">ID</th>                    
                                    <th scope="col">Puesto</th>
                                    
                                    <th scope="col">Departamento</th>
                                    <th scope="col" class="d-none">id_departamento</th>
                                    <th scope="col">Fecha Ingreso</th>
                                    <th scope="col">Estado</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                            </thead>
                            <tbody id="tbl_puestos" class="text-center">
                                <%
                                    Puesto puesto = new Puesto();
                                    DefaultTableModel tabla = new DefaultTableModel();
                                    tabla = puesto.leer();
                                    for (int t = 0; t < tabla.getRowCount(); t++) {
                                        out.println("<tr data-id=" + tabla.getValueAt(t, 0) + ">");
//                                        out.println("<td>" + t + "</td>");
                                        out.println("<td>" + tabla.getValueAt(t, 0) + "</td>");
                                        out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                                        out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                                        out.println("<td class='d-none'>" + tabla.getValueAt(t, 3) + "</td>");
                                        out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                                        out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                                        out.println("<td>"
                                        + "<div class='text-center'>"
                                            + "<div class='btn-group'>"
                                            + "<a href='#' <a href='#' class='btn btn-primary btn-editar'>Editar</a>"
                                            + "<a href='#' <a href='#' class='btn btn-danger btn-eliminar'>Eliminar</a>"
                                            + "</div>"
                                        + "</td>");
                                        
                                        out.println("</tr>");
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>                       
<!--            </div>-->
        </div>
<!--    </section>-->
        <!--Modal para CRUD-->
        <div class="modal fade" id="modalCRUD" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </button>
                    </div>
                <form action="sr_puesto" method="post">    
                    <div class="modal-body">
                        <div class="form-group">
                        <label for="lbl_id"><b>ID</b></label>
                        <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>  
                        </div>
                        <div class="form-group">
                        <label for="lbl_puesto" ><b>Nombre del Puesto</b></label>
                        <input type="text" name="txt_puesto" id="txt_puesto" class="form-control" placeholder="NombrePuesto">
                        </div>                
                        <div class="form-group">
                        <label for="lbl_departamento" ><b>Departamento</b></label>
                                <select name="drop_departamento" id="drop_departamento" class="form-select">
                                    
                                    <%
                                        Departamento departamento = new Departamento();
                                        HashMap<String, String> drop = departamento.drop_sangre();
                                        for (String i : drop.keySet()) {
                                            out.println(" <option value='" + i + "'>" + drop.get(i) + "</option>");
                                        }
                                    %>
                                </select>
                        </div>
                        <div class="form-group">
                         <label for="lbl_fechaIngreso" ><b>Fecha de ingreso</b></label>
                         <input type="text" name="txt_fechaIngreso" id="txt_fechaIngreso" class="form-control" value="" placeholder="22/02/2022">
                        </div>
                        <div class="form-group">
                         <label for="lbl_estado" ><b>Estado</b></label>
                         <input type="text" name="txt_estado" id="txt_estado" class="form-control" placeholder="activate">
                        </div> 
                    </div>
                    <div class="modal-footer">
<!--                        <button type="submit" id="btnGuardar" class="btn btn-dark">Guardar</button>
                        <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>-->
                        <button name="btnGuardar" id="btnGuardar"  class="btn btn-dark">Guardar</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    </div>
                </form>    
                </div>
            </div>
        </div> 

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
        var fila; //captura la fila para editar o borrar el registro
        
        //boton editar
        $(document).on("click", ".btn-editar", function () {
            fila = $(this).closest("tr");
 
            id = parseInt(fila.find('td:eq(0)').text());
            puesto = fila.find('td:eq(1)').text();
            departamento = fila.find('td:eq(2)').text();
            id_departamento = fila.find('td:eq(3)').text();
            fecha_ingreso = fila.find('td:eq(4)').text();
            estado = fila.find('td:eq(5)').text();
            value='modificar';
//            alert(value);
            //llenado de las cajas de texto



            $("#txt_id").val(id);
            $("#txt_puesto").val(puesto);
            $("#drop_departamento").val(id_departamento);
            $("#txt_fechaIngreso").val(fecha_ingreso);
            $("#txt_estado").val(estado);
            //valor del boton 
            $("#btnGuardar").val(value);
//            $("#btnGuardar").name('btn_modificar');
            
            
            //modal
            $(".modal-header").css("background-color", "#007bff");
            $(".modal-header").css("color", "white");
            $(".modal-title").text("Editar Puesto");            
            $("#modalCRUD").modal("show");  
    
});              

                    
                        
                    
    </script>
</body>
</html>