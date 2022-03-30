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
        <title>Marcas DB</title>
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
        <h1 align="center" style="color: #FFFFFF;">Mantenimiento de Marcas</h1>
        <div class="container  mt-6 col-4">
            
            <form action="sr_marca" method="post" class="form-group">
                <label for="lbl_id" style="color: #FFFFFF;"><b>ID</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>                
                <label for="lbl_marca" style="color: #FFFFFF;"><b>Nombre de la Marca</b></label>
                <input type="text" name="txt_marca" id="txt_marca" class="form-control" placeholder="NombreMarca" required pattern="[A-Z]{1}[a-z]{2,9}([ ][A-Z]{1}[a-z]{2,9})?" oninvalid="this.setCustomValidity('Los nombres deben iniciar con mayúsculas')" oninput="this.setCustomValidity('')">
                
                <br>
                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar</button>
                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>                   
             </form>
                <br>
                <div class="container col-sm-10">
            <table class="table table-hover table-dark" style="width:500px">
                <thead>
                  <tr>
                      <th scope="col">#</th>                    
                    <th scope="col">Marca</th>
                  </tr>
                </thead>
                <tbody id="tbl_marcas">
                    <%
                      Marca marca = new Marca();
                      DefaultTableModel tabla = new DefaultTableModel();
                      tabla = marca.leer();
                      for (int t = 0; t < tabla.getRowCount(); t++) {
                        out.println("<tr data-id=" + tabla.getValueAt(t, 0) +">");
                            out.println("<td scope='row' width='50%'>" + t + "</td>");
                            out.println("<td width='50%'>" + tabla.getValueAt(t, 1) + "</td>");
                        out.println("</tr>");
                      }
                    %>
                  
                </tbody>
            </table>
            </div> 
        </div>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    <script type="text/javascript">
        $('#tbl_marcas').on('click','tr td',function(evt){
            var target,id,marca;
            target = $(event.target);
            id = target.parent().data('id');
            marca = target.parent("tr").find("td").eq(1).html();
            
            $("#txt_id").val(id);
            $("#txt_marca").val(marca);
        });
    </script>
    
    </body>
</html>

