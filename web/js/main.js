/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/*----------N A V B A R------------------*/

/*Manfred 119416*/  

window.addEventListener('DOMContentLoaded', event => {

    // Navbar shrink function
    var navbarShrink = function () {
        const navbarCollapsible = document.body.querySelector('#mainNav');
        if (!navbarCollapsible) {
            return;
        }
        if (window.scrollY === 0) {
            navbarCollapsible.classList.remove('navbar-shrink')
        } else {
            navbarCollapsible.classList.add('navbar-shrink')
        }
        console.log("si funciona");

    };

    // Shrink the navbar 
    navbarShrink();

    // Shrink the navbar when page is scrolled
    document.addEventListener('scroll', navbarShrink);
    $(document).ready(function(){
        $('body').scrollspy({target: ".navbar", offset: 50});   
      });

    // Collapse responsive navbar when toggler is visible
    const navbarToggler = document.body.querySelector('.navbar-toggler');
    const responsiveNavItems = [].slice.call(
        document.querySelectorAll('#navbarResponsive .nav-link')
    );
    responsiveNavItems.map(function (responsiveNavItem) {
        responsiveNavItem.addEventListener('click', () => {
            if (window.getComputedStyle(navbarToggler).display !== 'none') {
                navbarToggler.click();
                console.log('Collapse');
            }
        });
    });

});



/*----------B O T O N E S ---------------*/


$("#btnNuevo").click(function () {

    value = 'agregar';
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
    value = 'modificar';


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
    value = 'eliminar';
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


/*-------Marcas------*/

$("#btnNuevo-marca").click(function () {

    value = 'agregar';
//valor del boton 
    $("#btnGuardar-marca").val(value);

    $("#formPersonas").trigger("reset");
    $(".modal-header").css("background-color", "#28a745");
    $(".modal-header").css("color", "white");
    $(".modal-title").text("Agregar Marca");
    $("#modalCRUD").modal("show");
    id = null;


});




//boton editar
var fila; //captura la fila para editar o borrar el registro

$(document).on("click", ".btn-editar-marca", function () {
    fila = $(this).closest("tr");

    id = parseInt(fila.find('td:eq(0)').text());
    marca = fila.find('td:eq(1)').text();
    fechaIngreso = fila.find('td:eq(2)').text();
    id_estado = fila.find('td:eq(3)').text();
    estado = fila.find('td:eq(4)').text();
    ingreso = fila.find('td:eq(5)').text();
    value = 'modificar';


//llenado de las cajas de texto
    $("#txt_id").val(id);
    $("#txt_marca").val(marca);
    $("#txt_fechaIngreso").val(fechaIngreso);
    $("#drop_estado").val(id_estado);
    $("#txt_ingreso").val(ingreso);
//valor del boton 
    $("#btnGuardar-marca").val(value);

//Estilos de la modal
    $(".modal-header").css("background-color", "#007bff");
    $(".modal-header").css("color", "white");
    $(".modal-title").text("Editar Marca");
    $("#modalCRUD").modal("show");

});


//botón BORRAR
var fila;
$(document).on("click", ".btnBorrar-marca", function () {
    fila = $(this).closest("tr");
    id = parseInt(fila.find('td:eq(0)').text());
    marca = fila.find('td:eq(1)').text();
    fechaIngreso = fila.find('td:eq(2)').text();
    id_estado = fila.find('td:eq(3)').text();
    estado = fila.find('td:eq(4)').text();
    ingreso = fila.find('td:eq(5)').text();
    value = 'eliminar';
//valor del boton 
    $("#btnGuardar-marca").val(value);

//llenado de las cajas de texto
    $("#txt_id").val(id);
    $("#txt_marca").val(marca);
    $("#txt_fechaIngreso").val(fechaIngreso);
    $("#drop_estado").val(id_estado);
    $("#txt_ingreso").val(ingreso);


//Estilos de la modal
    $(".modal-header").css("background-color", "#9e2435");
    $(".modal-header").css("color", "white");
    $(".modal-title").text("Eliminar Marca");
    $("#modalCRUD").modal("show");


});
