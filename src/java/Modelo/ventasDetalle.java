/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;
import Modelo.Conexion;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mfer_
 */
public class ventasDetalle {
    private int idventa_detalle;
    private int id_venta;
    private String nombrePorducto;
    private String cantidad;
    private Double precio; 
    Conexion cn; 
    public ventasDetalle(){};
    public ventasDetalle(int idventa_detalle, int id_venta, String nombrePorducto, String cantidad, Double precio) {
        this.idventa_detalle = idventa_detalle;
        this.id_venta = id_venta;
        this.nombrePorducto = nombrePorducto;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    public int getIdventa_detalle() {
        return idventa_detalle;
    }

    public void setIdventa_detalle(int idventa_detalle) {
        this.idventa_detalle = idventa_detalle;
    }

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public String getNombrePorducto() {
        return nombrePorducto;
    }

    public void setNombrePorducto(String nombrePorducto) {
        this.nombrePorducto = nombrePorducto;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }
    

    public DefaultTableModel leer() {
        DefaultTableModel tabla = new DefaultTableModel();
        try{
            String query;
            Conexion cn = new Conexion();
            cn.abrir_conexion();
            query = "SELECT v.idVentas AS id,v.noFactura, v.serie,v.fechaFactura,c.nombres as nombresCliente,c.apellidos as apellidosCliente,c.nit,e.nombres, e.apellidos,v.fechaIngreso FROM ventas AS v INNER JOIN clientes AS c ON v.idcliente = c.idClientes INNER JOIN empleados AS e ON v.idempleado = e.idempleados";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            
            String encabezado[] = {"id","noFactura","Serie","fechaFactura","cliente","nit","empleado","F. Ingreso"};
            tabla.setColumnIdentifiers(encabezado);
            
            String datos[] = new String[8];
            while(consulta.next()){
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("noFactura");
                datos[2] = consulta.getString("serie");
                datos[3] = consulta.getString("fechaFactura");
                datos[4] = consulta.getString("nombresCliente") +" "+ consulta.getString("apellidosCliente");
                datos[5] = consulta.getString("nit");
                datos[6] = consulta.getString("nombres") + " " +consulta.getString("apellidos");
                datos[7] = consulta.getString("fechaIngreso"); 
                tabla.addRow(datos);
            }
            
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println("Error" + ex.getMessage());
        }      
        return tabla;
    }
    
     public List<ventasDetalle> listar(int id){
        List<ventasDetalle>listav=new ArrayList<>();
        ResultSet rs;
       
        try{
            String sql="select vd.idventa_detalle AS id,vd.idVenta,p.producto,vd.cantidad,vd.precio_unitario from ventas_detalle as vd inner join productos as p on vd.idProducto = p.idProducto where vd.idVenta="+id;
            cn= new Conexion();
            cn.abrir_conexion();
            //ps=con.prepareStatement(sql);
            //rs=ps.executeQuery();
            rs = cn.conexionBD.createStatement().executeQuery(sql); 
            while(rs.next()){
                ventasDetalle ventasdet = new ventasDetalle();
                ventasdet.setIdventa_detalle(rs.getInt(1));
                ventasdet.setId_venta(rs.getInt(2));
                ventasdet.setNombrePorducto(rs.getString(3));
                ventasdet.setCantidad(rs.getString(4));
                ventasdet.setPrecio(rs.getDouble(5));
                listav.add(ventasdet);
            }
            cn.cerrar_conexion();
        }catch(Exception e){
        }
        return listav;
         
    }
    
}
