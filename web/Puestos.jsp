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
        <!--        <link href="css/estilos__empleados.css" rel="stylesheet" type="text/css"/>-->
        <link href="css/custom__css.css" rel="stylesheet" type="text/css"/>

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
    <div class="container content-tbl">
        <h1><i class="fa-solid fa-user-tie"></i> Puestos</h1>
        <div class="divider-custom1">
            <div class="divider-custom-line"></div>
        </div>
        <button id="btnNuevo" type="button" class="btn btn-success btn-lg" data-toggle="modal"><i class="fa-solid fa-plus"></i> Nuevo</button>
        <div class="container-data mt-5">
            <table class="table table-hover table-light table-sm table-striped table-bordered table-sm" >
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
                                    + "<a href='#' class='btn btn-primary btn-editar'><i class='fa-solid fa-pen-to-square'></i></a>"
                                    + "<a href='#' class='btn btn-danger btnBorrar'><i class='fa-solid fa-trash'></i></a>"
                                    + "</div>"
                                    + "</td>");

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
                    <form id="formPersonas" action="sr_puesto" method="post">    
                        <div class="modal-body">
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
                                        <label for="lbl_puesto" ><b>Nombre del Puesto</b></label>
                                        <input type="text" name="txt_puesto" id="txt_puesto" class="form-control" placeholder="NombrePuesto">
                                    </div>
                                    <div class="container col-4">
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
                                    <div class="container col-4">
                                        <label for="lbl_fechaIngreso" ><b>Fecha de ingreso</b></label>
                                        <input type="date" name="txt_fechaIngreso" id="txt_fechaIngreso" class="form-control" value="" placeholder="22/02/2022">
                                    </div>
                                    <div class="container col-4">
                                        <label for="lbl_estado" ><b>Estado</b></label>
                                        <input type="text" name="txt_estado" id="txt_estado" class="form-control" placeholder="Estado">
                                    </div>
                                </div>
                            </div>
                            <div class="container col-12 text-end pt-3">
                                <button name="btnGuardar" id="btnGuardar"  class="btn btn-primary">Aceptar</button>
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                            </div>
                    </form>    
                </div>
            </div>
        </div> 
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>