/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Modelo.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author mfer_
 */
public class ProductoDAO {
    Conexion cn; 
    int r;

    public Producto listarId (int id){
        Producto pr=new Producto();
        ResultSet rs;
       
        try{
            String sql="select * from productos where idProducto="+id;
            cn= new Conexion();
            cn.abrir_conexion();
            //ps=con.prepareStatement(sql);
            //rs=ps.executeQuery();
            rs = cn.conexionBD.createStatement().executeQuery(sql); 
            while(rs.next()){
                pr.setId(rs.getInt(1));
                pr.setProducto(rs.getString(2));
                pr.setId_marca(rs.getInt(3));
                pr.setDescripcion(rs.getString(4));
                pr.setImagen(rs.getString(5));
                pr.setPrecioCosto(rs.getDouble(6));
                pr.setPrecioVenta(rs.getDouble(7));
                pr.setExistencia(rs.getInt(8));
                
            }
            cn.cerrar_conexion();
        }catch(Exception e){
        }
        return pr;
         
    }
    
    public Producto buscar(int id){
        Producto p=new Producto(); 
        ResultSet rs;
       
        try{
            String sql="select * from productos where idProducto="+id;
            cn= new Conexion();
            cn.abrir_conexion();
            rs = cn.conexionBD.createStatement().executeQuery(sql); 
            while(rs.next()){
                p.setId(rs.getInt(1));
                p.setProducto(rs.getString(2));
                p.setId_marca(rs.getInt(3));
                p.setDescripcion(rs.getString(4));
                p.setImagen(rs.getString(5));
                p.setPrecioCosto(rs.getDouble(6));
                p.setPrecioVenta(rs.getDouble(7));
                p.setExistencia(rs.getInt(8));
                
            }
        }catch(Exception e){
        }
        return p;
    }
    
    public int actualizarStock(int id, int stock){
        String sql="update productos set Existencia=? where idProducto=?";
        PreparedStatement ps;
        try{
            cn= new Conexion();
            cn.abrir_conexion();
            //ps=con.prepareStatement(sql);
            ps = (PreparedStatement) cn.conexionBD.prepareStatement(sql);
            ps.setInt(1, stock);
            ps.setInt(2, id);
            ps.executeUpdate();
            cn.cerrar_conexion();
        }catch(Exception e){
        }
        return r;
    }
    
    
}
