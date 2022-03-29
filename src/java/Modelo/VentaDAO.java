/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Modelo.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author mfer_
 */
public class VentaDAO {
    Conexion cn;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    public String GenerarSerie(){
        String numeroserie="";
        
        try{
            String sql="select max(noFactura) from ventas";
            cn = new Conexion();
            cn.abrir_conexion();
            rs = cn.conexionBD.createStatement().executeQuery(sql);
            while(rs.next()){
                numeroserie=rs.getString(1);
            }
        }catch(Exception e){
        }
        return numeroserie; 
    }
    
    public String idVentas(){
        String idventas="";
        
        try{
            String sql = "select max(idVentas) from ventas";
            cn = new Conexion();
            cn.abrir_conexion();
            rs = cn.conexionBD.createStatement().executeQuery(sql);
            while(rs.next()){
                idventas=rs.getString(1);
            }
        }catch(Exception e){}
        return idventas;
    }
    
    public int guardarVenta(Venta ve){
       
        try{
            String sql="insert into ventas(noFactura,serie,fechaFactura,idcliente,idempleado,fechaIngreso)values(?,?,?,?,?,CURRENT_TIMESTAMP);";
            cn = new Conexion();
            cn.abrir_conexion();
            ps = (PreparedStatement) cn.conexionBD.prepareStatement(sql);
            ps.setInt(1, ve.getNumfactura());
            ps.setString(2, ve.getSerie());
            ps.setString(3, ve.getFecha_factura());
            ps.setInt(4, ve.getIdcliente());
            ps.setInt(5, ve.getIdempleado());
            ps.executeUpdate();
        }catch(Exception e){
        }
        return r;
    }
    public int guardarDetaleventas(Venta venta){
        
        
        try{
            String sql="insert into ventas_detalle (idVenta,idProducto,cantidad,precio_unitario)values(?,?,?,?)";
            cn = new Conexion();
            cn.abrir_conexion();
            ps = (PreparedStatement) cn.conexionBD.prepareStatement(sql);
            ps.setInt(1,venta.getId());
            ps.setInt(2, venta.getIdproducto());
            ps.setInt(3, venta.getCantidad());
            ps.setDouble(4, venta.getPrecio_unitario());
            ps.executeUpdate();
        }catch(Exception e){}
        return r;
    }
    
     public String obtenerfecha(){
        Calendar fecha = new GregorianCalendar();
        int año = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH);
        int dia = fecha.get(Calendar.DAY_OF_MONTH);

        String año1=String.valueOf(año);
        String mes1=String.valueOf(mes);
        String dia1=String.valueOf(dia);
        
        String fechafull=año1+"-"+mes1+"-"+dia1;
        return fechafull;
   }
     
    
}
