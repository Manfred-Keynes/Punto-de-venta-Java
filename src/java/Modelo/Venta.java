/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author mfer_
 */
public class Venta {
    Integer id;
    Integer item;
    Integer idcliente;
    Integer idempleado;
    Integer idproducto;
    Integer Numfactura;
    String serie;
    String Descripcionp;
    String fecha_factura;
    Double precio_unitario;
    Integer cantidad;
    Double subtotal;
    

    public Venta(){}

    public Venta(Integer id, Integer item, Integer idcliente, Integer idempleado, Integer idproducto, Integer Numfactura, String serie, String Descripcionp, String fecha_factura, Double precio_unitario, Integer cantidad, Double subtotal) {
        this.id = id;
        this.item = item;
        this.idcliente = idcliente;
        this.idempleado = idempleado;
        this.idproducto = idproducto;
        this.Numfactura = Numfactura;
        this.serie = serie;
        this.Descripcionp = Descripcionp;
        this.fecha_factura = fecha_factura;
        this.precio_unitario = precio_unitario;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getItem() {
        return item;
    }

    public void setItem(Integer item) {
        this.item = item;
    }

    public Integer getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(Integer idcliente) {
        this.idcliente = idcliente;
    }

    public Integer getIdempleado() {
        return idempleado;
    }

    public void setIdempleado(Integer idempleado) {
        this.idempleado = idempleado;
    }

    public Integer getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(Integer idproducto) {
        this.idproducto = idproducto;
    }

    public Integer getNumfactura() {
        return Numfactura;
    }

    public void setNumfactura(Integer Numfactura) {
        this.Numfactura = Numfactura;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public String getDescripcionp() {
        return Descripcionp;
    }

    public void setDescripcionp(String Descripcionp) {
        this.Descripcionp = Descripcionp;
    }

    public String getFecha_factura() {
        return fecha_factura;
    }

    public void setFecha_factura(String fecha_factura) {
        this.fecha_factura = fecha_factura;
    }

    public Double getPrecio_unitario() {
        return precio_unitario;
    }

    public void setPrecio_unitario(Double precio_unitario) {
        this.precio_unitario = precio_unitario;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    
}
