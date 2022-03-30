/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
        
        $("#btnNuevo").click(function () {
            
            value='agregar';
            //valor del boton 
            $("#btnGuardar").val(value);
            
            $("#formPersonas").trigger("reset");
            $(".modal-header").css("background-color", "#28a745");
            $(".modal-header").css("color", "white");
            $(".modal-title").text("Agregar Puesto");
            $("#modalCRUD").modal("show");
            id = null;
 
            
        });    
    
        
        
        

       
        
        //boton editar
         var fila; //captura la fila para editar o borrar el registro
        
        $(document).on("click", ".btn-editar", function () {
            fila = $(this).closest("tr");
 
            id = parseInt(fila.find('td:eq(0)').text());
            puesto = fila.find('td:eq(1)').text();
            departamento = fila.find('td:eq(2)').text();
            id_departamento = fila.find('td:eq(3)').text();
            fecha_ingreso = fila.find('td:eq(4)').text();
            estado = fila.find('td:eq(5)').text();
            value='modificar';
            
            
            //llenado de las cajas de texto
            $("#txt_id").val(id);
            $("#txt_puesto").val(puesto);
            $("#drop_departamento").val(id_departamento);
            $("#txt_fechaIngreso").val(fecha_ingreso);
            $("#txt_estado").val(estado);
            //valor del boton 
            $("#btnGuardar").val(value);

            //Estilos de la modal
            $(".modal-header").css("background-color", "#007bff");
            $(".modal-header").css("color", "white");
            $(".modal-title").text("Editar Puesto");            
            $("#modalCRUD").modal("show");    
   
});  


    //botón BORRAR
     var fila;
    $(document).on("click", ".btnBorrar", function () {
        fila = $(this).closest("tr");
        id = parseInt(fila.find('td:eq(0)').text());
        value='eliminar';
        //valor del boton 
        $("#btnGuardar").val(value);
        
        //llenado de las cajas de texto
            $("#txt_id").val(id);
            
            //valor del boton 
            $("#btnGuardar").val(value);

            //Estilos de la modal
            $(".modal-header").css("background-color", "#9e2435");
            $(".modal-header").css("color", "white");
            $(".modal-title").text("Eliminar Registro");            
            $("#modalCRUD").modal("show");    
        

    });